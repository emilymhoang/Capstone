﻿<%@ Page Title="Room Magnet - Find your Match" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row" style="background-image: url(images/foldimg_A0_Rectangle_2_pattern.png); background-repeat: no-repeat; background-size:cover; margin-top: 6rem;">

        <div class="col-md-4  ctahome" style="margin-top: 8rem; margin-bottom: 8rem; ">
            <div class="card card-inverse" style="width: 25rem; margin-top: 2rem; margin-bottom: 2rem; margin-right: 1rem;">
                <div class="card-body">
                    <h5 class="card-title" style="text-align: center;font-family: 'Oswald', sans-serif; color: #756664; font-size: 30px;"">Room Magnet</h5>
                    <p class="card-text" style="text-align: center; font-family: 'Oswald', sans-serif; color: #756664; font-size: 20px;">An intergenerational rental matching service that attracts the best option for your needs.</p>
                    <p style="text-align: center;">
                        <a href="BasicInfoHomeowner.aspx" class="btn btn-primary" style="margin-right: 1rem; font-family: 'Oswald', sans-serif; color: white; font-size: 20px;">Rent My Room</a>
                        <a href="BasicInfoTenant.aspx" class="btn btn-primary" style="margin-left: 1rem;font-family: 'Oswald', sans-serif; color: white; font-size: 20px;">Find a Room</a>
                    </p>
                </div>
            </div>
        </div><!-- end div col! -->


    </div><!-- end div row! -->

    <div class="row" style="margin-top: 1rem;">

        <div class="col-md-6 ">
            <div class="card" style="width: 30rem; border: none; margin: 0 auto;">
                <img src="images/scott-webb-1ddol8rgUH8-unsplash.jpg" style="height:350px;" class="card-img-top" alt="picture of a house">
                <div class="card-body">
                    <a href="AboutUs.aspx" class="btn btn-primary" style="margin: auto; font-family: 'Oswald', sans-serif; color: white; font-size: 20px;">Your safety is our #1 concern.</a>
                </div>
            </div>
        </div><!-- end div col! -->

        <div class="col-md-6">

            <div class="card" style="width: 30rem; border: none; margin: 0 auto;">
                <img src="images/ben-o-bro-wpU4veNGnHg-unsplash.jpg" style="height:350px;" class="card-img-top" alt="picture of a house">
                <div class="card-body">
                    <a href="Search.aspx" class="btn btn-primary" style="margin: auto;font-family: 'Oswald', sans-serif; color: white; font-size: 20px;">Search by city preferences</a>
<%--                    <p style="text-align: center; font-family: 'Oswald', sans-serif; color: white; font-size: 20px;"><a href="Search.aspx" class="btn btn-primary">Search by city &amp; preferences.</a></p>--%>
                </div>
            </div>

        </div><!-- end div col! -->

    </div> <!-- end div row! -->


   
    <div class="row" style="margin-top: 2rem; margin-left: 1rem;">
        <div class="col-md-12">
            <h2 style="font-family: 'Oswald', sans-serif; color: #756664;">Hear From Some Happy Customers</h2>
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
                                <img src="images/testimonials-01.png" class="d-block w-100" alt="...">
                            </div>
<%--                            <div class="col-md-6">
                                <p class="d-block w-100" style="font-family: 'Oswald', sans-serif; color: #756664; " >text goes here.</p>
                            </div>--%>
                        </div>

                        <div class="carousel-item ">
                            <div class="col-md-4 offset-1">
                                <img src="images/testimonials-02.png" class="d-block w-100" alt="...">
                            </div>
<%--                            <div>
                                <p class="d-block w-100" style="font-family: 'Oswald', sans-serif; color: #756664;">text goes here.</p>
                            </div>--%>
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
            <h2 style="font-family: 'Oswald', sans-serif; color: #756664;">How We Work</h2>
        </div>
    </div><!-- end div row! -->


    <div class="row">
        <div class="col-md-2" style="margin: 0 auto;">
            <p style="text-align: center;"><img src="images/icons-01.png" style="max-width: 100px;"></p>
            <p style="text-align: center; font-family: 'Oswald', sans-serif; color: #756664; font-size: 20px;">Text goes here.</p>
        </div>
        <div class="col-md-1">
            <p style="text-align: center; font-size: 5rem; margin: 0 auto; margin-top: 2rem;">&#8594;</p>
        </div>

        <div class="col-md-2" style="margin: 0 auto;">
            <p style="text-align: center;"><img src="images/icons-02.png" style="max-width: 100px;"></p>
            <p style="text-align: center; font-family: 'Oswald', sans-serif; color: #756664;font-size: 20px;">Text goes here.</p>
        </div>
        <div class="col-md-1">
            <p style="text-align: center; font-size: 5rem; margin: 0 auto; margin-top: 2rem;">&#8594;</p>
        </div>

        <div class="col-md-2" style="margin: 0 auto;">
            <p style="text-align: center;"><img src="images/icons-03.png" style="max-width: 100px;"></p>
            <p style="text-align: center; font-family: 'Oswald', sans-serif; color: #756664; font-size: 20px;">Text goes here.</p>
        </div>
        <div class="col-md-1">
            <p style="text-align: center; font-size: 5rem; margin: 0 auto; margin-top: 2rem;">&#8594;</p>
        </div>
        <div class="col-md-2" style="margin: 0 auto;">
            <p style="text-align: center;"><img src="images/icons-04.png" style="max-width: 100px;"></p>
            <p style="text-align: center;font-family: 'Oswald', sans-serif; color: #756664; font-size: 20px;">Text goes here.</p>
        </div>

    </div><!-- end div row! -->

    <div class="row" style="margin-top: 2rem; margin-left: 1rem;">
        <div class="col-md-12">
            <h1 style=" text-align: center; font-family: 'Oswald', sans-serif; color: #756664"; >We have properties available in the following locations</h1>
            <div class='tableauPlaceholder' id='viz1572313628086' style='margin:auto; position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ca&#47;CapstoneMap_15723112370830&#47;Dashboard1&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz' style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='CapstoneMap_15723112370830&#47;Dashboard1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ca&#47;CapstoneMap_15723112370830&#47;Dashboard1&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='filter' value='publish=yes' /></object></div>
            <script type='text/javascript'>var divElement = document.getElementById('viz1572313628086'); var vizElement = divElement.getElementsByTagName('object')[0]; if (divElement.offsetWidth > 800) { vizElement.style.width = '1000px'; vizElement.style.height = '827px'; } else if (divElement.offsetWidth > 500) { vizElement.style.width = '1000px'; vizElement.style.height = '827px'; } else { vizElement.style.width = '100%'; vizElement.style.height = '727px'; } var scriptElement = document.createElement('script'); scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js'; vizElement.parentNode.insertBefore(scriptElement, vizElement);</script>
        </div>  
    </div><!-- end div row! -->

    <%--<div class='tableauPlaceholder' id='viz1572313628086' style='margin:auto; position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ca&#47;CapstoneMap_15723112370830&#47;Dashboard1&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz' style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='CapstoneMap_15723112370830&#47;Dashboard1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ca&#47;CapstoneMap_15723112370830&#47;Dashboard1&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='filter' value='publish=yes' /></object></div>
    <script type='text/javascript'>var divElement = document.getElementById('viz1572313628086'); var vizElement = divElement.getElementsByTagName('object')[0]; if (divElement.offsetWidth > 800) { vizElement.style.width = '1000px'; vizElement.style.height = '827px'; } else if (divElement.offsetWidth > 500) { vizElement.style.width = '1000px'; vizElement.style.height = '827px'; } else { vizElement.style.width = '100%'; vizElement.style.height = '727px'; } var scriptElement = document.createElement('script'); scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js'; vizElement.parentNode.insertBefore(scriptElement, vizElement);</script>--%>

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
</asp:Content>

