<%@ Page Title="Room Info" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PropertyRoom.aspx.cs" Inherits="_Default" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <header style="margin-top: 8rem;">
      <div class="container">
        <h1>Tell us about the room</h1>
                <div class="progress " >
                <div class="progress-bar progress-bar-striped " role="progressbar" style="width: 80%; " aria-valuenow="25" ></div>
               </div>
      </div>
       
   
       
       
    </header>

    <section id="creation" style="margin-top: 4rem;">
      <div class="container">
          <div class="row">
            <div class="col">
              <label for="formGroupExampleInput">Monthly Price</label>
              <asp:Textbox ID="monthlyPriceTextbox" class="form-control" MaxLength="30" placeholder="$800.00" runat="server"></asp:Textbox>
                <asp:RequiredFieldValidator ID="monthlyPriceRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="monthlyPriceTextbox" ForeColor="#B23325"></asp:RequiredFieldValidator>
            </div>
            <div class="col">
              <label for="formGroupExampleInput">Square Footage</label>
              <asp:Textbox id="squareFootageTextbox" class="form-control" MaxLength="30" placeholder="941" runat="server"></asp:Textbox>
              <asp:RequiredFieldValidator ID="squareFootageRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="squareFootageTextbox" ForeColor="#B23325"></asp:RequiredFieldValidator>
            </div> <!--end col-->
          </div> <!--end row class-->
          <br>
          <div class="row">
            <div class="col">
             <label for="formGroupExampleInput">Availibility</label>
              <asp:DropDownList ID="DropDownListAvailibility" runat="server">
	<asp:ListItem Value="Y">Yes</asp:ListItem>
    <asp:ListItem Value="N">No</asp:ListItem>
                  </asp:DropDownList>
              <asp:RequiredFieldValidator ID="AvailibilityRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="DropDownListAvailibility" ForeColor="#B23325"></asp:RequiredFieldValidator>
            </div>
            <div class="col">
              </div> <!--end col-->
          </div> <!--end row class-->
          <br>
        <br>
        
        <div class="row" style="margin-bottom: 3rem;"> 
          <div class="col-md-6"></div>
            
             <div class="col-md-6"><asp:Button ID ="nextButton" class="btn" Text ="Next>" type="submit" onClick="submitBasicInfo" style="float: right;" runat="server"></asp:Button></div>
            
        </div>     
      </div> <!--end container-->
    </section>
</asp:Content>

