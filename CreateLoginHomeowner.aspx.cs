﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class CreateLoginHomeowner : System.Web.UI.Page
{

    //Create database connection
    SqlConnection sc = new SqlConnection(ConfigurationManager.ConnectionStrings["RDSConnectionString"].ConnectionString);
    String firstName;
    String lastName;
    String gender;
    String dateOfBirth;
    String email;
    String phoneNumber;


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void goBack(object sender, EventArgs e)
    {
        Response.Redirect("BasicInfoHomeowner.aspx");
    }

    protected void submitLogin_Click(object sender, EventArgs e)
    {
        //Username


        //ValidatePassword(username);
        String userNew = userNameTextbox.Text;
        Session["username"] = userNew;


        sc.Open();
        SqlCommand userCheck = new SqlCommand("SELECT Count(*) FROM [Capstone].[dbo].[Login] WHERE lower(Username) = @Username", sc);

        userCheck.Parameters.AddWithValue("@Username", userNew);
        userCheck.Connection = sc;
        int count = Convert.ToInt32(userCheck.ExecuteScalar());
        userCheck.ExecuteNonQuery();
        sc.Close();




        //Password 
        System.Data.SqlClient.SqlCommand insertHost = new System.Data.SqlClient.SqlCommand();
        insertHost.Connection = sc;
        System.Data.SqlClient.SqlCommand insertLogin = new System.Data.SqlClient.SqlCommand();
        insertLogin.Connection = sc;

        firstName = Session["firstName"].ToString();
        lastName = Session["lastName"].ToString();
        gender = Session["gender"].ToString();
        dateOfBirth = Session["dateOfBirth"].ToString();
        email = Session["email"].ToString();
        phoneNumber = Session["phoneNumberTextbox"].ToString();

        String password = passwordTextbox.Text;
        String cpassword = confirmPasswordTextbox.Text;

        Session["password"] = password;

        if (count == 0)
        {
            bool isValid;
            if (password.Length > 8 && (isValid = ValidatePassword(password)))
            {
                if (password == cpassword)
                {
                    Homeowner newHost = new Homeowner(firstName, lastName, gender, dateOfBirth, email, phoneNumber, userNameTextbox.Text, passwordTextbox.Text, confirmPasswordTextbox.Text);
                    resultmessage.Text = "";
                    insertHost.CommandText = "INSERT INTO [Capstone].[dbo].[Host] (Email, PhoneNumber, Firstname, MiddleName, LastName, BirthDate," +
                                "Gender, BackgroundCheckDate, BackgroundCheckResult, LastUpdatedBy, LastUpdated) VALUES (@Email, @PhoneNumber, @FirstName, @MiddleName," +
                                "@LastName, @BirthDate, @Gender, @BackgroundCheckDate, @BackgroundCheckResult, @LastUpdatedBy, @LastUpdated); ";

                    insertHost.Parameters.AddWithValue("@Email", email);
                    insertHost.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                    insertHost.Parameters.AddWithValue("@FirstName", firstName);
                    insertHost.Parameters.AddWithValue("@MiddleName", " ");
                    insertHost.Parameters.AddWithValue("@LastName", lastName);
                    insertHost.Parameters.AddWithValue("@BirthDate", dateOfBirth);
                    insertHost.Parameters.AddWithValue("@Gender", gender);
                    insertHost.Parameters.AddWithValue("@BackgroundCheckDate", DateTime.Now);
                    insertHost.Parameters.AddWithValue("@BackgroundCheckResult", "Y");
                    //ADD USERNAME and CONFIRM PASSOWRD IN DATABASE
                    insertHost.Parameters.AddWithValue("@LastUpdatedBy", lastName);
                    insertHost.Parameters.AddWithValue("@LastUpdated", DateTime.Now);

                    sc.Open();
                    insertHost.ExecuteNonQuery();

                    SqlCommand insert = new SqlCommand("SELECT HostID FROM [Capstone].[dbo].[Host] WHERE lower(Email) = @Email", sc);
                    insert.Parameters.AddWithValue("@Email", email.ToLower());
                    insert.Connection = sc;
                    int hostID = Convert.ToInt32(insert.ExecuteScalar());
                    insert.ExecuteNonQuery();
                    Session["hostID"] = hostID;


                    Login tempLogin = new Login(userNameTextbox.Text, passwordTextbox.Text);
                    insertLogin.CommandText = "INSERT INTO [Capstone].[dbo].[Login] (Username, Password, hostID) VALUES (@userName, @Password, @hostID)";
                    insertLogin.Parameters.AddWithValue("@userName", newHost.userName);
                    insertLogin.Parameters.AddWithValue("@Password", PasswordHash.HashPassword(newHost.password));
                    insertLogin.Parameters.AddWithValue("@hostID", hostID);

                    SqlCommand getAccountID = new SqlCommand("SELECT AccountID FROM [Capstone].[dbo].[Login] WHERE HostID = @HostID", sc);
                    getAccountID.Parameters.AddWithValue("@HostID", hostID);
                    getAccountID.Connection = sc;
                    int accountID = Convert.ToInt32(getAccountID.ExecuteScalar());
                    getAccountID.ExecuteNonQuery();
                    Session["accountID"] = accountID;
                    Session["username"] = newHost.userName;

                    insertLogin.ExecuteNonQuery();
                    sc.Close();
                    Response.Redirect("PropertyInfoHomeowner.aspx");
                }
                else
                {
                    resultmessage.Text = "Passwords does not match.";
                }
            }
            else
            {
                resultmessage.Text = "Password does not meet minimum password requirements.";
            }
        }
        else
        {
            resultmessage.Text = "Username already exists.";
        }

    }

    static bool ValidatePassword(string password)
    {
        const int MIN_LENGTH = 8;

        if (password == null) throw new ArgumentNullException();

        bool meetsLengthRequirements = password.Length >= MIN_LENGTH;
        bool hasUpperCaseLetter = false;
        bool hasLowerCaseLetter = false;
        bool hasDecimalDigit = false;

        if (meetsLengthRequirements)
        {
            foreach (char c in password)
            {
                if (char.IsUpper(c)) hasUpperCaseLetter = true;
                else if (char.IsLower(c)) hasLowerCaseLetter = true;
                else if (char.IsDigit(c)) hasDecimalDigit = true;
            }
        }

        bool isValid = meetsLengthRequirements
                    && hasUpperCaseLetter
                    && hasLowerCaseLetter
                    && hasDecimalDigit
                    ;
        return isValid;
    }

    protected void populate(object sender, EventArgs e)
    {

    }
}