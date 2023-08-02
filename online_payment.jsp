<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aumak Book Store : Payment</title>
<%@include file="all_component/allcss.jsp"%>
<style type="text/css">
*{
  font-family: 'Poppins', sans-serif;
  margin:0; padding:0;
  box-sizing: border-box;
  outline: none; border:none;
  text-transform: capitalize;
  transition: all .2s linear;
}

.container{
  display: flex;
  justify-content: center;
  align-items: center;
  padding:25px;
  min-height: 100vh;
}

.container form{
  padding:20px;
  width:700px;
  background: #fff;
  box-shadow: 0 5px 10px rgba(0,0,0,.1);
}

.container form .row{
  display: flex;
  flex-wrap: wrap;
  gap:15px;
}

.container form .row .col{
  flex:1 1 250px;
}

.container form .row .col .title{
  font-size: 20px;
  color:#333;
  padding-bottom: 5px;
  text-transform: uppercase;
}

.container form .row .col .inputBox{
  margin:15px 0;
}

.container form .row .col .inputBox span{
  margin-bottom: 10px;
  display: block;
}

.container form .row .col .inputBox input{
  width: 100%;
  border:1px solid #ccc;
  padding:10px 15px;
  font-size: 15px;
  text-transform: none;
}

.container form .row .col .inputBox input:focus{
  border:1px solid #000;
}

.container form .row .col .flex{
  display: flex;
  gap:15px;
}

.container form .row .col .flex .inputBox{
  margin-top: 5px;
}

.container form .row .col .inputBox img{
  height: 34px;
  margin-top: 5px;
  filter: drop-shadow(0 0 1px #000);
}

.container form .submit-btn{
  width: 100%;
  padding:12px;
  font-size: 17px;
  background: #27ae60;
  color:#fff;
  margin-top: 5px;
  cursor: pointer;
}

.container form .submit-btn:hover{
  background: #2ecc71;
}
</style>

</head>
<body style="background-color: #f2f2f2;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<form action="payment" method="post">
			<div class="row">
				<div class="col">
					<h3 class="title text-center">Payment</h3>
					
					<div class="inputBox">
						<span>Name On Card :</span> <input type="text"
							placeholder="Last - First - Middle" id="name">
					</div>
					<div class="inputBox">
						<span>Credit Card Number :</span> <input type="number"
							placeholder="1111-2222-3333-4444" id="card_number">
					</div>
					<div class="inputBox">
						<span>Exp Month :</span> <input type="email"
							placeholder="January" id="exp_month">
					</div>
					<div class="inputBox">
						<span>Exp Year :</span> <input type="number"
							placeholder="2023" id="exp_year">
					</div>
					<div class="inputBox">
						<span>Cvv :</span> <input type="text" placeholder="123" id="cvv">
					</div>
					
				</div>
			</div>
			<a href="order_success.jsp" type="submit" value="Order" class="submit-btn text-center">Pay
			</a>
		</form>
	</div>

	<div style="margin-top: 120px;">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>