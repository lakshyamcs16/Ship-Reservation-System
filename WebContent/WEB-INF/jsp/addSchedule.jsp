<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Ship Schedule</title>
<script>
var req;
var flag = 0;
function checkshipid(){
	req = new XMLHttpRequest();
	shipid = document.getElementById("shipid").value;
	var submit = "shipid";
	flag = 1;
	var url = "CheckServlet?shipid="+shipid+"&submit="+submit;
	req.onreadystatechange = getResponse;
	req.open("POST",url,true);
	req.send(null);
	
}



function checkrouteid(){
	req = new XMLHttpRequest();
	var submit = "routeid";
	flag = 2;
	routeid = document.getElementById("routeid").value;
	var url = "CheckServlet?routeid="+routeid+"&submit="+submit;
	req.onreadystatechange = getResponse;
	req.open("POST",url,true);
	req.send(null);
	
}

function getResponse(){
	
	
	if (req.readyState==4){
		if(flag == 1)
			document.getElementById("shipresult").innerHTML = req.responseText;
		else if(flag==2)
			document.getElementById("routeresult").innerHTML = req.responseText;
	}
}

function validate(){
var date = document.getElementById("date").value;
if(date.length==0)
{
	 
	 document.getElementById("error1").innerHTML = "Please enter start date";
	 return false;
}
else
	{
	 	//dd-mm-yyyy
	 	
	 	
	 	 var months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
	 	 var monthString = date.split("-")[1];	
	 	 var monthfield;
	 	var dayfield=date.split("-")[0];
		 var yearfield=date.split("-")[2];
		
		 var flag=0;
		 var i;
	 	 for(i=0; i<months.length;i++){
	 		 if(months[i].toUpperCase()===monthString.toUpperCase()){
	 			monthfield = parseInt(i);
	 		 }
	 	 }
	 	
	 	 date = dayfield+"-"+monthfield+"-"+yearfield;
	 	
	 	 var validformat=/^\d{2}-\d{1,2}-\d{4}$/ ;
		 var returnval=false;
		 
		 if (!validformat.test(date)){
			 document.getElementById("error1").innerHTML="Invalid format (dd-mmm-yyyy)";
		 	return false;
		 }
		 else{ 
			 
		 
		 
		 var dayobj = new Date(yearfield, monthfield-1, dayfield);
		 
		 
		 
		 if ((dayobj.getMonth()+1!=monthfield)||(dayobj.getDate()!=dayfield)||(dayobj.getFullYear()!=yearfield)){
		 document.getElementById("error1").innerHTML="Invalid date";
		 return false;
		 }
		 else
			 returnval=true;
		 }
		 
		 if (returnval==false){
			 document.getElementById("date").focus();
		 }
		 
		 return returnval;
		 }


		document.getElementById("error1").innerHTML="";
	}
	

</script>


<%@page import="java.util.ArrayList,com.wipro.srs.bean.RouteBean,com.wipro.srs.service.AdministratorImpl,com.wipro.srs.bean.ShipBean" %>

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
<h1><pre> Add Ship Schedule</pre></h1>
<%
AdministratorImpl administratorImpl = new AdministratorImpl();
ArrayList<RouteBean> arrayList = administratorImpl.viewByAllRoute();
ArrayList<ShipBean> list = administratorImpl.viewByAllShips();
RouteBean bean;
ShipBean shipBean;
%>
<form:form method="POST" action="addScheduleDetails"  >
   <table>
   <form:label path="scheduleID"></form:label>
   <form:hidden path="scheduleID" />

    <tr>
        <td><form:label path="shipID">Ship ID</form:label></td>
		<td><form:select path="shipID" id="shipID" onblur="checkshipid()" required="required">
        	
         <% for(int i=0; i<list.size(); i++){ 
        	shipBean = list.get(i);
        %>
        	
        	<form:option value='<%= shipBean.getShipID()%>'><%= shipBean.getShipID() %></form:option>
        
        <% } %>
        	</form:select></td>
    </tr>
	<tr>
	<td></td>
		<td><div id="shipresult"></div></td>
	</tr>
	<tr>
        <td><form:label path="routeID">Route ID</form:label></td>

        <td><form:select path="routeID" id="routeID" onblur="checkrouteid()" required="required">
        	
         <% for(int i=0; i<arrayList.size(); i++){ 
        	bean = arrayList.get(i);
        %>
        	
        	<form:option value='<%= bean.getRouteID()%>'><%=bean.getRouteID() %></form:option>
        
        <% } %>
        	</form:select></td>
    </tr>
	<tr><td></td>
		<td><div id="routeresult"></div></td>
	</tr>
	<tr>
        <td><form:label path="startDate">Start Date</form:label></td>
        <td><form:input path="startDate" placeholder="dd-mmm-yyyy" id="date" required="required"/></td>
    </tr>
	<tr><td></td><td><font color=#E44D4F><div id="error1"></div></font></td></tr>
	<tr>	
        <td></td><td>
            <input type="submit" value="ADD SCHEDULE" onclick="return validate()"/>
        </td>
    </tr>
</table>  
</form:form>
</div>
</center>
</body>
</html>