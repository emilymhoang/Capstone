using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["CapstoneConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void search_Click(object sender, EventArgs e)
    {
     


        try
        {
            
            sc.Open();
            SqlCommand search = new SqlCommand("SELECT zip, cityCounty" +
                "FROM [Capstone].[dbo].[Property] WHERE Zip ='" + searchTextbox.Text + "' OR CityCounty= '" + searchTextbox.Text + "';", sc);
            SqlDataReader read = search.ExecuteReader();
            while (read.Read())
            {

                //if numbers search zip
                //if words search for city

                searchTextbox.Text = HttpUtility.HtmlEncode(read["Zip"].ToString()));
                searchTextbox.Text = HttpUtility.HtmlEncode(read["CityCounty"].ToString()));
                
            }
            sc.Close();
        }
        catch (Exception)
        {
            //Output no property found
            searchTextbox.Text = "No properties found in this area";
        }
    }
}