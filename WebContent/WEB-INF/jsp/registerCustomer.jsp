<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Login</title>
    <style>
.shadow {
    background-color: #fff;
    background-color: rgba(0,0,0,0.2);
	width:auto;
	height:auto;
	display:inline-block;
	padding: 2em 3em 2em 2em;
	color: white;
}
</style>
<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="<c:url value="/resources/assets/css/main.css" />"/>
		<script src="<c:url value="/resources/js/registerValidation.js"/>"></script>



</head>
		<div id="page-wrapper">

			<!-- Header -->
				<header id="header" class="alt">
					<h1 id="logo"><a href="/SRS/login">Ship <span>Reservation System</span></a></h1>
					<nav id="nav">
						<ul>
							<li class="current"><a href="#form" class="button fit scrolly">Welcome</a></li>
							<li class="submenu">
								<a href="#">ABOUT</a>
								<ul>
									<li><a href="#main" class="button fit scrolly">About Us</a></li>
									<li><a href="#contact" class="button fit scrolly">Contact Us</a></li>
									
								</ul>
							</li>
							<li><a href="/SRS/login" class="button special">LOGIN</a></li>
						</ul>
					</nav>
				</header>

			<!-- Banner -->
				<section id="banner">

					<!--
						".inner" is set up as an inline-block so it automatically expands
						in both directions to fit whatever's inside it. This means it won't
						automatically wrap lines, so be sure to use line breaks where
						appropriate (<br />).
					-->
					<div class="inner">
<article id="form">
						<header>
							<h2>REGISTER</h2>
						</header>
						
						<footer>
							

<form:form method="POST" action="registerUser" >
   <table align="center">
    
   <form:label path="userID"></form:label>
   <form:hidden path="userID" />

    <tr>
        <td><form:label path="firstName">First Name</form:label></td>
        <td><form:input path="firstName" id="firstName" placeholder="Firstname" required="required" maxlength="20"/></td>
         <td><form:label path="lastName" >Last Name</form:label></td>
         <td><form:input path="lastName" id="lastName"  placeholder="Lastname" required="required" maxlength="20"/></td>
    </tr>
    <tr><td></td><td><font color=#E44D4F><div id="error1">${error}</div></font></td><td></td><td><font color=#E44D4F><div id="error2">${error}</div></font></td></tr>
	<tr>
        <td><form:label path="dateOfBirth">Date Of Birth</form:label></td>
        <td><form:input path="dateOfBirth" id="dateOfBirth" placeholder="dd-mm-yyyy" required="required"/></td>
         <td><form:label path="gender">Gender</form:label></td>
        <td><form:radiobutton path="gender" value="Male" id="gender1" />Male 
		<form:radiobutton path="gender" value="Female" id="gender2"/>Female</td>
    </tr>
	<tr><td></td><td><font color=#E44D4F><div id="error3">${error}</div></font></td><td></td><td><font color=#E44D4F><div id="error12">${error}</div></font></td></tr>
	<tr>
        <td><form:label path="street">Street</form:label></td>
        <td><form:input path="street" id="street"  placeholder="Street" required="required" maxlength="30"/></td>
         <td><form:label path="location">Location</form:label></td>
        <td><form:input path="location" id="location"  placeholder="Location" required="required" maxlength="20"/></td>
    </tr>
	<tr><td></td><td><font color=#E44D4F><div id="error4">${error}</div></font></td><td></td><td><font color=#E44D4F><div id="error5">${error}</div></font></td></tr>
	 <tr>
        <td><form:label path="city">City</form:label></td>
        <td><form:input path="city" id="city"  placeholder="City" required="required" maxlength="20"/></td>
         <td><form:label path="state">State</form:label></td>
        <td><form:input path="state" id="state"  placeholder="State" required="required" maxlength="20"/></td>
    </tr>
	 <tr><td></td><td><font color=#E44D4F><div id="error6">${error}</div></font></td><td></td><td><font color=#E44D4F><div id="error7">${error}</div></font></td></tr>
	<tr>
        <td><form:label path="pincode">Pincode</form:label></td>
        <td><form:input path="pincode" id="pincode"  maxlength="6" minlength="6"  placeholder="Pincode" required="required"/></td>
        <td><form:label path="mobileNo">Phone</form:label></td>
        <td><form:input path="mobileNo" id="mobileNo"  placeholder="Mobile Number" required="required" maxlength="10"/></td>
    </tr> 
	<tr><td></td><td><font color=#E44D4F><div id="error8">${error}</div></font></td><td></td><td><font color=#E44D4F><div id="error9">${error}</div></font></td></tr>
	
    <tr>
        <td><form:label path="emailID">Email ID</form:label></td>
        <td><form:input path="emailID" id="emailID"  placeholder="abc@abc.com" required="required" maxlength="30"/></td>
         <td><form:label path="password">Password</form:label></td>
        <td><form:password path="password" id="password"  placeholder="Password" maxlength="20" minlength="6" required="required"/></td>
    </tr>
	<tr><td></td><td><font color=#E44D4F><div id="error10">${error}</div></font></td><td></td><td><font color=#E44D4F><div id="error11">${error}</div></font></td></tr>
	
	<tr>	
        <td colspan="4" align="center">
            <center><input type="submit" value="REGISTER" onclick="return validate()"/></center>
        </td>
    </tr>
</table>  
</form:form>					
</article>								
								
						</footer>

					</div>

				</section>

			<!-- Main -->
				<article id="main">

					<header class="special container">
						<span class="icon fa-bar-chart-o"></span>
						<h2><strong>History</strong></h2>
						<p>The first version of the BOOKIT system was originally developed in 1987 for the AW Line operation between Mariehamn on the Åland Islands in Finland and Norrtälje in Sverige. This operation was a project by the Aland businessman Anders Wiklöf and was only sailing for two years. The next year Eckerö Linjen acquired the system and the saga started.

With some help from the travel technology giant Amadeus IT Group BOOKIT is today in use also by several customers in North Africa and in the Mediterranean Sea.

BOOKIT is now also expanding on the important British market by signing contract with the Isle of Wight operator Red Funnel as well as the Scottish operator NorthLink Ferries operating between mainland Scotland and the islands of Shetland and Orkney.</p>
					</header>
				</article>
				<article id="contact">
					<!-- One -->
						<section class="wrapper style2 container special-alt">
							<div class="row 50%">
								<div class="8u 12u(narrower)">

									
										<h2><strong>CONTACT US TODAY!</strong></h2>
									
									
										<pre>
										Name 			Lakshya Sethi
										
										Phone	  		+917834226571
										
										Email ID 		dreamtravels@shipers.com
										
										Address 		17-B, Royals Street
														Chennai-600119
														India.
										</pre>
									
									<footer>
		
									</footer>

								</div>
								<div class="4u 12u(narrower) important(narrower)">

									<ul class="featured-icons">
										<li><span class="icon fa-clock-o"><span class="label">Feature 1</span></span></li>
										<li><span class="icon fa-volume-up"><span class="label">Feature 2</span></span></li>
										<li><span class="icon fa-laptop"><span class="label">Feature 3</span></span></li>
										<li><span class="icon fa-inbox"><span class="label">Feature 4</span></span></li>
										<li><span class="icon fa-lock"><span class="label">Feature 5</span></span></li>
										<li><span class="icon fa-cog"><span class="label">Feature 6</span></span></li>
									</ul>

								</div>
							</div>
						</section>

					</article>

			<!-- Footer -->
				<footer id="footer">

					<ul class="icons">
						<li><a href="#" class="icon circle fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon circle fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon circle fa-google-plus"><span class="label">Google+</span></a></li>
						<li><a href="#" class="icon circle fa-github"><span class="label">Github</span></a></li>
						<li><a href="#" class="icon circle fa-dribbble"><span class="label">Dribbble</span></a></li>
					</ul>

					<ul class="copyright">
						<li>&copy; Lakshya 2015</li>
					</ul>

				</footer>

		</div>

		<!-- Scripts -->
			<script src="<c:url value="/resources/assets/js/jquery.min.js"/>"></script>
			<script src="<c:url value="/resources/assets/js/jquery.dropotron.min.js"/>"></script>
			<script src="<c:url value="/resources/assets/js/jquery.scrolly.min.js"/>"></script>
			<script src="<c:url value="/resources/assets/js/jquery.scrollgress.min.js"/>"></script>
			<script src="<c:url value="/resources/assets/js/skel.min.js"/>"></script>
			<script src="<c:url value="/resources/assets/js/util.js"/>"></script>
			<script>
			function validate(){
				flag=0;
				var regEx = /[A-Za-z]+/;
				var regExDigit = /^\d+$/;
			 var firstName = document.getElementById("firstName").value;
			 if(firstName.length==0)
			 {
				 
				 document.getElementById("error1").innerHTML = "Please enter first name";
				 return false;
			 }
			 else
				{
					document.getElementById("error1").innerHTML="";
				}

			 if(firstName.match(regEx)) {
					flag = 1;
				}else{
					 document.getElementById("error1").innerHTML = "Please enter only alphabets";
					document.getElementById("firstName").focus();
					flag = 0;
					return false;
				}


				
			 var lastName = document.getElementById("lastName").value;
			 if(lastName.length==0)
			 {
				 
				 document.getElementById("error2").innerHTML = "Please enter last name";
				 return false;
			 }
			 else
				{
					document.getElementById("error2").innerHTML="";
				}

			 if(lastName.match(regEx)) {
					flag = 1;
				}else{
					 document.getElementById("error2").innerHTML = "Please enter only alphabets";
					document.getElementById("lastName").focus();
					flag = 0;
					return false;
				}

				

			 var dateOfBirth = document.getElementById("dateOfBirth").value;
			 if(dateOfBirth.length==0)
			 {
				 
				 document.getElementById("error3").innerHTML = "Please enter date Of birth";
				 return false;
			 }
			 else
				{
				 	//dd-mm-yyyy
				 	
				 	 var validformat=/^\d{2}-\d{2}-\d{4}$/ ;
					 var returnval=false;
					 
					 if (!validformat.test(dateOfBirth)){
						 document.getElementById("error3").innerHTML="Invalid format (dd-mm-yyyy)";
					 	return false;
					 }
					 else{ 
						 
					 var dayfield=dateOfBirth.split("-")[0];
					
					 var monthfield=dateOfBirth.split("-")[1];
					 var yearfield=dateOfBirth.split("-")[2];
					 
					 var dayobj = new Date(yearfield, monthfield-1, dayfield);
					 
					 
					 
					 if ((dayobj.getMonth()+1!=monthfield)||(dayobj.getDate()!=dayfield)||(dayobj.getFullYear()!=yearfield)){
						 document.getElementById("error3").innerHTML="Invalid date";
					 return false;
					 }
					 else
						 returnval=true;
					 }
					 
					 if (returnval==false){
						 document.getElementById("dateOdBirth").focus();
						 return false;
					 }
					
					document.getElementById("error3").innerHTML="";
				}

			 var gender1 = document.getElementById("gender1").checked;
			 var gender2 = document.getElementById("gender2").checked;

			 if(!((gender1) || (gender2)))
			 {
				 
				 document.getElementById("error12").innerHTML = "Please select gender";
				 return false;
			 }
			 else
				{
					document.getElementById("error12").innerHTML="";
				}

			 var street = document.getElementById("street").value;
			 if(street.length==0)
			 {
				 
				 document.getElementById("error4").innerHTML = "Please enter street";
				 return false;
			 }
			 else
				{
					document.getElementById("error4").innerHTML="";
				}


			 
			 var location = document.getElementById("location").value;
			 if(location.length==0)
			 {
				 
				 document.getElementById("error5").innerHTML = "Please enter location";
				 return false;
			 }
			 else
				{
					document.getElementById("error5").innerHTML="";
				}
			 if(location.match(regEx)) {
					flag = 1;
				}else{
					 document.getElementById("error5").innerHTML = "Please enter correct location";
					document.getElementById("location").focus();
					flag = 0;
					return false;
				}


				
			 var city = document.getElementById("city").value;
			 if(city.length==0)
			 {
				 
				 document.getElementById("error6").innerHTML = "Please enter city";
				 return false;
			 }
			 else
				{
					document.getElementById("error6").innerHTML="";
				}
			 if(city.match(regEx)) {
					flag = 1;
				}else{
					 document.getElementById("error6").innerHTML = "Please enter correct city";
					document.getElementById("city").focus();
					flag = 0;
					return false;
				}


				
			 var state = document.getElementById("state").value;
			 if(state.length==0)
			 {
				 
				 document.getElementById("error7").innerHTML = "Please enter state";
				 return false;
			 }
			 else
				{
					document.getElementById("error7").innerHTML="";
				}
			 if(state.match(regEx)) {
					flag = 1;
				}else{
					 document.getElementById("error7").innerHTML = "Please enter correct state";
					document.getElementById("state").focus();
					flag = 0;
					return false;
				}


				
			 var pincode = document.getElementById("pincode").value;
			 if(pincode.length==0)
			 {
				 
				 document.getElementById("error8").innerHTML = "Please enter pincode";
				 return false;
			 }else if(pincode.length!=6){
				 document.getElementById("error8").innerHTML = "Please enter 6 digits";
				 return false;
			 }
			 else
				{
					document.getElementById("error8").innerHTML="";
				}
			 if(isNaN(pincode)){
				 document.getElementById("error8").innerHTML = "Please enter only numeric values";
				   document.getElementById("pincode").focus();
				   return false;
				 }


			 
			 var mobileNo = document.getElementById("mobileNo").value;
			 if(mobileNo.length==0)
			 {
				 
				 document.getElementById("error9").innerHTML = "Please enter mobile No";
				 return false;
			 }
			 else
				{
					document.getElementById("error9").innerHTML="";
				}

			 var phone_reg_one = /[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/;
			 if(phone_reg_one.test(mobileNo)) {
					
					
			 }else{
				 document.getElementById("error9").innerHTML = "Please enter 10 digit number";
			 	 document.getElementById("mobileNo").focus();
			 	 return false;
			 }

			 
			 var emailID = document.getElementById("emailID").value;
			 if(emailID.length==0)
			 {
				 
				 document.getElementById("error10").innerHTML = "Please enter email id";
				 return false;
			 }
			 else
				{
					document.getElementById("error10").innerHTML="";
				}
			pattern=/[a-z0-9A-Z._]+@[a-z0-9A-Z_]+\.[a-z0-9A-Z]+[a-z0-9A-Z]+/;
			 
			 
			 if(emailID.match(pattern)) {
					flag = 1;
				}else{
					 document.getElementById("error10").innerHTML = "Please enter email id in<br/> format x@x.xx";
					document.getElementById("emailID").focus();
					flag = 0;
					return false;
				}
			 var password = document.getElementById("password").value;
			 if(password.length==0)
			 {
				 
				 document.getElementById("error11").innerHTML = "Please enter password";
				 return false;
			 }
			 else
				{
					document.getElementById("error11").innerHTML="";
				} 
			 
						 
			 return true;
			}
			</script>

</body>
</html>