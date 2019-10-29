<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

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

    <div class="container">
           <form runat="server">
        <div class=" fixed-top navbar-expand-lg " style="background-color: white;" id="custom-nav">
            <div class="row">
                <div class="col-md-3">
                    <a href="index.html"><img src="images/logo-01.png" alt="Room Magnet Logo" class="img-fluid" style="margin-left: 1em; max-width: 100px;"></a>
                </div> <!-- end div header left - logo -->

                <div class="col-md-9" style="text-align: right;">
                    <!-- start nav header right -->
                    <div class=" btn">
                        <asp:Button type="button" class="btn btn-primary" runat="server" Text ="Get Started" OnClick ="getStarted"></asp:Button>
                    </div>
                    <div class=" btn">
                        <asp:Button type="button" class="btn btn-primary" runat="server" Text ="My Account" OnClick ="myAccount"></asp:Button>
                    </div>
                    <div class=" btn">
                        <asp:Button type="button" class="btn btn-primary" runat="server" Text ="English" OnClick ="translate"></asp:Button>
                    </div>
                    <nav>
                        <ul class="nav justify-content-end">

                            <li class="nav-item">
                                <a class="nav-link " href="#">Home-Owners</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="#">Tenants</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="#">Safety</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="#">FAQ</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div> <!-- end nav row -->
        </div>  <!-- end div navbar -->
      </form>
    </div> <!-- end div container! -->
    <div class="row" style="background-image: url(images/foldimg_A0_Rectangle_2_pattern.png); background-repeat: no-repeat; background-size:cover; margin-top: 6rem;">

        <div class="col-md-4  ctahome" style="margin-top: 8rem; margin-bottom: 8rem; ">
            <div class="card card-inverse" style="width: 25rem; margin-top: 2rem; margin-bottom: 2rem; margin-right: 1rem;">
                <div class="card-body">
                    <h5 class="card-title" style="text-align: center;">Room Magnet</h5>
                    <p class="card-text" style="text-align: center;">An intergenerational rental matching service that attracts the best option for your needs.</p>
                    <p style="text-align: center;">
                        <a href="#" class="btn btn-primary" style="margin-right: 1rem;">Rent My Room</a>
                        <a href="#" class="btn btn-primary" style="margin-left: 1rem;">Find a Room</a>
                    </p>
                </div>
            </div>
        </div><!-- end div col! -->


    </div><!-- end div row! -->

    <div class="row" style="margin-top: 5rem;">

        <div class="col-md-6 ">
            <div class="card" style="width: 30rem; border: none; margin: 0 auto;">
                <img src="images/scott-webb-1ddol8rgUH8-unsplash.jpg" class="card-img-top" alt="picture of a house">
                <div class="card-body">
                    <p style="text-align: center;"><a href="#" class="btn btn-primary">Your safety is our #1 concern.</a></p>
                </div>
            </div>
        </div><!-- end div col! -->

        <div class="col-md-6">

            <div class="card" style="width: 30rem; border: none; margin: 0 auto;;">
                <img src="images/ben_o_bro_wpU4veNGnHg_unsplash_A0_Rectangle_15_pattern.png" class="card-img-top" alt="picture of a house">
                <div class="card-body">
                    <p style="text-align: center;"><a href="#" class="btn btn-primary">Search by city &amp; preferences.</a></p>
                </div>
            </div>

        </div><!-- end div col! -->

    </div> <!-- end div row! -->


    <div class="row" style="margin-top: 2rem; margin-left: 1rem;">
        <div class="col-md-12">
            <h3>Hear From Some Happy Customers</h3>
        </div>
    </div><!-- end div row! -->

    <div class="row">
        <div class="col-md-12">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>

                <div class="carousel-inner">
                    <div class="row">
                        <div class="carousel-item active">
                            <div class="col-md-6">
                                <img src="images/Screen%20Shot%202019-10-16%20at%204.40.08%20PM.png" class="d-block w-100" alt="...">
                            </div>
                            <div class="col-md-6">
                                <p class="d-block w-100">text goes here.</p>
                            </div>
                        </div>


                        <div class="carousel-item ">
                            <div class="col-md-4 offset-1">
                                <img src="images/Screen%20Shot%202019-10-16%20at%204.40.08%20PM.png" class="d-block w-100" alt="...">
                            </div>
                            <div>
                                <p class="d-block w-100">text goes here.</p>
                            </div>
                        </div>
                    </div>

                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div><!-- end div carousel! -->
    </div><!-- end div row! -->


    <div class="row" style="margin-top: 2rem; margin-left: 1rem;">
        <div class="col-md-12">
            <h3>How We Work</h3>
        </div>
    </div><!-- end div row! -->


    <div class="row">
        <div class="col-md-2" style="margin: 0 auto;">
            <p style="text-align: center;"><img src="images/icons-01.png" style="max-width: 100px;"></p>
            <p style="text-align: center;">Text goes here.</p>
        </div>
        <div class="col-md-1">
            <p style="text-align: center; font-size: 5rem; margin: 0 auto; margin-top: 2rem;">&#8594;</p>
        </div>

        <div class="col-md-2" style="margin: 0 auto;">
            <p style="text-align: center;"><img src="images/icons-02.png" style="max-width: 100px;"></p>
            <p style="text-align: center;">Text goes here.</p>
        </div>
        <div class="col-md-1">
            <p style="text-align: center; font-size: 5rem; margin: 0 auto; margin-top: 2rem;">&#8594;</p>
        </div>

        <div class="col-md-2" style="margin: 0 auto;">
            <p style="text-align: center;"><img src="images/icons-03.png" style="max-width: 100px;"></p>
            <p style="text-align: center;">Text goes here.</p>
        </div>
        <div class="col-md-1">
            <p style="text-align: center; font-size: 5rem; margin: 0 auto; margin-top: 2rem;">&#8594;</p>
        </div>
        <div class="col-md-2" style="margin: 0 auto;">
            <p style="text-align: center;"><img src="images/icons-04.png" style="max-width: 100px;"></p>
            <p style="text-align: center;">Text goes here.</p>
        </div>

    </div><!-- end div row! -->

    <div class="row" style="margin-top: 2rem; margin-left: 1rem;">
        <div class="col-md-12">
            <h3>We have properties available in the following locations</h3>
        </div>
    </div><!-- end div row! -->

    <div class='tableauPlaceholder' id='viz1572313628086' style='position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ca&#47;CapstoneMap_15723112370830&#47;Dashboard1&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz' style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='CapstoneMap_15723112370830&#47;Dashboard1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ca&#47;CapstoneMap_15723112370830&#47;Dashboard1&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='filter' value='publish=yes' /></object></div>
    <script type='text/javascript'>var divElement = document.getElementById('viz1572313628086'); var vizElement = divElement.getElementsByTagName('object')[0]; if (divElement.offsetWidth > 800) { vizElement.style.width = '1000px'; vizElement.style.height = '827px'; } else if (divElement.offsetWidth > 500) { vizElement.style.width = '1000px'; vizElement.style.height = '827px'; } else { vizElement.style.width = '100%'; vizElement.style.height = '727px'; } var scriptElement = document.createElement('script'); scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js'; vizElement.parentNode.insertBefore(scriptElement, vizElement);</script>

    <!--<div class="row" style="margin-top: 2rem; margin-bottom: 2rem;">
         <div class="col-md-12">
             <p style="text-align: center">1,203</p>
             <p style="text-align: center">housing matches made this year.<br>Be the next one.</p>
             <p style="text-align: center;">
                 <a href="#" class="btn btn-primary" style="margin-right: 1rem; margin: 0 auto;">Get Started</a>
             </p>
         </div>
     </div>-->
    <!-- end div row! -->





    <footer class="footer mt-auto py-3 footer-expand-lg">
        <!-- start footer! -->
        <div class="row" style="padding-left: 3rem;">
            <div class="col-md-4" style="padding-left: 3rem;">
                <h3>Room Magnet</h3>
                <p>
                    Support:<br>
                    540-123-4567<br>
                    <a href="mailto:help@roommagnet.com">help@roommagnet.com</a>
                </p>
            </div>

            <div class="col-md-4" style="padding-left: 3rem;">
                <h4>Site Map</h4>
                <p>
                    <a href="#">Home-Owners</a><br>
                    <a href="#">Tenants</a><br>
                    <a href="#">Safety</a><br>
                    <a href="#">FAQ</a><br>
                    <a href="#">Contact Us</a>
                </p>
            </div>

            <div class="col-md-4" style="padding-left: 3rem;">
                <h4>Stay Connected</h4>
                <p>
                    <a href="#"><img src="images/social-icons-02.png" class="img-fluid" style="max-width: 180px;"></a>
                </p>
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

