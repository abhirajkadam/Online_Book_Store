<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Old Books</title>
<%@include file="all_component/allcss.jsp"%>

<style type="text/css">

.crd-ho:hover {
	background-color: #bfbfbf;
}
</style>

</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row p-3">
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getAllOldBook();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary btn-sm ml-5">Details</a> <a
								href="" class="btn btn-success btn-sm ml-5"><i class="fas fa-rupee-sign"></i> <%=b.getPrice()%>
								</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
	</div>

</body>
</html>