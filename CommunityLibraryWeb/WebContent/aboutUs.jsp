<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Community Library</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

		<style type="text/css">
			body{
				background-color: #D7CEC7;
			}

      #section5 {padding-top:20px; height:250px; margin-right:0px; margin-left:0px; color: #fff; background-color: #565656;}

			.about-text{
				color: #262228;
				display: block;
				box-sizing: inherit;
				padding-left: 180px;
        padding-right: 180px;
        padding-top: 15px;
        padding-bottom: 15px;
				font-size: 16px;
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
      .modal-content {
        background-color: #B1A296;
        border: none;
        border-radius: 8px;
      }
		</style>

    <script type="text/javascript">
      $(function () {
        $(document).scroll(function () {
          var $nav = $("nav");
          $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
        });
      });
    </script>
  </head>

  <body>
  <%
    Object id = request.getSession(false).getAttribute("userId");
    if(id==null)
    {
  %>
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
  <%
    }
    else
    {
    	int userId = Integer.parseInt(id.toString());
  %>
	    <nav class="navbar navbar-expand-sm fixed-top" id="mainNav">
	      <div class="container-fluid">
	          <div class="navbar-header">
	            <a class="navbar-brand" href="home.jsp">Community Library</a>
	          </div>
	          <ul class="navbar-nav navbar-right">
	            <li class="active nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
	            <li class="nav-item"><a class="nav-link" href="aboutUs.jsp">About Us</a></li>
	            <li class="nav-item"><a class="nav-link" href="displayBooks.jsp">Books</a></li>
	            <li class="nav-item"><a class="nav-link" href="#subscriptionModal" data-toggle="modal" data-target="#subscriptionModal">Lend/Borrow</a></li>
	            <li class="nav-item"><a class="nav-link" href="profile.jsp">Profile</a></li>
	          </ul>
	      </div>
	    </nav>
	    
	    <div class="modal fade" id="subscriptionModal">
	      <div class="modal-dialog modal-dialog-centered modal-sm">
	        <div class="modal-content">
	          <div class="modal-body" align="center">
	            <button type="button" class="btn btn-dark" onclick="location.href='lendBooks.jsp'" style="margin:5px;">Lend</button>
	            <button type="button" class="btn btn-dark" onclick="location.href='borrowBooks.jsp'" style="margin:5px;">Borrow</button>
	          </div>
	        </div>
	      </div>
	    </div>
  <%
    }
  %>
		
		<div class="container-fluid">
			<h1 style="padding-top: 60px; text-align: center; color: #76323F">About Us</h1>
				<div class="about-text">
					<p>The seeds for The Community Library Project (TCLP) were sown in the early 2010’s with a read-aloud program conducted by volunteers, for children attending the Ramditti J R Narang Deepalaya Learning Centre in New Delhi.</p>
					<p>At the center of the program was the idea that "Reading Is Thinking" - that everyone, regardless of their social or economic background, had the right to books and other tools of learning. In order to actualize this, one had to acknowledge the serious lack of free, community libraries in India that welcomed all, especially in those communities that had historically been left out (or actively kept out) of any discourse around books and reading.</p>
					<p>In 2014-15, the first library was set up, in partnership with the NGO Deepalaya and Narang Trust. Anyone could walk in and become a member, free of cost. Members could issue books once a week and participate in the Reading Program consisting of regular read alouds that focused on encouraging first-generation readers as they embarked on their reading journeys.</p>
					<p>Today, TCLP has set up 4 libraries in Delhi and Gurugram, catering to a membership of over 4000 children and adults, 7 days a week. We have also assisted several organizations in Delhi and beyond in creating free community libraries that welcome all.</p>
					<p>The Reading Program has developed multi-faceted curriculum for first-generation readers from ages 4 years to 16 years, and includes daily read aloud by member leaders, volunteers and staff, the Reading Fluency program, Honour Roll, Poetry Workshops, Book Club etc. TCLP libraries are high-standard, low-cost libraries with an excellently curated (and regularly updated) collection of over 30,000 books in Hindi, English, Urdu and Bengali.</p>
					<p>TCLP is consistently moving towards making its libraries community-owned as it mentors the Student Council – selected members, and member-interns, who are trained in library science, read aloud strategies and community mobilization. These young leaders are emerging as librarians, community organizers as well as read aloud trainers that are building a culture of "Reading Is Thinking".</p>
					<p>TCLP libraries have evolved into cultural and literary hubs, where members of the community can engage with one another's ideas in a safe and meaningful way. These spaces welcome writers, publishers, poets, dancers, musicians and other artists to perform and share their works. While our members benefit from and enjoy these experiences, artists, writers and publishers, too, widen their understanding of their audience.</p>
					<p>Duniya Sabki is an online extension of TCLP’s physical libraries. The free digital platform is a collection of video and audio read aloud, as well as links to books, magazines and other texts. It is sent by Whatsapp to over 2,000 members three times each week, and is also available on YouTube, SoundCloud and our website.</p>
					<p>TCLP is part of The Community Library Network, an attempt to bring different free libraries and reading programs across India onto one platform. Together, member libraries advocate for community libraries that welcome all. TCLN builds momentum for the library movement that has well and truly begun in India.</p>
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
	  </div>
  </body>  
</html>