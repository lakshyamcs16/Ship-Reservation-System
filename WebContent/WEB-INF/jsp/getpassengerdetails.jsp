<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
select,input[type="number"]{
width:100%;
background-color:rgba(0,0,0,0);
height: 52px;
text-align: center;
color:grey;
    -webkit-appearance: none;
}
h1{
letter-spacing: 2px;
}	
</style>
<title>Enter Passenger details</title>
</head>
<body>
<center>
<div class="shadow" align="center">
<h1><pre> PASSENGER DETAILS</pre></h1>
<form:form method="POST" action="proceedtopayment" modelAttribute="info">
<table>
<thead>
	<tr>
		<th>Name</th>
		<th>Age</th>
		<th>Gender</th>
	</tr>	
	</thead>
<%
	Integer seats = (Integer)session.getAttribute("seats");
	for(Integer i=0; i<seats; i++){
%>
<tbody>
<tr>
	<td><form:input type="text" placeholder="Name" path="name" required="required" maxlength="20"/></td>
	<td><form:input type="number" placeholder="Age" path="age" min="1" max="99" required="required"/></td>
	<td><form:select placeholder="Gender" path="gender" required="required">
		<form:option value="Female">Female</form:option>
		<form:option value="Male">Male</form:option>
		<form:option value="Others">Others</form:option>
		</form:select></td>
	</tr>
<%		
	}
%>
<tr>
	<td colspan="3"><input type="submit" value="Reserve Tickets"/></td>
</tr>
</tbody>
</table>
</form:form>
</div>
</center>
</body>
</html>