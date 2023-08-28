<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 하단 footer 시작-->
<footer class="footer">
	<div class="footerInside fnb">
		<ul class="fnbList">
			<li class="fnbItem"><a href="/contents/clause" class="">이용약관</a></li>
			<li class="fnbItem"><a href="/contents/infoPolicy" class=""><strong>개인정보처리방침</strong></a></li>
			<li class="fnbItem"><a href="/help/main" class="">고객센터</a></li>
			<li class="fnbItem"><a href="/store/list" class="">매장소개</a></li>
		</ul>
	</div>
	<div class="footerInside">
		<div class="footerBox">
			<div class="footerCol contact">
				<ul class="contactList">
					<li class="item name"><em class="title">상호: </em>(주)NOVOCOZY</li>
					<li class="item"><em class="title">대표이사 : </em>홍길동</li>
					<li class="item"><em class="title">주소 : </em>율도국</li>
					<li class="item"><em class="title">통신판매번호 : </em>2023-서울강남-0000</li>
					<li class="item"><em class="title">사업자등록번호 : </em>220-00-0000</li>
					<li class="item"><em class="title">개인정보보호책임자 : </em>홍길동</li>
				</ul>
				<ul class="contactList">
					<li class="item"><em class="title">홈페이지문의 : </em><a href="#">shopping@naver.com</a></li>
					<li class="item"><em class="title">이메일 : </em><a href="#">gildong@naver.com</a></li>
					<li class="item"><em class="title">고객센터 : </em>1234-1234</li>
				</ul>
				<small class="copyright en">©2023 HONG GIL DONG CAFE. ALL
					RIGHT RESERVED.</small>
				<ul class="snsList">
					<li class="item insta"><a href="#" target="_blank" rel="opener" class="iconS en">gildongcoffee</a></li>
					<li class="item youtube"><a href="#" target="_blank" rel="opener" class="iconS">홍길동커피</a></li>
					<li class="item kakao"><a href="#" target="_blank" rel="opener" class="iconS">홍길동커피</a></li>
				</ul>
			</div>
			<div class="footerCol cs">
				<strong class="boxTitle">고객센터 운영시간</strong>
				<dl class="subInfo">
					<dd>평일 09:00~18:00</dd>
					<dd>점심 12:00~13:00</dd>
					<dd>휴무 토/일/공휴일 휴무</dd>
				</dl>
			</div>
			<!-- 추가 -->
			<div class="footerCol app">
				<strong class="boxTitle">ABOUT US</strong>
				<div class="subInfo">
					<ul>
						<li><a href="../../board/Notice.jsp">공지사항</a></li>
						<br>
						<li><a href="../../board/FAQ.jsp">자주묻는 질문</a></li>
						<br>
						<li><a href="../../board/QNA.jsp">상품문의</a></li>
						<br>
						<li><a href="../../category/depth1/Review.jsp">구매후기</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</footer>

<script type="text/javascript">

$(document).ready(function() {
	
});


function openPopAddCart(productId, productPriceId) {

	$("#popCart").show();

    $.ajax({
        url : contextPath + "/market/product/" + productId + "/" + productPriceId + "/cartOptionHtml.inc",
        type: "POST",
        data: { 
			productId: productId
    	},
        dataType: "html",
        success: function(html) {
            $("#popCart").html(html).show();
        },
        error: function() {
        }
    });
}

function closePopAddCart() {
	$("#popCart").hide();
}

</script>
<div id="popCart" class="popWrap popCart"></div>
<form id="marketOrderForm" action="/market/order/nomember/payment" method="post"></form>
<form id="storeOrderForm" action="/storeOrder/payment" method="post"></form>
<form id="giftOrderForm" action="/gift/order/payment" method="post"></form>
<form id="loginForm" action="/login" method="get"></form>
</body>
</html>