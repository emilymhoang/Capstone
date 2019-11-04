using System;
using System.Collections.Generic;

using System.Data;

using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{

    //SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["CapstoneConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void search_Click(object sender, EventArgs e)
    {
        Property.lstPropertySearchResults.Clear();
        bool searchBy;
        int a;
        string propertySearch = searchTextbox.Text;

        if (string.IsNullOrEmpty(propertySearch))
        {
            lblInvalidSearch.Text = "You must enter a city OR a zip!";
            return;
        } else
        {
            searchBy = Int32.TryParse(propertySearch, out a);
            if (a < 0)
            {
                lblInvalidSearch.Text = "Enter a valid zip.";
                return;
            }
            lblInvalidSearch.Text = String.Empty;
        }

        


        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RDSConnectionString"].ConnectionString))
        {
            using (SqlCommand command = new SqlCommand())
            {
                command.Connection = connection;
                command.CommandType = CommandType.Text;

                if (searchBy)
                {
                    command.CommandText = "select * from [dbo].[Property] where [dbo].[Property].[Zip] = @zip";
                    command.Parameters.AddWithValue("@zip", propertySearch);
                }
                else
                {
                    command.CommandText = "select * from [dbo].[Property] where [dbo].[Property].[CityCounty] = @city";
                    command.Parameters.AddWithValue("@city", propertySearch);
                }
                
                

                try
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                int house = Convert.ToInt32(reader["HouseNumber"]);
                                string street = (string)reader["Street"];
                                string city = (string)reader["CityCounty"];
                                string state = (string)reader["HomeState"];
                                string country = (string)reader["Country"];
                                int zip = Convert.ToInt32(reader["Zip"]);
                                double price = Convert.ToDouble(reader["MonthlyPrice"]);
                                int rooms = (int)reader["NumberBedrooms"];
                                int availability = 1;
                                int host = (int)reader["HostID"];


                                Property prop = new Property(house, street, city, state, country, zip, price, rooms, availability, host);

                                Property.lstPropertySearchResults.Add(prop);
                            }
                          
                        }
                        else
                        {
                            lblInvalidSearch.Text = "Search returned no properties";
                        }

                    }
                }
                catch (SqlException t)
                {
                    string b = t.ToString();
                }
                finally
                {
                    searchTextbox.Text = string.Empty;
                    connection.Close();

                }
            }
        }
        Response.Redirect("SearchResults.aspx");


    }









}