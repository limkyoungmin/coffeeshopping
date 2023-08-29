<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<%@include file="../template/header.jsp"%>

<script type="text/javascript">
	var totalPrice = '';
	
	$(function() {
	    
        $("#buyerName").on("focusout", function() {
            $(this).val( $(this).val().replace(/[^a-zA-Z0-9ㄱ-힇]/gi,"") );
        });

	    // 셀렉트박스
	    $(".sltList li").on('click', function(e) {
	    	e.preventDefault();
	    	var txt = $(this).find("a").text();
	    	$(this).parents(".selectArea").removeClass("on").find(".sltCurrent").text(txt);
	    	if (txt == '직접입력') {
	    		$(this).parents(".selectArea").next(".textarea").show();
		    } else {
		    	$(this).parents(".selectArea").next(".textarea").hide();
			}
		})
	});

$(document).ready(function() {
    function orderAdd() {
        var paymentAgree = $("#paymentAgree").prop("checked");
        if (!paymentAgree) {
            $("#paymentAgree").focus();
            toastPop('결제 진행 필수 동의가 필요합니다.');
            return;
        }

		var buyerName = $("#buyerName").val();
		if (buyerName == '') {
			$("#buyerName").focus();
			toastPop('보내시는분 성함을 입력해주세요.');
			return;
		}

		var buyerPhone = $("#buyerPhone").val();
		if (buyerPhone == '') {
			$("#buyerPhone").focus();
			toastPop('보내시는분 전화번호를 입력해주세요.');
			return;
		}
		
		var receiverName = $("#receiverName").val();
        if (receiverName == '') {
            $("#receiverName").focus();
            toastPop('받으시는분 성함을 입력해주세요.');
            return;
        }
        
        var zonecode = $("#zonecode").val();
        if (zonecode == '') {
        	toastPop('받으시는 분 주소를 입력해주세요.');
            return;
        }
        
        var addressdetail = $("#addressdetail").val();
        if (addressdetail == '') {
        	toastPop('받으시는 분 상세주소를 입력해주세요.');
            return;
        }
        
     // 요청사항
        var orderRequestMsg = $("#selectAreaReqMsg").text();
        if (orderRequestMsg == '직접입력') {
            orderRequestMsg = $("#reqMsgTxtArea").val();
        }
        $("#orderRequestMsg").val(orderRequestMsg);
        
        iamport();
    }
    
    $("#orderButton").click(orderAdd);
 
 	// 결제방법 선택
 	function orderCheckCode() {
 		$('#kakaopay').change(function () {
            if ($(this).prop('checked')) {
                $('#inicis').prop('checked', false);
            }
        });

        $('#inicis').change(function () {
            if ($(this).prop('checked')) {
                $('#kakaopay').prop('checked', false);
            }
        });
 	}
 	orderCheckCode();

 	// 결제
 	function iamport() {
    var IMP = window.IMP;
    IMP.init("imp74386531");
    
    var selectorder = null;
	if($('#kakaopay').prop('checked')){
		selectorder = "kakaopay";
	} else if($('#inicis').prop('checked')){
		selectorder = "html5_inicis";
	}
    
    IMP.request_pay(
        {
        	pg : selectorder,
            pay_method: "card",
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: "NOVOCOZY 상품결제",
            amount: 100,/* parseInt($("#LastTotalPrice").text().replace(/[^0-9]/g, "")), */
            buyer_email: $("#buyerEmail").val(),
            buyer_name: $("#buyerName").val(),
            buyer_tel: $("#buyerPhone").val(),
            buyer_addr: $("#address").val(),
            buyer_postcode: $("#zonecode").val(),
        },
        function (rsp) {
            if (rsp.success) {
                console.log(rsp);
             var msg = '결제가 완료되었습니다. 감사합니다 :)'
             /*msg += '고유ID : ' + rsp.imp_uid;
             msg += '상점 거래ID : ' + rsp.merchant_uid;
             msg += '결제 금액 : ' + rsp.paid_amount;
             msg += '카드 승인번호 : ' + rsp.apply_num; */
            
            $("#merchant_uid").val(parseInt(rsp.merchant_uid));
            
            insertOrder();
            
            window.location.href = "/order/ordercomplete";
        }else{
        	var msg = '결제에 실패하였습니다.';
        }
            alert(msg);
           });
     }
 	
 	function insertOrder(){
 	    var orderDetails = []; // 주문 상세 정보 배열
 	    
 	    // 주문 리스트를 순회하며 주문 상세 정보를 배열에 추가
 	    <c:forEach items="${orderList}" var="order">
 	        var detail = {
 	            "product_name": "${order.productVO.product_name}",
 	            "product_price": ${order.productVO.product_price},
 	            "product_count": ${order.product_count},
 	            "product_num": ${order.productVO.product_num}
 	        };
 	        orderDetails.push(detail);
 	    </c:forEach>
 	    
 	    var orderdetailData={
 	    		"users_id" : $("#users_id").val(),
 	            "order_name" : $("#receiverName").val(),
 	            "order_zonecode" : $("#zonecode").val(),
 	            "order_address" : $("#address").val(),
 	            "order_addressdetail" : $("#addressdetail").val(),
 	            "order_phone" : $("#receiverPhone").val(),
 	            "order_deliverymsg" : $("#deliverymsg").val(),
 	            "order_buyer_name" : $("#buyerName").val(),
 	            "order_buyer_phone" : $("#buyerPhone").val(),
 	            "order_buyer_email" : $("#buyerEmail").val()
 	    }
 	    
 	    var RequestData = {
 	    		"orderDetails": orderDetails,
 	    		"orderdetailData" : orderdetailData
 	    };
 	    
 	    $.ajax({
 	        type: "POST",
 	        url: "/insertOrder",
 	        contentType: 'application/json',
 	        data: JSON.stringify(RequestData),
 	        success: function (response) {
 	            // 주문 내역 추가 후 처리 (예: 페이지 리디렉션)
 	        },
 	        error: function (error) {
 	            // 오류 처리
 	        }
 	    });
 	}

});
 	
function findPostCode() {
    new daum.Postcode({
        oncomplete : function(data) {
            var oldAddress = data.jibunAddress.length > 0 ? data.jibunAddress : data.autoJibunAddress;
            var zonecode = data.zonecode;
            var roadAddress = data.roadAddress.length > 0 ? data.roadAddress : data.autoRoadAddress;
            var buildingCode = data.buildingCode;
            var postcode = data.postcode;

            $("#zonecode").val(zonecode);
            $("#oldAddress").val(oldAddress);
            $("#address").val(roadAddress);
            $("#postCode").val(postcode);
            $("#addressdetail").val("").focus();
            $("#buildingCode").val(buildingCode);

        }
    }).open();
}
    
    
</script>

<div id="wrap" class="subWrap paymentWrap"><!-- 서브 공통 class="subWrap" -->
<!-- 내용 -->
<div class="contents orderArea">
    <h2 class="areaTitle">주문결제</h2>
    <!-- 단계 -->
    <div class="step">
        <a href="javascript:;">01 장바구니</a>
        <a href="javascript:;" class="on">02 주문결제</a>
        <a href="javascript:;">03 주문완료</a>
    </div>
    <!-- //단계 -->
    <div class="layoutCol">
        <div class="tdLft">
            <!-- 주문내역 -->
            <div class="layoutTd">
                <span class="subTitle">주문내역</span>
                <div class="orderList">
                    <ul class="cartList">
                    <c:set var="totalPrice" value="0" />
                    <c:forEach items="${orderList}" var="order">
                            <li>
                                <!-- 썸네일 이미지 -->
                                <div class="imgArea">
                                    <a href="/productmaindetail?product_num=${order.productVO.product_num}" class="thumbImg">
                                        <img src="${order.imgList[0].img_url}" alt="게이샤 g1 워시드 에티오피아썸네일 이미지">
                                    </a>
                                </div>
                                <!-- //썸네일 이미지 -->
                                <!-- 정보 -->
                                <div class="infoArea">
                                    <strong class="title">
                                        <a href="/productmaindetail?product_num=${order.productVO.product_num}">${order.productVO.product_name}</a>
                                    </strong>
                                </div>
                                <!-- //정보 -->
                                <div class="number">
                                    <span>${order.product_count}개</span>
                                </div>
                                <div class="total">
                                    <span class="price"><fmt:formatNumber pattern="###,###,###" value="${order.productVO.product_price * order.product_count}"/>원</span>
                                </div>
                                 <c:set var="totalPrice" value="${totalPrice + (order.productVO.product_price * order.product_count)}" />
                            </li>
                        </c:forEach>
                    </ul>
                </div>
        </div>
            <!-- //주문내역 -->
            <!-- 주문자 정보 -->
            <div class="layoutTd">
                <h3 class="subTitle">주문자 정보</h3>
                <div class="formArea formBtn">
                    <label for="buyerName">보내시는 분</label>
                    <input type="text" id="buyerName" name="order_buyer_name" class="ip_txt" value="${user.users_name}">
                </div>
                <div class="formArea formBtn">
                    <label for="buyerTel">연락처</label>
                    <input type="number" id="buyerPhone" name="order_buyer_phone" class="ip_txt" value="${user.users_phone}" maxlength="12" oninput="maxLengthChk(this)">
                </div>
                <div class="formArea formBtn">
                    <label for="email">이메일</label>
                    <input type="email" id="buyerEmail" name="order_buyer_email" class="ip_txt" value="${user.users_email}">
                    <ul class="guideList">
                        <li>- 이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요.</li>
                    </ul>
                </div>
            </div>
            <!-- //주문자 정보 -->
            <!-- 배송지 -->
            <div class="layoutTd">
                <h3 class="subTitle">배송지 정보</h3>
                
                <div class="formArea formBtn">
                    <label for="buyerName">받으시는 분</label>
                    <input type="text" id="receiverName" name="order_name" class="ip_txt" value="${user.users_name}">
                </div>
                <div class="formArea formBtn address">
                <label for="inputSample">주소</label> 
                <input type="text" id="zonecode" name="order_zonecode" class="ip_txt" readonly="readonly" style="width:324px;" value="${user.users_zonecode}"> 
                <input type="hidden" id="postCode" name="postCode"> 
                <a href="javascript:findPostCode()" class="btnStyle-4 btnInput">우편번호 검색</a>
                        
                <div class="innerFormArea" style="padding-left:140px;width:455px;">
                    <input type="text" id="address" name="order_address" class="ip_txt" readonly="readonly" value="${user.users_address}">
                </div>
                    
                <div class="innerFormArea" style="padding-left:140px;width:455px;">
                    <input type="text" id="addressdetail" name="order_addressdetail" class="ip_txt" placeholder="상세주소를 입력해 주세요" value="${user.users_addressdetail}"> 
                    <input type="hidden" id="oldAddress" name="oldAddress" readonly="readonly"> 
                    <input type="hidden" id="buildingCode" name="buildingCode">
                    <button class="btnDel">
                        <span class="blind">삭제</span>
                    </button>
                </div>
            </div>
                 <div class="formArea formBtn">
                    <label for="buyerTel">연락처</label>
                    <input type="number" id="receiverPhone" name="order_phone" class="ip_txt" value="${user.users_phone}" maxlength="12" oninput="maxLengthChk(this)">
                </div>
                <div class="infoArea">
                    <strong class="formLabel">배송 메시지</strong>
                    <div class="formDb">
                        <!-- 셀렉트 박스 -->
                        <div class="selectArea togAct">
                            <a href="" class="sltCurrent togBtn" id="selectAreaReqMsg">직접입력</a>
                            <ul class="sltList">
                                <li><a href="">직접입력</a></li>
                                <li><a href="">배송 전 연락 바랍니다.</a></li>
                                <li><a href="">문 앞에 놓아주세요.</a></li>
                                <li><a href="">부재 시 문 앞에 놓아주세요.</a></li>
                            </ul>
                        </div>
                        <!-- //셀렉트 박스 -->
                        <!-- 내용 -->
                        <div class="textarea">
                            <textarea id="deliverymsg" placeholder="메시지를 입력해 주세요.(30자 미만)" maxlength="30" id="reqMsgTxtArea"></textarea>
                        </div>
                        <!-- //내용 -->
                    </div>
                </div>
            </div>
            <!-- //배송지 -->

        </div>
        <!-- 최종 결제금액 -->
        <div class="layoutTd tdRgt">
            <h3 class="subTitle">최종 결제금액</h3>
            <!-- 금액 -->
            <div class="section orderPrice">
                <ul class="amountList">
                    <li class="amountSet">
                        <strong class="title">상품금액</strong>
                        <span class="price"><fmt:formatNumber pattern="###,###,###" value="${totalPrice}"/>원</span>
                    </li>
                    <li class="amountSet">
                        <strong class="title">배송비</strong>
                        <span class="price">2,500원</span>
                    </li>
                </ul>
                <!-- 총결제금액 -->
                <div class="sumPrice">
                    <strong class="title">총결제금액</strong>
                    <span class="price" id="LastTotalPrice"><fmt:formatNumber pattern="###,###,###" value="${totalPrice+2500}"/>원</span>
                </div>
                <!-- //총결제금액 -->
            </div>
            <!-- //금액 -->
            <!-- 주문하기 -->
            <div class="btn btnOrder">
                <a href="javascript:void(0);" id="orderButton" class="btnStyle-2">결제하기</a>
            </div>
            <div class="agreeArea">
                <div class="check">
                    <input type="checkbox" name="kakaopay" id="kakaopay">
                    <label for="kakaopay">카카오페이</label>
                </div>
                <div class="check">
                    <input type="checkbox" name="inicis" id="inicis">
                    <label for="inicis">KG이니시스</label>
                </div>
                <p class="block">원하시는 결제 수단을 선택해 주세요.</p>
            </div>
            <!-- //주문하기 -->
            <div class="agreeArea">
                <div class="check">
                    <input type="checkbox" name="paymentAgree" id="paymentAgree">
                    <label for="paymentAgree">주문서 동의</label>
                </div>
                <p class="block">주문할 상품의 거래명, 가격, 배송정보를 확인하였으며, 구매에 동의합니다.</p>
            </div>
            <!-- 꼭 알아두세요! -->
            <div class="guideArea">
                <ul class="guideList">
                    <li>발송일 지정 상품과 일반 상품을 같이 구매하는 경우 지정일에 함께 발송됩니다.</li>
                    <li>빠른 배송을 원하시면 발송일 지정 상품과 일반 상품을 별도로 주문해주시기 바랍니다.</li>
                </ul>
            </div>
            <!-- //꼭 알아두세요! -->
        </div>
        <!-- //최종 결제금액 -->
    </div>
    
</div>
<!-- //내용 -->
</div>

<input type="hidden" value="${user.users_id }" id="users_id">
            
<%@include file="../template/footer.jsp"%>