<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1 shrink-to-fit=no">
<title>관리자 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/style.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
</head>
<body>
	<!-- navbar -->
	<nav class="navbar navbar-expand-md navbar-light">
		<button class="navbar-toggler ml-auto md-2 bg-light" type="button" data-toggle="collapse" data-target="#sidebar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="sidebar">
			<div class="container-fluid">
				<div class="row">
					<!-- sidebar -->
					<div class="col-md-2 sidebar fixed-top">
						<!-- 로고 넣는곳 -->
						<a href="#" class="navbar-brand text-white text-center d-block mx-auto py-3 mb-4 bottom-border">Admin Page</a>
						<div class="bottom-border pb-3">
							<!-- 사용자 이미지, 이름 넣는곳 -->
							<img src="../images/admin.png" alt="" width="50" class="rounded-circle mr-3">
							<a href="#" class="text-white">Admin</a>
						</div>
						<ul class="navbar-nav flex-column mt-4">
							<li class="nav-item">
								<a href="main" class="nav-link text-white p-3 mb-2 sidebar-link">
									<i class="fas fa-home text-white fa-lg mr-3"></i>Main Home
								</a> 
							</li>
							<li class="nav-item">
								<a href="admin_user" class="nav-link text-white p-3 mb-2 sidebar-link">
									<i class="fas fa-user text-white fa-lg mr-3"></i>Member management
								</a>
						    </li>
						    <li class="nav-item">
						    	<a href="users_delivery" class="nav-link text-white p-3 mb-2 sidebar-link">
						    		<i class="fas fa-user text-white fa-lg mr-3"></i>Users Delivery
						    	</a>
						    </li>
							<li class="nav-item">
								<a href="product-management" class="nav-link text-white p-3 mb-2 sidebar-link">
									<i class="fas fa-solid fa-list-check text-white fa-lg mr-3"></i>Product management
								</a>
							</li>
							<li class="nav-item">
								<a href="adminnotice" class="nav-link text-white p-3 mb-2 sidebar-link">
									<i class="fas fa-solid fa-newspaper text-white fa-lg mr-3"></i>Notice
								</a>
							</li>
							<li class="nav-item">
								<a href="adminevent" class="nav-link text-white p-3 mb-2 sidebar-link">
									<i class="fa-regular fa-calendar text-white fa-lg mr-3"></i>Event
								</a>
							</li>
							<li class="nav-item">
                                <a href="adminfaq" class="nav-link text-white p-3 mb-2 sidebar-link">
                                    <i class="fa-regular fa-calendar text-white fa-lg mr-3"></i>FAQ
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="adminqna" class="nav-link text-white p-3 mb-2 sidebar-link">
                                    <i class="fa-regular fa-calendar text-white fa-lg mr-3"></i>QNA
                                </a>
                            </li>
						</ul>
					</div>
					<!-- end of sidebar -->
					<!-- top navbar -->
					<div class="col-xl-10 ml-auto bg-dark fixed-top py-2 top-navbar">
						<div class="row align-items-center">
							<div class="col-md-4">
								<h4 class="text-light text-uppercase mb-0">NOVOCOZY</h4>
							</div>
							<div class="col-md-5">
								<form action="#" method="post" accept-charset="utf-8">
									<div class="input-group">
										<input type="text" class="form-control search-input" placeholder="Search">
										<button type="button" class="btn btn-light search-button">
											<i class="fas fa-search text-danger"></i>
										</button>
									</div>
								</form>
							</div>
							<div class="col-md-3">
								<ul class="navbar-nav">
									<li class="nav-item icon-parent"><a href="#" class="nav-link icon-bullet"><i class="fas fa-comments text-muted fa-lg"></i></a></li>
									<li class="nav-item icon-parent"><a href="#" class="nav-link icon-bullet"><i class="fas fa-bell text-muted fa-lg"></i></a></li>
									<!-- 로그아웃 페이지 -->
									<li class="nav-item ml-auto"><a href="#" class="nav-link" data-toggle="modal" data-target="#sign-out"><i class="fas fa-sign-out-alt text-danger fa-lg"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- modal -->
					<div class="modal fade" id="sign-out">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">정말로 로그아웃 하실껀가요?</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="modal-body">
									로그아웃 하시면 관리자 로그인 페이지로 나가집니다.
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-success" data-dismiss="modal">그대로 있기</button>
									<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="location.href='/logout'">로그아웃</button>
								</div>
							</div>
						</div>
					</div>
					<!-- end of modal -->
					<!-- end of top navbar -->
				</div>
			</div>
		</div>
	</nav>
	
	
	<!-- Bootstrap CSS, JS -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	<script src="/js/script.js"></script>
	
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9648a29529.js" crossorigin="anonymous"></script>
</body>
</html>