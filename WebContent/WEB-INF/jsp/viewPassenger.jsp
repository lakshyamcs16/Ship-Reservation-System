<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Schedule detail</title>
<%@page import="java.util.ArrayList,com.wipro.srs.bean.ScheduleBean,com.wipro.srs.service.AdministratorImpl,com.wipro.srs.bean.ShipBean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<center>
<div class="shadow" align="center">
<h1><pre> View Passenger Details</pre></h1>
<%
AdministratorImpl administratorImpl = new AdministratorImpl();
ArrayList<ScheduleBean> list = administratorImpl.viewByAllSchedule();
ScheduleBean scheduleBean;
%>
<form:form method="POST" action="viewPassengerDetails" >
   <table>
   

    <tr>
        <td><form:label path="scheduleID">Schedule ID</form:label></td>
        <td><form:select path="ScheduleID" id="ScheduleID">
        	<form:option value="select">Schedule ID</form:option>
         <% for(int i=0; i<list.size(); i++){ 
        	 scheduleBean = list.get(i);
        %>
        	
        	<form:option value='<%= scheduleBean.getScheduleID()%>'><%= scheduleBean.getScheduleID() %></form:option>
        
        <% } %>
        	</form:select></td>
    </tr>
    <tr><td colspan=2><font color="#F4A5A5">${scheduleresult}</font></td></tr>
	<tr>	
        <td colspan="2">
            <input type="submit" value="View Passenger Details"/>
        </td>
    </tr>
</table>  
</form:form>
</div>
</center>
</body>
</html>