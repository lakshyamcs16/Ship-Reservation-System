<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reserve Ticket</title>
<%@page import="java.util.ArrayList,com.wipro.srs.bean.RouteBean,com.wipro.srs.service.AdministratorImpl" %>

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
select,input[type="date"],input[type="number"]{
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
</head>
<body>
<%
AdministratorImpl administratorImpl = new AdministratorImpl();
ArrayList<RouteBean> arrayList = administratorImpl.viewByAllRoute();
RouteBean bean;
%>
<center>
<div class="shadow" align="center">
<h1><pre> RESERVATION</pre></h1>
<form method="POST" action="reserveTicket" >
	<input type="hidden" name="userID" id="userID" />
   <table>
   		

    <tr>
        <td>Source</td>
        <td><select name="source" id="source">
        	<option value="select">Select</option>
         <% for(int i=0; i<arrayList.size(); i++){ 
        	bean = arrayList.get(i);
        %>
        	
        	<option value='<%= bean.getSource()%>'><%= bean.getSource() %></option>
        
        <% } %>
        	</select></td>
    </tr>
	<tr>
        <td>Designation</td>
        <td><select name="destination" id="destination">
        	<option value="select">Select</option>
         <% for(int i=0; i<arrayList.size(); i++){ 
        	bean = arrayList.get(i);
        %>
        	
        	<option value='<%= bean.getDestination()%>'><%= bean.getDestination() %></option>
        
        <% } %>
        	</select></td>
    </tr>
	<tr>
        <td>Journey Date</td>
        <td><input type="date" name="date" id="date" value="2015-10-27" required/></td>
    </tr>
	<tr>
        <td>Seats</td>
        <td><input type="number" name="seats" id="seats" min="1" value="1" required/></td>
    </tr>
	<tr>	
        <td colspan="2">
            <input type="submit" value="Proceed"/>
        </td>
    </tr>
</table>  
</form>
</div>
</center>
</body>
</html>