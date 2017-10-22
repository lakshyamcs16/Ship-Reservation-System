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
		<link rel="stylesheet" href="<c:url value="/resources/css/mycss.css"/>" />

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
<%@page import="java.util.Map,com.wipro.srs.bean.ReservationBean,java.util.ArrayList,com.wipro.srs.bean.PassengerBean" %>
<%@page import="java.util.Set,java.util.Iterator"%>
<title>View Ticket</title>
</head>
<body>
<%
session = request.getSession();
Map<ReservationBean,ArrayList<PassengerBean>> map = (Map<ReservationBean,ArrayList<PassengerBean>>) session.getAttribute("map");
if(map!=null){
	
	Set set = map.entrySet();
	Iterator itr = set.iterator();
	Map.Entry m;
%>
<center>
<div class="shadow" align="center">

<h1>CANCEL TICKET</h1>
<table style="margin: 0px; width: 100%;">
	<thead>
	<tr>
	<th>Booking Status</th>
	<th>Number of seats</th>
	<th>Total Fare</th>
	<th>Journey Date</th>
	</tr>
	<tr>
	</thead>
	<tbody>
<%

while(itr.hasNext()){
    m = (Map.Entry) itr.next();
    ReservationBean reservationBean = (ReservationBean)m.getKey();
    out.print("<td>"+reservationBean.getBookingStatus()+"</td><td>"+reservationBean.getNoOfSeats()+"</td><td>"+reservationBean.getTotalFare()+"</td><td>"+
    			reservationBean.getJourneyDate()+"</td></tr>");
%>
</tbody>
</table>
<table style="margin: 0px; width: 100%;">
<thead>
<tr>
	<th>Name</th>
	<th>Age</th>
	<th>Gender</th>
	</tr>
</thead>
<tbody>
<%
ArrayList arrayList = (ArrayList)m.getValue();
System.out.print("ARRAY"+arrayList.toString());

for(int i=0; i<arrayList.size(); i++){
	PassengerBean passengerBean = (PassengerBean)arrayList.get(i);
	out.print("<tr><td>"+passengerBean.getName()+"</td><td>"+passengerBean.getAge()+"</td><td>"+passengerBean.getGender()+"</td></tr>");
}
}
}
%>
</tbody>	
</table>

<form action="cancelTicketDetails" method="post"><input type="submit" id="cancel" value="CANCEL TICKET" /></form>
</div>
</center>
</body>
</html>