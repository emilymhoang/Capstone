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
    SqlConnection sc = new SqlConnection(ConfigurationManager.ConnectionStrings["CapstoneConnectionString"].ConnectionString);
    String firstName;
    String lastName;
    String gender;
    String dateOfBirth;
    String email;
    String phoneNumber;

    protected void Page_Load(object sender, EventArgs e)
    {
        firstName = Session["firstName"].ToString();
        lastName = Session["lastName"].ToString();
        gender = Session["gender"].ToString();
        dateOfBirth = Session["dateOfBirth"].ToString();
        email = Session["email"].ToString();
        phoneNumber = Session["phoneNumberTextbox"].ToString();
    }

    protected void submitLogin_Click(object sender, EventArgs e)
    {
        
        System.Data.SqlClient.SqlCommand insertTenant = new System.Data.SqlClient.SqlCommand();
        insertTenant.Connection = sc;


        Tenant newTenant = new Tenant(firstName, lastName, gender, dateOfBirth, email, phoneNumber, userNameTextbox.Text, passwordTextbox.Text, confirmPasswordTextbox.Text);

        Tenant newTenantLogin = new Tenant(userNameTextbox.Text, passwordTextbox.Text, confirmPasswordTextbox.Text);

        insertTenant.CommandText = "INSERT INTO [Capstone].[dbo].[Tenant] (Email, PhoneNumber, Firstname, MiddleName, LastName, BirthDate, Password," +
                    "Gender, BackgroundCheckDate, BackgroundCheckResult, LastUpdatedBy, LastUpdated) VALUES (@Email, @PhoneNumber, @MiddleName," +
                    "@LastName, @BirthDate, @Password, @Gender, @BackgroundCheckDate, @BackgroundCheckResult, @LastUpdatedBy); ";

        insertTenant.Parameters.AddWithValue("@Email", email);
        insertTenant.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
        insertTenant.Parameters.AddWithValue("@FirstName", firstName);
        //insertTenant.Parameters.AddWithValue("@MiddleName", newTenantInfo);
        insertTenant.Parameters.AddWithValue("@LastName", lastName);
        insertTenant.Parameters.AddWithValue("@BirthDate", dateOfBirth);
        insertTenant.Parameters.AddWithValue("@Password", newTenantLogin.password);
        insertTenant.Parameters.AddWithValue("@Gender", gender);
        insertTenant.Parameters.AddWithValue("@BackgroundCheckDate", DateTime.Now);
        insertTenant.Parameters.AddWithValue("@BackgroundCheckResult", "Y");
        //ADD USERNAME and CONFIRM PASSOWRD IN DATABASE
        insertTenant.Parameters.AddWithValue("@userName", newTenantLogin.userName);
        insertTenant.Parameters.AddWithValue("@ConfirmPassword", newTenantLogin.confirmPassword);
        insertTenant.Parameters.AddWithValue("@LastUpdatedBy", "Kessler");
        insertTenant.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
       


        sc.Open();
        
        insertTenant.ExecuteNonQuery();
        sc.Close();







    }
}