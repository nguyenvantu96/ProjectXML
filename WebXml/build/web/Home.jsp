<%@page import="Entities.CsgoEntities"%>
<%@page import="Entities.GenkMobileEntities"%>
<%@page import="Entities.HomeEntites"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <title>NewsFeed</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/animate.css">
        <link rel="stylesheet" type="text/css" href="css/font.css">
        <link rel="stylesheet" type="text/css" href="css/li-scroller.css">
        <link rel="stylesheet" type="text/css" href="css/slick.css">
        <link rel="stylesheet" type="text/css" href="css/jquery.fancybox.css">
        <link rel="stylesheet" type="text/css" href="css/theme.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">

    </head>
    <body>
        <%
            CsgoEntities csgo = (CsgoEntities) request.getAttribute("logo");
            ArrayList<HomeEntites> listData = (ArrayList<HomeEntites>) request.getAttribute("listData");
            ArrayList<GenkMobileEntities> listMobile = (ArrayList<GenkMobileEntities>) request.getAttribute("listMobile");
            GenkMobileEntities genk = (GenkMobileEntities) request.getAttribute("entitesList");

        %>
        <div id="preloader">
            <div id="status">&nbsp;</div>
        </div>
        <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
        <div class="container">
            <header id="header">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="header_top">
                            <div class="header_top_left">
                                <ul class="top_nav">
                                    <li><a href="home">Home</a></li>
                                    <li><a href="#">About</a></li>
                                    <li><a href="pages/contact.html">Contact</a></li>
                                </ul>
                            </div>
                            <div class="header_top_right">
                                <p>Tuesday,March 27,2018</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="header_bottom">
                            <div class="logo_area"><a href="index.html" class="logo"><img src="images/logo.jpg" alt=""></a></div>
                            <div class="add_banner"><a href="#"><img src="images/Capture.PNG" alt=""></a></div>

                        </div>
                    </div>
                </div>
            </header>
            <section id="navArea">
                <nav class="navbar navbar-inverse" role="navigation">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav main_nav">
                            <li class="active"><a href="home"><span class="fa fa-home desktop-home"></span><span class="mobile-show">Home</span></a></li>
                            <li><a href="#">CSGO</a></li>      
                            <li><a href="#">Mobile</a></li>       
                            <li><a href="pages/contact.html">Contact Us</a></li>
                        </ul>
                    </div>
                </nav>
            </section>
            <section id="newsSection">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="latest_newsarea"> <span>Latest News</span>
                            <ul id="ticker01" class="news_sticker">
                                <li><a href="news?link=<%=listData.get(0).getHref()%>"><img src="<%=listData.get(0).getImg()%>" alt=""><%=listData.get(0).getTitile()%></a></li>
                                <li><a href="news?link=<%=listData.get(1).getHref()%>"><img src="<%=listData.get(1).getImg()%>" alt=""><%=listData.get(1).getTitile()%></a></li>
                                <li><a href="news?link=<%=listData.get(2).getHref()%>"><img src="<%=listData.get(2).getImg()%>" alt=""><%=listData.get(2).getTitile()%></a></li>
                                <li><a href="mobile?link=<%=listMobile.get(0).getAherf()%>"><img src="<%=listMobile.get(0).getImg()%>" alt=""><%=listMobile.get(0).getTitle()%></a></li>
                                <li><a href="mobile?link=<%=listMobile.get(1).getAherf()%>"><img src="<%=listMobile.get(1).getImg()%>" alt=""><%=listMobile.get(1).getTitle()%></a></li>
                                <li><a href="mobile?link=<%=listMobile.get(2).getAherf()%>"><img src="<%=listMobile.get(2).getImg()%>" alt=""><%=listMobile.get(2).getTitle()%></a></li>
                            </ul>
                            <div class="social_area">
                                <ul class="social_nav">
                                    <li class="facebook"><a href="#"></a></li>
                                    <li class="twitter"><a href="#"></a></li>
                                    <li class="flickr"><a href="#"></a></li>
                                    <li class="pinterest"><a href="#"></a></li>
                                    <li class="googleplus"><a href="#"></a></li>
                                    <li class="vimeo"><a href="#"></a></li>
                                    <li class="youtube"><a href="#"></a></li>
                                    <li class="mail"><a href="#"></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section id="sliderSection">
                <div class="row">
                    <div class="col-lg-8 col-md-8 col-sm-8">
                        <div class="left_content">
                            <div class="fashion_technology_area">
                                <div class="fashion">
                                    <div class="single_post_content">
                                        <h2><span>CSGO-HLTV</span></h2>
                                        <ul class="business_catgnav">
                                            <li>
                                                <figure class="bsbig_fig wow fadeInDown"> <a href="pages/single_page.html" class="featured_img"> <img alt="" src="<%=csgo.getImg()%>"> <span class="overlay"></span> </a>

                                                    <p><%=csgo.getTitile()%></p>
                                                </figure>
                                            </li>
                                        </ul>
                                        <ul class="spost_nav">
                                            <%
                                                for (int i = 0; i < 6; i++) {%>
                                            <li>
                                                <div class="media wow fadeInDown"> <a href="news?link=<%=listData.get(i).getHref()%>" class="media-left"> <img alt="" src="<%=listData.get(i).getImg()%>"> </a>
                                                    <div class="media-body"> <a href="news?link=<%=listData.get(i).getHref()%>" class="catg_title"><%=listData.get(i).getTitile()%></a> </div>
                                                </div>
                                            </li> 
                                            <%}%>
                                        </ul>
                                    </div>
                                </div>
                                <div class="technology">
                                    <div class="single_post_content">
                                        <h2><span>Mobile</span></h2>
                                        <ul class="business_catgnav">
                                            <li>
                                                <figure class="bsbig_fig wow fadeInDown"> <a href="mobile?link=<%=genk.getAherf()%>" class="featured_img"> <img alt="" src="<%=genk.getImg()%>"> <span class="overlay"></span> </a>
                                                    <figcaption> <a href="mobile?link=<%=genk.getAherf()%>"><%=genk.getTitle()%></a> </figcaption>
                                                    <p><%=genk.getTileSub()%></p>
                                                </figure>
                                            </li>
                                        </ul>
                                        <ul class="spost_nav">
                                            <%
                                                for (int i = 0; i < 5; i++) {

                                            %>

                                            <li>
                                                <div class="media wow fadeInDown"> <a href="mobile?link=<%=listMobile.get(i).getAherf()%>" class="media-left"> <img alt="" src="<%=listMobile.get(i).getImg()%>"> </a>
                                                    <div class="media-body"> <a href="mobile?link=<%=listMobile.get(i).getAherf()%>" class="catg_title"> <%=listMobile.get(i).getTitle()%></a> </div>
                                                </div>
                                            </li>
                                            <%}%>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <div class="latest_post">
                            <h2><span>Latest post</span></h2>
                            <div class="latest_post_container">
                                <div id="prev-button"><i class="fa fa-chevron-up"></i></div>
                                <ul class="latest_postnav">
                                    <%
                                        for (int i = 6; i < 11; i++) {


                                    %>
                                    <li>
                                        <div class="media"> <a href="news?link=<%=listData.get(i).getHref()%>" class="media-left"> <img alt="" src="<%=listData.get(i).getImg()%>"> </a>
                                            <div class="media-body"> <a href="news?link=<%=listData.get(i).getHref()%>" class="catg_title"> <%=listData.get(i).getTitile()%></a> </div>
                                        </div>
                                    </li>             
                                    <%}%>
                                </ul>
                                <div id="next-button"><i class="fa  fa-chevron-down"></i></div>
                            </div>
                        </div>
                        <aside class="right_content">
                            <div class="single_sidebar">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li role="presentation" class="active"><a href="#category" aria-controls="home" role="tab" data-toggle="tab">Category</a></li>
                                    <li role="presentation"><a href="#video" aria-controls="profile" role="tab" data-toggle="tab">Video</a></li>
                                    <li role="presentation"><a href="#comments" aria-controls="messages" role="tab" data-toggle="tab">Comments</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane active" id="category">
                                        <ul>
                                            <li class="cat-item"><a href="#">Sports</a></li>
                                            <li class="cat-item"><a href="#">Fashion</a></li>
                                            <li class="cat-item"><a href="#">Business</a></li>
                                            <li class="cat-item"><a href="#">Technology</a></li>
                                            <li class="cat-item"><a href="#">Games</a></li>
                                            <li class="cat-item"><a href="#">Life &amp; Style</a></li>
                                            <li class="cat-item"><a href="#">Photography</a></li>
                                        </ul>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="video">
                                        <div class="vide_area">
                                            <iframe width="100%" height="250" src="http://www.youtube.com/embed/h5QWbURNEpA?feature=player_detailpage" frameborder="0" allowfullscreen></iframe>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="comments">
                                        <ul class="spost_nav">
                                            <li>
                                                <div class="media wow fadeInDown"> <a href="pages/single_page.html" class="media-left"> <img alt="" src="images/post_img1.jpg"> </a>
                                                    <div class="media-body"> <a href="pages/single_page.html" class="catg_title"> Aliquam malesuada diam eget turpis varius 1</a> </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="media wow fadeInDown"> <a href="pages/single_page.html" class="media-left"> <img alt="" src="images/post_img2.jpg"> </a>
                                                    <div class="media-body"> <a href="pages/single_page.html" class="catg_title"> Aliquam malesuada diam eget turpis varius 2</a> </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="media wow fadeInDown"> <a href="pages/single_page.html" class="media-left"> <img alt="" src="images/post_img1.jpg"> </a>
                                                    <div class="media-body"> <a href="pages/single_page.html" class="catg_title"> Aliquam malesuada diam eget turpis varius 3</a> </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="media wow fadeInDown"> <a href="pages/single_page.html" class="media-left"> <img alt="" src="images/post_img2.jpg"> </a>
                                                    <div class="media-body"> <a href="pages/single_page.html" class="catg_title"> Aliquam malesuada diam eget turpis varius 4</a> </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="single_sidebar wow fadeInDown">
                                <h2><span>Category Archive</span></h2>
                                <select class="catgArchive">
                                    <option>CSGO</option>
                                    <option>MOBILE</option>
                                </select>
                            </div>
                        </aside>
                    </div>
                </div>
            </section>
            <section id="contentSection">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-4">

                    </div>
                </div>
            </section>
            <footer id="footer">
                <div class="footer_top">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="footer_widget wow fadeInLeftBig">
                                <h2>Flickr Images</h2>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="footer_widget wow fadeInDown">
                                <h2>Tag</h2>
                                <ul class="tag_nav">
                                    <li><a href="#">Games</a></li>
                                    <li><a href="#">Mobile</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="footer_widget wow fadeInRightBig">
                                <h2>Contact</h2>
                                <p>Ngo Ngoc Tuyen</p>
                                <address>
                                    Km29 Dai Lo Thang Long, Thach That Ha Noi
                                </address>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer_bottom">
                    <p class="copyright">Copyright &copy; 2045 <a href="index.html">NewsFeed</a></p>
                    <p class="developer">Developed By Wpfreeware</p>
                </div>
            </footer>
        </div>
        <script src="js/jquery.min.js"></script> 
        <script src="js/wow.min.js"></script> 
        <script src="js/bootstrap.min.js"></script> 
        <script src="js/slick.min.js"></script> 
        <script src="js/jquery.li-scroller.1.0.js"></script> 
        <script src="js/jquery.newsTicker.min.js"></script> 
        <script src="js/jquery.fancybox.pack.js"></script> 
        <script src="js/custom.js"></script>

    </body>
</html>