using System;
using System.Collections.Generic;
using System.Data;
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
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["RDSConnectionString"].ConnectionString);
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

        int tenantIDRefresh = Convert.ToInt32(Session["tenantID"]);
        Message.lstMessages.Clear();

        //displays all of tenants messages
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RDSConnectionString"].ConnectionString))
        {
            using (SqlCommand command = new SqlCommand())
            {
                command.Connection = connection;
                command.CommandType = CommandType.Text;


                command.CommandText = "select  Message.HostID, Message.TenantID, Message.Message, Message.MessageDate," +
                    " Message.LastUpdated, Message.LastUpdatedBy, Host.FirstName, Host.LastName from Message " +
                    "left join Host on message.HostID = host.HostID where Message.TenantID = @tenantid order by Message.MessageID desc";
                command.Parameters.AddWithValue("@tenantid", tenantIDRefresh);


                try
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                int hostid = Convert.ToInt32(reader["HostID"]);
                                int tenantid = Convert.ToInt32(reader["TenantID"]);
                                string message = (string)reader["Message"];
                                string lub = (string)reader["LastUpdatedBy"];


                                Message msg = new Message(hostid, tenantid, message, lub);

                                msg.setMessageDate(Convert.ToDateTime(reader["MessageDate"]));
                                string recievername = (string)reader["FirstName"] + " " + (string)reader["LastName"];
                                msg.setRecieverName(recievername);


                                Message.lstMessages.Add(msg);
                            }

                        }
                        else
                        {
                            //lblInvalidSearch.Text = "Search returned no properties";
                        }

                    }
                }
                catch (SqlException t)
                {
                    string b = t.ToString();
                }
                finally
                {
                    connection.Close();

                }

            }
        }

        lvMessages.DataSource = Message.lstMessages;
        lvMessages.DataBind();
    }
    protected void sendMessage(object sender, EventArgs e)
    {
        int tenantID = Convert.ToInt32(Session["tenantID"]);
        int hostID = Convert.ToInt32(hostNameDropdown.SelectedItem.Value);
        string msgtxt = messageTextbox.Text;
        string messageSender = Session["username"].ToString();

        Message newMessage = new Message(tenantID, hostID, msgtxt, messageSender);

        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RDSConnectionString"].ConnectionString))
        {
            using (SqlCommand command = new SqlCommand())
            {
                command.Connection = connection;
                command.CommandType = CommandType.Text;
                command.CommandText = "INSERT INTO [dbo].[Message] ([HostID],[TenantID],[Message],[MessageDate]," +
                    "[LastUpdatedBy],[LastUpdated]) VALUES (@host,@tenant,@message,@msgdate,@lub,@lu)";

                command.Parameters.AddWithValue("@host", newMessage.hostID);
                command.Parameters.AddWithValue("@tenant", newMessage.tenantID);
                command.Parameters.AddWithValue("@message", newMessage.message);
                command.Parameters.AddWithValue("@msgdate", newMessage.messageDate);
                command.Parameters.AddWithValue("@lub", newMessage.lastUpdatedBy);
                command.Parameters.AddWithValue("@lu", newMessage.lastUpdated);


                try
                {
                    connection.Open();
                    int recordsAffected = command.ExecuteNonQuery();
                }
                catch (SqlException)
                {

                }
                finally
                {
                    connection.Close();
                }
            }
        }


        Message.lstMessages.Clear();

        //displays all of tenants messages
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RDSConnectionString"].ConnectionString))
        {
            using (SqlCommand command = new SqlCommand())
            {
                command.Connection = connection;
                command.CommandType = CommandType.Text;


                command.CommandText = "select  Message.HostID, Message.TenantID, Message.Message, Message.MessageDate," +
                    " Message.LastUpdated, Message.LastUpdatedBy, Host.FirstName, Host.LastName from Message " +
                    "left join Host on message.HostID = host.HostID where Message.TenantID = @tenantid order by Message.MessageID desc";
                command.Parameters.AddWithValue("@tenantid", tenantID);


                try
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                int hostid = Convert.ToInt32(reader["HostID"]);
                                int tenantid = Convert.ToInt32(reader["TenantID"]);
                                string message = (string)reader["Message"];
                                string lub = (string)reader["LastUpdatedBy"];


                                Message msg = new Message(hostid, tenantid, message, lub);

                                msg.setMessageDate(Convert.ToDateTime(reader["MessageDate"]));
                                string recievername = (string)reader["FirstName"] + " " + (string)reader["LastName"];
                                msg.setRecieverName(recievername);


                                Message.lstMessages.Add(msg);
                            }

                        }
                        else
                        {
                            //lblInvalidSearch.Text = "Search returned no properties";
                        }

                    }
                }
                catch (SqlException t)
                {
                    string b = t.ToString();
                }
                finally
                {
                    connection.Close();

                }

            }
        }

        lvMessages.DataSource = Message.lstMessages;
        lvMessages.DataBind();
    }


    protected void logout(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Index.aspx");
    }
}