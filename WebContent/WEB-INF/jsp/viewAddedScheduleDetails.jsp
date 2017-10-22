<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.wipro.srs.bean.ScheduleBean"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/table.css"/>" />
		
		<!--[if IE]>
  		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<title>Details Added</title>

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
th{
text-align: center;
}
td{
text-align: center;
color: grey;
}
h1{
letter-spacing: 2px;
}
</style>
</head>
<body>
<%
	session = request.getSession();
	ScheduleBean bean = (ScheduleBean)session.getAttribute("scheduleBean");
	String status = (String)session.getAttribute("status");
	if("Could not enter".equals(status)){out.print(status);}else{
%>
<center>
<div class="shadow" align="center">

<h1>Schedule has been added</h1>
<table style="margin: 0px; width: 100%;">
	<tr>
		<th>Schedule ID</th>
		<th>Route ID</th>
		<th>Ship ID</th>
		<th>Start Date</th>
	</tr>
	<tr>
		<td><%=bean.getScheduleID() %></td>
		<td><%=bean.getRouteID() %></td>
		<td><%=bean.getShipID() %></td>
		<td><%=bean.getStartDate() %></td>
	</tr>
</table>
<% 
	
	
	}%>
</div>
</center>
</body>
</html>