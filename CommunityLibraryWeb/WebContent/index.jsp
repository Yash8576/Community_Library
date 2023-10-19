<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Community Library</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">  
		<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

		<style>
		  body {
		    background-color: #D7CEC7;
		  }
			#section1 {padding-top:60px; height:800px; color: #fff; background-color: #C09F80;}
			#section2 {padding-top:50px; height:400px; margin-right:0px; margin-left:0px; color: #fff; background-color: #D7CEC7;}
 			#section5 {padding-top:20px; height:250px; margin-right:0px; margin-left:0px; color: #fff; background-color: #565656;}
			
			.carousel-inner {
				padding: 20px;
			}
			.carousel-inner > img{
				width: 100%;
				height: 100%;
			}
			#section2 > div > h1{
				color: #76323F;
			}
			#section2 > div > p { 
				color: #262228;
			}
			.navbar-brand, .nav-link {
				color: #76323F;
			}
			.navbar-brand:hover, .nav-link:hover {
				color: #76323F;
			}
			.navbar {
				background-color: #C09F80;
				color: #76323F;
			}
			.navbar.scrolled {
				background-color: #D7CEC7 !important;
			    transition: background-color 200ms linear;
			}
		</style>

		<script type="text/javascript">
			$(function () {
			  $(document).scroll(function () {
			    var $nav = $("nav");
			    $nav.toggleClass('scrolled', $(this).scrollTop() > 750);
			  });
			});
		</script>
	</head>

	<body>
		<nav class="navbar navbar-expand-sm fixed-top" id="mainNav">
			<div class="container-fluid">
			    <div class="navbar-header">
				    <a class="navbar-brand" href="index.jsp">Community Library</a>
			    </div>
			    <ul class="navbar-nav navbar-right">
				    <li class="active nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
				    <li class="nav-item"><a class="nav-link" href="aboutUs.jsp">About Us</a></li>
					  <li class="nav-item"><a class="nav-link" href="displayBooks.jsp">Books</a></li>
				    <li class="nav-item"><a class="nav-link" href="userRegistration.jsp">Sign In</a></li>
		      </ul>
			</div>
		</nav>
		  
		<div id="section1" class="container-fluid">
			<h1 style="text-align:center; color: #76323F">Our Community</h1>
			<div id="carouselInst" class="carousel slide" data-ride="carousel">
				<ul class="carousel-indicators">
					<li data-target="#carouselInst" data-slide-to="0" class="active"></li>
					<li data-target="#carouselInst" data-slide-to="1"></li>
					<li data-target="#carouselInst" data-slide-to="2"></li>
				</ul>
 	
				<div class="carousel-inner">
				  <div class="carousel-item active">
				    <img src="images/library_community_1.jpg" class="img-responsive" alt="library_community_1" width="100%" height="620px">
				     </div>  
				     <div class="carousel-item">  
				    <img src="images/library_community_2.jpg" class="img-responsive" alt="library_community_2" width="100%" height="620px">
				     </div>  
				     <div class="carousel-item">  
				    <img src="images/library_community_3.jpg" class="img-responsive" alt="library_community_3" width="100%" height="620px">
				     </div>
				</div>

				<a class="carousel-control-prev" href="#carouselInst" href="#carouselInst" data-slide="prev">
					<span class="carousel-control-prev-icon"></span><span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#carouselInst" href="#carouselInst" data-slide="next">
					<span class="carousel-control-next-icon"></span><span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		
		<script type="text/javascript">
			AOS.init();
		</script>
		
		<div id="section2" class="container-fluid row">
			<div class="indexObjective col-sm-8" data-aos="fade-right" data-aos-easing="ease-in-sine" data-aos-dealy="0" data-aos-duration="750" data-aos-mirror="true" data-aos-once="true">
				<h1 style="padding-bottom: 10px"><strong>Program</strong><br><strong>Objective</strong></h1>
				<p>To provide an easy and handful resourse<br> for book lovers !<br></p>
				<p>The spot on library recerated just with a formal interaction with the owner.<br>Own your desired books for any period of time at your desired place</p>
			</div>
			<div class="indexObjectiveImage col-sm-4"  data-aos="fade-left" data-aos-easing="ease-in-sine" data-aos-dealy="0" data-aos-duration="750" data-aos-mirror="true" data-aos-once="true">
				<img src="images/main_page_icon_1.jpg" class="img-responsive" alt="main_page_icon_1" width="300" height="300">
			</div>
		</div>  
		<div id="section2" class="container-fluid row" align="right">
			<div class="indexProcessImage col-sm-4"  data-aos="fade-right" data-aos-easing="ease-in-sine" data-aos-dealy="0" data-aos-duration="750" data-aos-mirror="true" data-aos-once="true">
				<img src="images/main_page_icon_2.jpg" class="img-responsive" alt="main_page_icon_2" width="300" height="300">
			</div>
			<div class="indexProcess col-sm-8" data-aos="fade-left" data-aos-easing="ease-in-sine" data-aos-dealy="0" data-aos-duration="750" data-aos-mirror="true" data-aos-once="true">
				<h1 style="padding-bottom: 10px"><strong>How we</strong><br><strong>Operate</strong></h1>
				<p>Donors and recipients are to be registered separetely and contact<br>each other in your respective genre of intrest.</p>
				<p>The contact details are shared between the donor and the recipient to have a better communication,<br>we dont step in between your connection.</p>
			</div>
		</div>  
		<div id="section2" class="container-fluid row">
			<div class="indexGuidelines col-sm-8" data-aos="fade-right" data-aos-easing="ease-in-sine" data-aos-dealy="0" data-aos-duration="750" data-aos-mirror="true" data-aos-once="true">
				<h1 style="padding-bottom: 10px;"><strong>Guidelines</strong></h1>
				<p>Just go through an easy registration on our page,<br>find your desired book based on genre or author, get through the contact<br>details of the donor and finally recieve the package by direct contact.</p>
				<p>You can even donate your books, similar process of registration is to be done in the beginning and then<br>fill a form to provide the details of the book to be donated and get notified if your book is an intrest of someone</p>
			</div>
			<div class="indexGuidelinesImage col-sm-4"  data-aos="fade-left" data-aos-easing="ease-in-sine" data-aos-dealy="0" data-aos-duration="750" data-aos-mirror="true" data-aos-once="true">
				<img src="images/main_page_icon_3.jpg" class="img-responsive" alt="main_page_icon_3" width="300" height="300">
			</div>
		</div>  
		<div id="section5" class="container-fluid row">
			<div class="col-sm-6">
				<h2>Contact Us</h2>
				<p><strong style="color: black;">Phone:</strong> +91 1800-153-7575</p>
				<p><strong style="color: black;">Phone:</strong> +91 1800-253-7575</p>
			</div>
			<div class="col-sm-6">
				<h2>Reach Us</h2>
				<p><strong style="color: black;">Email:</strong> libraryCommunity@gmail.com</p>
				<p>Follow us on:</p>
				<ul style="justify-content: space-between;">
					<li style="color: black;"><a href="#https://www.facebook.com/" style="color: black">Facebook</a></li>
					<li style="color: black;"><a href="#https://www.twitter.com/" style="color: black">Twitter</a></li>
					<li style="color: black;"><a href="#https://www.linkedin.com/" style="color: black">LinkedIn</a></li>
				</ul>
			</div>
		</div>  
	</body>  
</html>