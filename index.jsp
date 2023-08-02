<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aumak Book Store</title>
<%@include file="all_component/allcss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/background.jpg");
	height: 60vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #bfbfbf;
}
</style>

</head>
<body style="background-color: #f2f2f2;">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h1 class="text-center text-primary p-5">Welcome Reader</h1>

	</div>



	<!-- Start Recent Book -->


	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img src="books/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>

							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-primary btn-sm ml-5">Details</a> <a href=""
								class="btn btn-success btn-sm ml-5"><i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%> </a>
						</div>
						<%
						} else {
						%>
						Categories:<%=b.getBookCategory()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-warning btn-sm ml-2">Add
								To Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-warning btn-sm ml-2">Add To Cart</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-primary btn-sm ml-1">Details</a> <a href=""
								class="btn btn-success btn-sm ml-1"><i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%> </a>
						</div>
						<%
						}
						%>


					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-3">
			<a href="all_recent_book.jsp"
				class="btn btn-danger btn-sm text-white">View More</a>
		</div>
	</div>

	<!-- End Recent Book -->
	<hr>

	<!-- Start New Book -->


	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">


			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-warning btn-sm ml-2">Add
								To Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-warning btn-sm ml-2">Add To Cart</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-primary btn-sm ml-1">Details</a> <a href=""
								class="btn btn-success btn-sm ml-1"><i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%> </a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>






		</div>
		<div class="text-center mt-3">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View
				More</a>
		</div>
	</div>

	<!-- End New Book -->
	<hr>

	<!-- Start Old Book -->


	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">


			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBooks();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-primary btn-sm ml-5">Details</a> <a href=""
								class="btn btn-success btn-sm ml-5"><i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%> </i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>




		</div>
		<div class="text-center mt-3">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View
				More</a>
		</div>
	</div>

	<!-- End Old Book -->
	<%@include file="all_component/footer.jsp"%>
</body>
</html>