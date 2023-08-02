<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aumak Book Store : User Address</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f2f2f2;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row p-3">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">User Address</h4>

						<form action="">
							<div class="form-row">

								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4" value="">
								</div>

								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4" value="">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4" value="">
								</div>


								<div class="form-group col-md-4">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" value="">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">Pin Code</label> <input type="text"
										class="form-control" id="inputPassword4" value="">
								</div>
							</div>
						</form>
						<div class="text-center">
							<button class="btn btn-success">Add Address</button>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>