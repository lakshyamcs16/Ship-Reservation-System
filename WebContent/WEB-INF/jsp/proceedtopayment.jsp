<%@page import="com.wipro.srs.bean.RouteBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment</title>

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
td{
text-align:center;
}
input{
text-align:center;
}
select,input[type="date"]{
width:100%;
background-color:rgba(0,0,0,0);
height: 45px;
text-align: center;
color:grey;
    -webkit-appearance: none;
}
h1{
letter-spacing: 2px;
}	
</style>
</head>
<body>
<center>
<div class="shadow" align="center">
<h1><pre> PAYMENT DETAILS</pre></h1>
<%! double totalfare; %>
<%
	RouteBean routeBean = (RouteBean) session.getAttribute("routeforrate");
	int seats = (Integer)session.getAttribute("seats");
	double fare = routeBean.getFare();
	String duration[] = routeBean.getTravelDuration().split(" ");
	int travelduration = Integer.parseInt(duration[0]);
	totalfare = fare*seats-travelduration;
	session.setAttribute("totalfare", totalfare);
%>
<table align="center">

	<tr>
		<th>Total Fare</th>
		<td>$ <%= totalfare %></td>
	</tr>
<form:form method="POST" action="pay" >	
	<tr><td></td><td><font color="#E44D4F">${failed}</font></td>
	</tr>
	<tr>
		<th>Card Number</th>
		<td><form:input path="creditCardNumber" maxlength="16" minlength="16" required="required"/></td>
	</tr>
	<tr>
		<th>Valid From</th>
		<td><form:input type="date" path="validFrom" required="required"/></td>
	</tr>
	<tr>
		<th>Valid To</th>
		<td><form:input type="date" path="validTo" required="required"/></td>
	</tr>	
	<tr>
		<td></td>
		<td><input type="submit" value="Pay"/></td>
	</tr>
</form:form>		

</table>
</div>
</center>
</body>
</html>