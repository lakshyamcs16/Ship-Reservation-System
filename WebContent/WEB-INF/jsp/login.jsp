<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Login</title>


<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="<c:url value="/resources/assets/css/main.css" />"/>
<script>
function validate(){
	flag=0;
 var userID = document.getElementById("userID").value;
 if(userID.length==0)
 {
	 
	 document.getElementById("error1").innerHTML = "Please enter user ID";
	 return false;
 }
 else
	{
		document.getElementById("error1").innerHTML="";
	}
	 


 var password = document.getElementById("password").value;
 if(password.length==0)
 {
	 document.getElementById("error2").innerHTML = "Please enter password";
	return false;
}
 else
	{
		document.getElementById("error2").innerHTML="";
	}
 
 return true;
}
</script>


</head>
<article id="form">
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
							<li><a href="/SRS/registerCustomer" class="button special">Sign Up</a></li>
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

						<header>
							<h2>LOGIN</h2>
						</header>
						
						<footer>
							
	<form:form method="POST" action="loginuser"  >
   <table>
    <tr ><td colspan="2" align="center"><font color="#E44D4F">${failed}</font><font color="#24AB85">${changed}${success}</font></td></tr>
    <tr><td></td><td align="center" colspan="2" ><font color="#E44D4F">${invalid}${loginagain}</font></td></tr>
    <tr>
        <td><b><form:label path="userID" style="position:relative;margin-top:10px; margin-left:-45px;font-size:20px;">User ID</form:label></b></td>
        <td><form:input class="form-control" path="userID" style="text-align:center;" placeholder="User ID" id="userID" required="required"/></td>
    </tr>
    <tr><td></td><td><font color=#E44D4F><div id="error1">${error}</div></font></td></tr>
    <tr>
        <td><b><form:label path="password" style="position:absolute;margin-top:5px; margin-left:-73px;font-size:20px;">Password</form:label></b></td>
        <td><form:password class="form-control" path="password" style="text-align:center;" placeholder="Password" id="password" required="required"/></td>
    </tr>
    <tr><td></td><td><font color=#E44D4F><div id="error2">${error}</div></font></td></tr>
	<tr>	
		<td></td>
        <td>
            <input class="form-control" type="submit" value="Login" onclick="return validate()"/>
        </td>
    </tr>
</table>  
</form:form>

		<input type="checkbox" />Remember me on this computer<br />
		Forgot Password? <a href="/SRS/forgotPassword">Reset</a>						
								
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
						<li>&copy; Copyright</li><li>2015 Wipro Technologies. All rights reserved</li>
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
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="<c:url value="/resources/assets/js/main.js"/>"></script>

</body>
</html>