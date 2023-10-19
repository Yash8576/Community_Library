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
    </style>
  </head>

  <body>
	  <div class="container">
	    <div class="jumbotron" align="center">
  <%
    String emailId = request.getParameter("email");
    String password = request.getParameter("password");
    
    UserLogin login = new UserLogin();
    int userId = login.userLoginAuthentication(emailId, password);
    if(userId > 0)
    {
      System.out.println("Login successful");
      request.getSession().setAttribute("userId", userId);
  %>
				<div class="alert alert-success">
				  <strong>Success!</strong> You've successfully Logged In!
				</div>
	      <script type="text/javascript">
	          $(document).ready(function() 
	          {
	           setTimeout(function() {window.location = "profile.jsp";}, 3500);
	          });
	      </script>
				<p>Please wait for 5 seconds to redirect to the <a href="profile.jsp">profile page</a><small> Click on the link if not</small></p>
  <%    
    }
    else
    {
      System.out.println("error ocuured");
  %>
				<div class="alert alert-danger">
				  <strong>Error!</strong> Something went wrong please try again later!
				</div>
        <script type="text/javascript">
            $(document).ready(function() 
            {
             setTimeout(function() {window.location = "index.jsp";}, 3500);
            });
        </script>
				<p>Please wait for 5 seconds to redirect to the <a href="index.jsp">Main page</a><small> Click on the link if not</small></p>
  <%    
    }
  %>
  <%@ page import="java.sql.*"%>
  <%@ page import="java.io.*" %>
  <%@ page import="javax.servlet.*"%>
  <%@ page import="library.*" %>
  
	    </div>
	  </div>
  </body>
</html>