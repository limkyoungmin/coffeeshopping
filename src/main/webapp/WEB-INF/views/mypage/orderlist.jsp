<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../template/header.jsp"%>
<script type="text/javascript">
    var intervalId;
    var pattern1 = /[0-9]/g;
    var pattern2 = /[a-zA-Z]/ig;
    var pattern3 = /[~!@#$%<>^&*+-]/ig;
	$(document).ready(
		function() {
			$('#username, #password').on("keydown", function(e) {
			if (e.keyCode == 13) {
				if ($.trim($('#username').val()) != "" && $.trim($("#password").val()) == "") {
					$password.focus();
				} else if ($.trim($('#username').val()) != "" && $.trim($("#password").val()) != "") {
					doLogin();
				} else {
					alert("아이디를 입력해주세요.");
					$('#username').focus();
				}
			}
		});

        $("input[name=idCertify]").on("change", function() {
            $(".infoFind").hide();
            if ($(this).attr("id") == 'idCertifyTel') {
                $(".infoFind.tel").show();
            } else {
                $(".infoFind.email").show();
            }
        })

	});

	/**
	 * 로그인
	 */
	function doLogin() {
		var userId = $('#username').val();
		var password = $('#password').val()

		if (userId == '') {
			alert('아이디를 입력해주세요.');
			return;
		}

		if (password == '') {
			alert('비밀번호를 입력해주세요.');
			return;
		}

		var $loginForm = $("#loginForm");
		$loginForm.submit();
	}

</script>				
<script type="text/javascript">
    $(function() {
        $(".popWrap").on("click", ".popClose", function(e) {
            e.preventDefault();
            $(this).parents(".popWrap").removeClass("on");
        })
    })
</script>

<script type="text/javascript">
 var page = 0;
 var fromDate = null;
 var toDate = null;
 var period = 1;
 var orderStatusGroup = null;

 var isLoading = false;

 $(function() {
	 $(".sltList li").on('click', function(e) {
		 e.preventDefault();
		 var txt = $(this).find("a").text();
		 $(this).parents(".selectArea").removeClass("on").find(".sltCurrent").text(txt);
		 $(this).parents(".selectArea").find("li").removeClass("on");
		 $(this).addClass("on");
		 if(txt != '전체보기')
			 $(this).parents(".selectArea").find(".sltListAll").show();
		 else
			 $(this).parents(".selectArea").find(".sltListAll").hide();

        orderStatusGroup = $(this).find("a").data("status");
        page = 0;
        paging();
	});

    $(".popWrap").on("click", ".popClose", function(e) {
        e.preventDefault();
        $(this).parents(".popWrap").removeClass("on");
    })

    $(window).scroll(function() {
        if (!isLoading && ($(window).scrollTop() >= $(document).height() - $(window).height() - 110)) {
            paging();
        }
    });
    
    tabPeriod(1);
 });

 // 매장주문 정보 조회
 function getStoreOrderInfo(orderId) {
	 $.ajax({
		 url : contextPath + "/myPage/storeOrder/" + orderId + "/info.inc",
	     type: "GET",
	     dataType: "html",
	     success: function(html) {
	         $(".storeOrderInfoWrap").html(html);
	     },
	     error: function() {
	     }
	 });
 }

 function paging() {
    var totalPages = $("#totalPages").val();
	if(page == 0) {
        $("#totalPages").val(0);
		$("#orderList").html("");
		$(".noHistory").hide();
	}

	if(fromDate != null && fromDate != '') {
		fromDate = fromDate.replace(/[.]/g, '-');
	}

	if(toDate != null && toDate != '') {
		toDate = toDate.replace(/[.]/g, '-');
	}
	
	if (!isLoading && (page == 0 || totalPages > page) ) {
		++page;
 		isLoading = true;
		$.ajax({
    		url : contextPath + "/myPage/subOrderList",
    		type: "GET",
    		dataType: "html",
    		data: { page : page
 		    	, period : period
 		    	, fromDate : fromDate
 		    	, toDate : toDate 
                , orderStatusGroup : orderStatusGroup
 		     },
    		success: function(html) {
    			if(page == 1 && $.trim(html) == '') {
    				$(".noHistory").show();
	    		}
    			else {
    				$("#orderList").append(html);
	    			if (page == '') {
		    			$("#btn-more-wrap").hide();
		    		}
	    		}
    			
    			isLoading = false;
    		}, 
    		error: function() {
    			isLoading = false;
			}
    	});
 	}
}

function tabPeriod(selectPeriod) {

	if(selectPeriod == 1) {
		$("input[id='month-1']:radio").prop("checked", true);
	}
	
	var toD = new Date();
	var fromD = new Date();
	fromD.setMonth(fromD.getMonth() - Number(selectPeriod));

	fromDate = getFormatedDate(fromD);
	toDate = getFormatedDate(toD);
	period = selectPeriod;
	page = 0;
	paging();
}

function getFormatedDate(d) {
	var y = d.getFullYear();
	var m = d.getMonth() + 1;
	var d = d.getDate();

	if(m < 10)
		m = '0' + m;
	if(d < 10)
		d = '0' + d;

	return y + '.' + m + '.' + d;
}

function popQna(orderId) {
	$("#qnaOrderId").val(orderId);
	$("#popQuestion").show();
}

function addQna() {
	var categoryNo = null;
	$(".sltList.qna li").each(function(e) {
		if($(this).hasClass('on')) {
			categoryNo = $(this).find("a").attr("href");
		}
	});
	alert(categoryNo);
}
</script>
<script>
    // 페이지 로드 후 실행될 초기화 함수
    document.addEventListener("DOMContentLoaded", function() {
        var openPopupButtons = document.querySelectorAll(".open-popup");

        openPopupButtons.forEach(function(button) {
            button.addEventListener("click", function() {
                var productNum = button.getAttribute("data-product-num");
                openPopup(productNum);
            });
        });

        function openPopup(productNum) {
            var popup = document.getElementById("popChange");
            popup.style.display = "block";

            // 팝업 내용을 동적으로 채우는 코드 작성
            // 예: 상품 정보를 가져와서 해당 위치에 채우는 등의 작업
            var productInfo = getProductInfo(productNum);
            // 예시로 제목 영역에 상품명을 채우는 코드
            var titleElement = popup.querySelector(".title a");
            titleElement.textContent = productInfo.productName;
        }

        function getProductInfo(productNum) {
            // 서버에서 상품 정보를 가져오는 AJAX 호출 또는 데이터 처리 로직
            // 이 예시에서는 가상의 정보를 반환하도록 했습니다.
            return {
                productName: "모카포트&더치",
                // ... 다른 필요한 정보 ...
            };
        }
    });
</script>
<%@include file="mypagetemplate.jsp"%>
<div class="userCont">
    <!-- 주문/배송 내역 -->
    <div class="contBox history">
        <div class="colTitle">
            <h2 class="title">주문/배송 내역</h2>
            <p class="sub">최근 주문하신 1년 이내 내역만 보여집니다.</p>
        </div>
        <div class="period">
            <div class="squareRadio">
                <div class="radio tab">
                    <input type="radio" name="orderPeriod" id="month-1" checked="">
                    <label for="month-1" onclick="javascript:tabPeriod(1)">1개월</label>
                </div>
                <div class="radio tab">
                    <input type="radio" name="orderPeriod" id="month-3">
                    <label for="month-3" onclick="javascript:tabPeriod(3)">3개월</label>
                </div>
                <div class="radio tab">
                    <input type="radio" name="orderPeriod" id="month-6">
                    <label for="month-6" onclick="javascript:tabPeriod(6)">6개월</label>
                </div>
                <div class="radio tab">
                    <input type="radio" name="orderPeriod" id="year-1">
                    <label for="year-1" onclick="javascript:tabPeriod(12)">1년</label>
                </div>
            </div>
            <div class="selectArea togAct">
                <a href="" class="sltCurrent togBtn">전체상태</a>
                <ul class="sltList">
                    <li class="sltListAll" style="display:none"><a href="">전체상태</a></li>
                    <li><a href="" data-status="ready">주문완료</a></li>
                    <li><a href="" data-status="job">배송준비중</a></li>
                    <li><a href="" data-status="delivery">배송중</a></li>
                    <li><a href="" data-status="complete">배송완료</a></li>
                    <li><a href="" data-status="confirm">구매확정</a></li>
                    <li><a href="" data-status="cancel">취소/교환/반품</a></li>
                </ul>
            </div>
        </div>
        	<div class="noHistory" style="display:none"><!--최근 주문 내역 없을 때 -->
				<p class="text">최근 주문 내역이 없습니다.</p>
			</div>       
        <div class="orderList"><!-- //주문 내역 있을 때 -->
			<table>
		        <thead>
		            <tr class="cartList">
		                <td style="text-align:center;">주문날짜</td>
		                <td style="text-align:center;">배송상태</td>
		                <td style="text-align:center;">제품사진</td>
		                <td style="text-align:center;">제품명</td>
		                <td style="text-align:center;">제품가격</td>
		                <td style="text-align:center;">교환신청</td>
		            </tr>
		        </thead>
			        <tbody>
			        <c:forEach var="orderList" items="${orderList}">
			        	<tr>
				            <td style="text-align:center;">${orderList.orderVO.order_date}</td>
				            <td style="text-align:center;">${orderList.orderVO.order_request}</td>
				            <td style="width:100px; height: 100px; text-align:center;"><a href="/productmaindetail?product_num=${orderList.product_num}"><img src="${orderList.imgList[0].img_url}" ></a></td>
				            <td style="text-align:center;">${orderList.product_name}</td>
				            <td style="text-align:center;">${orderList.product_price}</td>
							<td style="text-align:center;">
							    <a href="javascript:void(0);" class="open-popup" data-product-num="${orderList.product_num}">교환신청</a>
							</td>
			            </tr>
		            </c:forEach>
			        </tbody>
			</table>
		</div>
	</div>
</div>
<!-- 팝업::반품신청 -->
<div id="popReturn" class="popWrap popQna popReturn"></div>
<!-- // 팝업::반품신청 -->

<!-- 팝업::교환신청 -->
<div id="popChange" class="popWrap popQna popReturn" style="display: none;">
    <div class="popInner">
        <div class="popBox">
            <h5 class="popHeader">교환신청</h5>
            <div class="btnClose">
                <a href="javascript:closePopQuestion()" class="iconS"><span class="blind">팝업 닫기</span></a>
            </div>
            <div class="popBody">
                <p class="notice">교환/반품은 상품 수령일로 부터 3일 이내 신청이 가능합니다.</p>
                <form id="qnaForm" name="qnaForm" action="/help/question" method="post">
                    <div class="orderList type2">
                        <ul class="cartList">
                            <li class="cart-item">
                                <!-- 썸네일 이미지 -->
                                <div class="imgArea">
                                    <a href="" class="thumbImg"><img src="" alt=" 썸네일 이미지"></a>
                                </div>
                                <!-- //썸네일 이미지 -->
                                <!-- 정보 -->
                                <div class="infoArea">
                                    <strong class="title">
                                        <a href="">제목영역입니다</a>
                                    </strong>
                                    <div class="option">
                                        <!-- 1set -->
                                        <div class="optionSet">
                                            <em class="name">
                                                <span>모카포트&amp;더치</span>
                                                <span>400g</span>
                                            </em>
                                        </div>
                                        <!-- //1set -->
                                    </div>
                                    <div class="total">
                                        <span class="price">20,000원</span>
                                    </div>
                                </div>
                                <!-- //정보 -->
                            </li>
                        </ul>
                        <div class="selectArea togAct">
                            <a href="" class="sltCurrent togBtn">옵션 선택</a>
                            <input type="hidden" name="changeOption" id="changeOption" value="">
                            <ul class="sltList">
                                <li><a href="">빨강</a></li>
                                <li><a href="">파랑</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="innerBox">
                        <!-- 유형 -->
                        <div class="selectArea togAct" id="qnaCategoryNoWrap">
                            <a href="" class="sltCurrent togBtn">교환사유를 선택하세요.</a>
                            <input type="hidden" name="qnaCategoryNo" id="qnaCategoryNo" value="">
                            <ul class="sltList">
                                <li><a href="">고객 단순변심</a></li>
                                <li><a href="">상품 </a></li>
                            </ul>
                        </div>
                        <!-- //유형 -->
                        <!-- 내용 -->
                        <div class="textarea">
                            <textarea id="question" name="question" placeholder="교환사유를 입력해주세요.(1,000자 미만)" maxlength="1000"></textarea>
                            <span class="maxlength"><em id="questionLength">0</em> / 1,000</span>
                        </div>
                        <!-- //내용 -->
                        <!-- 회수지 정보 -->
                        <div class="infoBox">
                            <strong class="ttl">회수지 정보</strong>
                            <dl class="grp">
                                <div class="item">
                                    <dt class="title">수령인
                                    </dt><dd class="desc">김아무개</dd>
                                </div>
                                <div class="item">
                                    <dt class="title">연락처
                                    </dt><dd class="desc">010-2222-2222</dd>
                                </div>
                                <div class="item">
                                    <dt class="title">주소
                                    </dt><dd class="desc">[02020] 서울시 종로구 케이트윈타워</dd>
                                </div>
                                <div class="item">
                                    <dt class="title">배송 메시지
                                    </dt><dd class="desc">
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
                                            <textarea placeholder="메시지를 입력해 주세요.(30자 미만)" maxlength="30" id="reqMsgTxtArea"></textarea>
                                        </div>
                                        <!-- //내용 -->
                                    </dd></div>
                                
                            </dl>
                        </div>
                        <!-- //회수지 정보 -->
                        <!-- 꼭 알아두세요! -->
                        <div class="guideArea">
                            <strong class="guideTitle">꼭 알아두세요!</strong>
                            <ul class="guideList">
                                <li>다음과 같은 경우는 교환/반품이 불가합니다.
                                    <ul class="depth2">
                                        <li>원두(드립백 포함), 생두, 식품은 신선 제품입니다. 고객의 변심에 의한 교환/반품은 불가합니다.</li>
                                        <li>분쇄 옵션 선택 실수로 인한 교환/반품은 불가합니다.</li>
                                        <li>기물, 도서는 개봉 및 상품 가치 훼손 시 교환/반품이 불가합니다.</li>
                                    </ul>
                                </li>
                                <li>오배송 및 상품 하자로 인한 교환/반품 배송비는 테라로사가 부담합니다.</li>
                                <li>교환/반품의 경우, 고객이 왕복 배송비(5,000원, 우체국 택배 착불)를 부담합니다.</li>
                            </ul>
                        </div>
                        <!-- //꼭 알아두세요! -->
                    </div>
                </form>
            </div>
        </div>
        <div class="btn">
            <a href="javascript:closePopQuestion()" class="popClose btnStyle-6">취소</a>
            <a href="javascript:questionAdd()" class="btnStyle-2">확인</a>
        </div>
    </div>
</div>
<!-- //팝업::교환신청 -->

<input type="hidden" id="totalPages" value="0">

            <!-- //컨텐츠 -->
        </div>
    </div>
    <!-- //내용 -->
</div>
<!-- //컨텐츠 -->

<%@include file="../template/footer.jsp"%>