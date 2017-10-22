<%@page import="com.wipro.srs.service.AdministratorImpl"%>
<%@page import="com.wipro.srs.bean.ReservationBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.wipro.srs.bean.PassengerBean"%><html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/table.css"/>" />
		
		<!--[if IE]>
  		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@page import="java.util.ArrayList" %>
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
	AdministratorImpl administratorImpl= new AdministratorImpl();
	ArrayList<PassengerBean> list = (ArrayList<PassengerBean>)session.getAttribute("passengerList");
	ReservationBean reservationBean = new ReservationBean();
	if(list.size()>0){
		 reservationBean = administratorImpl.viewByReservationId(list.get(0).getReservationID());

%>
<center>
<div class="shadow" align="center">
<h1>Passenger Details</h1>
<table style="margin: 0px; width: 100%;">

	<tr>
		<th>Reservation ID</th>
		<th>Schedule ID</th>
		<th>Name</th>
		<th>Age</th>
		<th>Gender</th>
	</tr>
<%
	for(int i=0; i<list.size(); i++){
	
	PassengerBean bean = (PassengerBean)list.get(i);
%>


	<tr>
		<td><%=bean.getReservationID() %></td>
		<td><%=bean.getScheduleID() %></td>
		<td><%=bean.getName() %></td>
		<td><%=bean.getAge() %></td>
		<td><%=bean.getGender() %></td>
	</tr>
<%
		}
%>
</table>

<%
	}else{
		%>
		<font color="red">${scheduleresult}</font>
<%
	}
%>

</div>
</center>
</body>
</html>