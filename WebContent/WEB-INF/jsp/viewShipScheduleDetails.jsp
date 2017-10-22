<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.wipro.srs.bean.ScheduleBean"%><html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/table.css"/>" />
		
		<!--[if IE]>
  		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<script>
var req;

function deleteSchedule(scheduleid){
	req = new XMLHttpRequest();
	var submit = "delete";
	var url = "ScheduleServlet?scheduleid="+scheduleid+"&submit="+submit;
	req.onreadystatechange = getResponse;
	req.open("GET",url,true);
	req.send(null);
	
}
var id;
function modifySchedule(scheduleid){
	req = new XMLHttpRequest();
	var submit = "modify";
	var url = "ScheduleServlet?scheduleid="+scheduleid+"&submit="+submit;
	id = scheduleid;
	req.onreadystatechange = getResponseModify;
	req.open("GET",url,true);
	req.send(null);
	
}

function modifydetails(scheduleid){
	req = new XMLHttpRequest();
	var submit = "modifydetails";
	var shipid = document.getElementById(scheduleid+"SHIP").value;
	var routeid = document.getElementById(scheduleid+"ROUTE").value;
	var date = document.getElementById(scheduleid+"DATE").value;
	var url = "ScheduleServlet?scheduleid="+scheduleid+"&submit="+submit+"&shipid="+shipid+"&routeid="+routeid+"&date="+date;
	req.onreadystatechange = getResponseModifyDetails;
	req.open("GET",url,true);
	req.send(null);
	
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
<%@page import="java.util.ArrayList,com.wipro.srs.bean.ScheduleBean" %>
<%@page import="com.wipro.srs.service.AdministratorImpl" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>view details</title>
</head>
<body>
<%
session = request.getSession();
String isRemove = (String)session.getAttribute("remove");
System.out.println("HELLO");
if(isRemove!=null){
	if(isRemove.equals("SUCCESS")){
	AdministratorImpl administratorImpl = new AdministratorImpl();
	session.setAttribute("scheduleList",administratorImpl.viewByAllSchedule());
	}
}

ArrayList<ScheduleBean> list = (ArrayList<ScheduleBean>)session.getAttribute("scheduleList");

%>

<%
	if(list!=null){ 
%>
<center>
<div class="shadow" align="center">

<h1>SCHEUDLE DETAILS</h1>
<div class="sticky-wrap">
<table class="sticky-wrap" style="margin: 0px; width: 100%;">
	<tr>
		<th>Schedule ID</th>
		<th>Ship ID</th>
		<th>Route ID</th>
		<th>Start Date</th>
		<th>Modify</th>
		<th>Delete</th>
	</tr>


<% 
	for(int i=0; i<list.size(); i++){
		ScheduleBean scheduleBean = list.get(i); 
		out.print("<tr><td>"+scheduleBean.getScheduleID()+"</td><td>"+scheduleBean.getShipID()+"</td><td>"+scheduleBean.getRouteID()+"</td><td>"+scheduleBean.getStartDate()+"</td>"); %>
		<td style="background-color:rgba(0,0,0,0.1);"><a href='#' onclick='modifySchedule(this.title)' title='<%=scheduleBean.getScheduleID() %>'>Modify</a></td>
		<td style="background-color:rgba(0,0,0,0.2);"><a href='#' onclick='deleteSchedule(this.title)' title='<%=scheduleBean.getScheduleID() %>'>Delete</a></td></tr>
		<tr id='<%=scheduleBean.getScheduleID()%>'></tr>
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