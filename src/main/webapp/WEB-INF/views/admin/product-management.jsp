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
<link rel="stylesheet" href="../css/style.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script>
/* 첨부파일 추가 */
function addFile(obj){
    var maxFileCnt = 3;   // 첨부파일 최대 개수
    var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
    var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수

    // 첨부파일 개수 확인
    if (curFileCnt > remainFileCnt) {
        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
    } 
}

$(document).ready(function() {
    // 파일 선택시 이름 파일이름 뜨게 하는 기능
    $("input[type='file']").on('change', function(event) {
        $(this).next('.custom-file-label').html(event.target.files[0].name);
        
        // 파일 선택 시 호출되는 함수 호출
        handleFileSelect(event);
    });

    // Navbar 불러 올 시 current 클래스 추가
    $(".navbar-nav a").each(function() {
        if ($(this).attr("href") === "product-management") {
            $(this).addClass("current");
        } else {
            $(this).removeClass("current");
        }
    });

    $(".btn-delete").on("click", function() {
        console.log("ㅎㅎㅎㅎㅎ");
        var productNum = $(this).data("product-num"); // 상품 번호 가져오기
        $("#product_num_input").val(productNum); // 숨겨진 입력 필드에 값 설정
    });
});

var uploadedFiles = []; // 업로드한 파일 정보를 저장하는 배열

function addFile(input) {
    for (var i = 0; i < input.files.length; i++) {
        var file = input.files[i];
        uploadedFiles.push(file); // 파일을 배열에 추가
        var listItem = document.createElement('div');
        listItem.textContent = file.name;
        document.querySelector('.file-list').appendChild(listItem);
    }
}

function uploadFiles() {
    // 서버로 업로드한 파일과 순서 정보를 전송
    var formData = new FormData();
    for (var i = 0; i < uploadedFiles.length; i++) {
        formData.append('files', uploadedFiles[i]);
    }
    // Ajax를 사용하여 formData 전송 등의 로직
}
</script>

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
						<div class="col-9">
							<h3 class="text-muted text-center mb-3">상품 리스트</h3>
							<table class="table text-center">
								<thead>
									<tr class="bg-dark text-white">
										<th class="col-1">상품번호</th>
										<th class="col-2">카테고리</th>
										<th class="col-3">상품명</th>
										<th class="col-2">가격</th>
										<th class="col-2">삭제유무</th>
										<th class="col-2">버튼</th>
									</tr>
								</thead>
								<tbody>
									<!-- DB추가 되면 테이블이 자동으로 생성되는 곳 -->
									<c:forEach var="productList" items="${productList}">
										<tr class="table-ho">
											<td data-product-num="${productList.product_num}">${productList.product_num}</td>
											<td data-product-cate="${productList.product_cate}">${productList.product_cate}</td>
											<td data-product-name="${productList.product_name}"><a href="productdetail?product_num=${productList.product_num}"><c:out value="${productList.product_name}"></c:out></a></td>
											<td data-product-price="${productList.product_price}"><fmt:formatNumber value="${productList.product_price}" pattern="#,### 원"/></td>
											<td data-product-yn="${productList.product_deleted}">${productList.product_deleted}</td>
											<td><button type="button" class="btn btn-danger btn-delete" data-toggle="modal" data-target="#product_delete" data-product-num="${productList.product_num}">삭제</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- data-toggle="modal" data-target="#product_delete" -->
							<div class="modal fade" id="product_delete">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">해당 상품을 삭제할까요?</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>
										<div class="modal-body">
											삭제를 진행할 시 상품페이지에 상품이 안 뜨게 됩니다.
											그래도 삭제를 진행 할까요?
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-success" data-dismiss="modal">취소</button>
											<form action="productdelete" method="post">
												<input type="hidden" id="product_num_input" name="product_num" value="${product_num}">
												<button type="submit" class="btn btn-danger">삭제</button>
											</form>
										</div>
									</div>
								</div>
							</div>
							<!-- pagination -->
							<nav>
							    <ul class="pagination justify-content-center">
							            <li class="page-item <c:if test='${page == 1}'>disabled</c:if>">
							                <a class="page-link" href="<c:if test='${page > 1}'>/admin/product-management?page=${page - 1}</c:if>">이전</a>
							            </li>
									<c:forEach begin="${startPage}" end="${endPage}" var="i">
									    <li class="page-item <c:if test='${i == page}'>active</c:if>">
									        <a class="page-link" href="/admin/product-management?page=${i}">${i}</a>
									    </li>
									</c:forEach>
						            <li class="page-item <c:if test='${page == totalPages}'>disabled</c:if>">
						                <a class="page-link" href="<c:if test='${page < totalPages}'>/admin/product-management?page=${page + 1}</c:if>">다음</a>
						            </li>
							        <li class="page-item ml-3">
							            <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#product_write">상품 등록</button>
							        </li>
							    </ul>
							</nav>
							<form action="product-management" method = "get">
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
							<!-- #product_write modal -->
							<div class="modal fade" id="product_write" tabindex="-1" role="dialog" aria-hidden="true">
								<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
									<div class="modal-content p-md-3">
										<div class="modal-header">
											<h4 class="modal-title">상품 등록</h4>
											<button class="close" type="button" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
										<div class="modal-body">
											<form action="productWrite" method="post" enctype="multipart/form-data">
												<div class="row">
													<!-- required : 반드시 입력해야 되는지 설정 true or false -->
													<div class="form-group col-lg-12">
														<label class="font-weight-bold text-small" for="product_category">카테고리<span class="text-primary ml-1">*</span></label>
														<br>
														<select name="product_cate" id="product_category">
															<option value="커피" selected>커피</option>
															<option value="푸드">푸드</option>
															<option value="머신">머신</option>
															<option value="굿즈">굿즈</option>
														</select>
														<!-- <input class="form-control" name="product_cate" id="product_category" type="text" placeholder="카테고리를 입력해주세요." required /> -->
													</div>
													<div class="form-group col-lg-12">
														<label class="font-weight-bold text-small" for="product_name">상품명<span class="text-primary ml-1">*</span></label>
														<input class="form-control" name="product_name" id="product_name" type="text" placeholder="상품명을 입력해주세요." required />
													</div>
													<div class="form-group col-lg-6">
														<label class="font-weight-bold text-small" for="product_price">상품가격<span class="text-primary ml-1">*</span></label>
														<input class="form-control" name="product_price" id="product_price" type="number" placeholder="상품가격을 입력해주세요.(숫자만)" required />
													</div>
													<div class="form-group col-lg-6">
														<label class="font-weight-bold text-small" for="product_stock">총 재고<span class="text-primary ml-1">*</span></label>
														<input class="form-control" name="product_stock" id="product_stock" type="number" placeholder="물건의 총 재고 수를 입력해주세요.(숫자만)" required />
													</div>
													<div class="form-group col-lg-12">
													    <label class="font-weight-bold text-small" for="notice_image">이미지
													    <span class="text-primary ml-1">*</span><span class="text-danger ml-1">(png, jpeg만 가능)</span></label>
													    <div class="custom-file">
													        <!-- 여러 개의 파일 선택을 지원하는 input 요소 -->
											                <input name="files" type="file" onchange="addFile(this);" id="product_imgs1" accept="image/png, image/jpeg" multiple />
													        <label class="custom-file-label" for="product_imgs1">이미지 파일을 선택해 주세요.</label>
													    </div>
													    <div class="file-list"></div>
													</div>
													<div class="form-group col-lg-12">
														<label class="font-weight-bold text-small" for="product_content">상품설명<span class="text-primary ml-1">*</span></label>
														<textarea class="form-control" name="product_content" id="product_content" placeholder="상품설명을 입력해 주세요."></textarea>
													</div>
													<div class="form-group col-lg-12">
														<input type="submit" class="btn btn-dark" value="상품 등록">
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							<!-- end of #product_write modal -->
							<!-- #product_edit modal -->
							<div class="modal fade" id="product_edit" tabindex="-1" role="dialog" aria-hidden="true">
								<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
									<div class="modal-content p-md-3">
										<div class="modal-header">
											<h4 class="modal-title">상품 수정</h4>
											<button class="close" type="button" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
										<div class="modal-body">
											<form action="#" method="post">
												<input type="hidden" id="product_num" name="product_num" />
												<div class="row">
													<!-- required : 반드시 입력해야 되는지 설정 true or false -->
													<div class="form-group col-lg-12">
														<label class="font-weight-bold text-small" for="product_category">카테고리<span class="text-primary ml-1">*</span></label>
														<select name="product_cate" id="product_category">
															<option value="커피" selected>커피</option>
															<option value="푸드">푸드</option>
															<option value="머신">머신</option>
															<option value="굿즈">굿즈</option>
														</select>
														<!-- <input class="form-control" id="product_category" type="text" placeholder="카테고리를 입력해주세요." required /> -->
													</div>
													<div class="form-group col-lg-12">
														<label class="font-weight-bold text-small" for="product_name">상품명<span class="text-primary ml-1">*</span></label>
														<input class="form-control" id="product_name" type="text" placeholder="상품명을 입력해주세요." required />
													</div>
													<div class="form-group col-lg-6">
														<label class="font-weight-bold text-small" for="product_price">상품가격<span class="text-primary ml-1">*</span></label>
														<input class="form-control" id="product_price" type="number" placeholder="상품가격을 입력해주세요.(숫자만)" required />
													</div>
													<div class="form-group col-lg-6">
														<label class="font-weight-bold text-small" for="product_stock">총 재고<span class="text-primary ml-1">*</span></label>
														<input class="form-control" id="product_stock" type="number" placeholder="물건의 총 재고 수를 입력해주세요.(숫자만)" required />
													</div>
													<div class="form-group col-lg-12">
														<label class="font-weight-bold text-small" for="notice_image">이미지1
														<span class="text-primary ml-1">*</span><span class="text-danger ml-1">(png, jpeg만 가능)</span></label>
														<div class="custom-file">
															<input class="custom-file-input" type="file" id="notice_image" accept="image/png, image/jpeg" required="" />
															<label class="custom-file-label" for="notice_image">이미지 파일을 선택해 주세요.</label>
														</div>
													</div>
													<div class="form-group col-lg-12">
														<input type="submit" class="btn btn-dark" value="상품 수정">
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							<!-- end of #product_edit modal -->
						</div>
						<div class="col-1">
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
	<br>
	</section>
	
	<!-- Bootstrap CSS, JS -->
	<script src="../script.js"></script>
	
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9648a29529.js" crossorigin="anonymous"></script>
</body>
</html>