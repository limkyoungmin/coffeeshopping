<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1 shrink-to-fit=no">
<title>Bootstrap demo</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="../style.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script>
$(document).ready(function() {
	// Navbar 불러 올 시 current 클래스 추가
	$(".navbar-nav a").each(function() {
		if ($(this).attr("href") === "Member_management.jsp") {
		  $(this).addClass("current");
		} else {
		  $(this).removeClass("current");
		}
	});
});

// select
function selectOptionChanged() {
	var selectValue = document.getElementById("memberStatement").value;
	if (selectValue === "1") {
		document.getElementById("memberTable").style.display = "table";
		document.getElementById("orderTable").style.display = "none";
		document.getElementById("deliveryTable").style.display = "none";
	} else if (selectValue === "2") {
		document.getElementById("memberTable").style.display = "none";
		document.getElementById("orderTable").style.display = "table";
		document.getElementById("deliveryTable").style.display = "none";
	} else if (selectValue === "3") {
		document.getElementById("memberTable").style.display = "none";
		document.getElementById("orderTable").style.display = "none";
		document.getElementById("deliveryTable").style.display = "table";
	}
}
/* 	
	예비용1 selectOptionChanged() -> else if 다음에 주입
	// 요청상태가 "교환"인 경우
    if (document.querySelector(".request").textContent === "교환") {
        var exchangeOption = '<option selected value="0">선택</option>' +
            '<option value="1">승인</option>' +
            '<option value="2">준비중</option>' +
            '<option value="3">교환완료</option>';
        document.getElementById("requestStatusSelect").innerHTML = exchangeOption;
    }
    
    // 요청상태가 "반품"인 경우
    else if (document.querySelector(".request").textContent === "반품") {
        var returnOption = '<option selected value="0">선택</option>' +
            '<option value="1">승인</option>' +
            '<option value="2">준비중</option>' +
            '<option value="3">반품완료</option>';
        document.getElementById("requestStatusSelect").innerHTML = returnOption;
    }
}
	
 	예비용2 $(document).ready(function() 안에 주입
 	// 처음 페이지 로딩 시 요청상태 변경 함수를 호출하여 초기 상태 설정
	changeRequestStatus();

	// select 요소 변경 시 요청상태 변경 함수를 호출하여 선택 상태 변경
	$("#memberStatement").change(function() {
	    changeRequestStatus();
	});
}

// 요청상태를 변경하는 함수
function changeRequestStatus() {
    // 모든 요소를 선택합니다.
    var requestElements = document.getElementsByClassName("request");

    // 선택한 요소들을 반복문으로 순회하면서 처리합니다.
    for (var i = 0; i < requestElements.length; i++) {
        var requestElement = requestElements[i];
        var selectElement = requestElement.nextElementSibling.querySelector("select");

        // 요청상태가 "교환"인 경우
        if (requestElement.textContent === "교환") {
            var exchangeOption = '<option selected value="0">선택</option>' +
                '<option value="1">승인</option>' +
                '<option value="2">준비중</option>' +
                '<option value="3">교환완료</option>';
            selectElement.innerHTML = exchangeOption;
        }
        
        // 요청상태가 "반품"인 경우
        else if (requestElement.textContent === "반품") {
            var returnOption = '<option selected value="0">선택</option>' +
                '<option value="1">승인</option>' +
                '<option value="2">준비중</option>' +
                '<option value="3">반품완료</option>';
            selectElement.innerHTML = returnOption;
        }
    } 
}*/

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
							<h3 class="text-muted text-center mb-2">회원 리스트</h3>
							<select class="custom-select mr-sm-2 col-5" id="memberStatement" onchange="selectOptionChanged()">
						        <option selected value="1">Member</option>
						        <option value="2">Order</option>
						        <option value="3">Delivery</option>
							</select>
							<!-- memberTable -->
							<table class="table text-center" id="memberTable">
								<thead>
									<tr class="text-white bg-dark">
										<th class="col-2">회원번호</th>
										<th class="col-5">ID</th>
										<th class="col-1">이름</th>
										<th class="col-2">탈퇴유무</th>
										<th class="col-2">버튼</th>
									</tr>
								</thead>
								<tbody>
									<tr class="table-ho">
										<td>1</td> 
										<td>test</td>
										<td>test</td>
										<td>N</td>
										<td>
											<button type="button" class="btn" data-toggle="modal" data-target="#user_edit">
												<i class="fa-solid fa-user-pen"></i>
											</button>
											<button type="button" class="btn" data-toggle="modal" data-target="#user_delete">
												<i class="fa-regular fa-trash-can"></i>
											</button>
										</td>
									</tr>
									<tr class="table-ho">
										<td>1</td>
										<td>test</td>
										<td>test</td>
										<td>N</td>
										<td>
											<button type="button" class="btn" data-toggle="modal" data-target="#user_edit">
												<i class="fa-solid fa-user-pen"></i>
											</button>
											<button type="button" class="btn" data-toggle="modal" data-target="#user_delete">
												<i class="fa-regular fa-trash-can"></i>
											</button>
										</td>
									</tr>
								</tbody>
							</table>
							<!-- end of memberTable -->
							<!-- orderTable -->
							<table class="table text-center" id="orderTable" style="display: none;">
								<thead>
									<tr class="text-white bg-dark">
										<th class="col-1">회원번호</th>
										<th class="col-2">ID</th>
										<th class="col-1">이름</th>
										<th class="col-5">주소</th>
										<th class="col-1">요청상태</th>
										<th class="col-2">변경</th>
									</tr>
								</thead>
								<tbody>
									<tr class="table-ho">
										<td>2</td> 
										<td>222</td>
										<td>2222</td>
										<td>경기도 경기도 경기경기도 경기경기 경기도</td>
										<td>교환</td>
										<td>
											<select class="custom-select mr-sm-2 text-center">
												<option selected value="0">선택</option>
										        <option value="1">승인</option>
										        <option value="2">준비중</option>
										        <option value="3">교환완료</option>
											</select>
										</td>
									</tr>
									<tr class="table-ho">
										<td>2</td> 
										<td>222</td>
										<td>2222</td>
										<td>경기도 경기도 경기경기도 경기경기 경기도</td>
										<td>반품</td>
										<td>
											<select class="custom-select mr-sm-2 text-center">
												<option selected value="0">선택</option>
										        <option value="1">승인</option>
										        <option value="2">준비중</option>
										        <option value="3">반품완료</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
							<!-- end of orderTable -->
							<!-- deliveryTable -->
							<table class="table text-center" id="deliveryTable" style="display: none;">
								<thead>
									<tr class="text-white bg-dark">
										<th class="col-1">회원번호</th>
										<th class="col-2">ID</th>
										<th class="col-1">이름</th>
										<th class="col-5">주소</th>
										<th class="col-1">주문번호</th>
										<th class="col-2">변경</th>
									</tr>
								</thead>
								<tbody>
									<tr class="table-ho">
										<td>2</td> 
										<td>222</td>
										<td>2222</td>
										<td>경기도 경기도 경기경기도 경기경기 경기도</td>
										<td>201929283</td>
										<td>
											<select class="custom-select mr-sm-2 text-center">
												<option selected value="0">선택</option>
										        <option value="1">배송준비중</option>
										        <option value="2">배송중</option>
										        <option value="3">배송완료</option>
											</select>
										</td>
									</tr>
									<tr class="table-ho">
										<td>3</td> 
										<td>333</td>
										<td>3333</td>
										<td>경기도 경기도 경기경기도 경기경기 경기도</td>
										<td>102019293</td>
										<td>
											<select class="custom-select mr-sm-2 text-center">
												<option selected value="0">선택</option>
										        <option value="1">배송준비중</option>
										        <option value="2">배송중</option>
										        <option value="3">배송완료</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
							<!-- end of deliveryTable -->							
							
							
							
							<!-- data-toggle="modal" data-target="#user_delete" -->
							<div class="modal fade" id="user_delete">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">해당 유저를 탈퇴처리 할까요?</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>
										<div class="modal-body">
											탈퇴시 탈퇴 유무가 Y로 바뀌고 해당 유저는 로그인을 못합니다.
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-success" data-dismiss="modal">취소</button>
											<button type="button" class="btn btn-danger" data-dismiss="modal">삭제</button>
										</div>
									</div>
								</div>
							</div>
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
						<div class="col-2"></div>
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