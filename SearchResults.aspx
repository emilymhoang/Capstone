<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchResults.aspx.cs" Inherits="SearchResults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div  class="container">
  <div class="row fixed-top" style="margin-top: 6.35rem; background-color: white; ">
    <div class="col-md-8">
      <h1 style="margin-left: 2rem;">Search for your perfect space.</h1>
      </div>
    <div class="col-md-4" style="margin-top: 1rem; ">
            
            <input type="text" class="form-control" placeholder="Search">
        </div> <!--end col-->
    </div><!-- end div row -->  
    
    
    <div class="row " style="margin-top: 12rem; border-bottom: solid; border-bottom-width: 1px; ">
        <div class="col-md-4" >
            <h2 class="list-group-item-heading">Host(s) Name Here</h2>
            <h5>Title of space goes here.</h5>
            <p class="list-group-item-text">The brief bio that a homeowner would write about their home would go here. This is a room in an old home, but it's not haunted I swear.</p>
            <img src="images/badges-03.png" style="max-width: 130px;">
        </div>
        <div class="col-md-2" style="margin-top: .5rem;">
            <img src="images/icons-07.png" style="max-width: 30px;">
        </div>
        <div class="col-md-5" style="margin-top: .5rem; float: right; margin-bottom: 1rem;">
            <a href="#"><img src="images/badges-11.png" style="max-width: 100px;"></a>
            <a href="#"><img src="images/badges-12.png" style="max-width: 90px;"></a>
            <a href="#"><img src="images/badges-13.png" style="max-width: 90px;"></a><br><br>
            <img src="images/kitchen.jpeg" class="img-fluid">
        </div>
        
    </div><!-- end div row --> 
    
    
    <div class="row " style="margin-top: 2rem; border-bottom: solid; border-bottom-width: 1px; ">
        <div class="col-md-4" >
            <h2 class="list-group-item-heading">Host(s) Name Here</h2>
            <h5>Title of space goes here.</h5>
            <p class="list-group-item-text">The brief bio that a homeowner would write about their home would go here. This is a room in an old home, but it's not haunted I swear.</p>
            <img src="images/badges-03.png" style="max-width: 130px;">
        </div>
        <div class="col-md-2" style="margin-top: .5rem;">
            <img src="images/icons-07.png" style="max-width: 30px;">
        </div>
        <div class="col-md-5" style="margin-top: .5rem; float: right; margin-bottom: 1rem;">
            <a href="#"><img src="images/badges-11.png" style="max-width: 100px;"></a>
            <a href="#"><img src="images/badges-12.png" style="max-width: 90px;"></a>
            <a href="#"><img src="images/badges-13.png" style="max-width: 90px;"></a><br><br>
            <img src="images/kitchen.jpeg" class="img-fluid">
        </div>
        
    </div><!-- end div row --> 
    <div>
        <asp:ListView id="lvSearchResults" runat="server" Visible="true" >

            <LayoutTemplate>
                <h1>Search Results</h1>
                <table id="tbl1" runat="server">
                    <tr id="itemPlaceholder" runat="server"></tr>
                </table>
            </LayoutTemplate>

            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblName" runat="Server" Text='<%#Eval("cityCounty") %>' />
                        </td>
                    </tr>
                    <tr>
                        <th>state</th>
                        <th>rooms</th>
                        <th>price</th>
                        <th>street</th>
                    </tr>
                    <tr>
                        
                        <td>
                            <asp:Label ID="lblDescription" runat="Server" Text='<%#Eval("homeState") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lblNumberBedrooms" runat="Server" Text='<%#Eval("numberOfRooms") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lblPrice" runat="Server" Text='<%#Eval("priceRange") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lblStreet" runat="Server" Text='<%#Eval("street") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblOther" runat="Server" Text='<%#Eval("zip") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button runat="server" ID="btnAddFav" Text="Add Favorite" />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>

        </asp:ListView>
    </div>

    
    
    
</div> <!-- end div container! -->   
</asp:Content>

