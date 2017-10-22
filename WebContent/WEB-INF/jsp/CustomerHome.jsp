<!DOCTYPE HTML>
<!--
	Twenty by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)



-->

<%@page import="com.wipro.srs.bean.ProfileBean"%>
<%@page import="com.wipro.srs.service.CustomerServiceImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
	<%
	String userid = (String)session.getAttribute("userid");
	CustomerServiceImpl customerServiceImpl = new CustomerServiceImpl();
	ProfileBean profileBean = customerServiceImpl.findProfileByUserID(userid);
	
	%>
		<title>Welcome <%=profileBean.getFirstName() %></title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="<c:url value="/resources/assets/css/main.css" />"/>
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	</head>
	<body>
		

			<!-- Header -->
				<header id="header" class="alt">
					<h1><a href="/SRS/CustomerHome"><span>Welcome, </span><%=profileBean.getFirstName() %></a></h1>
					<br><nav id="nav">
						<ul>
							<li class="current"><a href="/SRS/changePassword" target="allpages">CHANGE PASSWORD</a></li>
							<li class="current"><a href="/SRS/reservation" target="allpages">RESERVATION</a></li>
							<li class="current"><a href="/SRS/cancelTicketById" target="allpages">CANCELLATION</a></li>
							<li class="current"><a href="/SRS/viewTicket" target="allpages">PRINT/SAVE TICKET</a></li>
							
							
							<li class="submenu">
								<a href="#">VIEW</a>
								<ul>
									<li><a href="/SRS/viewShipSchedule" class="button" target="allpages">SHIP/SCHEDULE</a></li>
									<li><a href="/SRS/viewTicket" class="button" target="allpages">TICKET</a></li>
									
								</ul>
							</li>
							
							<li class="submenu">
								<a href="#">ABOUT</a>
								<ul>
									<li><a href="#main" class="button fit scrolly">About Us</a></li>
									<li><a href="#contact" class="button fit scrolly">Contact Us</a></li>
									
								</ul>
							</li>
							<li><a href="/SRS/logout" class="button special">LOGOUT</a></li>
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
					
						
<iframe  scrolling="no" height="470px" width="100%" allowtransparency="true" src="abc" name="allpages" align="center"><section id="banner"></section></iframe>
					

				
</section>
			
			<!-- Footer -->
				<footer id="footer" style="padding: 1em;">
	

					<ul class="copyright">
						<li>&copy; Copyright</li><li>2015 Wipro Technologies. All rights reserved</li>
					</ul>

				</footer>

		

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