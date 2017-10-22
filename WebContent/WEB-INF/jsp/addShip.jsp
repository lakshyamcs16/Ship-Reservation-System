<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
    <title>Add Ship</title>
  <script>

  function validate(){
  	flag=0;
   var shipName= document.getElementById("shipName").value;
   if(shipName.length==0)
   {
  	 
  	 document.getElementById("error1").innerHTML = "Please enter ship name";
  	 return false;
   }
   else if(shipName.length>0)
  	{
  		document.getElementById("error1").innerHTML="";
  	}
  	 
   var regEx = /^\d+$/;

   var seatingCapacity = document.getElementById("seatingCapacity").value;
   if(seatingCapacity.length==0)
   {
  	 document.getElementById("error2").innerHTML = "Please enter seating capacity";
  	return false;
  }
   else
  	{
  	 if(isNaN(seatingCapacity)){
  	 	 document.getElementById("error2").innerHTML = "Please enter only digits";
  	 	   document.getElementById("seatingCapacity").focus();
  	 	   return false;
  	 	 }

  	  if(seatingCapacity<1){
  	 	 document.getElementById("error2").innerHTML = "Cannot be zero or negative";
  	 	   document.getElementById("seatingCapacity").focus();
  	 	   return false;
  	 	 }


  	 	    
  	  if(seatingCapacity.match(regEx)) {
  	 		flag = 1;
  	 		document.getElementById("error2").innerHTML="";
  	 	}else{
  	 		 document.getElementById("error2").innerHTML = "Don't enter any special character ";
  	 		document.getElementById("seatingCapacity").focus();
  	 		flag = 0;
  	 		return false;
  	 	}
  		
  	}






   var reservationCapacity = document.getElementById("reservationCapacity").value;
   if(reservationCapacity.length==0)
   {
  	 document.getElementById("error3").innerHTML = "Please enter reservation capacity";
  	return false;
  }
   else
  	{
  	 if(isNaN(reservationCapacity)){
  		 document.getElementById("error3").innerHTML = "Please enter only digits";
  		   document.getElementById("reservationCapacity").focus();
  		   return false;
  		 }
  	 if(reservationCapacity<1){
  		 document.getElementById("error3").innerHTML = "Cannot be zero or negative";
  		   document.getElementById("reservationCapacity").focus();
  		   return false;
  		 }

  	 if(reservationCapacity.match(regEx)) {
  			flag = 1;
  			document.getElementById("error3").innerHTML="";
  		}else{
  			 document.getElementById("error3").innerHTML = "Don't enter any special character";
  			document.getElementById("reservationCapacity").focus();
  			flag = 0;
  			return false;
  		}
  		
  	}





   
   if(parseInt(seatingCapacity)<parseInt(reservationCapacity))
   {
  	 document.getElementById("error3").innerHTML = "Reservation capacity should be less <br/> than seating capacity";
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
h1{
letter-spacing: 2px;
}	
</style>



</head>
<body>
<center>
<div class="shadow" align="center">
<h1><pre> Add Ship</pre></h1>
<form:form method="POST" action="addShipDetails">
   <table align="center">
    
   
       <form:label path="shipID"></form:label>
       <form:hidden path="shipID" />
	<tr>
		<td></td>
		<td><font color="white">${failed}</font></td>
	</tr>	
    <tr>
        <td><form:label path="shipName">Ship Name</form:label></td>
        <td><form:input path="shipName" placeholder="Ship Name" id="shipName" required="required" maxlength="15"/></td>
    </tr>
    <tr><td></td><td><font color=#E44D4F><div id="error1">${error}</div></font></td></tr>
    
	<tr>
        <td><form:label path="seatingCapacity">Seating Capacity</form:label></td>
        <td><form:input path="seatingCapacity" placeholder="Seating Capacity" id="seatingCapacity" maxlength="4" required="required"/></td>
    </tr>
    <tr><td></td><td><font color=#E44D4F><div id="error2">${error}</div></font></td></tr>
	<tr>
        <td><form:label path="reservationCapacity">Reservation Capacity</form:label></td>
        <td><form:input path="reservationCapacity"  placeholder="Reservation Capacity" id="reservationCapacity" maxlength="4" required="required"/></td>
    </tr>
	<tr><td></td><td><font color=#E44D4F><div id="error3">${error}</div></font></td></tr>
	
	<tr>	
        <td></td>
        <td>
            <input type="submit" value="ADD SHIP" onclick="return validate()"/>
        </td>
    </tr>
</table>  
</form:form>
</div>
</center>
</body>
</html>