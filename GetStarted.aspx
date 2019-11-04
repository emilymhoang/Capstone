<%@ Page Title="Basic Info Tenant" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GetStarted.aspx.cs" Inherits="GetStarted" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <style type="text/css">
       h1 {
        font-family: 'Oswald', sans-serif;
        color: #CC6559;
        text-align: center;
        font-size: 50px;
        }

        .btn {
           font-family: 'Oswald', sans-serif;
           color: white; 
           font-size: 20px;
       }
        </style>
  <section id="creation" style="margin-top: 4rem;">
      <div class="container">
   <header style="margin-top: 8rem;">
      <div class="container">
        <h1>Welcome to the first step in finding your perfect housemate</h1> <br />
        <p style="font-family: 'Oswald', sans-serif; color: #756664; text-align: center; font-size: 20px;">Tell us some things about yourself so we can find the best option for you.</p><br />
           <div class="progress " >
                <div class="progress-bar progress-bar-striped " role="progressbar" style="width: 10%; " aria-valuenow="66" ></div>
               </div><br />
           <div class="col-md-6" style="align-items: center;">
                <div><asp:Button ID="RentMyRoomButton" class="btn" style="float: right; margin: auto;" runat="server" Text="Rent My Room" onClick = "RentMyRoom" AutoPostBack ="true"></asp:Button>
                <asp:Button ID="FindMyRoomButton" class="btn" style="float: right;  margin: auto;" runat="server" Text="Find My Room" OnClick ="FindMyRoom" AutoPostBack ="true"></asp:Button><br /><br /></div>
             </div>
       </div>
    </header>
      </div> <!--end container-->
    </section>
</asp:Content>
