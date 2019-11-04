using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;

public partial class CreateLoginTenant : System.Web.UI.Page
{
    //Create database connection
    SqlConnection sc = new SqlConnection(ConfigurationManager.ConnectionStrings["CapstoneConnectionString"].ConnectionString);
    String firstName;
    String lastName;
    String gender;
    String dateOfBirth;
    String email;
    String phoneNumber;
    String profilePic;
    

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void goBack(object sender, EventArgs e)
    {
        Response.Redirect("BasicInfoTenant.aspx");
    }
    protected void submitLogin_Click(object sender, CommandEventArgs e)
    {
        //Username
        
        String userNew = userNameTextbox.Text;
        //ValidatePassword(username);
        String username = userNameTextbox.Text;
        Session["username"]= username;
        

        sc.Open();
        SqlCommand userCheck = new SqlCommand("SELECT Username FROM [Capstone].[dbo].[Login] WHERE lower(Username) = @Username", sc);
            
        userCheck.Parameters.AddWithValue("@Username", username);
        userCheck.Connection = sc;
        String userDup = Convert.ToString(userCheck.ExecuteScalar());
        userCheck.ExecuteNonQuery();
        sc.Close();
        if (userDup == userNew)
        {
            resultUser.Text = "Sorry, That Username Has Been Taken";
        }
        else
            resultUser.Text = "Valid Username";
        
        
        //Password 
        System.Data.SqlClient.SqlCommand insertTenant = new System.Data.SqlClient.SqlCommand();
        insertTenant.Connection = sc;
        System.Data.SqlClient.SqlCommand insertLogin = new System.Data.SqlClient.SqlCommand();
        insertLogin.Connection = sc;

        firstName = Session["firstName"].ToString();
        lastName = Session["lastName"].ToString();
        gender = Session["gender"].ToString();
        dateOfBirth = Session["dateOfBirth"].ToString();
        email = Session["email"].ToString();
        phoneNumber = Session["phoneNumberTextbox"].ToString();
        //profilePic = Session["profilepicture"].ToString();

        String password = passwordTextbox.Text;
        String cpassword = confirmPasswordTextbox.Text;

        Session["password"] = password;

        bool isValid;
        if (password.Length > 8 && (isValid = ValidatePassword(password)))
        {
            if (password == cpassword)
            {
                Tenant newTenant = new Tenant(firstName, lastName, gender, dateOfBirth, email, phoneNumber, userNameTextbox.Text, passwordTextbox.Text, confirmPasswordTextbox.Text);
                resultmessage.Text = "";


                insertTenant.CommandText = "INSERT INTO [Capstone].[dbo].[Tenant] (Email, PhoneNumber, Firstname, MiddleName, LastName, BirthDate," +
                            "Gender, BackgroundCheckDate, BackgroundCheckResult, LastUpdatedBy, LastUpdated) VALUES (@Email, @PhoneNumber, @FirstName, @MiddleName," +
                            "@LastName, @BirthDate, @Gender, @BackgroundCheckDate, @BackgroundCheckResult, @LastUpdatedBy, @LastUpdated); ";



                insertTenant.Parameters.AddWithValue("@Email", email);
                insertTenant.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                insertTenant.Parameters.AddWithValue("@FirstName", firstName);
                insertTenant.Parameters.AddWithValue("@MiddleName", "fakeMiddleName");
                insertTenant.Parameters.AddWithValue("@LastName", lastName);
                insertTenant.Parameters.AddWithValue("@BirthDate", dateOfBirth);
                insertTenant.Parameters.AddWithValue("@Gender", gender);
                insertTenant.Parameters.AddWithValue("@BackgroundCheckDate", DateTime.Now);
                insertTenant.Parameters.AddWithValue("@BackgroundCheckResult", "Y");
                //ADD USERNAME and CONFIRM PASSOWRD IN DATABASE
                insertTenant.Parameters.AddWithValue("@LastUpdatedBy", "Kessler");
                insertTenant.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
                //insertTenant.Parameters.Add("@ProfilePic", GetImage(profilePic));


                sc.Open();
                insertTenant.ExecuteNonQuery();


                SqlCommand insert = new SqlCommand("SELECT TenantID FROM [Capstone].[dbo].[Tenant] WHERE lower(Email) = @Email", sc);
                insert.Parameters.AddWithValue("@Email", email.ToLower());
                insert.Connection = sc;
                int tenantID = Convert.ToInt32(insert.ExecuteScalar());
                insert.ExecuteNonQuery();
              

                Login tempLogin = new Login(userNameTextbox.Text, passwordTextbox.Text);
                insertLogin.CommandText = "INSERT INTO [Capstone].[dbo].[Login] (Username, Password, TenantID) VALUES (@userName, @Password, @TenantID)";
                insertLogin.Parameters.AddWithValue("@userName", newTenant.userName);
                insertLogin.Parameters.AddWithValue("@Password", PasswordHash.HashPassword(newTenant.password));
                insertLogin.Parameters.AddWithValue("@TenantID", tenantID);

                if (FileUploadControl.HasFile)
                {
                    string strname = FileUploadControl.FileName.ToString();
                    //FileUploadControl.PostedFile.SaveAs(Server.MapPath("~/") + strname);
                    SqlCommand cmd = new SqlCommand("UPDATE[Capstone].[dbo].[Tenant] SET ProfilePic = @strname WHERE TenantID = @TenantID", sc);
                    cmd.Parameters.AddWithValue("@TenantID", tenantID);
                    cmd.Parameters.AddWithValue("@strname", strname);
                    cmd.ExecuteNonQuery();

                    StatusLabel.Text = "Image Uploaded successfully";
                }
                else
                {
                    StatusLabel.Text = "Plz upload the image!!!!";
                }


                SqlCommand getAccountID = new SqlCommand("SELECT AccountID FROM [Capstone].[dbo].[Login] WHERE TenantID = @TenantID", sc);
                getAccountID.Parameters.AddWithValue("@TenantID", tenantID);
                getAccountID.Connection = sc;
                int accountID = Convert.ToInt32(getAccountID.ExecuteScalar());
                getAccountID.ExecuteNonQuery();
                Session["accountID"] = accountID;
                Session["username"] = newTenant.userName;

                insertLogin.ExecuteNonQuery();
                sc.Close();
                Response.Redirect("CreateAccountSafety.aspx");
            }
            else
            {
                resultmessage.Text = "Passwords does not match.";
            }
        }
        else
        {
            resultmessage.Text = "Password does not meet minimum password requirements.";
        }
    }

    //static bool ValidatePassword(String password)
    //{
    //    bool isValid = false;
    //    bool containsInt = password.Any(char.IsDigit);
    //    bool containsUpper = password.Any(char.IsUpper);
    //    bool containsLower = password.Any(char.IsLower);

    //    if (containsInt == true && containsUpper == true && containsLower == true)
    //    {
    //        isValid = true;
    //    }

    //    return isValid;
    //}

    static bool ValidatePassword(string password)
    {
        const int MIN_LENGTH = 8;

        if (password == null) throw new ArgumentNullException();

        bool meetsLengthRequirements = password.Length >= MIN_LENGTH;
        bool hasUpperCaseLetter = false;
        bool hasLowerCaseLetter = false;
        bool hasDecimalDigit = false;

        if (meetsLengthRequirements)
        {
            foreach (char c in password)
            {
                if (char.IsUpper(c)) hasUpperCaseLetter = true;
                else if (char.IsLower(c)) hasLowerCaseLetter = true;
                else if (char.IsDigit(c)) hasDecimalDigit = true;
            }
        }

        bool isValid = meetsLengthRequirements
                    && hasUpperCaseLetter
                    && hasLowerCaseLetter
                    && hasDecimalDigit
                    ;
        return isValid;
    }

    //static bool ValidateUsername(string username)
    //{

    //    bool noDuplicate;

    //    return noDuplicate;
    //}
    protected void UploadButton_Click(object sender, EventArgs e)
    {

    }

}