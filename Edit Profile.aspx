﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Edit Profile.aspx.cs" Inherits="_Default" %>

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
        <h1>Edit Profile</h1>
      </div>
       
      <%-- <div class="row">
           <div class="col-md-6 promar" >
                <div class="progress " >
                <div class="progress-bar progress-bar-striped " role="progressbar" style="width: 33%; " aria-valuenow="33" ></div>
               </div>
           </div>
       </div>--%>
       
       
    </header>

    <section id="creation" style="margin-top: 4rem;">
      <div class="container">
        <form runat="server">
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
              <label for="formGroupExampleInput">Password</label>
              <asp:Textbox id="passwordTextbox" class="form-control" MaxLength="30" placeholder="Password" runat="server"></asp:Textbox>
              <asp:RequiredFieldValidator ID="passwordRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="passwordTextbox" ForeColor="#B23325"></asp:RequiredFieldValidator>
            </div>
            <div class="col">
              <label for="formGroupExampleInput">Your Password Must:<br>*contain at least 8 characters<br>*contain at least 1 number<br>*contain at least 1 uppercase letter<br>*contain at least 1 lower case letter </label>
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
              <label for="formGroupExampleInput">Phone Number</label>
              <asp:Textbox id="phoneNumberTextbox" class="form-control" MaxLength="50" placeholder="xxx-xxx-xxxx" runat="server"></asp:Textbox>
              <asp:RequiredFieldValidator ID="phoneNumberRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="phoneNumberTextbox" ForeColor="#B23325"></asp:RequiredFieldValidator>
            </div> <!--end col-->
          </div> <!--end row class-->
        <br>
        
        <div class="row" style="margin-bottom: 3rem;"> 
          <div class="col-md-6"></div>
            
           
            <%-- <div class="col-md-6"><asp:Button ID ="nextButton" class="btn" Text ="Next>" type="submit" onClick="submitBasicInfo" style="float: right;" runat="server"></asp:Button></div>--%>
            
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