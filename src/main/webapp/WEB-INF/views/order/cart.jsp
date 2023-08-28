<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../template/header.jsp"%>
<script>
    $(function() {
        $(".ipCount .number").on("focusout", function(e) {
            var count = Number($(this).val());
            var buyMin = 1;
            var buyMax = $(this).parents(".ipCount").data("buy-max");
            if (count < buyMin) {
                count = buyMin;
                $(this).val(buyMin);
            }

            if (count > buyMax) {
                alert('해당 상품은 ' + buyMax + '개 이상 구매하실 수 없습니다.');
                count = buyMax;
                $(this).val(buyMax);
            }
            var $optionEl = $(this).parent();
            var price = $optionEl.data("price");
            var $salePrice = $(this).parent().parent("li").find(".price");
            $salePrice.text(comma(price * count) + "원");

            updateTotalPrice();

            var $li = $(this).parent().parents("li");
            var cartId = $li.data("id");
            var quantity = count;

            cartUpdate(cartId, quantity);
        });

        // 수량 다운.
        $(".minus").click(function (e) {
            e.preventDefault();
            var $optionEl = $(this).parent();
            var $count = $optionEl.find(".number");
            var count = Number($count.val()) - 1;
            var buyMin = 1;
            if (count < buyMin) {
                count = buyMin;
            }

            $count.val(count);
            var price = $optionEl.data("price");
            var $salePrice = $(this).parent().parent("li").find(".price");
            $salePrice.text(comma(price * count) + "원");

            updateTotalPrice();

            var $li = $(this).parent().parents("li");
            var cartId = $li.data("id");
            var quantity = count;

            cartUpdate(cartId, quantity);
        });

        // 수량 업.
        $(".plus").click(function (e) {
            e.preventDefault();
            var $optionEl = $(this).parent();
            var $count = $optionEl.find(".number");
            var buyMax = $(this).parents(".ipCount").data("buy-max");
            var count = Number($count.val()) + 1;
            if (count > buyMax) {
                count = buyMax;
                alert('해당 상품은 ' + buyMax + '개 이상 구매하실 수 없습니다.');
            }
            $count.val(count);
            var price = $optionEl.data("price");
            var $salePrice = $(this).parent().parent("li").find(".price");
            $salePrice.text(comma(price * count) + "원");

            updateTotalPrice();

            var $li = $(this).parent().parents("li");
            var cartId = $li.data("id");
            var quantity = count;

            cartUpdate(cartId, quantity);
        });

        // 장바구니 체크박스 선택 시.
           $("input[name='cartChk']").change(function() {
            var cartId = $(this).attr("id").substring($(this).attr("id").indexOf("-") + 1, $(this).attr("id").length); //카트 아이디 가져오기.
            var cartCheckYn = $(this).prop("checked") ? "Y":"N"; // 카트체크여부.
            var quantity = $(this).parents("li").find(".number").val();

            cartUpdate(cartId, quantity, cartCheckYn);
            updateTotalPrice();
        });

        // 전체 체크박스 선택
        $("input[name='cartChkAll']").change(function() {
            var cartIds = [];
            var cartCheckYn;
            $("input[name='cartChk']").each(function() {
                var cartId = $(this).attr("id").substring($(this).attr("id").indexOf("-") + 1, $(this).attr("id").length); //카트 아이디 가져오기.
                cartCheckYn = $(this).prop("checked") ? "Y":"N"; // 카트체크여부.
                var quantity = $(this).parents("li").find(".number").val();
                cartIds.push(cartId);
            });

            cartsUpdate(cartIds, cartCheckYn);
            updateTotalPrice();
        });

        // 가격 업데이트
        updateTotalPrice();

        // 체크박스 업데이트
        if ($("input[name='cartChk']:not(:checked)").length == 0) {
            $("input[name='cartChkAll']").prop("checked", true);
        }

        // 옵션 아이템 클릭 (수량 올라가는것도 옵션임 여기 건드리면 click 이벤트 발생 X)
        $(".optionList").on("click", ".optionItem", function(e) {
            e.preventDefault();
        })
    });

    // 금액 셋팅 조건부 배송비무료는 나중에.. 다시 시도하기...
    function updateTotalPrice() {
    var totalPrice = 0;
    var totalCount = 0;

    $(".cartList").find("li").each(function() {
        if ($(this).find("input[name=cartChk]").prop("checked")) {
            var $quantity = $(this).find(".number");
            var quantity = Number($quantity.val());
            var price = $quantity.parents(".count").data("price");

            var productPrice = quantity * price;
            totalPrice += productPrice;
            totalCount++;
        }
    });
    
    var deliveryPrice = 2500;
    totalPrice += deliveryPrice;
    
    $("#deliveryPrice").text(comma(deliveryPrice)+ "원")
    $("#price").text(comma(totalPrice - deliveryPrice)+ "원");
    $("#totalPrice").text(comma(totalPrice)+ "원");
    $("#totalCount").text(comma(totalCount));
    if (totalPrice > 0) {
        $("#orderBtn").text(totalCount + "개 " + comma(totalPrice) + "원 주문하기");
    }
}

function order(cartId) {
    var $marketOrderForm = $("#marketOrderForm");
    var cartIds = [];
    $marketOrderForm.empty(); // 폼 초기화

    if (cartId) {
        $marketOrderForm.empty(); // 폼 초기화
        // 선택한 상품의 cart_num 값을 폼에 추가
        $marketOrderForm.append("<input type='hidden' name='cart_num' value='" + cartId + "' />");
        cartIds.push(cartId);
    } else {
        var count = 0;
        $(".cart-item").each(function() {
            var cartId = $(this).data("id");
            if ($(this).find("input[name='cartChk']").prop("checked")) {
                cartIds.push(cartId);
                count++;
            }
        });

        if (count < 1) {
            toastPop('주문하실 상품이 없습니다.', '', '', 'check');
            return;
        }
    }
    
    // 선택한 상품의 cart_num 값을 폼에 추가
    for (var i = 0; i < cartIds.length; i++) {
        $marketOrderForm.append("<input type='hidden' name='selectedCartNums' value='" + cartIds[i] + "' />");
    }
    
    // 서버로 요청 보내기 (주문 페이지로 이동)
    $marketOrderForm.submit();
}
</script>

<div id="wrap" class="subWrap cartListWrap"><!-- 서브 공통 class="subWrap" -->
    <!-- 내용 -->
    <div class="contents orderArea">
        <h2 class="areaTitle">장바구니</h2>
        <!-- 단계 -->
            <div class="step">
                <a href="javascript:;" class="on">01 장바구니</a>
                <a href="javascript:;">02 주문결제</a>
                <a href="javascript:;">03 주문완료</a>
            </div>

        <!-- //단계 -->
        <div class="tabArea">
            <!-- 탭 메뉴 -->
            <div class="tabMenu type1">
             <a href="/market/cart/list" class="on">일반배송</a>
                    </div>                     
            <!-- //탭 메뉴 -->
            <!-- 탭 내용 -->
            <div class="tabContArea">
                <!-- 일반배송 -->
                <div class="tabCont on">
                    <div class="layoutCol">
                        <!-- 상품 리스트 -->
                        <div class="layoutTd tdLft">
                            <!-- 주문 리스트 -->
								<div class="orderList">
									<!-- 전체선택 -->
									<div class="checkAll">
										<div class="check">
											<input type="checkbox" name="cartChkAll" id="cartChkAll">
											<label for="cartChkAll">전체선택
											</label>
										</div>
										<div class="btnDel">
											<a href="" class="cartDeleteAll">전체삭제</a>
										</div>
									</div>
									<!-- //전체선택 -->								
									<c:if test="${empty cart}">
									    <div style="margin: 150px auto; text-align: center;">
									        <span style="font-size:20px">장바구니에 담긴 상품이 없습니다.</span>
									    </div>
                                    </c:if>
									<c:forEach items="${cart}" var="cart">
									<input type="hidden" value="${cart.cart_num}" name="cart_num">
									<input type="hidden" value="${cart.imgList[0].img_url}" name="img_url">
									<input type="hidden" value="${cart.productVO.product_num}" name="product_num">
									<input type="hidden" value="${cart.productVO.product_name}" name="product_name">
									<input type="hidden" value="${cart.productVO.product_price}" name="product_price">
									<input type="hidden" value="${cart.productVO.product_price * cart.product_count}" name="totalPrice">
									<div class="checkEach">
										<ul class="cartList" style="padding-bottom:0px;">
											<li class="cart-item " data-id="${cart.cart_num}">
												<!-- 체크박스 -->
												<div class="check">
													<input type="checkbox" name="cartChk" id="cartChk-${cart.cart_num}" checked="checked"> 
                                                    <label for="cartChk-${cart.cart_num}"><span class="blind">상품 선택</span></label>
												</div> <!-- //체크박스 --> 
												<!-- 썸네일 이미지 -->										
												<div class="imgArea">
													<a href="/productmaindetail?product_num=${cart.productVO.product_num}" class="thumbImg">
														<img src="${cart.imgList[0].img_url}" alt="${cart.productVO.product_name} 썸네일 이미지">
													</a>

												</div> <!-- //썸네일 이미지 --> <!-- 정보 -->
												<div class="infoArea">
													<strong class="title"> 
														<a href="/productmaindetail?product_num=${cart.productVO.product_num}">${cart.productVO.product_name}</a>
													</strong>
												</div> <!-- //정보 -->
												<div class="count ipCount" data-origin-price="${cart.productVO.product_price}" data-price="${cart.productVO.product_price}" data-free-delivery-order-price="50000" data-delivery-price="2500" data-buy-max="1000">
													<input type="number" name="count" id="productCount" value="${cart.product_count}" class="number">													
													 <a href="" class="minus"><span class="blind">빼기</span></a>
													 <a href="" class="plus"><span class="blind">더하기</span></a>
												</div>
												<div class="total">
													<span class="price"><fmt:formatNumber pattern="###,###,###" value="${cart.productVO.product_price * cart.product_count}"/>원</span>
												</div>
												<div class="btnDel">
				                                    <a href="#" onclick="cartDelete(${cart.cart_num}); return false;" class="iconS"><span class="blind">장바구니에서 삭제하기</span>
                                                    </a>
												</div>
											</li>
										</ul>										
									</div>
									</c:forEach>
								</div>
								<!-- 버튼 -->
                            <div class="btnSelect">
                                <a href="../category/depth2/CoffeAll.jsp" class="btnStyle-8">계속 쇼핑하기</a>
                                <a href="javascript:order()" class="btnStyle-8">주문하기</a>                               
                            </div>
                            <!-- //버튼 -->
                            <!-- //주문 리스트 -->
                        </div>
                        <!-- //상품 리스트 -->
                        <!-- 배송지/금액/주문버튼 -->
							<div class="layoutTd tdRgt">

								<!-- 금액 -->
								<div class="section orderPrice">
									<ul class="amountList">
										<li class="amountSet"><strong class="title">상품금액</strong>
											<span class="price" id="price"></span>
										</li>
										<li class="amountSet"><strong class="title">배송비</strong>
											<span class="price" id="deliveryPrice">2,500</span>
										</li>
									</ul>
									<!-- 총결제금액 -->
									<div class="sumPrice">
										<strong class="title">총결제금액</strong><span class="price" id="totalPrice"></span>
										<p class="emphasis">구매 확정시 <b>증정품 이벤트 진행중!</b></p>
									</div>
									<!-- //총결제금액 -->
								</div>
								<!-- //금액 -->
								<!-- 주문하기 -->
								<div class="btn btnOrder">
									<a href="javascript:order()" class="btnStyle-2">주문하기</a>            							
								</div>
								<!-- //주문하기 -->
							</div>
							<!-- //배송지/금액/주문버튼 -->
                    </div>
                </div>
                <!-- //일반배송 -->
            </div>
            <!-- //탭 내용 -->
        </div>
    </div>
    <!-- //내용 -->
</div>
<!-- 삭제 관련 스크립트 위치가 여기인 이유는 페이지가 전부 로드된후 삭제 기능을 실행하기 위해서임 안그러면 삭제 안됨! -->
<script>
function cartDelete(cart_num) {
    $.ajax({
        type: "POST",
        url: "/order/cartDelete",
        dataType: "json",
        data: { "cart_num": cart_num },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        },
        success: function (data) {
            if (data == 1) {
                alert("상품이 장바구니에서 삭제되었습니다");
                location.reload();
            }
        }
    });
}

$(".cartDeleteAll").click(function() {
    cartDeleteAll();
});

var confirmDelete = false; // 확인 창이 이미 떴는지 여부를 저장하는 변수

function cartDeleteAll() {
    if (!confirmDelete) { // 확인 창이 떠있지 않은 경우에만 실행 이거 안쓰면 장바구니 상품 data 갯수만큼 alert창 뜸 지옥임
        confirmDelete = confirm("장바구니를 모두 삭제하시겠습니까?");
        if (confirmDelete) {
            $.ajax({
                type: "POST",
                url: "/order/cartDeleteAll",
                dataType: "json",
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                },
                success: function (data) {
                    if (data > 0) {
                        alert(data + "개의 상품이 장바구니에서 삭제되었습니다.");
                        location.reload();
                    }
                }
            });
        }
    }
}
</script>

<form id="marketOrderForm" action="/order/orderView" method="post"></form>

<%@include file="../template/footer.jsp"%>