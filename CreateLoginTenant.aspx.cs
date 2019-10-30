using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class CreateLoginTenant : System.Web.UI.Page
{
    //Create database connection
    SqlConnection sc = new SqlConnection(ConfigurationManager.ConnectionStrings["RDSConnectionString"].ConnectionString);
    String firstName;
    String lastName;
    String gender;
    String dateOfBirth;
    String email;
    String phoneNumber;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submitLogin_Click(object sender, CommandEventArgs e)
    {
        System.Data.SqlClient.SqlCommand insertTenant = new System.Data.SqlClient.SqlCommand();
        insertTenant.Connection = sc;

        firstName = Session["firstName"].ToString();
        lastName = Session["lastName"].ToString();
        gender = Session["gender"].ToString();
        dateOfBirth = Session["dateOfBirth"].ToString();
        email = Session["email"].ToString();
        phoneNumber = Session["phoneNumberTextbox"].ToString();

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
                insertTenant.CommandText = "INSERT INTO [Capstone].[dbo].[Tenant] (Email, PhoneNumber, Firstname, MiddleName, LastName, BirthDate, Password," +
                            "Gender, BackgroundCheckDate, BackgroundCheckResult, LastUpdatedBy, LastUpdated, Username, ConfirmPassword) VALUES (@Email, @PhoneNumber, @FirstName, @MiddleName," +
                            "@LastName, @BirthDate, @Password, @Gender, @BackgroundCheckDate, @BackgroundCheckResult, @LastUpdatedBy, @LastUpdated, @Username, @ConfirmPassword); ";

                insertTenant.Parameters.AddWithValue("@Email", email);
                insertTenant.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                insertTenant.Parameters.AddWithValue("@FirstName", firstName);
                insertTenant.Parameters.AddWithValue("@MiddleName", "fakeMiddleName");
                insertTenant.Parameters.AddWithValue("@LastName", lastName);
                insertTenant.Parameters.AddWithValue("@BirthDate", dateOfBirth);
                insertTenant.Parameters.AddWithValue("@Password", newTenant.password);
                insertTenant.Parameters.AddWithValue("@Gender", gender);
                insertTenant.Parameters.AddWithValue("@BackgroundCheckDate", DateTime.Now);
                insertTenant.Parameters.AddWithValue("@BackgroundCheckResult", "Y");
                //ADD USERNAME and CONFIRM PASSOWRD IN DATABASE
                insertTenant.Parameters.AddWithValue("@userName", newTenant.userName);
                insertTenant.Parameters.AddWithValue("@ConfirmPassword", newTenant.confirmPassword);
                insertTenant.Parameters.AddWithValue("@LastUpdatedBy", "Kessler");
                insertTenant.Parameters.AddWithValue("@LastUpdated", DateTime.Now);

                sc.Open();

                insertTenant.ExecuteNonQuery();
                sc.Close();
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




}