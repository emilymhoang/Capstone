using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TenantDashboard : System.Web.UI.Page
{
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["CapstoneConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

        lvMessages.DataSource = Message.lstMessages;
        lvMessages.DataBind();

        lvFavorites.DataSource = Favorite.lstFavorites;
        lvFavorites.DataBind();

        sc.Open();
        int accountID = Convert.ToInt32(Session["accountID"]);
        Response.Write(accountID);

        SqlCommand insert = new SqlCommand("SELECT TenantID FROM [Capstone].[dbo].[Login] WHERE AccountID = @AccountID", sc);
        insert.Parameters.AddWithValue("@AccountID", accountID);
        insert.Connection = sc;
        int tenantID = Convert.ToInt32(insert.ExecuteScalar());
        insert.ExecuteNonQuery();
        Session["tenantID"] = tenantID;
   
        SqlCommand filter = new SqlCommand("SELECT FirstName, LastName, PhoneNumber, Email, ProfilePic FROM [Capstone].[dbo].[Tenant] WHERE TenantID = @TenantID", sc);
        filter.Parameters.AddWithValue("@TenantID", tenantID);
        SqlDataReader rdr = filter.ExecuteReader();
        while (rdr.Read())
        {
            nameTextbox.Text = rdr["FirstName"].ToString() + " " + rdr["LastName"].ToString();
            emailTextbox.Text = rdr["Email"].ToString();
            phoneTextbox.Text = rdr["PhoneNumber"].ToString();
            dashboardTitle.Text = rdr["FirstName"].ToString() + "'s Dashboard";
            image1.ImageUrl = rdr["ProfilePic"].ToString();
        }
        usernameTextbox.Text = Session["username"].ToString();
    }
    protected void sendMessage(object sender, EventArgs e)
    {
        int tenantID = Convert.ToInt32(Session["tenantID"]);
        Message newMessage = new Message(tenantID, messageTextbox.Text);
    }
}