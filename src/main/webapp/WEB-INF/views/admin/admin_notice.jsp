<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1 shrink-to-fit=no">
<title>관리자 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="../style.css">
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
		if ($(this).attr("href") === "adminnotice") {
		  $(this).addClass("current");
		} else {
		  $(this).removeClass("current");
		}
	});
	
    $(".btn-delete").on("click", function() {
        console.log("ㅎㅎㅎㅎㅎ");
        var noticeNum = $(this).data("notice-num");
        $("#notice_num_input").val(noticeNum);
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
						<div class="col-1"></div>
						<div class="col-10">
							<h3 class="text-muted text-center mb-3">공지사항</h3>
							<table class="table text-center">
								<thead>
									<tr class="bg-dark text-white">
										<th class="col-1">글번호</th>
										<th class="col-5">제목</th>
										<th class="col-2">작성자</th>
										<th class="col-2">작성날짜</th>
										<th class="col-2">버튼</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="noticeList" items="${noticeList}">
										<tr class="table-ho">
											<td data-notice-num="${noticeList.notice_num}">${noticeList.notice_num}</td>
											<td><a href="noticedetail?notice_num=${noticeList.notice_num}">${noticeList.notice_title}</a></td>
											<td>${noticeList.notice_writer}</td>
											<td><fmt:formatDate pattern = "yyyy.MM.dd" value="${noticeList.notice_date}"/></td>
											<td><button type="button" class="btn btn-danger btn-delete" data-toggle="modal" data-target="#notice_delete" data-notice-num="${noticeList.notice_num}">삭제</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- #notice_delete modal -->
							<div class="modal fade" id="notice_delete">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">해당 공지사항을 삭제 할까요?</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>
										<div class="modal-body">
											공지사항 삭제시 
											데이터베이스의 정보와 실제 이미지가 같이 삭제 됩니다.
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-success" data-dismiss="modal">취소</button>
											<form action="noticedelete" method="post">
												<input type="hidden" id="notice_num_input" name="notice_num" value="${notice_num}">
												<button type="submit" class="btn btn-danger">삭제</button>
											</form>
										</div>
									</div>
								</div>
							</div>
							<!-- end of #notice_delete modal -->
							<!-- pagination -->
							<!-- 
							<nav>
							    <ul class="pagination justify-content-center">
							            <li class="page-item <c:if test='${page == 1}'>disabled</c:if>">
							                <a class="page-link" href="<c:if test='${page > 1}'>/admin/adminnotice?page=${page - 1}</c:if>">이전</a>
							            </li>
									<c:forEach begin="${startPage}" end="${endPage}" var="i">
									    <li class="page-item <c:if test='${i == page}'>active</c:if>">
									        <a class="page-link" href="/admin/adminnotice?page=${i}">${i}</a>
									    </li>
									</c:forEach>
						            <li class="page-item <c:if test='${page == totalPages}'>disabled</c:if>">
						                <a class="page-link" href="<c:if test='${page < totalPages}'>/admin/adminnotice?page=${page + 1}</c:if>">다음</a>
						            </li>
							        <li class="page-item ml-3">
							            <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#notice_write">공지 쓰기</button>
							        </li>
							    </ul>
							</nav> -->
							<nav aria-label="Page navigation example">
							    <ul class="pagination justify-content-center">
							        <li class="page-item <c:if test='${page == 1}'>disabled</c:if>">
							            <a class="page-link" href="<c:if test='${page > 1}'>/admin/adminnotice?page=${page - 1}&searchWord=${searchWord}</c:if>" aria-label="Previous">
							                <span aria-hidden="true">이전</span>
							            </a>
							        </li>
							        <c:forEach var="i" begin="${startPage}" end="${endPage}">
							            <li class="page-item <c:if test='${i == page}'>active</c:if>">
							                <a class="page-link" href="/admin/adminnotice?page=${i}&searchWord=${searchWord}">${i}</a>
							            </li>
							        </c:forEach>
							        <li class="page-item <c:if test='${page == totalPages}'>disabled</c:if>">
							            <a class="page-link" href="<c:if test='${page < totalPages}'>/admin/adminnotice?page=${page + 1}&searchWord=${searchWord}</c:if>" aria-label="Next">
							                <span aria-hidden="true">다음</span>
							            </a>
							        </li>
							        <li class="page-item ml-3">
							            <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#notice_write">공지 쓰기</button>
							        </li>
							    </ul>
							</nav>

							<form action="adminnotice" method = "get">
							<div class="input-group">
								<div class="input-group">
									<div class="col-md-3"></div>
									<input type="text" name="searchWord" class="form-control" placeholder="원하는 검색어를 입력하세요.">
									<div class="input-group-append">
										<button class="btn btn-dark" type="submit">
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
									<div class="col-md-3"></div>
								</div>
							</div>
							</form>
							<!-- end of pagination -->
							<!-- #notice_write modal -->
							<div class="modal fade" id="notice_write" tabindex="-1" role="dialog" aria-hidden="true">
								<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
									<div class="modal-content p-md-3">
										<div class="modal-header">
											<h4 class="modal-title">공지 작성</h4>
											<button class="close" type="button" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
										<div class="modal-body">
											<form action="noticeWrite" method="post" enctype="multipart/form-data">
												<div class="row">
													<!-- required : 반드시 입력해야 되는지 설정 true or false -->
													<div class="form-group col-lg-12">
														<label class="font-weight-bold text-small" for="notice_title">제목<span class="text-primary ml-1">*</span></label>
														<input class="form-control" id="notice_title" name="notice_title" type="text" placeholder="제목을 입력해 주세요." required />
													</div>
													<div class="form-group col-lg-12">
														<label class="font-weight-bold text-small" for="notice_content">내용<span class="text-primary ml-1">*</span></label>
														<textarea class="form-control" id="notice_content" name="notice_content" rows="5" placeholder="내용을 입력해 주세요." required=""></textarea>
													</div>
													<div class="form-group col-lg-12">
														<label class="font-weight-bold text-small" for="notice_image">이미지
														<span class="text-primary ml-1">*</span><span class="text-danger ml-1">(png, jpeg만 가능)</span></label>
														<div class="custom-file">
															<input name="file" class="custom-file-input" type="file" id="notice_img" accept="image/png, image/jpeg" />
															<label class="custom-file-label" for="notice_img">이미지 파일을 선택해 주세요.</label>
														</div>
													</div>
													<div class="form-group col-lg-12">
														<input type="submit" class="btn btn-dark" value="공지 쓰기">
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							<!-- end of #notice_write modal -->
						</div>
						<div class="col-1"></div>
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