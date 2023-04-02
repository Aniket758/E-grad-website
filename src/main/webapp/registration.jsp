<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up</title>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
				<script src="js/main.js"></script>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
				
				 <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
				<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
				<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet">
			<!-- Main css -->
			<!-- <link rel="stylesheet" href="css/style.css"> -->
</head>
<body>
<!-- <input type="hidden" id="status" value="success" > -->
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>" >
	<div class="main">
		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form method="post" action="RegisterServlet" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="fname"><i class="zmdi zmdi-account material-icons-name"></i></label> 
								<input type="text" name="fname" id="fname" placeholder="Your First Name" required="required"/>
							</div>
							<div class="form-group">
								<label for="lname"><i class="zmdi zmdi-account material-icons-name"></i></label> 
								<input type="text" name="lname" id="lname" placeholder="Your Last Name" required="required"/>
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email" required="required"/>
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Password" required="required"/>
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" required="required" />
							</div>
							<div class="form-group">
								<label for="dob"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="date" name="dob" id="dob"
									placeholder="dob" required="required" />
							</div>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="contact" id="contact"
									placeholder="Contact no" required="required"/>
							</div>
							<div class="form-group">
								<label> Gender:</label><br />
								<label><input type="radio" name="gender" value="Male" checked> Male</label><br /><br />
								<label><input type="radio" name="gender" value="Female"> Female</label><br /><br />
								<label><input type="radio" name="gender" value="Other"> Other</label><br />
							</div>
							
							<div class="form-group">
								<label for="address"><i class="zmdi zmdi-pin"></i></label>
								<input type="text" name="address" id="address" placeholder="Enter your address" required="required" />
							</div>
							<!-- <div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>/ -->
							<div class="form-group">
								<label for="state"><i class="zmdi zmdi-pin"></i></label>
								<input type="text" name="state" id="state" placeholder="Enter your state" required="required" />
							</div>

							<div class="form-group">
								<label for="city"><i class="zmdi zmdi-city"></i></label>
								<input type="text" name="city" id="city" placeholder="Enter your city" required="required" />
							</div>
							
							<div class="form-group">
								<label for="country"><i class="zmdi zmdi-globe"></i></label>
								<input type="text" name="country" id="country" placeholder="Enter your country" required="required" />
							</div>
							
							<div class="form-group">
								<label for="pincode"><i class="zmdi zmdi-pin"></i></label>
								<input type="text" name="pincode" id="pincode" placeholder="Enter your pincode" required="required" />
							</div>
							
							<div class="form-group">
							    <label for="course">Course Applied:</label><br><br>
							    <input type="checkbox" name="course[]" value="Java"> Java<br><br>
							    <input type="checkbox" name="course[]" value="Python"> Python<br><br>
							    <input type="checkbox" name="course[]" value="C++"> C++<br><br>
							    <input type="checkbox" name="course[]" value="Kotlin"> Kotlin<br><br>
							</div>
							
							<div class="form-group form-button">
							<input type="submit" name="signup" id="signup" class="form-submit" value="Register" />
								
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signup-image.jpg" alt="sing up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	
	<script type="text/javascript">
		var stat = document.getElementById("status").value;
		if(stat=="success"){
			
			swal("account ","created", "successfully");
		}
		if(stat=="nopee"){
			
			swal("Pleaseeeeeeeee  ","fill in all", "the fields ");
		}
		if(stat=="nope"){
					
					swal("Please  ","fill in all", "the fields ");
				}
		
		
	
	</script>



</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>