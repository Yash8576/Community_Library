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
      }
      .alterSigninText {
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0, 0.2); /* Black w/opacity/see-through */
        color: #262228;
        font-weight: bold;
        border: 3px solid #f1f1f1;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 2;
        width: 80%;
        padding: 20px;
        text-align: center;
      }
			.customer-login-form{
				padding-top: 250px;
				min-height: 100vh;
				text-align: center;
			}
      input:focus, password:focus {
         border: none;
         border-color: none;
         box-shadow: none;
         outline: none;
      }
			.customer-login-form > input,
			.password-field > input{
        width: 70%;
        height: 35px;
        border: none;
        border-radius: 8px;
        padding: 8px;
        margin-bottom: 10px;
        font-family: sans-serif;
        font-weight: 500;
        background-color: #fff;
			}
			.signIn-button, .login-button {
				width: 150px;
				height: 50px;
				border-radius: 35px;
				padding: 8px;
				font-family: sans-serif;
				font-weight: 500;
			}
			.signIn-button {
				border: 2px solid;
				border-color: #ffffff;
				background-color: #C09F80;
				color: #1A1A1D;
			}
			.login-button {
				border: none;
				background-color: #B1A296;
				color: #1A1A1D;
			}
      .navbar-brand, .navbar-brand:hover {
        color: #76323F;
      }
      .showPassword {
        border: none;
        border-color: transparent;
        background-color: transparent;
        outline: none;
        margin: -5px;
      }
    </style>
  </head>

  <body>
     <nav class="navbar navbar-expand-sm fixed-top" id="mainNav" style="background-color: transparent">
      <div class="container-fluid">
          <div class="navbar-header">
            <a class="navbar-brand" href="index.jsp">Community Library</a>
          </div>
      </div>
    </nav>
  
    <script type="text/javascript">
      $(function()
      {
        $("#signInButton").click(function()
        {
          window.location.href = "userRegistration.jsp";  
        });
      });
    </script>
		
		<div class="LoginAsCustomer row">
			<div class="col-sm-7">
				<form action="userLoginProcess.jsp" class="customer-login-form" name="customer-login-form" onsubmit="return validate(this);" method="post">
					<h1 style="padding-bottom: 20px; color: #76323F">Login Here!</h1>
          <input name="email" type="email" id="emailId" placeholder="Email ID" autocapitalize="off" required>
          <small id="validEmail" style="color: #76323F"><br>Your email must be a valid email</small><br>
          <div class="container">
            <div class="password-field">
              <input name="password" type="password" id="password" placeholder="Password" autocapitalize="off" required>
              <button style="color: black;" class="showPassword" id="showPassword" onclick="togglePassword()"><i class="fas fa-eye"></i></button>
            </div>
          </div>
					<button class="login-button" id="loginButton" type="submit">LogIn</button>
				</form>
				<script type="text/javascript">
				  function togglePassword()
				  {
					  var x = document.getElementById("showPassword");
					  if (x.type === "password")
					    x.type = "text";
					  else
					    x.type = "password";
					}
				</script>
				
				<script type="text/javascript">
					$(function () 
					{
            $("#validEmail").hide();
            $("#emailId").css("margin-bottom", "10px");
            let emailError = true;
            $("#validEmail").keyup(function() 
            {
              let emailAddress = $("#emailId").val();
              var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
              if(regex.test(emailAddress))
              {
                $("#emailId").css("margin-bottom", "10px");
                $("#validEmail").hide();
              }
              else
              {
                $("#emailId").css("margin-bottom", "0px");
                $("#validEmail").show();
                emailError = false;
                return false;
              }
            });

						$("#loginButton").click(function()
						{
							if(emailError)
								return true;
							else
								return false;
						});
					});
				</script>
			</div>
      <div class="col-sm-5" style="background-color: #C09F80">
        <div class="alterSigninText">
          <h1>Welcome!</h1>
          <p>New User ?<br>Please Sign Up over here..</p>
          <button class="signIn-button" id="signInButton">Sign Up</button>
        </div>
      </div>
		</div>
	</body>
</html>