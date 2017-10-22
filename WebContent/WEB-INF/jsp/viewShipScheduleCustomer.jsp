<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/table.css"/>" />
		
		<!--[if IE]>
  		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@page import ="java.util.ArrayList,com.wipro.srs.bean.ScheduleBean" %>
<title>View Schedule Details</title>
</head>
<body>
<center>
<div class="shadow" align="center">

<h1>SHIP/SCHEDULE DETAILS</h1>
<table style="margin: 0px; width: 100%;">
<tr>
	<th>Schedule ID</th>
	<th>Ship ID</th>
	<th>Route ID</th>
	<th>Start date</th>
</tr>
<%
session = request.getSession();
ArrayList<ScheduleBean> arrayList = (ArrayList<ScheduleBean>) session.getAttribute("scheduleBeans");
if(arrayList!=null){
	for(int i=0; i<arrayList.size(); i++){
		out.print("<tr><td>"+arrayList.get(i).getScheduleID()+"</td><td>"+arrayList.get(i).getRouteID()+"</td><td>"+arrayList.get(i).getRouteID()
				+"</td><td>"+arrayList.get(i).getStartDate()+"</td></tr>");
	}
}
%>
</table>
</div>
</center>
</body>
</html>