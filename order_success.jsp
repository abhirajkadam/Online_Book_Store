<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aumak Book Store : Order Successful</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f2f2f2;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container text-center mt-5">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank You</h1>
		<h2>Your Order Is Successfully Registered</h2>
		<h5>Within 2 Days Your Books Will Be Delivered</h5>
		<a href="index.jsp" class="btn btn-primary mt-3">Home</a> <a
			href="order.jsp" class="btn btn-danger mt-3">View Order</a>
	</div>

</body>
</html>