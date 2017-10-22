<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/table.css"/>" />
		
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ticket Cancellation</title>
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
input{
text-align:center;
}
</style>
</head>
<body>
<center>
	<div class="shadow" align="center">
		<h1>
			<font color="#61C459" size="14">${success}</font>
			<font color="#E44D4F">${failed}</font>
		</h1>
	</div>
</center>
</body>
</html>