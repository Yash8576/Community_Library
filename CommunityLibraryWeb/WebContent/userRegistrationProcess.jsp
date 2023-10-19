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
    String fullName = request.getParameter("fname");
    String emailId = request.getParameter("email");
    String gender = request.getParameter("gender");
    String contact = request.getParameter("contact");
    String disName = request.getParameter("disName");
    String cityName = request.getParameter("cityName");
    String stateName = request.getParameter("stateName");
    String pinCode = request.getParameter("pinCode");
    String address = request.getParameter("address");
    String password = request.getParameter("password");
    
    ArrayList<String> userDetails = new ArrayList<>();
    userDetails.add(fullName);
    userDetails.add(password);
    userDetails.add(address);
    userDetails.add(disName);
    userDetails.add(cityName);
    userDetails.add(stateName);
    userDetails.add(pinCode);
    userDetails.add(contact);
    userDetails.add(emailId);
    userDetails.add(gender);
    
    UserRegistration reg = new UserRegistration();
    int userId = reg.registerNewUser(userDetails);
    if(userId > 0)
    {
    	System.out.println("registration successful");
    	request.getSession().setAttribute("userId", userId);
  %>
			<div class="alert alert-success">
			  <strong>Success!</strong> You've successfully registered now!
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
  <%@ page import="java.util.*" %>
  <%@ page import="javax.servlet.*"%>
  <%@ page import="library.*" %>

       </div>
     </div>
  </body>
</html>