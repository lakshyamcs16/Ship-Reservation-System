<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Change Password</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/mycss.css"/>" />
	<script>

	function noBack(){
	
		 document.body.style.background = "#81666C";
		document.body.style.marginTop = "100px"; 
		
	}

	function validate(){
		flag=0;
	 var opass = document.getElementById("opass").value;
	 if(opass.length==0)
	 {
		 
		 document.getElementById("error1").innerHTML = "Enter your old password";
		 return false;
	 }
	 else
		{
			document.getElementById("error1").innerHTML="";
		}
		 


	 var npass = document.getElementById("npass").value;
	 if(npass.length==0)
	 {
		 document.getElementById("error2").innerHTML = "Enter new password";
		return false;
	}
	 else
		{
			document.getElementById("error2").innerHTML="";
		}
	 var cpass = document.getElementById("cpass").value;
	 if(cpass.length==0)
	 {
		 document.getElementById("error3").innerHTML = "Confirm your password";
		return false;
	}
	 else
		{
			document.getElementById("error3").innerHTML="";
		}
	 if(npass!=cpass)
	 {
		 document.getElementById("error3").innerHTML = "New and confirm password didn't match";
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
<%
String first = "";
if((first=(String)session.getAttribute("firstLogin"))!=null){
%>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();">
<%	
}else{

%>
<body>

<% } %>
<center>
<div class="shadow" align="center">

<h1><pre> Change Password</pre></h1>
<form action="changePasswordDetails" method="post"  >
<table>
	<tr><td><font color="#E44D4F">${failed}</font><font color="#24AB85">${changed}</font></td></tr>
	<tr>
		
		<td><input type="password" placeholder="Old Password" id="opass" name="opass" required/></td>
	</tr>
	<tr><td><font color=#E44D4F><div id="error1">${error}</div></font></td></tr>
	<tr>
		<td><input  type="password" placeholder="New Password" id="npass" name="npass" maxlength="20" minlength="6" required/></td>
	</tr>
	<tr><td><font color=#E44D4F><div id="error2">${error}</div></font></td></tr>
	<tr>
		
		<td><input   type="password" placeholder="Confirm Password" id="cpass" name="cpass" maxlength="20" minlength="6" required/></td>
	</tr>
	<tr><td><font color=#E44D4F><div id="error3">${error}</div></font></td></tr>
	<tr>
		
		<td><pre>   <input  type="submit" value="Change Password" style="width:2em;" onclick="return validate()"/></pre></td>
	</tr>
</table>
</form>

</div>
</center>
</body>

</html>