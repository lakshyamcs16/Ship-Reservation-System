<%@page import="com.wipro.srs.service.CustomerServiceImpl"%>
<%@page import="com.wipro.srs.bean.ProfileBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
@font-face {
	font-family: 'Lato';
	src: url('/resources/theme1/assets/fonts/FontAwesome.otf');
}
h2{
padding-top: 70px;
font-size: 80px;
color: white;
font-family: 'Lato', sans-serif;
}
</style>
</head>
<body>
<%
if(session!=null){
String userid = (String)session.getAttribute("userid");
ProfileBean profileBean = new ProfileBean();
CustomerServiceImpl customerServiceImpl = new CustomerServiceImpl();
if((profileBean = customerServiceImpl.findProfileByUserID(userid))!=null){
	

%>
<center><h2>Welcome, <b><%=profileBean.getFirstName() %></b></h2></center>

<% }else{

%><center><h2>Welcome, <b><%=userid %></b></h2></center>
	
	
<% }
}else{

	response.sendRedirect("/SRS/login");
}
%>
</body>
</html>