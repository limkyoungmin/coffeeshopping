<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../template/header.jsp"%>

<script type="text/javascript">
    var isLoading = false;
    var page = 1;
    $(function() {
        $(window).scroll(function() {
            if (!isLoading && ($(window).scrollTop() >= $(document).height() - $(window).height() - 110)) {
                paging();
            }
        });

        showPopup()
    });

    function paging() {
        var totalPages = $("#totalPages").val();
        var categoryId = $("#productListForm").find("input[name=categoryId]").val();
        var rows = $("#productListForm").find("input[name=rows]").val();
        if (!isLoading) {
            if (++page <= totalPages) {
                isLoading = true;
                $.ajax({
                    url : contextPath + "/product/list",
                    type: "GET",
                    dataType: "html",
                    data: { page : page
                        , categoryId : categoryId
                        , rows: rows
                    },
                    success: function(html) {
                        $(".listWrap").append(html);
                        isLoading = false;
                    }, 
                    error: function() {
                        isLoading = false;
                    }
                });
            }
        }
    }

    function showPopup() {
        var popupCnt = 0;

        if(popupCnt > 0){
            cookiedata = document.cookie;
            if (cookiedata.indexOf("marketMainPopup=done") < 0 ) {
                $("#popMainFirst").show();
            }
        }
    };   
</script>

	<div id="wrap" class="subWrap productListWrap"><!-- 서브 공통 class="subWrap" -->
		<!-- 내용 -->
		<div class="contents incCat">
			<!-- 카테고리가 있는 경우 "incCat" -->
			<!-- 카테고리 탭 -->
			<div class="menuSlide">
				<!-- depth1 -->
				<div class="innerSlide">
					<ul class="depth1">
						<li>
							<a href="productCoffeeList" data-category-id="5" data-category-nm="커피" data-depth="2"><span>커피</span></a>
						</li>
						<li>
							<a href="productFoodList" data-category-id="6" data-category-nm="푸드" data-depth="2"><span>푸드</span></a>
						</li>
						<li>
							<a href="productMachineList" data-category-id="7" data-category-nm="머신" data-depth="2"><span>머신</span></a>
						</li>
						<li class="on">
							<a href="productGoodsList" data-category-id="8" data-category-nm="굿즈" data-depth="2"><span>굿즈</span></a>
						</li>
					</ul>
				</div>
				<!-- //depth1 -->

				<!-- 배너 -->
				<div class="bannerArea">
					<img src="/images/banner/banner1.png" alt="커피 배너"><!-- 교체필요  -->
				</div>
				<!-- //배너 -->				

			</div>
			<!-- //카테고리 탭 -->
			<div class="innerContents">
				<div class="mainSection">
					<div class="listStyle">
						<ul class="listWrap">
							<script type="text/javascript">
								$(document).ready(
										function() {
											var totalPages = '1';
											var total = '10';
											$(".listCount").find("span > em")
													.text(comma(total));
											$("#totalPages").val(totalPages);
										});
							</script>
							<c:forEach var="productGoodsList" items="${productGoodsList}">
								<li class="listSet swiper-slide" data-product-id="156" data-price="32500">
									<div class="imgArea">
										<div class="thumbImg">
											<img data-src="${productGoodsList.imgList[0].img_url}" alt="게이샤 G1 워시드 에티오피아 썸네일 이미지" src="${productGoodsList.imgList[0].img_url}">
										</div>
									</div>
									<div class="infoArea">
										<strong class="title">${productGoodsList.product_name}</strong>
										<span class="subScript">${productGoodsList.product_content}</span> 
										<span class="subScript">출시날짜 : <fmt:formatDate pattern = "yyyy.MM.dd" value="${productGoodsList.product_date}"/></span> 
										<em class="price"><fmt:formatNumber value="${productGoodsList.product_price}" pattern="#,### 원"/></em>
									</div> 
									<a href="productmaindetail?product_num=${productGoodsList.product_num}" class="btnViewDetail"><span class="blind">상품 상세 보기</span></a>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- //내용 -->
	</div>

	<form id="productListForm">
		<input type="hidden" id="totalPages" name="totalPages" value="1">
		<input type="hidden" id="categoryId" name="categoryId" value="10">
		<input type="hidden" id="rows" name="rows" value="50">
	</form>
	
	<%@include file="../../template/footer.jsp"%>

