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
<script>
var req;

function deleteShip(shipid){
	req = new XMLHttpRequest();
	var submit = "delete";
	var url = "ShipServlet?shipid="+shipid+"&submit="+submit;
	
	req.onreadystatechange = getResponse;
	req.open("GET",url,true);
	req.send(null);
	
}
var id;
function modifyShip(shipid){
	req = new XMLHttpRequest();
	var submit = "modify";
	var url = "ShipServlet?shipid="+shipid+"&submit="+submit;

	id = shipid
	req.onreadystatechange = getResponseModify;
	req.open("GET",url,true);
	req.send(null);
	
}

var shipname;
var capacity;
var reservation;

var cap;
var res;

function modifydetails(shipid){
	req = new XMLHttpRequest();
	var submit = "modifydetails";
	 shipname = document.getElementById(shipid+"NAME").value;
	 capacity = document.getElementById(shipid+"CAPACITY").value;
	 reservation = document.getElementById(shipid+"RESERVATION").value;
	 
	 cap = document.getElementById(shipid+"CAPACITY");
	 res = document.getElementById(shipid+"RESERVATION");
	 var bool = val();
	 if(bool==false){
		 return false;
	 }else{
			 var url = "ShipServlet?shipid="+shipid+"&submit="+submit+"&name="+shipname+"&capacity="+capacity+"&reservation="+reservation;
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
	var regEx = /^\d+$/;

	   var seatingCapacity = capacity;
	   if(seatingCapacity.length==0)
	   {
	  	 alert("Please enter seating capacity");
	  	 return false;
	  }
	   else
	  	{
	  	 if(isNaN(seatingCapacity)){
	  	 	 alert("Please enter only digits");
	  	 	   cap.focus();
	  	 	 return false;

	  	 	 }

	  	  if(seatingCapacity<1){
	  		alert("Cannot be zero or negative");
	  	 	   cap.focus();
	  	 	 return false;
	  	 	  	 }


	  	 	    
	  	  if(seatingCapacity.match(regEx)) {
	  	 		flag = 1;
	  	 		
	  	 	}else{
	  	 		alert("Don't enter any special character ");
	  	 		cap.focus();
	  	 	 return false;
	  	 		flag = 0;
	  	 		
	  	 	}
	  		
	  	}






	   var reservationCapacity = reservation;
	   if(reservationCapacity.length==0)
	   {
	  	alert("Please enter reservation capacity");
	  	 return false;
	  }
	   else
	  	{
	  	 if(isNaN(reservationCapacity)){
	  		alert("Please enter only digits");
	  		   res.focus();
	  		 return false;
	  		 }
	  	 if(reservationCapacity<1){
	  		alert("Cannot be zero or negative");
	  		   res.focus();
	  		 return false;
	  		 }

	  	 if(reservationCapacity.match(regEx)) {
	  			flag = 1;
	  			
	  		}else{
	  			alert("Don't enter any special character");
	  			res.focus();
	  			flag = 0;
	  			 return false;
	  		}
	  		
	  	}





	   
	   if(parseInt(seatingCapacity)<parseInt(reservationCapacity))
	   {
	  	 alert("Reservation capacity should be less \n than seating capacity");
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
<%@page import="java.util.ArrayList,com.wipro.srs.bean.ShipBean" %>
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
	session.setAttribute("list",administratorImpl.viewByAllShips());
	}
}

ArrayList<ShipBean> list = (ArrayList<ShipBean>)session.getAttribute("list");

%>

<%
	if(list!=null){ 
%>
<center>
<div class="shadow" align="center">

<h1>SHIP DETAILS</h1>
<table style="margin: 0px; width: 100%;">

	<tr>
		<th>Ship ID</th>
		<th>Ship Name</th>
		<th>Seating Capacity</th>
		<th>Reservation Capacity</th>
		<th>Modify</th>
		<th>Delete</th>
	</tr>

<% 
	for(int i=0; i<list.size(); i++){
		ShipBean shipBean = list.get(i); 
		out.print("<tr><td>"+shipBean.getShipID()+"</td><td>"+shipBean.getShipName()+"</td><td>"+shipBean.getSeatingCapacity()+"</td><td>"+shipBean.getReservationCapacity()+"</td>"); %>
		<td style="background-color:rgba(0,0,0,0.1);"><a href='#' onclick='modifyShip(this.title)' title='<%=shipBean.getShipID() %>'>Modify</a></td>
		<td style="background-color:rgba(0,0,0,0.2);"><a href='#' onclick='deleteShip(this.title)' title='<%=shipBean.getShipID() %>'>Delete</a></td></tr>
		<tr id='<%=shipBean.getShipID()%>'></tr>
<%
	}
	} 


	
%>
</table>
</div>
<div id="result">${ success }</div>
</center>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
		<script src="<c:url value="/resources/js/jquery.stickyheader.js"/>" ></script>
</body>
</html>