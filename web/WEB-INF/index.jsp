<%-- 
    Document   : index
    Created on : 08/09/2018, 10:50:50 PM
    Author     : mrm96
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="css.jsp" %>
    </head>
    <body>
        <%@include file="header.jsp" %>
        
        <div class="page-header" data-parallax="true" style="background-image: url('assets/img/pizzas/bg4.jpg');">
            <div class="filter"></div>
            <div class="container">
                <div class="motto text-center">
                    <h1>Example page</h1>
                    <h3>Start designing your landing page here.</h3>
                    <br />
                    <button type="button" class="btn btn-outline-neutral btn-round">Download</button>
                </div>
            </div>
        </div>
        <div class="wrapper">
            <!-- content come here     -->
            <div id="carousel">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8  ml-auto mr-auto">
                            <div class="card page-carousel">
                                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">
                                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active bg-success"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                    </ol>
                                    <div class="carousel-inner" role="listbox">
                                        <div class="carousel-item active">
                                            <img class="img" src="assets/img/pizzas/sl1.jpg" alt="First slide">
                                            <div class="carousel-caption d-none d-md-block">
                                                <p>Somewhere</p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block img-fluid" src="assets/img/pizzas/sl2.jpg" alt="Second slide">
                                            <div class="carousel-caption d-none d-md-block">
                                                <p>Somewhere else</p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block img" src="assets/img/pizzas/bg6.jpg" alt="Third slide">
                                            <div class="carousel-caption d-none d-md-block">
                                                <p>Here it is</p>
                                            </div>
                                        </div>
                                    </div>
                                    <a class="left carousel-control carousel-control-prev bg-success" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                        <span class="fa fa-angle-left"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="right carousel-control carousel-control-next bg-success" href="#carouselExampleIndicators" role="button" data-slide="next">
                                        <span class="fa fa-angle-right"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="info">
                                <div class="icon icon-danger">
                                    <i class="nc-icon nc-album-2"></i>
                                </div>
                                <div class="description">
                                    <h4 class="info-title">Beautiful Gallery</h4>
                                    <p class="description">Spend your time generating new ideas. You don't have to think of implementing.</p>
                                    <a href="#pkp" class="btn btn-link btn-danger">See more</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="info">
                                <div class="icon icon-danger">
                                    <i class="nc-icon nc-bulb-63"></i>
                                </div>
                                <div class="description">
                                    <h4 class="info-title">New Ideas</h4>
                                    <p>Larger, yet dramatically thinner. More powerful, but remarkably power efficient.</p>
                                    <a href="#pkp" class="btn btn-link btn-danger">See more</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="info">
                                <div class="icon icon-danger">
                                    <i class="nc-icon nc-chart-bar-32"></i>
                                </div>
                                <div class="description">
                                    <h4 class="info-title">Statistics</h4>
                                    <p>Choose from a veriety of many colors resembling sugar paper pastels.</p>
                                    <a href="#pkp" class="btn btn-link btn-danger">See more</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
    <%@include file="js.jsp" %>
</html>
