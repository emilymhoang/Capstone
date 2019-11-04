<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TenantDashboard.aspx.cs" Inherits="TenantDashboard" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .modalBackground{
            background-color: black;
            filter:alpha(opacity=90) !important;
            opacity:0.6 ! important;
            z-index: 20;
        }
        .modalpopup{
            padding: 20px 0px 24px 10px;
            position: relative;
            width: 500px;
            height: 500px;
            background-color: white;
            border: 1px solid black;
        }
        .btn {
           font-family: 'Oswald', sans-serif;
           color: white; 
           font-size: 20px;
       }
    </style>
<div  class="container">
  <div class="row " style="margin-top: 7rem; ">
    <div class="col-md-9">
        <h1><asp:Label ID="dashboardTitle" runat="server" Text=""></asp:Label></h1>
      </div>
    <div class="col-md-3">
        <a href="Search.aspx" class="btn " style="margin-top: 1rem;">Search Properties</a>
      </div>
    </div><!-- end div row -->  
    
    
   <div class="row " style="margin-top: 1rem;">
    <div class="col-md-6" style="border: solid; border-color: white;">
        <div class="row">
            <div class="col-md-6">
               <h2 >Your Profile</h2> 
            </div>
            <div class="col-md-6">
                <a href="EditProfileTenant.aspx" class="btn" >Edit Profile</a>
            </div>
        </div>
           <%--    begin file container--%>
        <div class="row" style="background-color: #ebebeb; margin-top: 1rem; margin-bottom: 1rem;" >
            <div class="col-md-6" style="margin-top: 1rem;">
                    <asp:Image ID="image1" ImageUrl="" class="img-fluid" runat="server" />
                
                <div class="row" style="margin-top: 1rem;">
                    <div class="col-md-6">
                        <asp:Image ID="image2" ImageUrl="" class="img-fluid" runat="server" />
                    </div>
                    <div class="col-md-6">
                        <asp:Image ID="image3" ImageUrl="" class="img-fluid" runat="server" />
                    </div>
                </div>
            </div>
             <div class="col-md-6" style="margin-top: 1rem;">
                <h3><asp:Label ID="nameTextbox" runat="server" Text="John Smith" BackColor="#ebebeb"></asp:Label></h3>
                 <p><asp:Label ID="usernameTextbox" runat="server" Text="JohnSmith1" BackColor="#ebebeb"></asp:Label></p>
                 <p><asp:Label ID="emailTextbox" Text="johnsmith@gmailcom" runat="server" BackColor="#ebebeb"></asp:Label></p>
                 <p><asp:Label ID="phoneTextbox" Text="xxx-xxx-xxx" runat="server"  BackColor="#ebebeb"></asp:Label></p>
                 <img src="images/badges-01.png" style="max-width: 150px;">
            </div>

        <%--    end profile container--%>
        </div>
      </div>
       
       
       <div class="col-md-6" style="border: solid; border-color: white; ">
        <div class="row">
            <h2 >Your Favorites</h2>
        </div>
           
<div class="row " style="margin-top: 1rem;">
        <div class="col-md-6"  style="border: solid; border-color: white;">
            <div class="row">
                <div class="col-md-12">
                   <h2 >Your Favorites</h2> 
                </div>

            </div>

            <div class="row" style="background-color: #ebebeb; margin-top: 1rem; margin-bottom: 1rem;" >
                <div class="col-md-12" style="margin-top: 1rem; border-bottom: solid; border-bottom-width: 1px;">
                    <div><asp:ListView id="lvFavorites" runat="server" Visible="true" >
                        <LayoutTemplate><h1>Your Favorites</h1>
                        <table id="favorites" runat="server">
                            <tr id="itemPlaceholder" runat="server"></tr>
                        </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                        <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblSenderName" runat="Server" Text='<%#Eval("hostName") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <th>Host Name </th>
                                </tr>
                            </table>
                        </ItemTemplate>

                    </asp:ListView>
                </div>
                </div>
            </div>
          </div>
         </div>
        
      </div>      
    
    </div><!-- end div big row -->
    
    
     <div class="row " style="margin-top: 1rem;">
        <div class="col-md-6"  style="border: solid; border-color: white;">
            <div class="row">
                <div class="col-md-12">
                   <h2 >Message Board</h2> 
                </div>

            </div>

            <div class="row" style="background-color: #ebebeb; margin-top: 1rem; margin-bottom: 1rem;" >
                <div class="col-md-12" style="margin-top: 1rem; border-bottom: solid; border-bottom-width: 1px;">
                    <div><asp:ListView id="lvMessages" runat="server" Visible="true" >
                        
                        <LayoutTemplate>
                            <h1>Message Board</h1>
                        <table id="tbl1" runat="server">
                            <tr id="itemPlaceholder" runat="server"></tr>
                        </table>
                        </LayoutTemplate>

                        <ItemTemplate>
                        <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblSenderName" runat="Server" Text='<%#Eval("senderName") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <th>Sender Name </th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblMessage" runat="Server" Text='<%#Eval("message") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <th>Message </th>
                                </tr>

                            </table>
                        </ItemTemplate>

                    </asp:ListView>
                </div>
                </div>
            </div>
          </div>
         </div>

    <div class="col-md-6">
        <asp:Button ID="createMessageButton" runat="server" Text="Create a Message" AutoPostBack="true" type="submit" class="btn"/>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>        
                <asp:Panel ID="Panel1" runat="server" CssClass="modalpopup">
                    <center>
                        <asp:Label style="font-family: 'Oswald', sans-serif; color: #53A39F; font-size: 30px" ID="Label2" runat="server" Text="Label">Create a Message</asp:Label>
                    </center>
                    <asp:Label style="font-family: 'Oswald', sans-serif; color: #53A39F; font-size: 30px" ID="Label1" runat="server" Text="Label">Send to: </asp:Label>
                       
                        <asp:DropDownList ID="hostNameDropdown" runat="server">
                            <asp:ListItem>02</asp:ListItem>
                            <asp:ListItem>03</asp:ListItem>
                            <asp:ListItem>04</asp:ListItem>
                        </asp:DropDownList>
                       
                        
                        <br />
                    <center>
                        <asp:TextBox ID="messageTextbox" TextMode="MultiLine" class="form-control" style="height:300px; width:400px;" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button class="btn" ID="sendButton" onClick="sendMessage" runat="server" Text="Send" />
                        <asp:Button class="btn" ID="cancelButton" runat="server" Text="Cancel" /> <br/>
                    </center>
                </asp:Panel>
                <AjaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel1" TargetControlID="createMessageButton" BackgroundCssClass="modalBackground" CancelControlID="cancelButton">
                </AjaxToolkit:ModalPopupExtender>
    </div>
    <a data-config="commands=videocall;size=14;status=off;theme=logo;language=en;bgcolor=#000000;hostname=www.skaip.org" id="skaip-buttons" href="http://www.skaip.org/">Skype</a><script src="//apps.skaip.org/buttons/widget/core.min.js" defer="defer"></script>
    <div>
        <a href="skype:Echo123"><button class="btn btn-primary" style="font-family: 'Oswald', sans-serif; color: white; font-size: 18px;">Videochat</button></a>
    </div>


        <div class="col-md-6" style="border: solid; border-color: white;" >
        <div class="row">
            <div class="col-md-12">
               <h2 >Background Check Status</h2> 
            </div>
            
        </div>
        
        <div class="row" style="background-color: #ebebeb; margin-top: 1rem; margin-bottom: 1rem; " >
            <div class="col-md-12" style="margin-top: 1rem; border-bottom: solid; border-bottom-width: 1px;">
               <h3>Status Goes Here</h3>
                <p style="text-align: center;"><img src="images/icons-07.png" style="max-width: 75px;"></p>
                <p>The status of your background check will be explained right here. Background checks are important to us, very important. We take your safety seriously.</p>
            </div>
             
        </div>
      </div>
    
    </div><!-- end div big row -->
    
   
    <div class="row " style="margin-top: 1rem;">
        <div class="col-md-12"  >
            <h2>Your Rental Agreements</h2>
          </div>
    </div><!-- end div big row -->  
    
    <div class="row " style="margin-top: 1rem; background-color: #ebebeb; margin-bottom: 3rem;">
        <div class="col-md-12"  style=" margin-top: 1rem;">
            <p>When you have a rental agreement, it will be indicated here. We hope you find your perfect housing match so that you can have some wonderful rental agreements.</p>
          </div>
    </div><!-- end div big row -->  
    
    
    
</div> <!-- end div container! -->    

</asp:Content>

