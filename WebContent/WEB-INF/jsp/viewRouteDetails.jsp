<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.wipro.srs.bean.ScheduleBean"%>
<%@page import="com.wipro.srs.bean.RouteBean"%><html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/table.css"/>" />
		
		<!--[if IE]>
  		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<script>
var req;

function deleteRoute(routeid){
	req = new XMLHttpRequest();
	var submit = "delete";
	var url = "RouteServlet?routeid="+routeid+"&submit="+submit;
	
	req.onreadystatechange = getResponse;
	req.open("GET",url,true);
	req.send(null);
	
}
var id;
function modifyRoute(routeid){
	req = new XMLHttpRequest();
	var submit = "modify";
	var url = "RouteServlet?routeid="+routeid+"&submit="+submit;

	id = routeid
	req.onreadystatechange = getResponseModify;
	req.open("GET",url,true);
	req.send(null);
	
}

var fareVal;
var fareId;
var dur;
var durId;

function modifyRoutedetails(routeid){
	req = new XMLHttpRequest();
	var submit = "modifydetails";
	var source = document.getElementById(routeid+"SOURCE").value;
	var dest = document.getElementById(routeid+"DEST").value;
	var duration = document.getElementById(routeid+"DURATION").value;
	fareVal = document.getElementById(routeid+"FARE").value;
	fareId = document.getElementById(routeid+"FARE");
	dur = duration;
	durId = document.getElementById(routeid+"DURATION");
	var bool = val();
	 if(bool==false){
		 return false;
	 }else{
	var url = "RouteServlet?routeid="+routeid+"&submit="+submit+"&source="+source+"&dest="+dest+"&duration="+duration+"&fare="+fareVal;

	req.onreadystatechange = getResponseModifyDetails;
	req.open("GET",url,true);
	req.send(null);
	return true;
	 }
	
	
}

function getResponse(){
	
				
				if (req.readyState==4){

					if(req.responseText=="0"){
					
						document.getElementById("result").innerHTML = req.responseText;
						
						
					}else{
						location.reload();
					}
				}
		
}

function getResponseModify(){
	
	if (req.readyState==4){
		
			document.getElementById(id).innerHTML = req.responseText;
	}

}

function getResponseModifyDetails(){
	
	if (req.readyState==4){
			location.reload();
	}

}

function val(){


var fare = fareVal;
if(fare.length==0)
{
	alert("Please enter fare");
	return false;
}
			
if(isNaN(fare)){
	alert("Enter only numeric values");
	fareId.focus();
	   return false;
	 }


if(fare<=0){
	alert("Cannot be negative or zero");
	fareId.focus();
	   return false;
	 }

var travelDuration = dur;
var days = dur.split(" ")[0];
if(travelDuration.length==0)
{
	 alert("Please enter travel duration");
	 durId.focus();
	return false;
}
var regexTravel = /^\d{1,3} DAYS$/ ;
if(!regexTravel.test(travelDuration)){
	alert("Incorrect format(XXX DAYS)");
	 durId.focus();
	   return false;
	 }

if(days==0){
	 
	alert("Travel duration cannot be 0");
	durId.focus();
	return false;
}


return true;
}
</script>
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
<%@page import="java.util.ArrayList,com.wipro.srs.bean.RouteBean" %>
<%@page import="com.wipro.srs.service.AdministratorImpl" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>view details</title>
</head>
<body>

<%
session = request.getSession();
String isRemove = (String)session.getAttribute("remove");
if(isRemove!=null){
	if(isRemove.equals("SUCCESS")){
	AdministratorImpl administratorImpl = new AdministratorImpl();
	session.setAttribute("routeList",administratorImpl.viewByAllRoute());
	}
}

ArrayList<RouteBean> list = (ArrayList<RouteBean>)session.getAttribute("routeList");

%>

<%
	if(list!=null){ 
%>
<center>
<div class="shadow" align="center">

<h1>ROUTE DETAILS</h1>
<div style="overflow:auto;">
<table style="margin: 0px; width: 100%;">
	<tr>
		<th>Route ID</th>
		<th>Source</th>
		<th>Destination</th>
		<th>Travel Duration</th>
		<th>Fare</th>
		<th>Modify</th>
		<th>Delete</th>
		
	</tr>


<% 
	for(int i=0; i<list.size(); i++){
		RouteBean routeBean = list.get(i); 
		out.print("<tr><td>"+routeBean.getRouteID()+"</td><td>"+routeBean.getSource()+"</td><td>"+routeBean.getDestination()+"</td><td>"+routeBean.getTravelDuration()+"</td><td>$ "+routeBean.getFare()+"</td>"); %>
		<td style="background-color:rgba(0,0,0,0.1);"><a href='#' onclick='modifyRoute(this.title)' title='<%=routeBean.getRouteID() %>'">Modify</a></td>
		<td style="background-color:rgba(0,0,0,0.2);"><a href='#' onclick='deleteRoute(this.title)' title='<%=routeBean.getRouteID() %>'>Delete</a></td></tr>
		<tr id='<%=routeBean.getRouteID()%>'></tr>
<%
	}
	} 


	
%>
</table>
</div>
</div>
<div id="result">${ success }</div>
</center>
</body>
</html>