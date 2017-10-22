<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<script>
    function validate(){
    	flag=0;
    	var regEx = /[A-Za-z]+/;
    	
    	var regexTravel = /^\d{1,3} DAYS$/ ;
    	
     var source= document.getElementById("source").value;
     if(source.length==0)
     {
    	 
    	 document.getElementById("error1").innerHTML = "Please enter source";
    	 return false;
     }
     else
    	{
    		document.getElementById("error1").innerHTML="";
    	}
     if(source.match(regEx)) {
    		flag = 1;
    	}else{
    		 document.getElementById("error1").innerHTML = "Invalid Source";
    		document.getElementById("source").focus();
    		flag = 0;
    		return false;
    	}


    		 


     var destination = document.getElementById("destination").value;
     if(destination.length==0)
     {
    	 document.getElementById("error2").innerHTML = "Please enter destination";
    	return false;
    }
     else
    	{
    		document.getElementById("error2").innerHTML="";
    	}

     if(destination.match(regEx)) {
    		flag = 1;
    	}else{
    		 document.getElementById("error2").innerHTML = "Invalid destination";
    		document.getElementById("destination").focus();
    		flag = 0;
    		return false;
    	}

     if(source==destination)
     {
    	 document.getElementById("error2").innerHTML = "Source and destination cannot be same ";
    		return false;
     }
    	
    	

     var travelDuration = document.getElementById("travelDuration").value;
     var days = travelDuration.split(" ")[0];
     if(travelDuration.length==0)
     {
    	 document.getElementById("error3").innerHTML = "Please enter travel duration";
    	return false;
    }
     else
    	{
    		document.getElementById("error3").innerHTML="";
    	}
     
     

     if(!regexTravel.test(travelDuration)){
    	 document.getElementById("error3").innerHTML = "Incorrect format(XXX DAYS)";
    	   document.getElementById("travelDuration").focus();
    	   return false;
    	 }

	if(days==0){
    	 
		document.getElementById("error3").innerHTML = "Travel duration cannot be 0";
    	return false;
     }
     
     var fare = document.getElementById("fare").value;
     if(fare.length==0)
     {
    	 document.getElementById("error4").innerHTML = "Please enter fare";
    	return false;
    }
     else
    	{
    		document.getElementById("error4").innerHTML="";
    	}			
     if(isNaN(fare)){
    	 document.getElementById("error4").innerHTML = "Enter only numeric values";
    	   document.getElementById("fare").focus();
    	   return false;
    	 }


     if(fare<=0){
    	 document.getElementById("error4").innerHTML = "Cannot be zero/negative";
    	   document.getElementById("fare").focus();
    	   return false;
    	 }
     
     
     return true;
    }



    </script> 
    <title>Ship Route</title>
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
<h1><pre> Add Ship Route</pre></h1>


<form:form method="POST" action="addRouteDetails" >
   <table>
   <form:label path="routeID"></form:label>
   <form:hidden path="routeID" />

    <tr>
      
        <td><form:input path="source" placeholder="Source" id="source" required="required" maxlength="20"/></td>
    </tr>
    <tr><td><font color=#E44D4F><div id="error1">${error}</div></font></td></tr>
	<tr>
      
        <td><form:input path="destination" placeholder="Destination" id="destination" required="required" maxlength="20"/></td>
    </tr>
    <tr><td><font color=#E44D4F><div id="error2">${error}</div></font></td></tr>
	<tr>
        
        <td><form:input path="travelDuration" placeholder="XXX DAYS" id="travelDuration" required="required" maxlength="10"/></td>
    </tr>
    <tr><td><font color=#E44D4F><div id="error3">${error}</div></font></td></tr>
	<tr>
        
        <td><form:input path="fare" placeholder="Fare" id="fare" required="required" maxlength="8"/></td>
    </tr>
    	<tr><td><font color=#E44D4F><div id="error4">${error}</div></font></td></tr>	
	<tr>	
           <td align="center"><input type="submit" value="ADD ROUTE" onclick="return validate()"/>
        </td>
    </tr>
</table>  
</form:form>
</div>
</center>
 
</body>
</html>