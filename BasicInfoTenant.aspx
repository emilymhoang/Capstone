<%@ Page Title="Basic Info Tenant" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BasicInfoTenant.aspx.cs" Inherits="BasicInfoTenant" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    </header>

    <section id="creation" style="margin-top: 4rem;">
      <div class="container">
          <div class="row">
            <div class="col">
              <label for="formGroupExampleInput">First Name</label>
              <asp:Textbox ID="firstNameTextbox" class="form-control" MaxLength="30" placeholder="First Name" runat="server"></asp:Textbox>
                <asp:RequiredFieldValidator ID="firstNameRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="firstNameTextbox" ForeColor="#B23325"></asp:RequiredFieldValidator>
            </div>
            <div class="col">
              <label for="formGroupExampleInput">Last Name</label>
              <asp:Textbox id="lastNameTextbox" class="form-control" MaxLength="30" placeholder="Last Name" runat="server"></asp:Textbox>
              <asp:RequiredFieldValidator ID="lastNameRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="lastNameTextbox" ForeColor="#B23325"></asp:RequiredFieldValidator>
            </div> <!--end col-->
          </div> <!--end row class-->
          <br>
          <div class="row">
            <div class="col">
              <label for="formGroupExampleInput">Gender</label>
               <asp:DropDownList ID="DropDownListGender" runat="server">
	<asp:ListItem Value="M">Male</asp:ListItem>
    <asp:ListItem Value="F">Female</asp:ListItem>
    <asp:ListItem Value="O">Other</asp:ListItem>
                  </asp:DropDownList>
              <asp:RequiredFieldValidator ID="genderRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="DropDownListGender" ForeColor="#B23325"></asp:RequiredFieldValidator>
            </div>
            <div class="col">
              <label for="formGroupExampleInput">Date of Birth</label>
              <asp:Textbox id="dateOfBirthTextbox" class="form-control" MaxLength="10" placeholder="DD-MM-YYYY" runat="server"></asp:Textbox>
              <asp:RequiredFieldValidator ID="dateOfBirthRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="dateOfBirthTextbox" ForeColor="#B23325"></asp:RequiredFieldValidator>
            </div> <!--end col-->
          </div> <!--end row class-->
          <br>
          <div class="row">
            <div class="col">
              <label for="formGroupExampleInput">Email</label>
              <asp:Textbox id="emailTextbox" runat="server" class="form-control" MaxLength="50" placeholder="example@example.com"></asp:Textbox>
              <asp:RequiredFieldValidator ID="emailRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="emailTextbox" ForeColor="#B23325"></asp:RequiredFieldValidator>
            </div>
            <div class="col">
              <label for="formGroupExampleInput">Confirm Email</label>
              <asp:Textbox id="confirmEmailTextbox" runat="server" class="form-control" MaxLength="50" placeholder="example@example.com"></asp:Textbox>
              <asp:RequiredFieldValidator ID="confirmRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="confirmEmailTextbox" ForeColor="#B23325"></asp:RequiredFieldValidator>
            </div> <!--end col-->
          </div> <!--end row class-->
        <br>
            <br>
          <div class="row">
             <div class="col">
              <label for="formGroupExampleInput">Phone Number</label>
              <asp:Textbox id="phoneNumberTextbox" class="form-control" MaxLength="50" placeholder="xxx-xxx-xxxx" runat="server"></asp:Textbox>
              <asp:RequiredFieldValidator ID="phoneNumberRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="phoneNumberTextbox" ForeColor="#B23325"></asp:RequiredFieldValidator>
            </div>
              <div class="col">
             </div> <!--end col-->
          </div> <!--end row class-->
        <br>
        
        <div class="row" style="margin-bottom: 3rem;"> 
          <div class="col-md-6"></div>
            
            <div class="col-md-6"><asp:Button ID ="populatebutton" class="btn" Text ="Populate" type="submit" onClick="populate" style="float: right;" runat="server" CausesValidation="false"></asp:Button></div>
             <div class="col-md-6"><asp:Button ID ="nextButton" class="btn" Text ="Next>" type="submit" onClick="submitBasicInfo" style="float: right;" runat="server"></asp:Button></div>
            
        </div>     
      </div> <!--end container-->
    </section>
</asp:Content>
   