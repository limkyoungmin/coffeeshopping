<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../../template/header.jsp"%>

<script type="text/javascript">
		$(function() {
					window._ui.detail.init();				
				})
				
				 // 수량 최대값 설정
    $(".cartList").on("keyup", ".number", function(e) {
        var buyMax = $(this).parents(".ipCount").data("buy-max");
        var quantity = Number($(this).val());
        if (quantity > buyMax) {
            $(this).val(buyMax);
            return;
        }
        if (quantity < 1) {
            $(this).val(1);
        }
        calculate();
    })
    
    //수량 minus plus 이벤트 발생
    $(function() {
    $('.detailSection .cart').on('click', function(e){
        e.preventDefault();
        if ($(this).hasClass("options")) {
            var options = new Array();
            $(".sltOptionBox").each(function() {
                var optionQuantity = Number($(this).find(".number").val());
            });
        }
    });

    // 옵션 수량 조절 minus (-)
    $(".cartList").on("click", ".minus", function(e) {
        e.preventDefault();
        var $quantity = $(this).parents(".item").find(".number");
        var quantity = Number($quantity.val());
        if (quantity < 2) {
            return;
        }
        quantity -= 1;
        $quantity.val(quantity);
        calculate();
    });

    // 옵션 수량 조절 plus (+)
    $(".cartList").on("click", ".plus", function(e) {
        e.preventDefault();
        var buyMax = $(this).parents(".ipCount").data("buy-max");
        var $quantity = $(this).parents(".item").find(".number");
        var quantity = Number($quantity.val());
        quantity += 1;
        $quantity.val(quantity);
        calculate();
    });
    calculate();
});

// 금액 계산

    function calculate() {
        var optionTotalPrice = 0;
        var totalPrice = 0;
        // 옵션들 먼저 계산
        $(".count.option").each(
                function() {
                    var optionPrice = Number($(this).data("price"));
                    var optionQuantity = Number($(this).find(".number").val());
                    optionTotalPrice += (optionPrice * optionQuantity);
                    $(this).parents(".item").find(".each.num").text(
                            comma(optionPrice * optionQuantity));
                });

        $(".additonalOptionWrap").find(".tabRadio").each(function() {
            var $selectRadio = $(this).find("input[type=radio]:checked");
            var optionPrice = Number($selectRadio.data("price"));
            optionTotalPrice += optionPrice;
        });

        $(".count.product").each(
                function() {
                    var price = Number($(this).data("price"));
                    var quantity = Number($(this).find(".number").val());
                    
                    // 총 금액 계산 ( 옵션 가격 먼저 더함)
                    $(this).parents(".item").find(".each.num").text(
                            comma(price * quantity));
                    totalPrice += ((price + optionTotalPrice) * quantity);
                });

        var ordertotalPrice = totalPrice + optionTotalPrice;
        $("#totalPrice").text(comma(totalPrice + optionTotalPrice));
    }

    $(document).ready(function() {
        $("#cartInsert").on("click",function() {
        	//추가
        	 var count = parseInt($("#productCount").val());
        	
            $.ajax({
                type : "POST",
                url : "/addcart",
                dataType : "json",
                data : {
                	'product_num': $(this).data('product_num'),
                	'product_count': count  // product_count 값 //추가
                },
                error : function(request,status,error) {
                    alert("code:"+ request.status+ "\n"+ "message:"+ request.responseText+ "\n"+ "error:"+ error);
                },
                success : function(data) {
                    if (data == 1) {
                    	toastPop('장바구니에 추가되었습니다.', '', '', 'check');
                    } else if (data == 2) {
                    	toastPop("이미 추가 된 상품입니다");
                    }
                }
            });
        })
    })
    
        $(document).ready(function() {
        $("#buyInsert").on("click",function() {
            //추가
             var count = parseInt($("#productCount").val());
            
            $.ajax({
                type : "POST",
                url : "/buyDirect",
                dataType : "json",
                data : {
                    'product_num': $(this).data('product_num'),
                    'product_count': count  // product_count 값 //추가
                },
                error : function(request,status,error) {
                    alert("code:"+ request.status+ "\n"+ "message:"+ request.responseText+ "\n"+ "error:"+ error);
                },
                success : function(data) {
                    if (data == 1) {
                    	window.location.href = "/order/cart";
                    } else if (data == 2) {
                        toastPop("이미 장바구니에 추가 된 상품입니다");
                    }
                }
            });
        })
    })

</script>
	<!--  -->
	<div id="wrap" class="subWrap marketDetailWrap">
		<!-- 서브 공통 class="subWrap" -->
		<!-- 내용 -->
		<div class="contents detailArea incCat">
			<!-- 상세페이지 공통 class="detailArea", 카테고리가 있는 경우 "incCat" -->

			<div class="detailCont">
				<!-- 경로 -->
				<div class="currentPath">
					<a href="/" class="iconS"><span class="blind">메인</span></a> 
				    <c:choose>
				        <c:when test="${productmaindetail.product_cate eq '커피'}">
				            <a href="productCoffeeList">커피</a>
				        </c:when>
				        <c:when test="${productmaindetail.product_cate eq '푸드'}">
				            <a href="productFoodList">푸드</a>
				        </c:when>
				        <c:when test="${productmaindetail.product_cate eq '굿즈'}">
				            <a href="productGoodsList">굿즈</a>
				        </c:when>
				        <c:when test="${productmaindetail.product_cate eq '머신'}">
				            <a href="productMachineList">머신</a>
				        </c:when>
				    </c:choose>
				</div>
				<!-- //경로 -->
				<div class="rowTop">
					<!-- 상품 이미지 -->
					<div class="imgArea zoomSection">
						<div
							class="in swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events">
							<ul class="swiper-wrapper" id="swiper-wrapper-a3161e0f9541580e" aria-live="polite" style="transform: translate3d(0px, 0px, 0px);">
							
								<li class="thumbImg swiper-slide swiper-slide-active" role="group" aria-label="1 / 2" style="width: 500px;">
								<img src="${productmaindetail.imgList[0].img_url}" alt="상품 이미지 1"></li>

								<li class="thumbImg swiper-slide swiper-slide-next" role="group" aria-label="2 / 2" style="width: 500px;">
								<img src="${productmaindetail.imgList[1].img_url}" alt="상품 이미지 2"></li>
							</ul>
							
							<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
						</div>
						
						<div thumbsslider="" class="out swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events swiper-container-thumbs">
							<ul class="swiper-wrapper" id="swiper-wrapper-6f08579ccf8d0ef8" aria-live="polite" style="transform: translate3d(0px, 0px, 0px);">
							
								<li class="gallery swiper-slide swiper-slide-visible swiper-slide-active swiper-slide-thumb-active" role="group" aria-label="1 / 3" style="width: 160px; margin-right: 10px;">								
									<div class="thumbImg">
										<img src="${productmaindetail.imgList[0].img_url}" alt="상품 이미지 1">
									</div>
								</li>

								<li class="gallery swiper-slide swiper-slide-visible swiper-slide-next" role="group" aria-label="2 / 3" style="width: 160px; margin-right: 10px;">									
									<div class="thumbImg">
										<img src="${productmaindetail.imgList[1].img_url}" alt="상품 이미지 2">
									</div>
								</li>

								<li class="gallery swiper-slide swiper-slide-visible" role="group" aria-label="3 / 3" style="width: 160px; margin-right: 10px;"></li>
							</ul>
							<!-- 네비게이션 -->
							<div class="swiper-arrow next swiper-button-disabled" tabindex="-1" role="button" aria-label="Next slide" aria-controls="swiper-wrapper-6f08579ccf8d0ef8" aria-disabled="true"></div>
							<div class="swiper-arrow prev swiper-button-disabled" tabindex="-1" role="button" aria-label="Previous slide" aria-controls="swiper-wrapper-6f08579ccf8d0ef8" aria-disabled="true"></div>
							<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
						</div>
					</div>
					<!-- //상품 이미지 -->
					<div class="detailSection">
						<div class="infoArea">
							<h2 class="title">${productmaindetail.product_name}</h2>
								<span class="notes">
									<em class="noteTit"><br>
										<br>
										<br><b>novocozy 에서는 최고급 품질을 자랑합니다.</b>
										<br>
										<br>최상의 품질과 뛰어난 맛, 향과 기술을 추구하여 고객님께 특별한 경험을 선사하고자 합니다.
										<br>그리고 세심한 관리와 정성스러운 검수 과정을 통해 더욱 특별한 취급하고 있습니다.
										<br>novocozy 는 고객님의 시간을 더욱 특별하게 만들어드릴 것입니다.
								</em></span> 
								<em class="price"><fmt:formatNumber value="${productmaindetail.product_price}" pattern="#,### 원"/></em>
						</div>
						<div class="subInfo">
							<dl class="infoList togType2">
								<dt class="">로스팅</dt>
								<dd class=""><fmt:formatDate pattern = "yyyy.MM.dd" value="${productmaindetail.product_date}"/></dd>
								<dt>배송안내</dt>
								<c:choose>
							        <c:when test="${productmaindetail.product_cate eq '커피'}">
							            <dd><p class="fs">원두 구매시 로스팅 일자 상품이 있으시면 주문 메세지에 별도로 입력해주시기 바랍니다.</p></dd>
							        </c:when>
							        <c:when test="${productmaindetail.product_cate eq '푸드'}">
							            <dd><p class="fs">푸드 주문시 원하는 배송날짜가 있으시면 메세지에 별도로 입력해주시기 바랍니다.</p></dd>
							        </c:when>
							        <c:when test="${productmaindetail.product_cate eq '굿즈'}">
							            <dd><p class="fs">굿즈 주문시 주문제작 이므로 시간이 조금 걸립니다. 부디 양해 바랍니다.</p></dd>
							        </c:when>
							        <c:when test="${productmaindetail.product_cate eq '머신'}">
							            <dd><p class="fs">머신 주문시 반드시 설치기사가 방문 하오니 양해 바랍니다.</p></dd>
							        </c:when>
						        </c:choose>
								<dd><p class="fs">상품별 출고예정일이 다를 시 가장 늦은 상품 기준으로 모두 함께 배송됩니다.</p></dd>
							</dl>
							
							<div class="priceArea">
								<ul class="sltItem cartList">
									<li class="item sltOptionBox">
										<span class="info"> <strong class="name">${productmaindetail.product_name}</strong> </span> 
										<div class="count option ipCount" data-price="${productmaindetail.product_price}" data-buy-max="1000">
											<input type="number" name="count" id="productCount" value="1" class="number"> 
											<a href="" class="minus"><span class="blind">빼기</span></a> 
											<a href="" class="plus"><span class="blind">더하기</span></a>
										</div> 
										<em class="price"><span class="each num">${productmaindetail.product_price}</span>원</em> 
									</li>
								</ul>
								<div class="totalPrice">
									<div class="fr">
										<strong class="tit">총 상품금액</strong><em class="num" id="totalPrice">0</em><span class="unit">원</span>
									</div>
								</div>
							</div>
							<!-- //금액 -->
							<!-- 버튼 -->
							<div class="btnArea btn">
								<!-- 회원 구매 -> 이건 바로 장바구니 창으로 넘어가게 만들어버리기 -->
								<button type="button" id="buyInsert" class="btnStyle-2 options" style=width:300px; data-product_num="${productmaindetail.product_num}">구매하기</button>
								<!-- 회원 장바구니 -->
								<!-- 중요부분 -->
								<button type="button" id="cartInsert" class="btnStyle-4 btnCart cart options" style="width:300px;" data-product_num="${productmaindetail.product_num}">장바구니</button>
							</div>
							<!-- //버튼 -->
						</div>
					</div>
					<!-- //상품 정보 -->
				</div>
				<!-- 탭 -->
				<div class="tabArea">
					<!-- 탭 메뉴 -->
					<div class="anchorMenu" style="height: 62px;">
						<div class="anchorInner">
							<a href="#anchorInfo" class="on">상세정보</a> <a href="#anchorReview">후기</a>
						</div>
					</div>
					<!-- //탭 메뉴 -->
					<!-- 탭 내용 -->
					<div class="anchorCont">
						<!-- 상세정보 -->
						<div id="anchorInfo" class="section infoBox">
							<div style="text-align: center;">
								<img src="${productmaindetail.imgList[2].img_url}" style="font-family: &amp; amp;"><br>
							</div>
							<!-- 구매안내 -->
							<div id="anchorGuide" class="section guideBox">
								<div class="innerBox">
									<h3 class="innerTitle">상품 구매 안내</h3>
									<!-- 1set -->
									<h4 class="guideTitle">상품결제정보</h4>
									<ol class="depth1">
										<li>배송 준비가 시작되는 배송 준비 중부터 취소 및 정보 변경이 불가합니다.</li>
										<li>휴대폰 결제는 당월(1일~말일) 취소만 가능하며, 부분 취소가 불가합니다.</li>
										<li>계좌이체 사용시 개인정보보호 및 거래의 안전을 위해 실명인증된 본인 명의 계좌를 입력해 주세요.(잔액 부족시 결제 불가)</li>
									</ol>
									<!-- //1set -->
									
									<h4 class="guideTitle">배송정보</h4>
									<ul class="depth1">
										<li>평일 오후 2시까지 결제 완료된 건(네이버페이 주문 제외)는 우체국 택배로 당일 발송되며, 발송일로부터 1~3일 내에 수령이 가능합니다.(주말, 공휴일은 제외)</li>
										<li>배송료: 5만원 이상 구매 시 무료이며 5만원 미만이면 배송비 2,500원이 추가됩니다.</li>
										<li>포장: 커피를 분할하여 포장해드리지 않습니다. 500g 주문하시면 500g 봉투에 포장되어 발송됩니다.(묶음 발송 및 분할 발송 서비스는 제공하지 않습니다.)</li>
									</ul>
									<h4 class="guideTitle">교환 및 반품정보</h4>
									<ul class="depth1">
										<li>교환/반품은 상품 수령일로부터 3일 이내에 1:1문의를 통해 접수해주세요.(마이페이지&gt;주문내역&gt;1:1문의)</li>
										<li>다음과 같은 경우는 교환/반품이 불가합니다.
											<ul class="depth2">
												<li>- 원두(드립백 포함), 생두, 식품은 신선 제품입니다. 고객의 변심에 의한 교환/반품은 불가합니다.</li>
												<li>- 기물, 도서는 개봉 및 상품 가치 훼손 시 교환/반품이 불가합니다.</li>
											</ul>
										</li>
										<li>오배송 및 상품 하자로 인한 교환/반품 배송비는 노보코지가 부담합니다.</li>
										<li>일반 교환/반품의 경우, 고객이 왕복 배송비(5,000원, 우체국 택배 착불)를 부담합니다.</li>
									</ul>
									<h4 class="guideTitle">적립 안내</h4>
									<ol class="depth1">
										<li>결제 금액의 1%가 적립금으로 적립되며, 1,000원 이상일 때 1원부터 사용 가능합니다.</li>
										<li>멤버십 등급에 따른 쿠폰 조건달성: 최근 6개월간 누적 금액 달성 조건에 따라, 매년 1/1, 7/1 시점에 회원 등급이 새롭게 부여됩니다.</li>
									</ol>
								</div>
							</div>
							<!-- //구매안내 -->
						</div>
						<!-- //상세정보 -->
						<!-- 구매안내 -->
						<div id="anchorReview" class="section guideBox">
							<div class="contBox">
								<!-- 질문 리스트 -->
								<div class="colTitle">
									<h1
										style="text-align: center; margin-bottom: 50px; font-size: 30px;">후기</h1>
								</div>
								<div class="myTable">
									<table class="qnaTable type2 togType2">
										<caption>후기 작성하는 표</caption>
										<colgroup>
											<col style="width: 180px">
											<col style="width: auto">
											<col style="width: 230px">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">번호</th>
												<th scope="col">제목</th>
												<th scope="col">등록일</th>
												<th scope="col">작성자</th>
											</tr>
										</thead>
										<tbody>
											<tr class="question togAct">
												<td class="sml" style="padding-right: 30px;">5</td>
												<td class="alignLeft fs16"><a href="#" class="togBtn">
														<span>후기 제목들어갈 자리 </span><br> <span>별점들어갈 자리</span>
												</a></td>
												<td class="sml">2023.07.07</td>
												<td class="sml">작성자</td>
											</tr>
											<tr class="answer">
												<td colspan="4">멤버십 쿠폰은 조건달성(등급별 기준 누적 구매금액 참고) 즉시 등급
													조정과 동시에 자동 지급되며, 결제 단계에서 사용 가능합니다.&nbsp;
													<div>
														사용 가능한 쿠폰이 있을 시 쿠폰 적용 버튼이 활성화되며,&nbsp;<span
															style="background-color: transparent;">적립금의 경우
															1,000원 이상일 때 1원부터 사용 가능하며 1,000원 이상 보유 시 적립금 칸이 활성화됩니다.</span>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- //탭 내용 -->
					</div>
					<!-- //탭 -->
				</div>
			</div>
			<!-- //내용 -->
		</div>
		<!-- //컨텐츠 -->
		</div>

<%@include file="../../template/footer.jsp"%>