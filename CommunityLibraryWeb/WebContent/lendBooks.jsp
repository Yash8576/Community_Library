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

    <style>
      body {
        background-color: #D7CEC7;
      }
      #section1 {padding-top: 80px; padding-bottom: 40px;}
      #section2 {padding-top: 80px; padding-bottom: 40px;}
      #section5 {padding-top:20px; height:250px; margin-right:0px; margin-left:0px; color: #fff; background-color: #565656;}
      
      .card {
        margin-left: 60px;
        margin-right: 60px;
        margin-bottom: 20px;
        border-radius: 3px;
        background-color: #F2F2F2;
        box-shadow: 6px 6px #A0A0A0;
        transition: .3s transform cubic-bezier(.155,1.105,.295,1.12),.3s box-shadow,.3s -webkit-transform cubic-bezier(.155,1.105,.295,1.12);
        cursor: pointer;
      }
      .card:hover{
        transform: scale(1.05);
        box-shadow: 0 10px 20px rgba(0,0,0,.12), 0 4px 8px rgba(0,0,0,.06);
      }
      .head {
        font-size: 18px;
        font-weight: 500;
        color: #76323F;
        padding: 12px;
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
      $(function () 
    	{
        $(document).scroll(function () 
        {
          var $nav = $("nav");
          $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
        });
        
        $("#section2").hide();
        $("#display-button").click(function()
        {
          $("#section2").fadeToggle();
        });
        
        $("#register-button").click(function()
        {
          window.location.href = "bookRegistration.jsp";
        });
      });
    </script>
  </head>

  <body>
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
    <div id="section1" class="container-fluid" align="center">
    <%
      Object obj = request.getSession(false).getAttribute("result");
      if(obj!=null)
      {
        if(obj.toString().equals("success"))
        {
    %>  
          <div class="alert alert-success alert-dismissible fade show">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>Success!</strong> You've successfully registered your book!"
          </div>
    <%    
        }
        else
        {
    %>  
         <div class="alert alert-danger alert-dismissible fade show">
           <button type="button" class="close" data-dismiss="alert">&times;</button>
           <strong>Error!</strong> Something went wrong please try again later!
         </div>
    <%  
        }
        request.getSession(false).removeAttribute("result");
      }
    %>
      <div align="right">
        <button type="button" class="btn btn-secondary" id="display-button">Display Your Books</button>
        <button type="button" class="btn btn-secondary" id="register-button">Register A New Book</button>
      </div>
    </div>
    <div id="section2" class="container-fluid">
    <%
	  try
    {
     	int userId = (Integer) request.getSession(false).getAttribute("userId");
      GetConnection getCon = new GetConnection();
      Connection connection = getCon.setUpConnection();
       
      PreparedStatement statement = connection.prepareStatement("SELECT * FROM [dbo].[BOOK_MASTER] WHERE BookId IN (SELECT (BookId) FROM [dbo].[USER_BOOK_MAPPING] WHERE UserId = ?)");
      statement.setInt(1, userId);
       
      ResultSet rset = statement.executeQuery();
      if(rset.next())
      {
	     	do
	     	{
	     		String imageUrl = rset.getString(6);
    %>
		      <div class="card">
		        <div class="card-body row">
		          <div class="col-sm-3">
		            <img align="left" class="img-responsive" id="book-image" alt="Anna Karenina" src="<%out.println("images/" + imageUrl);%>" width="250px" height="300px">
		          </div>
		          <div class="col-sm-3">
		            <div class="container">
		              <table>
		                <tbody>
		                  <tr><td class="head">Book Name: </td><td><%out.println(rset.getString(2));%></td></tr>
		                  <tr><td class="head">Author: </td><td><%out.println(rset.getString(3));%></td></tr>
		                  <tr><td class="head">Book Genre: </td><td><%out.println(rset.getString(4));%></td><tr>
		                </tbody>
		              </table>
		            </div>
		          </div>
		          <div class="col-sm-6">
		            <div class="container">
		              <table>
		                <tbody>
		                  <tr><td class="head">Book Synopsis: </td></tr>
		                  <tr><td><%out.println(rset.getString(5));%></td></tr>
		                </tbody>
		              </table>
		            </div>
		          </div>
		        </div>
		      </div>
    <%
         }
	       while(rset.next());
      }
      else
      {
 	  %>   
        <h2 align="center">You haven't lended any books yet.!</h2>
	  <%
	    }
	  }
    catch(Exception e) {
      e.printStackTrace();
    }
    %>
	  <%@ page import="java.sql.*"%>
	  <%@ page import="java.io.*" %>
	  <%@ page import="javax.servlet.*"%>
	  <%@ page import="library.*" %>

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