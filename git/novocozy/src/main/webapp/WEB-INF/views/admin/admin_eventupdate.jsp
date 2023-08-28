<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1 shrink-to-fit=no">
<title>관리자 페이지</title>
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
		if ($(this).attr("href") === "adminevent") {
		  $(this).addClass("current");
		} else {
		  $(this).removeClass("current");
		}
	});
});
</script>
<body>
	<!-- Navbar.jsp Template -->
	<%@ include file="navbar.jsp" %>
	<!-- end of Navbar.jsp -->
	<!-- table -->
	<section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                	<h3 class="text-muted text-center mb-3">이벤트 수정</h3>
                    <div class="modal-body">
						<form action="eventupdate.do" method="post" enctype="multipart/form-data">
							<input type="hidden" name="event_num" value="${eventupdate.event_num}">
							<input type="hidden" name="event_img" value="${eventupdate.event_img}">
							<div class="row">
								<div class="form-group col-lg-12">
									<label class="font-weight-bold text-small" for="event_title">이벤트명<span class="text-primary ml-1">*</span></label>
									<input class="form-control" id="event_title" name="event_title" type="text" value="${eventupdate.event_title}" required />
								</div>
								<div class="form-group col-lg-6">
									<label class="font-weight-bold text-small" for="event_startdate">시작날짜<span class="text-primary ml-1">*</span></label>
									<input class="form-control" id="event_startdate" name="event_startdate" type="date" value="${eventupdate.event_startdate}" />
								</div>
								<div class="form-group col-lg-6">
									<label class="font-weight-bold text-small" for="event_enddate">종료날짜<span class="text-primary ml-1">*</span></label>
									<div class="md-form md-outline input-with-post-icon datepicker">
										<input class="form-control" id="event_enddate" name="event_enddate" type="date" value="${eventupdate.event_enddate}" >
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="font-weight-bold text-small" for="event_img">이미지
									<span class="text-primary ml-1">*</span><span class="text-danger ml-1">(png, jpeg만 가능)</span></label>
									<div class="custom-file">
										<input name="file" class="custom-file-input" type="file" id="event_img" accept="image/png, image/jpeg" />
										<label class="custom-file-label" for="event_img">이미지 파일을 선택해 주세요.</label>
									</div>
								</div>
								<div class="form-group col-lg-12">
									<label class="font-weight-bold text-small" for="event_content">내용<span class="text-primary ml-1">*</span></label>
									<textarea class="form-control" id="notice_content" name="event_content" rows="5">${eventupdate.event_content}</textarea>
								</div>
								<div class="form-group col-lg-12">
									<input type="submit" class="btn btn-dark" value="이벤트 수정">
								</div>
							</div>
						</form>
					</div>
                </div>
            </div>
		
	</section>
	
	<!-- Bootstrap CSS, JS -->
	<script src="../script.js"></script>
	
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9648a29529.js" crossorigin="anonymous"></script>
</body>
</html>