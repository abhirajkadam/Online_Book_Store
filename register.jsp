<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aumak Book Store : Register</title>
<%@include file="all_component/allcss.jsp"%>

<script type="text/javascript">
	function validate() {
		var name = document.getElementById("name").value;
		var email = document.getElementById("email").value;
		var phone_number = document.getElementById("phone_number").value;
		var password = document.getElementById("password").value;

		//name validation
		if (name == "") {
			document.getElementById("nameerror").innerHTML = "Please Enter Name.";
			return false;
		} else {
			document.getElementById("nameerror").innerHTML = "";
		}
		
		//email validation
		if (email == "") {
			document.getElementById("emailerror").innerHTML = "Please Enter Email.";
			return false;
		} else {
			document.getElementById("emailerror").innerHTML = "";
		}

		//phone validation
		if (phone_number == "") {
			document.getElementById("phoneerror").innerHTML = "Enter Phone Number.";
			return false;
		} else{
			document.getElementById("phoneerror").innerHTML = "";
		}
		if (phone_number.length!=10) {
			document.getElementById("phoneerror").innerHTML = "Enter 10 digits Number";
			return false;
		} else {
			document.getElementById("phoneerror").innerHTML = "";
		}
		
		//password validation
		if (password == "") {
			document.getElementById("passerror").innerHTML = "Please Enter Password.";
			return false;
		} else{
			document.getElementById("passerror").innerHTML = "";
		}
		if (password.length<4 || password.length>8) {
			document.getElementById("passerror").innerHTML = "Enter Atleast 4 to 8 Characters";
			return false;
		} else {
			document.getElementById("passerror").innerHTML = "";
		}
		return true;
	}
</script>

</head>
<body style="background-color: #f2f2f2;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Registration Page</h4>

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form onsubmit="return validate()" action="register" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <span
									style="color: red" id="nameerror">*</span> <input type="text"
									class="form-control" id="name" aria-describedby="emailHelp"
									name="fname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email Address</label> <span
									style="color: red" id="emailerror">*</span> <input type="email"
									class="form-control" id="email" aria-describedby="emailHelp"
									name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone Number</label> <span
									style="color: red" id="phoneerror">*</span> <input
									type="number" class="form-control" id="phone_number"
									aria-describedby="emailHelp" name="phone">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <span
									style="color: red" id="passerror">*</span> <input
									type="password" class="form-control" id="password"
									name="password">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Terms & Conditions</label> <span
									style="color: red">*</span>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary mt-3">Submit</button>
								<br> <a href="login.jsp">Already Registered?</a>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>

</body>
</html>