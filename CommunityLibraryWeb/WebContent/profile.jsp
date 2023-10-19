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
      .profile {
        padding-top: 80px;
        padding-left: 50px;
        padding-bottom: 50px;
      }
      .card {
        background-color: #F0F0F0;
      }
      .card-header {
        background-color: #F0F0F0;
        border: none;
        border-radius: 4px;
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
            <li class="active nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
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

    <%! String gender; %>
    <%! ArrayList<String> userDetails = new ArrayList<>(); %>
    <%
      int userId = (Integer) request.getSession(false).getAttribute("userId");
      UserLogin login = new UserLogin();
      userDetails = login.getUserDetails(userId);
      gender = userDetails.get(9);
      
      BookSubscription subsObj = new BookSubscription();
    %>
    <div class="container-fluid row profile">
      <div class="col-sm-4">
    <%
        if(gender.equals("M"))
        {
    %>
          <a href="#"><img src="images/male.jpg" class="img-responsive img-thumbnail" alt="male_avatar" width="400px" height="400px"></a>
    <%
        }
        else
        {
    %>
          <a href="#"><img src="images/female.jpg" class="img-responsive img-thumbnail" alt="female_avatar" width="400px" height="400px"></a>
    <%
        }
    %>
      </div>
      <div class="col-sm-8">
        <div id="accordion">
          <div class="card">
            <div class="card-header">
              <a class="collapsed card-link" data-toggle="collapse" href="#details" style="color: #76323F; font-size: 24px">Personal Details</a>
            </div>
            <div id="details" class="collapse show" data-parent="#accordion">
              <div class="card-body">
                <table class="table table-striped">
                 <tbody>
                   <tr><td>Full Name :</td><td><%out.println(userDetails.get(0));%></td></tr>
                   <tr><td>Email ID :</td><td><%out.println(userDetails.get(8));%></td></tr>
                   <tr><td>Contact :</td><td><%out.println(userDetails.get(7));%></td></tr>
                   <tr><td>Gender :</td><td><%if(gender.equals("M"))out.println("Male");else out.println("Female");%></td></tr>
                   <tr><td>District Name :</td><td><%out.println(userDetails.get(3));%></td></tr>
                   <tr><td>City Name :</td><td><%out.println(userDetails.get(4));%></td></tr>
                   <tr><td>State Name :</td><td><%out.println(userDetails.get(5));%></td></tr>
                    <tr><td>Pin Code :</td><td><%out.println(userDetails.get(6));%></td></tr>
                   <tr><td>Address :</td><td><%out.println(userDetails.get(2));%></td></tr>
                 </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="card-header">
              <a class="collapsed card-link" data-toggle="collapse" href="#subscriptions" style="color: #76323F; font-size: 24px">Book Subscriptions</a>
            </div>
            <div id="subscriptions" class="collapse" data-parent="#accordion">
              <div class="card-body">
                <table class="table table-striped">
                  <tbody>
                    <%
                    %>
                    <tr><td>Books Lended :</td><td><%out.println(subsObj.getLendedBooksCount(userId));%></td></tr>
                    <tr><td>Books Borrowed :</td><td><%out.println(subsObj.getBorrowedBooksCount(userId));%></td></tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="card-header">
              <a class="collapsed card-link" data-toggle="collapse" href="#notifications" style="color: #76323F; font-size: 24px">Notifications</a>
            </div>
            <div id="notifications" class="collapse" data-parent="#accordion">
              <div class="card-body">
              <%
              try
              {
                GetConnection getCon = new GetConnection();
                Connection connection = getCon.setUpConnection();
                 
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM [dbo].[USER_NOTIFICATION] WHERE ReceiverId = ? AND Status = ?");
                statement.setInt(1, userId);
                statement.setString(2, "NotRead");
                
                ResultSet rset = statement.executeQuery();
                if(rset.next())
                {
                	do
                	{
                    String notificationMsg = rset.getString("NotificationMsg");
                    String type = rset.getString("Type");
              %>
                  <div class="alert alert-success alert-dismissible fade show" id="alert">
                    <button type="button" class="close" onclick="" data-dismiss="alert">&times;</button>
                    <strong>Success!</strong><%out.println(" " + notificationMsg); %>
                  </div>
              <%
                	}while(rset.next());
                }
                else
                {
              %>
                <p align="center">Currently you don't have any notifications</p>
              <%  	
                }
              }
              catch(Exception e){
              	e.printStackTrace();
              }
              %>
              </div>
            </div>
          </div>
        </div>
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
    <%@ page import="java.sql.*"%>
    <%@ page import="java.io.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="javax.servlet.*"%>
    <%@ page import="library.*" %>
  </body>  
</html>