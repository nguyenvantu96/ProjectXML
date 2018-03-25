<%@page import="Entities.HomeEntites"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entities.GenkMobileEntities"%>
<%@page import="Entities.GenkMobileEntities"%>
<%@page import="java.util.List"%>
<%@page import="Entities.CsgoEntities"%>
<!DOCTYPE html>
<html>
    <head>
        <title>NewsFeed | Pages | Single Page</title>
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
        <!--[if lt IE 9]>
        <script src="../assets/js/html5shiv.min.js"></script>
        <script src="../assets/js/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
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
                                    <li><a href="contact.html">Contact</a></li>
                                </ul>
                            </div>
                            <div class="header_top_right">
                                <p>Friday, December 05, 2045</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="header_bottom">
                            <div class="logo_area"><a href="home" class="logo"><img src="images/logo.jpg" alt=""></a></div>
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
                            <li><a href="#">Technology</a></li>
                            <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Mobile</a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Android</a></li>
                                    <li><a href="#">Samsung</a></li>
                                    <li><a href="#">Nokia</a></li>
                                    <li><a href="#">Walton Mobile</a></li>
                                    <li><a href="#">Sympony</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Laptops</a></li>
                            <li><a href="#">Tablets</a></li>
                            <li><a href="contact.html">Contact Us</a></li>
                            <li><a href="404.html">404 Page</a></li>
                        </ul>
                    </div>
                </nav>
            </section>
            <section id="newsSection">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="latest_newsarea"> <span>Latest News</span>
                            <ul id="ticker01" class="news_sticker">
                                <li><a href="#"><img src="images/news_thumbnail3.jpg" alt="">My First News Item</a></li>
                                <li><a href="#"><img src="images/news_thumbnail3.jpg" alt="">My Second News Item</a></li>
                                <li><a href="#"><img src="images/news_thumbnail3.jpg" alt="">My Third News Item</a></li>
                                <li><a href="#"><img src="images/news_thumbnail3.jpg" alt="">My Four News Item</a></li>
                                <li><a href="#"><img src="images/news_thumbnail3.jpg" alt="">My Five News Item</a></li>
                                <li><a href="#"><img src="images/news_thumbnail3.jpg" alt="">My Six News Item</a></li>
                                <li><a href="#"><img src="images/news_thumbnail3.jpg" alt="">My Seven News Item</a></li>
                                <li><a href="#"><img src="images/news_thumbnail3.jpg" alt="">My Eight News Item</a></li>
                                <li><a href="#"><img src="images/news_thumbnail2.jpg" alt="">My Nine News Item</a></li>
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
            <%
                GenkMobileEntities genk = (GenkMobileEntities) request.getAttribute("data");
            %>
            <section id="contentSection">
                <div class="row">
                    <div class="col-lg-8 col-md-8 col-sm-8">
                        <div class="left_content">
                            <div class="single_page">
                                <ol class="breadcrumb">
                                    <li><a href="home">Home</a></li>
                                    <li><a href="#">Technology</a></li>
                                    <li class="active">Mobile</li>
                                </ol>
                                <h1><%=genk.getTitle()%></h1>
                                <div class="post_commentbox"> <a href="#"><i class="fa fa-user"></i>Admin</a> <span><i class="fa fa-calendar"></i><%=genk.getTime()%></span> <a href="#"><i class="fa fa-tags"></i>Mobile</a> </div>
                                <div class="single_page_content"> <img class="img-center" src="<%=genk.getImg()%>" alt="">            
                                    <blockquote><%=genk.getTileSub()%></blockquote>
                                </div>
                                <div class="social_link">
                                    <ul class="sociallink_nav">
                                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                        <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <nav class="nav-slit"> <a class="prev" href="#"> <span class="icon-wrap"><i class="fa fa-angle-left"></i></span>
                            <div>
                                <h3>City Lights</h3>
                                <img src="../images/post_img1.jpg" alt=""/> </div>
                        </a> <a class="next" href="#"> <span class="icon-wrap"><i class="fa fa-angle-right"></i></span>
                            <div>
                                <h3>Street Hills</h3>
                                <img src="../images/post_img1.jpg" alt=""/> </div>
                        </a> </nav>
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <aside class="right_content">
                            <div class="single_sidebar">
                                <h2><span>Popular Post</span></h2>
                                <ul class="spost_nav">
                                    <%     ArrayList<GenkMobileEntities> listMobile = (ArrayList<GenkMobileEntities>) request.getAttribute("listMobile");
                                            for (int i = 0; i < 5; i++) {
                                                    
                                                
                                    %>
                                    <li>
                                        <div class="media wow fadeInDown"> <a href="mobile?link=<%=listMobile.get(i).getAherf()%>" class="media-left"> <img alt="" src="<%=listMobile.get(i).getImg()%>"> </a>
                                            <div class="media-body"> <a href="mobile?link=<%=listMobile.get(i).getAherf()%>"class="catg_title"><%=listMobile.get(i).getTitle()%></a> </div>
                                        </div>
                                    </li>          
                                    <%}%>
                                </ul>
                            </div>
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
                                                <div class="media wow fadeInDown"> <a href="single_page.html" class="media-left"> <img alt="" src="../images/post_img1.jpg"> </a>
                                                    <div class="media-body"> <a href="single_page.html" class="catg_title"> Aliquam malesuada diam eget turpis varius 1</a> </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="media wow fadeInDown"> <a href="single_page.html" class="media-left"> <img alt="" src="../images/post_img2.jpg"> </a>
                                                    <div class="media-body"> <a href="single_page.html" class="catg_title"> Aliquam malesuada diam eget turpis varius 2</a> </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="media wow fadeInDown"> <a href="single_page.html" class="media-left"> <img alt="" src="../images/post_img1.jpg"> </a>
                                                    <div class="media-body"> <a href="single_page.html" class="catg_title"> Aliquam malesuada diam eget turpis varius 3</a> </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="media wow fadeInDown"> <a href="single_page.html" class="media-left"> <img alt="" src="images/post_img2.jpg"> </a>
                                                    <div class="media-body"> <a href="single_page.html" class="catg_title"> Aliquam malesuada diam eget turpis varius 4</a> </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="single_sidebar wow fadeInDown">
                                <h2><span>Sponsor</span></h2>
                                <a class="sideAdd" href="#"><img src="images/add_img.jpg" alt=""></a> </div>
                            <div class="single_sidebar wow fadeInDown">
                                <h2><span>Category Archive</span></h2>
                                <select class="catgArchive">
                                    <option>Select Category</option>
                                    <option>Life styles</option>
                                    <option>Sports</option>
                                    <option>Technology</option>
                                    <option>Treads</option>
                                </select>
                            </div>
                            <div class="single_sidebar wow fadeInDown">
                                <h2><span>Links</span></h2>
                                <ul>
                                    <li><a href="#">Blog</a></li>
                                    <li><a href="#">Rss Feed</a></li>
                                    <li><a href="#">Login</a></li>
                                    <li><a href="#">Life &amp; Style</a></li>
                                </ul>
                            </div>
                        </aside>
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
                                    <li><a href="#">Sports</a></li>
                                    <li><a href="#">Fashion</a></li>
                                    <li><a href="#">Business</a></li>
                                    <li><a href="#">Life &amp; Style</a></li>
                                    <li><a href="#">Technology</a></li>
                                    <li><a href="#">Photo</a></li>
                                    <li><a href="#">Slider</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="footer_widget wow fadeInRightBig">
                                <h2>Contact</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                <address>
                                    Perfect News,1238 S . 123 St.Suite 25 Town City 3333,USA Phone: 123-326-789 Fax: 123-546-567
                                </address>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer_bottom">
                    <p class="copyright">Copyright &copy; 2045 <a href="../index.html">NewsFeed</a></p>
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