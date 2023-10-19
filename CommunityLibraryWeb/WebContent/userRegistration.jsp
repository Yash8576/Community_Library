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
   		.alterLoginText {
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
			.customer-register-form{
				padding-top: 30px;
				min-height: 100vh;
				text-align: center;
			}
			.password-field {
			  margin: 0px;
			}
			input:focus, select:focus, password:focus {
         border: none;
         border-color: none;
         box-shadow: none;
         outline: none;
      }
			.customer-register-form > input, select,
			.password-field > input {
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
			.logIn-button, .register-button {
				width: 150px;
				height: 50px;
				border-radius: 35px;
				padding: 8px;
				font-family: sans-serif;
				font-weight: 500;
			}
			.logIn-button {
				border: 2px solid;
				border-color: #ffffff;
				background-color: #C09F80;
				color: #1A1A1D;
			}
			.register-button {
				border: none;
				background-color: #B1A296;
				color: #1A1A1D;
			}
      .navbar-brand, .navbar-brand:hover {
        color: #76323F;
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
    	  $("#logInButton").click(function()
    		{
    		  window.location.href = "userLogin.jsp";  
    	  });
      });
    </script>

		<div class="registrationAsCustomer row">
			<div class="col-sm-5" style="background-color: #C09F80">
			  <div class="alterLoginText">
	        <h1>Hey There!</h1>
	        <p>If you are already a customer<br>Please Login In here..</p>
	        <button class="logIn-button" id="logInButton">Log In</button>
			  </div>
      </div>
			<div class="col-sm-7">
				<form class="customer-register-form" name="customer-register-form" action="userRegistrationProcess.jsp" method="post">
					<h1 style="padding-bottom: 20px; padding-left: 70px; color: #76323F">Register Here!</h1>
					<input name="fname" type="text" id="fullName" placeholder="Full Name" autocapitalize="off" required><br>
					<input name="email" type="email" id="emailId" placeholder="Email ID" autocapitalize="off" required>
					<small id="validEmail" style="color: #76323F"><br>Your email must be a valid email</small><br>
					<select name="gender" style="display: inline;">
						<option value="M">Male</option>
						<option value="F">Female</option>
						<option value="O">Others</option>
					</select><br>
					<input name="contact" type="tel" id="contactNumber" placeholder="Contact" autocapitalize="off" required>
					<small id="telCheck" style="color: #76323F"><br>Please enter a valid phone number</small><br>
					<input name="disName" type="text" id="disName" placeholder="District" autocapitalize="on" required><br>
					<input name="cityName" type="text" id="cityName" placeholder="City" autocapitalize="on" required><br>
					<input name="stateName" type="text" id="stateName" placeholder="State" autocapitalize="on" required><br>
          <input name="pinCode" type="text" id="pinCode" placeholder="Pin Code" autocapitalize="off" required><br>
					<input name="address" type="text" id="address" placeholder="Address" autocapitalize="off" required><br>
					<div class="container">
					  <div class="password-field">
              <input name="password" type="password" id="password" placeholder="Password" autocapitalize="off" required>
              <a style="color: black;" id="showP" href="#"><i class="fas fa-eye"></i></a>
					  </div>
            <small id="passCheck" style="color: #76323F"><br>Please enter a strong password</small>
					</div>
          <div class="container">
            <div class="password-field">
              <input name="repassword" type="password" id="repassword" placeholder="Confirm Password" autocapitalize="off" required>
              <a style="color: black;" id="showRp" href="#"><i class="fas fa-eye"></i></a>
            </div>
            <small id="rePassCheck" style="color: #76323F"><br>Passwords do not Match</small>
          </div>
					<button class="register-button" id="registerButton" type="submit">Register</button>
				</form>
				
				<script type="text/javascript">
					$(function () 
					{
            $("#validEmail").hide();
            $("#emailId").css("margin-bottom", "10px");
            let emailError = true;
            $("#validEmail").keyup(function() 
            {
            	let emailAddress = $("#emailId").val();
            	var regex = "/^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/";
            	if(regex.test(emailAddress))
            	{
            		$("#emailId").css("margin-bottom", "10px");
            		$("#validEmail").hide();
            		emailError = true;
            	}
            	else
              {
	              $("#emailId").css("margin-bottom", "0px");
	              $("#validEmail").show();
	              emailError = false;
	              return false;
              }
            });
						
						$("#telCheck").hide();
						$("#contactNumber").css("margin-bottom", "10px");
						let phoneNumberError = true;
						$("#contactNumber").keyup(function() 
						{
              let contactNum = $("#contactNumber").val();
              if(contactNum.length != 10) 
              {
                 $("#contactNumber").css("margin-bottom", "0px");
                $("#telCheck").show();
                phoneNumberError = false;
              }
              else 
              {
            	  phoneNumberError = true;
                $("#telCheck").hide();
                $("#contactNumber").css("margin-bottom", "10px");
              }
						});
																		
						$("#passCheck").hide();
            $("#password").css("margin-bottom", "10px");
						let passwordError = true;
						$("#password").keyup(function()
						{
              let passwordValue = $("#password").val();
              if(passwordValue.length=='') 
              {
                $("#password").css("margin-bottom", "0px");
                $("#passCheck").show();
                passwordError = false;
              }
              else if(passwordValue.length < 3) 
              {
                $("#passCheck").show();
                $("#password").css("margin-bottom", "0px");
                $("#passCheck").html("length of the password should be greater than 3");
                $("#passCheck").css("color", "#76323F");
                passwordError = false;
              }
              else 
              {
            	  passwordError = true;
                $("#password").css("margin-bottom", "10px");
                $("#passCheck").hide();
              }
						});
						
						$("#rePassCheck").hide();
						let confirmPasswordError = true;
            $("#repassword").css("margin-bottom", "10px");
						$("#repassword").keyup(function() 
						{
              let confirmPasswordValue = $("#repassword").val();
              let passwordValue = $("#password").val();
              
              if(confirmPasswordValue != passwordValue) 
              {
                $("#rePassCheck").show();
                $("#repassword").css("margin-bottom", "0px");
                $("#rePassCheck").html("Passwords do not match");
                $("#rePassCheck").css("color", "#76323F");
                confirmPasswordError = false;
              }
              else 
              {
            	  confirmPasswordError = true;
                $("#repassword").css("margin-bottom", "10px");
                $("#rePassCheck").hide();
              }
						});
					
						$("#registerButton").click(function () 
						{
							console.log(confirmPasswordError + ' ' + passwordError + ' ' + phoneNumberError);
							if(confirmPasswordError && passwordError && phoneNumberError) 
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