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

  <%
    request.getSession().invalidate();
    System.out.println("You have successfully logged out");
  %>
  <body>
    <div class="container">
      <div class="jumbotron" align="center">
        <div class="alert alert-success">
          <strong>You've successfully Logged Out!</strong>
        </div>
        <script type="text/javascript">
            $(document).ready(function() 
            {
             setTimeout(function() {window.location = "index.jsp";}, 3500);
            });
        </script>
        <p>Please wait for 5 seconds to redirect to the <a href="index.jsp">Main page</a><small> Click on the link if not</small></p>
      </div>
    </div>
  </body>
</html>