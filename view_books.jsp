<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Details</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f2f2f2;">
	<%@include file="all_component/navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(bid);
	%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="books/<%=b.getPhotoName()%>"
					style="height: 200px; width: 150px"><br>
				<h4 class="mt-2">
					Book Name: <span class="text-danger"><%=b.getBookName()%></span>
				</h4>
				<h4>
					Author Name: <span class="text-danger"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Category: <span class="text-danger"><%=b.getBookCategory()%></span>
				</h4>
				<h4>
					Available Stock: <span class="text-primary"><%=b.getQuantity()%></span>
				</h4>
				
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName()%></h2>

				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				<h5>Contact To Seller</h5>
				<h5>
					<i class="far fa-envelope"></i> Email:<span class="text-info">
						<%=b.getEmail()%></span>
				</h5>
				<%
				}
				%>

				<div class="row p-5">
					<div class="col-md-4 text-success text-center p-2">
						<i class="fas fa-money-bill-wave fa-3x"></i>
						<p>Payment</p>
					</div>
					<div class="col-md-4 text-primary text-center p-2">
						<i class="fas fa-undo-alt fa-3x"></i>
						<p>Return Product</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-truck-moving fa-3x"></i>
						<p>Free Shipping</p>
					</div>
				</div>

				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-warning"><i class="fas fa-cart-plus"></i>
						Continue Shopping</a> <a href="" class="btn btn-success"><i
						class="fas fa-rupee-sign"></i> <%=b.getPrice()%></a>
				</div>
				<%
				} else {
				%>
				<div class="text-center p-3">
					<a href="" class="btn btn-warning"><i class="fas fa-cart-plus"></i>
						Add To Cart</a> <a href="" class="btn btn-success"><i
						class="fas fa-rupee-sign"></i> <%=b.getPrice()%></a>
				</div>
				<%
				}
				%>


			</div>
		</div>
	</div>
</body>
</html>