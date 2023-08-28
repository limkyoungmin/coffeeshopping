<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1 shrink-to-fit=no">
<title>Bootstrap demo</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="../css/style.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script>
$(document).ready(function() {
	// 파일 선택시 이름 파일이름 뜨게 하는 기능
	$("input[type='file']").on('change',function(){
		$(this).next('.custom-file-label').html(event.target.files[0].name);
	});
	
	// Navbar 불러 올 시 current 클래스 추가
	$(".navbar-nav a").each(function() {
		if ($(this).attr("href") === "Notice.jsp") {
		  $(this).addClass("current");
		} else {
		  $(this).removeClass("current");
		}
	});
});
</script>
</head>
<body>
	<!-- Navbar.jsp Template -->
	<%@ include file="navbar.jsp" %>
	<!-- end of Navbar.jsp -->
	<!-- table -->
	<section class="pt-5">
		<div class="container-fluid">
			<div class="row mb-5">
				<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
					<div class="row">
						<div class="col-2"></div>
						<div class="col-8">
							<br><h3 class="text-muted text-center mb-3">문의</h3>
							<table class="table text-center">
								<thead>
									<tr class="bg-dark text-white">
										<th class="col-1">글번호</th>
										<th class="col-5">제목</th>
										<th class="col-1">작성자</th>
										<th class="col-2">작성날짜</th>
										<th class="col-2">답변여부</th>								
									</tr>
								</thead>
		
								<tbody>	
								<c:forEach items="${qnalist}" var="qnalist">  							  
									<tr id="qna" class="table-ho">
						                        <td class="sml">${qnalist.qna_num }</td>
						                        <td class="alignLeft fs16"><a href="adminqnaread?qna_num=${qnalist.qna_num}">${qnalist.qna_title }</a></td>
						                        <td class="sml">${qnalist.users_id }</td>	                        	
						                        <td class="sml"><fmt:formatDate value="${qnalist.qna_date}" pattern = "yyyy-MM-dd"/></td>	
						                        <td class="sml">${qnalist.qna_yn }</td>					                        										
									</tr>
									</c:forEach>
								</tbody>								
							</table>
							
							<!-- pagination -->
							<nav>
								<ul class="pagination justify-content-center">
									<li class="page-item">
										<a href="#" class="page-link py-2 px-3">
											<span>&laquo;</span>
										</a>
									</li>
									
									<!-- 페이지 정보를 추가 -->
									<li class="page-item active">
										<a href="#" class="page-link py-2 px-3">1</a>
									</li>
									<li class="page-item">
										<a href="#" class="page-link py-2 px-3">2</a>
									</li>
									<li class="page-item">
										<a href="#" class="page-link py-2 px-3">3</a>
									</li>
									<li class="page-item">
										<a href="#" class="page-link py-2 px-3">4</a>
									</li>
									
									<li class="page-item">
										<a href="#" class="page-link py-2 px-3">
											<span>&raquo;</span>
										</a>
									</li>									
								</ul>
							</nav>
							<!-- end of pagination -->
							
							<!-- #notice_edit modal -->
							<div class="modal fade" id="notice_edit" tabindex="-1" role="dialog" aria-hidden="true">
								<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
									<div class="modal-content p-md-3">
										<div class="modal-header">
											<h4 class="modal-title">문의 답변 수정</h4>
											<button class="close" type="button" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
										
									</div>
								</div>
							</div>
							<!-- end of #notice_edit modal -->
						</div>
						<div class="col-2"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end of table -->

	
	<!-- Bootstrap CSS, JS -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script> -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script> -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script> -->
	<script src="../script.js"></script>
	
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9648a29529.js" crossorigin="anonymous"></script>
</body>
</html>