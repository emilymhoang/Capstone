using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BasicInfoHomeowner : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submitBasicInfo(object sender, EventArgs e)
    {
        Response.Redirect("CreateLoginHomeowner.aspx");
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