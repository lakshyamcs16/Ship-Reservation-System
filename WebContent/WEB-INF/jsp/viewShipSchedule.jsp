<%@page import="com.wipro.srs.service.AdministratorImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>View Ship/Schedule</title>

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
select,input[type="week"]{
width:95%;
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
<%@page import="java.util.ArrayList,com.wipro.srs.bean.RouteBean" %>
</head>
<body>
<center>
<div class="shadow" align="center">
<h1><pre> View Ship/Schedule</pre></h1>

<%
AdministratorImpl administratorImpl = new AdministratorImpl();
ArrayList<RouteBean> arrayList = administratorImpl.viewByAllRoute();
RouteBean bean;
%>
<form method="POST" action="ViewShipScheduleDetails" >
   <table>
    <tr>
        <td>Source</td>
        <td><select name="source" id="source">
        	<option value='select'>Select</option>
        <% for(int i=0; i<arrayList.size(); i++){ 
        	bean = arrayList.get(i);
        %>
        	
        	<option value='<%= bean.getSource()%>'><%= bean.getSource() %></option>
        
        <% } %>
        	</select>
        </td>
    </tr>
	<tr>
        <td>Designation</td>
        <td><select name="dest" id="dest">
        	<option value='select'>Select</option>
        <% for(int i=0; i<arrayList.size(); i++){ 
        	bean = arrayList.get(i);
        %>
        	
        	<option value='<%= bean.getDestination()%>'><%= bean.getDestination() %></option>
        
        <% } %>
        	</select></td>
    </tr>
	<tr>
        <td>Date</td>
        <td><input type="week" name="date" id="date" min="2015-10-19" value="2015-W44" required/></td>
    </tr>
<tr><td></td><td><font color=#E44D4F>${error}</font></td></tr>
	<tr>	
        <td colspan="2">
            <input type="submit" value="View Schedule"/>
        </td>
    </tr>
</table>  
</form>
</div>
</center>
</body>
</html>