using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BasicInfoForm : System.Web.UI.Page
{
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["CapstoneConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["firstName"] = firstNameTextbox.Text;
        Session["lastName"] = lastNameTextbox.Text;
        Session["gender"] = genderTextbox.Text;
        Session["dateOfBirth"] = dateOfBirthTextbox.Text;
        Session["email"] = emailTextbox.Text;
        Session["phoneNumberTextbox"] = phoneNumberTextbox.Text;
    }

    protected void submitBasicInfo(object sender, EventArgs e)
    {
        //sc.Open();
        //System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        //insert.Connection = sc;

        ////create a Tenant object
        //Session["firstName"] = firstNameTextbox.Text;
        //Session["lastName"] = lastNameTextbox.Text;
        //Session["gender"] = genderTextbox.Text;
        //Session["dateOfBirth"] = dateOfBirthTextbox.Text;
        //Session["email"] = emailTextbox.Text;
        //Session["phoneNumberTextbox"] = phoneNumberTextbox.Text;
    }

}