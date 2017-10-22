<%@page import="com.wipro.srs.bean.ShipBean"%>
<%@page import="com.wipro.srs.bean.ScheduleBean"%>
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
		
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Passenger Details</title>

<%@page import="java.util.ArrayList,com.wipro.srs.bean.RouteBean,com.wipro.srs.service.AdministratorImpl" %>

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
ArrayList<ScheduleBean> scheduleBeans = (ArrayList<ScheduleBean>)session.getAttribute("schedulebeans");
ArrayList<String> shipBeans = new ArrayList<String>();
ArrayList<String> routeBeans = new ArrayList<String>();

AdministratorImpl administratorImpl = new AdministratorImpl();

if(scheduleBeans!=null){
	for(int i=0;i<scheduleBeans.size();i++){
		shipBeans.add(scheduleBeans.get(i).getShipID());
	}
	for(int i=0;i<scheduleBeans.size();i++){
		
		routeBeans.add(scheduleBeans.get(i).getRouteID());
	}
	
}
%>
<center>
<div class="shadow" align="center">

<h1>SHIP DETAILS</h1>
<table style="margin: 0px; width: 100%;">

<thead>
<tr>
		<th>Ship Name</th>
		<th>Reservation Capacity</th>
		<th>Start date</th>
		<th>Source</th>
		<th>Destination</th>
		<th>Travel Duration</th>
		<th>Fare</th>
		<th>Book</th>
</tr>		
</thead>
<tbody>
<tr>
<%
for(int i=0; i<shipBeans.size();i++){
	ShipBean shipBean = administratorImpl.viewByShipId(shipBeans.get(i));
	out.print("<td>"+shipBean.getShipName()+"</td><td>"+shipBean.getReservationCapacity()+"</td><td>"+scheduleBeans.get(i).getStartDate()+"</td>");
	RouteBean routeBean = administratorImpl.viewByRouteId(routeBeans.get(i));
%>


		<td><%=routeBean.getSource() %></td>
		<td><%=routeBean.getDestination() %></td>
		<td><%=routeBean.getTravelDuration() %></td>
		<td>$ <%=routeBean.getFare() %></td>
		<td style="background-color:rgba(0,0,0,0.2);"><form action='getpassengerdetails' method="get"><button  style="padding:2px 4px 2px 4px; border-radius:2px;"id="book" name="book" value='<%=scheduleBeans.get(i).getScheduleID() %>' >Book Ship</button></form></td>
	</tr>
<%
}
%>
</tbody>
</table>
</div>
</center>
</body>
</html>