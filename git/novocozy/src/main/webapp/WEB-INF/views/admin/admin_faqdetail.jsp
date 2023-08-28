<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1 shrink-to-fit=no">
<title>자주 묻는 질문</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/style.css">
<link rel="stylesheet" href="../resources/css/novocozy2.css">
<link rel="stylesheet" href="../resources/css/novocozy3.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
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

/* modal close시 입력값 초기화 자꾸 남아있음.. */
$(document).on("click",".close",function(){
	$(".modalBtns").removeClass("on");
	$('#form_box')[0].reset();
/* 	$(this).parents(".modal_layer").fadeOut("fast"); */
});	

</script>
</head>
<body>
	<!-- Navbar.jsp Template -->
	<%@ include file="navbar.jsp"%>
	<!-- end of Navbar.jsp -->
	<section>
		<!-- #notice_delete modal -->
			<div class="modal fade" id="faqdelete">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">삭제 확인</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
							<div class="modal-body">해당 게시물을 삭제하시겠어요?</div>
							<form action="faqdelete" method="post">
							<input type="hidden" name="faq_num" value="${faqread.faq_num}">
							<div class="modal-footer">
								<button type="button" class="btn btn-success" data-dismiss="modal">취소</button>
								<button type="submit" class="btn btn-danger">삭제</button>
							</div>
							</form>
						</div>
					</div>
				</div>
			<!-- end of #notice_delete modal -->
			
		<div class="contents mainArea">
			<div class="mypageCol">
				<div class="userCont" style="width: 1200px;">
					<div class="contBox" style="width: 1200px;">
						<div class="boardView" style="width: 1200px;">
							<!-- 제목 -->
							<div class="boardHead">
								<strong class="title" style="margin-left: 150px;">${faqread.faq_title}</strong>
								<div class="info" style="border-bottom: 2px solid gray; margin-left: 150px; padding-bottom: 20px;">
									<span class="date">작성일(수정일) : <fmt:formatDate pattern="yyyy/MM/dd" value="${faqread.faq_date}" /></span>&nbsp;&nbsp;
									<span>작성자 : </span>&nbsp;<span>${faqread.admin_id }</span>
								</div>
							</div>
							<!-- //제목 -->
							<!-- 내용 -->
							<div class="boardDesc"
								style="width: 92%; margin-left: 200px; border-bottom: 2px solid gray">
								<p>
								<div>${faqread.faq_content}</div>
								<p>
							</div>
							<!-- //내용 -->
						</div>
						<div style="margin-top: 30px; margin-right: 0; float: right;">
							<button type="button" class="btn btn-dark" data-toggle="modal" onclick="location.href='/admin/adminfaq'">게시물 목록</button>
							<button type="button" class="btn btn-dark" data-toggle="modal" data-target="#faqupdate">게시물 수정</button>
							<button type="button" class="btn btn-dark" data-toggle="modal" data-target="#faqdelete">게시물 삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- start of #faqupdate modal -->
		<div class="modal fade" id="faqupdate" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered"
				role="document">
				<div class="modal-content p-md-3">
					<div class="modal-header">
						<h4 class="modal-title">자주 묻는 질문 수정</h4>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="faqupdate" method="post" id="form_box">
							<input type="hidden" id="faq_num" name="faq_num" value="${faqread.faq_num}" />
							<div class="row">
								<!-- required : 반드시 입력해야 되는지 설정 true or false -->
								<div class="form-group col-lg-12">
									<label class="font-weight-bold text-small" for="faq_title">제목</label>
									<input class="form-control" id="faq_title" name="faq_title" type="text" value="${faqread.faq_title}">
								</div>
								<div class="form-group col-lg-12">
									<label class="font-weight-bold text-small" for="admin_id">작성자</label>
									<input type="hidden" name="admin_id" id="admin_id" value="ajy">
								</div>
								<div class="form-group col-lg-12">
									<label class="font-weight-bold text-small" for="faq_content">내용</label>
									<textarea class="form-control" id="faq_content" name="faq_content" rows="5">${faqread.faq_content}</textarea>
								</div>
								<!-- 수정  버튼 -->
								<div class="form-group col-lg-12">
									<input type="submit" class="btn btn-dark" value="게시물 수정" />
								</div>
								<!-- //수정 버튼 -->
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="col-2"></div>
		<!-- end of #faqupdate modal -->
	</section>
	<!-- //내용 -->

	<script src="https://kit.fontawesome.com/9648a29529.js" crossorigin="anonymous"></script>
</body>
</html>