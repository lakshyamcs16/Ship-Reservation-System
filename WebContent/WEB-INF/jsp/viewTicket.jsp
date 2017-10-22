<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>View Ticket</title>
<script>
function validate(){
 var res = document.getElementById("res").value;
 if(res.length==0)
 {
	 document.getElementById("error").innerHTML = "Please enter reservation id.";
	 return false;
}
 return true;
}
</script>

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
<h1><pre> VIEW TICKET</pre></h1>

<form:form method="POST" action="viewTicketDetails"  >
   <table>
    
    <tr>
        <td><form:label path="reservationID">Reservation ID</form:label></td>
        <td><form:input path="reservationID" id="res" onblur="return validate()"/></td>
		
    </tr>
	
   <tr><td></td><td><font color=#E44D4F><div id="error">${error}</div></font></td></tr>
	<tr><td></td>	
        <td colspan="2">
            <input type="submit" value="View"/>
        </td>
    </tr>
</table>  
</form:form>
</div>
</center>
</body>
</html>