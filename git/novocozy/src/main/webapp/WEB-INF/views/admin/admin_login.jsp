<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1 shrink-to-fit=no">
<title>관리자 로그인 페이지</title>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="../css/admin_login.css">
<%-- <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/style.css">  --%>

<body class="main-bg">
	<div class="login-container text-c animated flipInX">
		<div>
			<h1 class="logo-badge text-whitesmoke">
				<span class="fa fa-user-circle"></span>
			</h1>
		</div>
		<h3 class="text-whitesmoke">Sign In Admin</h3>
		<p class="text-whitesmoke">Sign In</p>
		<div class="container-content">
			<form action="loginCheck" method="post" class="margin-t">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Admin id" name="admin_id" required="">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="*****" name="admin_passwd" required="">
				</div>
				<button type="submit" class="form-button button-l margin-b">Sign In</button>
				<br> <a class="text-darkyellow" href="/main"><small>Move Main Page</small></a> <br>
			</form>
			<p class="margin-t text-whitesmoke">
				<small> novocozy &copy; 2023</small>
			</p>
		</div>
	</div>
</body>
	<!-- Bootstrap CSS, JS -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script> -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="<%= request.getContextPath() %>/js/script.js"></script>
	
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9648a29529.js" crossorigin="anonymous"></script>
</body>
</html>