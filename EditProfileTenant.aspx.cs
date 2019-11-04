using System;
using System.Collections.Generic;

using System.Data;

using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditProfileTenant : System.Web.UI.Page
{
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["RDSConnectionString"].ConnectionString);
    int tenantID;
    protected void Page_Load(object sender, EventArgs e)
    {
        sc.Open();
        String username = Session["username"].ToString();

        SqlCommand insert = new SqlCommand("SELECT TenantID FROM [Capstone].[dbo].[Login] WHERE Username = @Username", sc);
        insert.Parameters.AddWithValue("@Username", username);
        insert.Connection = sc;
        tenantID = Convert.ToInt32(insert.ExecuteScalar());
        insert.ExecuteNonQuery();
        SqlCommand filter = new SqlCommand("SELECT Email, PhoneNumber, Firstname, MiddleName, LastName, BirthDate," +
                            "Gender, BackgroundCheckDate, BackgroundCheckResult, LastUpdatedBy, LastUpdated FROM [Capstone].[dbo].[Tenant] WHERE " +
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
        //SqlCommand filter = new SqlCommand("SELECT Email, PhoneNumber, Firstname, MiddleName, LastName, BirthDate, Password," +
        //                    "Gender, BackgroundCheckDate, BackgroundCheckResult, LastUpdatedBy, LastUpdated, Username, ConfirmPassword FROM [Capstone].[dbo].[Tenant] WHERE" +
        //                    "TenantID = " + tenantID, sc);

        update.CommandText = "UPDATE [Capstone].[dbo].[Tenant] SET Email= @Email, PhoneNumber= @PhoneNumber, FirstName= @FirstName," +
            "LastName = @LastName, Password = @Password WHERE TenantID = " + tenantID;

        update.Parameters.AddWithValue("@Email", emailTextbox.Text);
        update.Parameters.AddWithValue("@PhoneNumber", phoneNumberTextbox.Text);
        update.Parameters.AddWithValue("@FirstName", firstNameTextbox.Text);
        update.Parameters.AddWithValue("@LastName", lastNameTextbox.Text);
        update.Parameters.AddWithValue("@Password", passwordTextbox.Text);

        resultmessage.Text = "Property is updated.";
        update.ExecuteNonQuery();
        sc.Close();

        //using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RDSConnectionString"].ConnectionString))
        //{
        //    using (SqlCommand update = new SqlCommand())
        //    {
        //        update.Connection = connection;
        //        update.CommandType = CommandType.Text;

        //        update.CommandText = "UPDATE [Capstone].[dbo].[Tenant] SET Email= @Email, PhoneNumber= @PhoneNumber, FirstName= @FirstName," +
        //    "LastName = @LastName, Password = @Password WHERE TenantID = " + tenantID;

        //        try
        //        {
        //            connection.Open();
        //            using (SqlDataReader reader = update.ExecuteReader())
        //            {
        //                if (reader.HasRows)
        //                {
        //                    while (reader.Read())
        //                    {
        //                        int house = Convert.ToInt32(reader["HouseNumber"]);
        //                        string street = (string)reader["Street"];
        //                        string city = (string)reader["CityCounty"];
        //                        string state = (string)reader["HomeState"];
        //                        string country = (string)reader["Country"];
        //                        int zip = Convert.ToInt32(reader["Zip"]);
        //                        double price = Convert.ToDouble(reader["PriceRange"]);
        //                        int rooms = (int)reader["NumberBedrooms"];
        //                        int availability = 1;
        //                        int host = (int)reader["HostID"];


        //                        Property prop = new Property(house, street, city, state, country, zip, price, rooms, availability, host);

        //                        Property.lstPropertySearchResults.Add(prop);
        //                    }

        //                }


        //            }
        //        }
        //        catch (SqlException t)
        //        {
        //            string b = t.ToString();
        //        }

        //    }
        //}


    }
}
