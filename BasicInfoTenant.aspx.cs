using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BasicInfoTenant : System.Web.UI.Page
{
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["RDSConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submitBasicInfo(object sender, EventArgs e)
    {
        Session["firstName"] = firstNameTextbox.Text;
        Session["lastName"] = lastNameTextbox.Text;
        Session["gender"] = DropDownListGender.SelectedValue;
        Session["dateOfBirth"] = dateOfBirthTextbox.Text;
        Session["email"] = emailTextbox.Text;
        Session["phoneNumberTextbox"] = phoneNumberTextbox.Text;
        //Session["firstName"] = "Emily";
        //Session["lastName"] = "Hoang";
        //Session["gender"] = "F";
        //Session["dateOfBirth"] = "12-02-1997";
        //Session["email"] = "emily@gmail.com";
        //Session["phoneNumberTextbox"] = "703-342-7285";
        Response.Redirect("CreateLoginTenant.aspx");

    }

    protected void populate(object sender, EventArgs e)
    {
        firstNameTextbox.Text = "Emily";
        lastNameTextbox.Text = "Hoang";
        DropDownListGender.SelectedValue = "F";
        dateOfBirthTextbox.Text = "12-02-1997";
        emailTextbox.Text = "emily@gmail.com";
        phoneNumberTextbox.Text = "703-342-7285";

    }

}