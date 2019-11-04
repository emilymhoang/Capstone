using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditProfileTenant : System.Web.UI.Page
{
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["CapstoneConnectionString"].ConnectionString);
    String firstName;
    String lastName;
    String gender;
    String dateOfBirth;
    String email;
    String phoneNumber;
    String password;
    int tenantID;
    protected void Page_Load(object sender, EventArgs e)
    {
        sc.Open();
        firstName = Session["firstName"].ToString();
        lastName = Session["lastName"].ToString();
        gender = Session["gender"].ToString();
        dateOfBirth = Session["dateOfBirth"].ToString();
        email = Session["email"].ToString();
        phoneNumber = Session["phoneNumberTextbox"].ToString();
        password = Session["password"].ToString();

        SqlCommand insert = new SqlCommand("SELECT TenantID FROM [Capstone].[dbo].[Tenant] WHERE lower(FirstName) = @FirstName AND lower(LastName) = @LastName", sc);
        insert.Parameters.AddWithValue("@LastName", lastName);
        insert.Parameters.AddWithValue("@FirstName", firstName);
        insert.Connection = sc;
        tenantID = Convert.ToInt32(insert.ExecuteScalar());
        insert.ExecuteNonQuery();
        SqlCommand filter = new SqlCommand("SELECT Email, PhoneNumber, Firstname, MiddleName, LastName, BirthDate," +
                            "Gender, BackgroundCheckDate, BackgroundCheckResult, LastUpdatedBy, LastUpdated FROM [Capstone].[dbo].[Tenant] WHERE" +
                            "TenantID = " + tenantID, sc);

        SqlDataReader rdr = filter.ExecuteReader();
        while (rdr.Read())
        {
            firstNameTextbox.Text = rdr["FirstName"].ToString();
            lastNameTextbox.Text = rdr["LastName"].ToString();
            emailTextbox.Text = rdr["Email"].ToString();
            phoneNumberTextbox.Text = rdr["PhoneNumber"].ToString();
        }
        passwordTextbox.Text = "";


    }
    protected void saveChanges(object sender, EventArgs e)
    {
        sc.Open();
        System.Data.SqlClient.SqlCommand update = new System.Data.SqlClient.SqlCommand();
        update.Connection = sc;
        SqlCommand filter = new SqlCommand("SELECT Email, PhoneNumber, Firstname, MiddleName, LastName, BirthDate, Password," +
                            "Gender, BackgroundCheckDate, BackgroundCheckResult, LastUpdatedBy, LastUpdated, Username, ConfirmPassword FROM [Capstone].[dbo].[Tenant] WHERE" +
                            "TenantID = " + tenantID, sc);
        update.CommandText = "UPDATE [Capstone].[dbo].[Tenant] SET Email= @Email, PhoneNumber= @PhoneNumber, FirstName= @FirstName," +
            "LastName = @LastName, Password = @Password WHERE TenantID = " + tenantID;

        update.Parameters.AddWithValue("@Email", email);
        update.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
        update.Parameters.AddWithValue("@FirstName", firstName);
        update.Parameters.AddWithValue("@LastName", lastName);
        update.Parameters.AddWithValue("@Password", password);

        resultmessage.Text = "Property is updated.";
        update.ExecuteNonQuery();
        sc.Close();
    }
}