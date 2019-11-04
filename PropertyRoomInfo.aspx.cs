using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class PropertyRoomInfo : System.Web.UI.Page
{    
    int PropertyID;
    
    double MonthlyPrice;
    int SquareFootage;
    int NumberBedrooms;

    SqlConnection sc = new SqlConnection(ConfigurationManager.ConnectionStrings["RDSConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submitPropRoom(object sender, EventArgs e)
    {
        sc.Open();
        SqlCommand insert = new SqlCommand("SELECT PropertyID FROM [Capstone].[dbo].[Property] WHERE HostID = @HostID", sc);
        insert.Parameters.AddWithValue("@HostID", Convert.ToInt32(Session["hostID"]));
        insert.Connection = sc;
        int propertyID = Convert.ToInt32(insert.ExecuteScalar());
        insert.ExecuteNonQuery();
       
       
        System.Data.SqlClient.SqlCommand insertRoom = new System.Data.SqlClient.SqlCommand();
        insertRoom.Connection = sc;

        double monthlyPrice = Convert.ToInt32(monthlyPriceTextbox.Text);
        int sqFoot = Convert.ToInt32(squareFootageTextbox.Text);
        String avail = DropDownListAvailibility.SelectedValue;
        String display = displayTextbox.Text;
        
        PropertyRoom newRoom = new PropertyRoom(propertyID, monthlyPrice, sqFoot, avail, display);
        try
        {
            sc.Open();
            insertRoom.CommandText = "INSERT INTO [Capstone].[dbo].[PropertyRoom] (PropertyID, MonthlyPrice, SquareFootage, Availability, BriefDescription, LastUpatedBy, LastUpdated, TenantID) " +
                "VALUES (@PropertyID, @MonthlyPrice, @SquareFootage, @Availability, @BriefDescription, @LastUpatedBy, @LastUpdated, @TenantID); ";

            insertRoom.Parameters.AddWithValue("@PropertyID", newRoom.propertyID);
            insertRoom.Parameters.AddWithValue("@MonthlyPrice", newRoom.monthlyPrice);
            insertRoom.Parameters.AddWithValue("@SquareFootage", newRoom.squareFootage);
            insertRoom.Parameters.AddWithValue("@Availability", newRoom.availability);
            insertRoom.Parameters.AddWithValue("@BriefDescription", newRoom.briefDescription);
            insertRoom.Parameters.AddWithValue("@LastUpdatedBy", "Kessler");
            insertRoom.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
            insertRoom.Parameters.AddWithValue("@TenantID", "null");

            insertRoom.ExecuteNonQuery();
        }
        catch(Exception t)
        {
            string g = t.ToString();
        }
        finally
        {
            sc.Close();
            Response.Redirect("CreateAccountSafetyHomeowner.aspx");
        }
    }



}