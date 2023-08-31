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
<link rel="stylesheet" href="../style.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script>
$(document).ready(function() {
	// Navbar 불러 올 시 current 클래스 추가
	$(".navbar-nav a").each(function() {
		if ($(this).attr("href") === "users_delivery") {
		  $(this).addClass("current");
		} else {
		  $(this).removeClass("current");
		}
	});
	
    $(".btn-delete").on("click", function() {
        var usersId = $(this).data("users-id"); // 상품 번호 가져오기
        $("#users_id_input").val(usersId); // 숨겨진 입력 필드에 값 설정
    });
});

document.addEventListener("DOMContentLoaded", function () {
    const updateButtons = document.querySelectorAll(".update-btn");
    
    updateButtons.forEach(function (button) {
        button.addEventListener("click", function () {
            const orderRequest = button.getAttribute("data-order-request");
            let alertMessage = "";
            
            if (orderRequest === "배송완료") {
                alert("이미 배송완료 상태입니다.");
                return; // 업데이트 중단
            }
            
            switch (orderRequest) {
                case "주문완료":
                    alertMessage = "주문 업데이트가 되어 배송준비중으로 변경되었습니다.";
                    break;
                case "배송준비중":
                    alertMessage = "배송중으로 변경되었습니다.";
                    break;
                case "배송중":
                    alertMessage = "배송완료로 변경되었습니다.";
                    break;
                // 이 외의 경우에는 아무 작업도 하지 않음
            }

            if (alertMessage) {
                alert(alertMessage);
            }
        });
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
							<h3 class="text-muted text-center mb-2">회원 배송 리스트</h3>
							<!-- memberTable -->
							
							
							<table class="table text-center" id="memberTable">
								<thead>
									<tr class="text-white bg-dark">
										<th class="col-2">주문날짜</th>
										<th class="col-2">ID</th>
										<th class="col-2">이름</th>
										<th class="col-2">주문번호</th>
										<th class="col-2">배송현황</th>
										<th class="col-2">업데이트</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="orderList" items="${orderList}">
									<form action="userDeliveryUpdate" method="post">
										<input type="hidden" name="order_num" value="${orderList.order_num}">
										<input type="hidden" name="order_request" value="${orderList.order_request}">
										<c:if test="${not empty orderList.order_courier}">
											<input type="hidden" name="order_courier" value="${orderList.order_courier}">
											<input type="hidden" name="order_trackingnum" value="${orderList.order_trackingnum}">
										</c:if>
											<tr class="table-ho">
												<td rowspan="3" style="text-align:center; vertical-align: middle;">${orderList.order_date}</td>
												<td rowspan="3" style="text-align:center; vertical-align: middle;" data-users-id="${orderList.users_id}">${orderList.users_id}</td> 
												<td rowspan="3" style="text-align:center; vertical-align: middle;">${orderList.order_name}</td>
												<td rowspan="3" style="text-align:center; vertical-align: middle;">${orderList.order_num}</td>
												<td style="text-align:center; vertical-align: middle;">${orderList.order_request}</td>
												<td rowspan="3" style="text-align:center; vertical-align: middle;"><input type="submit" value="업데이트" class="update-btn"  data-order-request="${orderList.order_request}"></td>
											</tr>
											<c:choose>
												<c:when test="${empty orderList.order_courier}">
													<tr class="table-ho">
														<td style="text-align:center; vertical-align: middle;">
															<select name="order_courier" class="form-control">
															  <option value="" style="text-align:center;">택배사 선택</option>
															  <option value="CJ대한통운" style="text-align:center;">CJ대한통운</option>
															  <option value="우체국" style="text-align:center;">우체국</option>
															  <option value="한진택배" style="text-align:center;">한진택배</option>
															</select>
														</td>
													</tr>
													<tr class="table-ho">
														<td style="text-align:center; vertical-align: middle;"><input type="text" name="order_trackingnum" placeholder="송장번호를 입력하세요"></td>
													</tr>
												</c:when>
												<c:otherwise>
													<tr class="table-ho">
														<td style="text-align:center; vertical-align: middle;">${orderList.order_courier}</td>
													</tr>
													<tr class="table-ho">
														<td style="text-align:center; vertical-align: middle;">${orderList.order_trackingnum}</td>
													</tr>
												</c:otherwise>
											</c:choose>
											</form>
									</c:forEach>
								</tbody>
							</table>
							
							<!-- end of memberTable -->
							<!-- data-toggle="modal" data-target="#user_delete"
							<div class="modal fade" id="user_delete">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">해당 유저를 처리 할까요?</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>
										<div class="modal-body">
											현재 상태가 <b>탈퇴</b>시 미탈퇴 처리가 됩니다.<br>
											현재 상태가 <b>미탈퇴</b>시 탈퇴 처리가 됩니다.
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-success" data-dismiss="modal">취소</button>
											<form action="userDelete" method="post">
												<input type="hidden" id="users_id_input" name="users_id" value="${users_id}">
												<button type="submit" class="btn btn-danger">처리</button>
											</form>
										</div>
									</div>
								</div>
							</div> -->
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
						</div>
						<div class="col-1"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	<!-- Bootstrap CSS, JS -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script> -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="../script.js"></script>
	
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9648a29529.js" crossorigin="anonymous"></script>
</body>
</html>