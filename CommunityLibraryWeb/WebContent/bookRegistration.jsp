<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Community Library</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
      body {
        background-color: #D7CEC7;
      }
      .row {
        margin-left: 0px;
        margin-right: 0px;
        padding-top: 80px;
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
    </style>

    <script type="text/javascript">
      $(function()
      {
        $("#logInButton").click(function()
        {
          window.location.href = "userLogin.jsp";  
        });
      });
    </script>
  </head>

  <body>
     <nav class="navbar navbar-expand-sm fixed-top" id="mainNav" style="background-color: #C09F80">
      <div class="container-fluid">
          <div class="navbar-header">
            <a class="navbar-brand" href="index.jsp">Community Library</a>
          </div>
          <ul class="navbar-nav navbar-right">
            <li class="nav-item"><a class="nav-link" href="lendBooks.jsp">Back</a></li>
          </ul>
      </div>
    </nav>
  
    <div class="container-fluid row">
      <div class="col-sm-4" align="center" style="padding-top: 30px;">
        <a href="#"><img src="images/male.jpg" class="img-responsive img-thumbnail" alt="male_avatar" width="400px" height="400px"></a><br>
        <small>Upload the image of the book here</small>
      </div>
      <div class="col-sm-8">
        <h1 style="padding-bottom: 20px; padding-left: 70px; color: #76323F" align="center">Register Here!</h1>
        <form class="book-registartion-form" name="book-registartion-form" action="bookRegistrationProcess.jsp" method="post">
          <div class="form-group">
            <input class="form-control" name="bookName" type="text" id="bookName" placeholder="Name of the Book" autocapitalize="on" required>
          </div>
          <div class="form-group">
            <input class="form-control" name="bookAuthor" type="text" id="bookAuthor" placeholder="Author of the Book" autocapitalize="on" required>
          </div>
          <select class="custom-select mb-3" name="bookGenre">
            <option selected disabled>Genre</option>
            <option value="Fantasy">Fantasy</option>
            <option value="Sci-Fi">Sci-Fi</option>
            <option value="Mystery">Mystery</option>
            <option value="Thriller">Thriller</option>
            <option value="Romance">Romance</option>
            <option value="Westerns">Westerns</option>
            <option value="Dystopian">Dystopian</option>
            <option value="Contemporary">Contemporary</option>
          </select>
          <div class="custom-file mb-3">
            <input class="custom-file-input" name="bookImgUrl" type="file" id="bookImgUrl" placeholder="Book Image"required>
            <label class="custom-file-label" for="bookImgUrl">Choose Image</label>
            <small id="validFile" style="color: #76323F">Please choose a valid file, (.jpg, .jpeg, .png)</small>
          </div>
          <div class="form-group">
            <textarea class="form-control" rows="5" name="bookSummary" id="bookSummary" placeholder="Few lines about the Book.." autocapitalize="on" required></textarea>
          </div>
          <div align="center">
            <button class="btn btn-light" id="registerButton" type="submit" style="color: #76323F">Register</button>
            <button class="btn btn-light" id="resetButton" type="reset" style="color: #76323F">Reset</button>
          </div>
        </form>

        <script type="text/javascript">
          $(function()
          {
        	  $("#validFile").hide();
            let fileError = true;
            $(".custom-file-input").on("change", function() 
            {
              var fileName = $(this).val().split("\\").pop();
              var extension = fileName.split(".").pop();
              if(extension=="jpg" || extension=="jpeg" || extension=="png")
              {
                fileError = true;
                $("#validFile").hide();
                $("img").attr("src", "images/" + fileName);
                $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
              }
              else
              {
                fileError = false;
                $("#bookImgUrl").val("");
                $("#validFile").show();
              }
            });
        	  
        	  $("#registerButton").click(function()
        		{
        		  if(fileError)
        			  return true;
        		  else
        			  return false;
        	  });
          });
          
        </script>
      </div>
    </div>
  </body>
</html>