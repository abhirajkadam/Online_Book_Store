<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aumak Book Store : Cart</title>
<%@include file="all_component/allcss.jsp"%>

<script type="text/javascript">
	function validate() {
		var name = document.getElementById("name").value;
		var email = document.getElementById("email").value;
		var phone_number = document.getElementById("phone_number").value;
		var address = document.getElementById("address").value;
		var landmark = document.getElementById("landmark").value;
		var city = document.getElementById("city").value;
		var state = document.getElementById("state").value;
		var pin = document.getElementById("pin").value;

		//name validation
		if (name == "") {
			document.getElementById("nameerror").innerHTML = "Name?";
			return false;
		} else {
			document.getElementById("nameerror").innerHTML = "";
		}
		
		//email validation
		if (email == "") {
			document.getElementById("emailerror").innerHTML = "Email?";
			return false;
		} else {
			document.getElementById("emailerror").innerHTML = "";
		}

		//phone validation
		if (phone_number == "") {
			document.getElementById("phoneerror").innerHTML = "Phone Number?";
			return false;
		} else{
			document.getElementById("phoneerror").innerHTML = "";
		}
		if (phone_number.length!=10) {
			document.getElementById("phoneerror").innerHTML = "10 Digit Number?";
			return false;
		} else {
			document.getElementById("phoneerror").innerHTML = "";
		}
		
		//address validation
		if (address == "") {
			document.getElementById("addresserror").innerHTML = "Address?";
			return false;
		} else {
			document.getElementById("addresserror").innerHTML = "";
		}
		
		//landmark validation
		if (landmark == "") {
			document.getElementById("landmarkerror").innerHTML = "Landmark?";
			return false;
		} else {
			document.getElementById("landmarkerror").innerHTML = "";
		}
		
		//city validation
		if (city == "") {
			document.getElementById("cityrror").innerHTML = "City?";
			return false;
		} else {
			document.getElementById("cityrror").innerHTML = "";
		}
		
		//state validation
		if (state == "") {
			document.getElementById("stateerror").innerHTML = "State?";
			return false;
		} else {
			document.getElementById("stateerror").innerHTML = "";
		}
		
		//pin validation
		if (pin == "") {
			document.getElementById("pinerror").innerHTML = "Pin Code?";
			return false;
		} else {
			document.getElementById("pinerror").innerHTML = "";
		}
		return true;
	}
</script>

</head>
<body style="background-color: #f2f2f2;">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center" role="alert">${succMsg }</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger text-center" role="alert">${failedMsg }</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Book Cart</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								User u = (User) session.getAttribute("userobj");

								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice = 0.00;
								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>

								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details For Order</h3>
						<form onsubmit="return validate()" action="order" method="post">
							<input type="hidden" value="${userobj.id }" name="id">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <span
									style="color: red" id="nameerror">*</span> <input type="text"
										name="username" class="form-control" id="name"
										value="${userobj.name }" >
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <span
									style="color: red" id="emailerror">*</span> <input type="email"
										name="email" class="form-control" id="email"
										value="${userobj.email }" >
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <span
									style="color: red" id="phoneerror">*</span> <input
										name="phone" type="number" class="form-control"
										id="phone_number" value="${userobj.phone }">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <span
									style="color: red" id="addresserror">*</span> <input type="text"
										name="address" class="form-control" id="address"
										value="" >
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <span
									style="color: red" id="landmarkerror">*</span> <input type="text"
										name="landmark" class="form-control" id="landmark" value="" >
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <span
									style="color: red" id="cityrror">*</span> <input type="text"
										name="city" class="form-control" id="city" value="" >
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <span
									style="color: red" id="stateerror">*</span> <input type="text"
										name="state" class="form-control" id="state" value="" >
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pin Code</label> <span
									style="color: red" id="pinerror">*</span> <input type="text"
										name="pincode" class="form-control" id="pin"
										value="">
								</div>
							</div>
							<div class="form-group">
								<label>Payment Mode</label> <span
									style="color: red">*</span> <select class="form-control"
									name="payment">
									<option value="noselect">--Select--</option>
									<option value="Online">UPI / QR Code</option>
								</select>
							</div>
							<div class="text-center">
								<button class="btn btn-success">Pay Now</button>
								<button class="btn btn-warning">Continue Shopping</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>