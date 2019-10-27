using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class CreateLogin : System.Web.UI.Page
{
    //Create database connection
    SqlConnection sc = new SqlConnection(ConfigurationManager.ConnectionStrings["CapstoneConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submitLogin_Click(object sender, EventArgs e)
    {
        
        System.Data.SqlClient.SqlCommand insertTenant = new System.Data.SqlClient.SqlCommand();
        insertTenant.Connection = sc;

        Tenant newTenantLogin = new Tenant(userNameTextbox.Text, passwordTextbox.Text, confirmPasswordTextbox.Text);

        

        

        insertTenant.CommandText = "INSERT INTO [Capstone].[dbo].[Tenant] (Email, PhoneNumber, Firstname, MiddleName, LastName, BirthDate, Password," +
                    "Gender, BackgroundCheckDate, BackgroundCheckResult, LastUpdatedBy, LastUpdated) VALUES (@Email, @PhoneNumber, @MiddleName," +
                    "@LastName, @BirthDate, @Password, @Gender, @BackgroundCheckDate, @BackgroundCheckResult, @LastUpdatedBy); ";

        insertTenant.Parameters.AddWithValue("@Email", newTenantInfo.email;
        insertTenant.Parameters.AddWithValue("@PhoneNumber", newTenantInfo.phoneNumber;
        insertTenant.Parameters.AddWithValue("@FirstName", newTenantInfo.firstName;
        insertTenant.Parameters.AddWithValue("@MiddleName", newTenantInfo.getMiddleName());
        insertTenant.Parameters.AddWithValue("@LastName", newTenantInfo.lastName;
        insertTenant.Parameters.AddWithValue("@BirthDate", newTenantInfo.dateOfBirth;
        insertTenant.Parameters.AddWithValue("@Password", newTenantLogin.password;
        insertTenant.Parameters.AddWithValue("@Gender", newTenantInfo.gender;
        insertTenant.Parameters.AddWithValue("@BackgroundCheckDate", DateTime.Now);
        insertTenant.Parameters.AddWithValue("@BackgroundCheckResult", "Y");
        //ADD USERNAME and CONFIRM PASSOWRD IN DATABASE
        insertTenant.Parameters.AddWithValue("@userName", newTenantLogin.userName;
        insertTenant.Parameters.AddWithValue("@ConfirmPassword", newTenantLogin.confirmPassword;
        insertTenant.Parameters.AddWithValue("@LastUpdatedBy", "Kessler");
        insertTenant.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
       


        sc.Open();
        
        insertTenant.ExecuteNonQuery();
        sc.Close();







    }
}