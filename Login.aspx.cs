using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["RDSConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submitLogin_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();
        sc.Open();
        findPass = new SqlCommand("select Password from Login where Email = @Email", sc);
        findPass.Parameters.Add(new SqlParameter("@Email", HttpUtility.HtmlEncode(userNameTextbox.Text)));
        SqlDataReader reader = findPass.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                string storedHash = reader["Password"].ToString();

                if (PasswordHash.ValidatePassword(passwordTextbox.Text, storedHash))
                {
                    resultmessage.Text = "Success!";
                    loginButton.Enabled = false;
                    userNameTextbox.Enabled = false;
                    passwordTextbox.Enabled = false;
                    Login tempLogin = new Login(userNameTextbox.Text, passwordTextbox.Text);

                    reader.Close();

                    SqlDataReader reader2;
                    SqlCommand insert5 = new SqlCommand();
                    insert5.Connection = sc;
                    String AccountIDResult2;
                    int accountID2;

                    String emailVar = userNameTextbox.Text;
                    insert5 = new SqlCommand("Select AccountID from [dbo].[Login] where Email = @Email", sc);
                    insert5.Parameters.AddWithValue("@Email", HttpUtility.HtmlEncode(emailVar));
                    Session["email"] = emailVar;

                    reader2 = insert5.ExecuteReader();
                    reader2.Read();
                    AccountIDResult2 = reader2[0].ToString();
                    accountID2 = int.Parse(AccountIDResult2);
                    Session["accountID"] = accountID2.ToString();
                    reader2.Close();
                    sc.Close();
                    Response.Redirect("Home.aspx");
                    reader.Read();
                }

                else
                    resultmessage.Text = "The password is wrong. Please try again.";
            }
        }
        else
            resultmessage.Text = "Login failed";
    }

protected Boolean EmailValidation(String email)
{
    Boolean emailRegistered = false;
    SqlCommand checkUser;
    sc.Open();
    //parameterized queries with XXS
    checkUser = new SqlCommand("Select count(*) from [CapProject].[dbo].[Login] where (Email = @Email)", sc);
    checkUser.Parameters.AddWithValue("@Email", HttpUtility.HtmlEncode(userNameTextbox.Text));
    int userExist = (int)checkUser.ExecuteScalar();
    sc.Close();

    //works if the login info is already in DB but not if it's not 
    if (userExist > 0)
    {
        emailRegistered = true;

    }
    else
    {
        emailRegistered = false;
    }

    return emailRegistered;
    }
} 
