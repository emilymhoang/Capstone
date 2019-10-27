<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PropertyInfoHomeowner.aspx.cs" Inherits="PropertyInfoHomeowner" %>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="Room Magnet">
<meta name="keywords" content="room magnet, roommate, housing, matchmaking, house, apartment, living arrangement">
<meta name="author" content="Room Magnet">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Room Magnet</title>

<!-- Bootstrap v4 -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="screen">
<!-- custom css -->
<link href="css/custom.css" rel="stylesheet" type="text/css" media="screen">
<link rel="shortcut icon" href="images/logo-02.png" type="image/x-icon"/>
</head>

<body>
        
<div  class="container">
    <div class=" fixed-top navbar-expand-lg " style="background-color: white;" id="custom-nav">
    	<div class="row" >
        <div class="col-md-3"> 
       		<a href="index.html"><img src="images/logo-01.png" alt="Room Magnet Logo" class="img-fluid" style="margin-left: 1em; max-width: 100px;"></a> 
        </div> <!-- end div header left - logo -->       
        
        <div class="col-md-9 navhome" style="text-align: right;"><!-- start nav header right -->   	
           
               <a href="#" class="btn btnb">Get Started</a>
           
               <a href="#" class="btn btnb">My Account</a>
           
               
          
            <nav ><ul class="nav justify-content-end">
             
              <li class="nav-item ">
                <a class="nav-link " href="#" style="font-family: 'DIN Alternate Bold'; color: #756664; font-size: 16px;">Home-Owners</a>
              </li>
                
                <li class="nav-item">
                <a class="nav-link" href="#" style="font-family: 'DIN Alternate Bold'; color: #756664; font-size: 16px;">Tenants</a>
              </li>
               
              
                
                <li class="nav-item">
                <a class="nav-link" href="#" style="font-family: 'DIN Alternate Bold'; color: #756664; font-size: 16px;">FAQ</a>
              </li>
            </ul>   
        </nav> 
            </div>
        </div> <!-- end nav row -->  
     </div>  <!-- end div navbar -->
     
</div> <!-- end div container! -->

   <header style="margin-top: 8rem;">
      <div class="container">
        <h1>Tell us about yourself.</h1>
        <p>Let us find you the perfect housemate.</p>
      </div>
       
       <div class="row">
           <div class="col-md-6 promar" >
                <div class="progress " >
                <div class="progress-bar progress-bar-striped " role="progressbar" style="width: 75%; " aria-valuenow="75" ></div>
               </div>
           </div>
       </div>
       
       
    </header>

    <section id="creation" style="margin-top: 4rem;">
      <div class="container">
        <form runat="server">
          <div class="row">
            <div class="col">
              <label for="formGroupExampleInput">Address Line 1*</label>
              <asp:Textbox ID="AddressLine1Textbox" class="form-control" placeholder="" runat="server"></asp:Textbox>
                <asp:RequiredFieldValidator ID="Address1RequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="AddressLine1Textbox" ForeColor="#B23325"></asp:RequiredFieldValidator>
            </div>
            <div class="col">
              <label for="formGroupExampleInput">Appt # (If applicable)</label>
              <asp:Textbox id="AptNumTextbox" class="form-control" placeholder="" runat="server"></asp:Textbox>
                <asp:RequiredFieldValidator ID="AptNumRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="AptNumTextbox" ForeColor="#B23325"></asp:RequiredFieldValidator>
            </div> <!--end col-->
          </div> <!--end row class-->
          <br>
          <div class="row">
            <div class="col">
              <label for="formGroupExampleInput">City*</label>
              <asp:Textbox id="cityTextbox" class="form-control" placeholder="" runat="server"></asp:Textbox>
                <asp:RequiredFieldValidator ID="cityRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="cityTextbox" ForeColor="#B23325"></asp:RequiredFieldValidator>
            </div>
            <div class="col">
              <label for="formGroupExampleInput">State</label>
              <asp:DropDownList ID="DropDownListState" runat="server">
	<asp:ListItem Value="">Select a state</asp:ListItem>
    <asp:ListItem Value="AL">Alabama</asp:ListItem>
	<asp:ListItem Value="AK">Alaska</asp:ListItem>
	<asp:ListItem Value="AZ">Arizona</asp:ListItem>
	<asp:ListItem Value="AR">Arkansas</asp:ListItem>
	<asp:ListItem Value="CA">California</asp:ListItem>
	<asp:ListItem Value="CO">Colorado</asp:ListItem>
	<asp:ListItem Value="CT">Connecticut</asp:ListItem>
	<asp:ListItem Value="DC">District of Columbia</asp:ListItem>
	<asp:ListItem Value="DE">Delaware</asp:ListItem>
	<asp:ListItem Value="FL">Florida</asp:ListItem>
	<asp:ListItem Value="GA">Georgia</asp:ListItem>
	<asp:ListItem Value="HI">Hawaii</asp:ListItem>
	<asp:ListItem Value="ID">Idaho</asp:ListItem>
	<asp:ListItem Value="IL">Illinois</asp:ListItem>
	<asp:ListItem Value="IN">Indiana</asp:ListItem>
	<asp:ListItem Value="IA">Iowa</asp:ListItem>
	<asp:ListItem Value="KS">Kansas</asp:ListItem>
	<asp:ListItem Value="KY">Kentucky</asp:ListItem>
	<asp:ListItem Value="LA">Louisiana</asp:ListItem>
	<asp:ListItem Value="ME">Maine</asp:ListItem>
	<asp:ListItem Value="MD">Maryland</asp:ListItem>
	<asp:ListItem Value="MA">Massachusetts</asp:ListItem>
	<asp:ListItem Value="MI">Michigan</asp:ListItem>
	<asp:ListItem Value="MN">Minnesota</asp:ListItem>
	<asp:ListItem Value="MS">Mississippi</asp:ListItem>
	<asp:ListItem Value="MO">Missouri</asp:ListItem>
	<asp:ListItem Value="MT">Montana</asp:ListItem>
	<asp:ListItem Value="NE">Nebraska</asp:ListItem>
	<asp:ListItem Value="NV">Nevada</asp:ListItem>
	<asp:ListItem Value="NH">New Hampshire</asp:ListItem>
	<asp:ListItem Value="NJ">New Jersey</asp:ListItem>
	<asp:ListItem Value="NM">New Mexico</asp:ListItem>
	<asp:ListItem Value="NY">New York</asp:ListItem>
	<asp:ListItem Value="NC">North Carolina</asp:ListItem>
	<asp:ListItem Value="ND">North Dakota</asp:ListItem>
	<asp:ListItem Value="OH">Ohio</asp:ListItem>
	<asp:ListItem Value="OK">Oklahoma</asp:ListItem>
	<asp:ListItem Value="OR">Oregon</asp:ListItem>
	<asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
	<asp:ListItem Value="RI">Rhode Island</asp:ListItem>
	<asp:ListItem Value="SC">South Carolina</asp:ListItem>
	<asp:ListItem Value="SD">South Dakota</asp:ListItem>
	<asp:ListItem Value="TN">Tennessee</asp:ListItem>
	<asp:ListItem Value="TX">Texas</asp:ListItem>
	<asp:ListItem Value="UT">Utah</asp:ListItem>
	<asp:ListItem Value="VT">Vermont</asp:ListItem>
	<asp:ListItem Value="VA">Virginia</asp:ListItem>
	<asp:ListItem Value="WA">Washington</asp:ListItem>
	<asp:ListItem Value="WV">West Virginia</asp:ListItem>
	<asp:ListItem Value="WI">Wisconsin</asp:ListItem>
	<asp:ListItem Value="WY">Wyoming</asp:ListItem>

</asp:DropDownList>
            </div> <!--end col-->
              <div class="col">
              <label for="formGroupExampleInput">Zip*</label>
              <asp:Textbox id="zipTextbox" class="form-control" placeholder="" runat="server"></asp:Textbox>
                  <asp:RequiredFieldValidator ID="zipRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="zipTextbox" ForeColor="#B23325"></asp:RequiredFieldValidator>
            </div>
          </div> <!--end row class-->
          <br>
          <div class="row">
            <div class="col">
              <label for="formGroupExampleInput">Don't fret, only your city, state, and zip code will appear on your profile to potential tenants</label>
            </div> <!--end col-->
          </div> <!--end row class-->
             <div class="row">
            <div class="col">
              <label for="formGroupExampleInput">Please briefly describe your property*</label>
              <asp:DropDownList ID="DropDownList1" runat="server">
    <asp:ListItem Value="Single Room">Single Room</asp:ListItem>
                  <asp:ListItem Value="Shared Space">Shared Space</asp:ListItem>
</asp:DropDownList>
            </div>
          </div> <!--end row class-->
            <div class="row">
            <div class="col">
              <label for="formGroupExampleInput">What best describes your property?*</label>
              <asp:Textbox ID="displayTextbox" class="form-control" placeholder="" runat="server"></asp:Textbox>

            </div>
          </div> <!--end row class-->
             <div class="row">
            <div class="col">
              <label for="formGroupExampleInput">Does the space have a private bathroom?*</label>
              <asp:RadioButtonList ID="rbPribateBr" runat="server">
                    <asp:ListItem Text="Yes" Value="yesPrivateBr" />
                    <asp:ListItem Text="No" Value="noPrivateBr" />
            </asp:RadioButtonList>
            </div>
            <div class="col">
              <label for="formGroupExampleInput">Does the space have a private enterence?*</label>
              <asp:RadioButtonList ID="rbPrivateEntr" runat="server">
                    <asp:ListItem Text="Yes" Value="yesPrivateEntr" />
                    <asp:ListItem Text="No" Value="noPrivateEntr" />
            </asp:RadioButtonList>
            </div> <!--end col-->
                 <div class="col">
              <label for="formGroupExampleInput">Does the space have a closet/ storage space?*</label>
              <asp:RadioButtonList ID="rbStorage" runat="server">
                    <asp:ListItem Text="Yes" Value="yesStorage" />
                    <asp:ListItem Text="No" Value="noStorage" />
            </asp:RadioButtonList>
            </div> <!--end col-->
          </div> <!--end row class-->
        <br>
             <div class="row">
            <div class="col">
              <label for="formGroupExampleInput">Is the space furnished?*</label>
              <asp:RadioButtonList ID="rbFurnished" runat="server">
                    <asp:ListItem Text="Yes" Value="yesFurnished" />
                    <asp:ListItem Text="No" Value="noFurnished" />
            </asp:RadioButtonList>
            </div>
            <div class="col">
              <label for="formGroupExampleInput">Do you smoke/ allow smokers?*</label>
              <asp:RadioButtonList ID="rbSmoke" runat="server">
                    <asp:ListItem Text="Yes" Value="yesSmoke" />
                    <asp:ListItem Text="No" Value="noSmoke" />
            </asp:RadioButtonList>
            </div> <!--end col-->
                 <div class="col">
              <label for="formGroupExampleInput">Do you have pets?*</label>
              <asp:RadioButtonList ID="rbPets" runat="server">
                    <asp:ListItem Text="Yes" Value="yesPets" />
                    <asp:ListItem Text="No" Value="noPets" />
            </asp:RadioButtonList>
            </div> <!--end col-->
          </div> <!--end row class-->
            <div class="row">
            <div class="col">
              <label for="formGroupExampleInput">Tell us more about your rental space*</label>
              <asp:Textbox ID="descriptionTextbox" class="form-control" placeholder="" runat="server"></asp:Textbox>
            </div>
          </div> <!--end row class-->
        <div class="row" style="margin-bottom: 3rem;"> 
          <div class="col-md-6"></div>
            
             <div class="col-md-6"><asp:Button ID ="submitButton" class="btn" Text ="Next>" type="submit" onClick="submitBasicInfo" style="float: right;" runat="server"></asp:Button></div>
            
        </div>     
       </form> <!--end form-->
      </div> <!--end container-->
    </section>
    
    
    
    
    
<footer class="footer mt-auto py-3 footer-expand-lg"><!-- start footer! -->
   <div class="row" style="padding-left: 3rem;">
    <div class="col-md-4" style="padding-left: 3rem;">   
    <h3 class="din">Room Magnet</h3>
    <p>Support:<br>
    540-123-4567<br>
    <a href="mailto:help@roommagnet.com">help@roommagnet.com</a></p>
    </div>
       
    <div class="col-md-4" style="padding-left: 3rem;">   
    <h4 class="din">Site Map</h4>
        <p><a href="#">Home-Owners</a><br>
        <a href="#">Tenants</a><br>
        <a href="#">Safety</a><br>
        <a href="#">FAQ</a><br>
        <a href="#">Contact Us</a>
    </p>
    </div>
    
    <div class="col-md-4" style="padding-left: 3rem;">   
    <h4 class="din">Stay Connected</h4>
    <p>
    <a href="#"><img src="images/social-icons-02.png" class="img-fluid" style="max-width: 180px;"></a></p>
    </div>
       
    </div>
</footer><!-- end footer! --> 
    
<!-- jQuery and Bootstrap links - do not delete! -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<!-- end of do not delete -->
</body>
</html>