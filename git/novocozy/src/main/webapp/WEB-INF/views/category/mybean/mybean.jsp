<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../../template/header.jsp"%>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/novocozy4.css">
<script>
$(function(){
	$('li .aBox').click(function(){
		$(this).parent().addClass("on").siblings().removeClass("on");
		$('.secondBeans').children().siblings().removeClass("co");
		$('#viewBox').addClass("noneView");
		return true;
	});
	$('.secondBeans li .bBox').click(function(){
		$(this).parent().addClass("co").siblings().removeClass("co");
		return true;
	});
});
</script>

<div id="choiceTitle">
	<h1>취향에 맞는 커피 찾기</h1><br>
	<h5>자신의 취향에 맞는 커피를 찾아보세요</h5>
</div>
<div id="choiceBeans">
		<h1>어떤 풍미를 가장 선호하시나요?<br><span>가장 좋아하는 음식을 생각해보세요</span></h1>
		<h1>어느정도의 강도를 선호하시나요?<br><span>강도는 커피의 로스트와 풍미를 나타냅니다</span></h1>
	<ul id="firstBeans">
		<li>
			<div class="aBox">
				<p>짭잘한 맛<span>소금</span></p>
			</div>
			<ul class="secondBeans">
				<li>
					<div class="bBox"><p>은은하고 부드러움</p></div>
					<div class="choiceButton"><a href="category/depth2/Single.jsp">나에게 맞는 커피 확인하기</a></div>
				</li>
				<li>
					<div class="bBox"><p>미디엄으로 균형 잡힘</p></div>
					<div class="choiceButton"><a href="category/depth2/Single.jsp">나에게 맞는 커피 확인하기</a></div>
				</li>
				<li>
					<div class="bBox"><p>무게감을 주는 강렬함</p></div>
					<div class="choiceButton"><a href="category/depth2/Single.jsp">나에게 맞는 커피 확인하기</a></div>
				</li>
			</ul>
		</li>
		
		<li>
			<div class="aBox">
				<p>과일 맛<span>새콤 달콤</span></p>
			</div>
			<ul class="secondBeans">
				<li>
						<div class="bBox"><p>은은하고 부드러움</p></div>
					<div class="choiceButton"><a href="category/depth2/Single.jsp">나에게 맞는 커피 확인하기</a></div>
				</li>
				<li>
					<div class="bBox"><p>미디엄으로 균형 잡힘</p></div>
					<div class="choiceButton"><a href="category/depth2/Single.jsp">나에게 맞는 커피 확인하기</a></div>
				</li>
				<li>
					<div class="bBox"><p>무게감을 주는 강렬함</p></div>
					<div class="choiceButton"><a href="category/depth2/Single.jsp">나에게 맞는 커피 확인하기</a></div>
				</li>
			</ul>
		</li>
		
		<li>
		<div class="aBox">
			<p>고소한 맛<span>견과류 또는 곡물</span></p>
		</div>
			<ul class="secondBeans">
				<li>
					<div class="bBox"><p>은은하고 부드러움</p></div>
					<div class="choiceButton"><a href="category/depth2/Single.jsp">나에게 맞는 커피 확인하기</a></div>
				</li>
				<li>
					<div class="bBox"><p>미디엄으로 균형 잡힘</p></div>
					<div class="choiceButton"><a href="category/depth2/Single.jsp">나에게 맞는 커피 확인하기</a></div>
				</li>
				<li>
					<div class="bBox"><p>무게감을 주는 강렬함</p></div>
					<div class="choiceButton"><a href="category/depth2/Single.jsp">나에게 맞는 커피 확인하기</a></div>
				</li>
			</ul>
		</li>
	</ul>
	
	<div id="viewBox">
		<ul class="secondBeans">
		<!-- 디코딩 -> 향을 먼저 선택해주세요 -->
			<li><div class="bBox"><a href="javascript:alert('%ED%96%A5%EC%9D%84%20%EB%A8%BC%EC%A0%80%20%EC%84%A0%ED%83%9D%ED%95%B4%20%EC%A3%BC%EC%84%B8%EC%9A%94')"><p>은은하고 부드러움</p></a></div></li>
			<li><div class="bBox"><a href="javascript:alert('%ED%96%A5%EC%9D%84%20%EB%A8%BC%EC%A0%80%20%EC%84%A0%ED%83%9D%ED%95%B4%20%EC%A3%BC%EC%84%B8%EC%9A%94')"><p>미디엄으로 균형 잡힘</p></a></div></li>
			<li><div class="bBox"><a href="javascript:alert('%ED%96%A5%EC%9D%84%20%EB%A8%BC%EC%A0%80%20%EC%84%A0%ED%83%9D%ED%95%B4%20%EC%A3%BC%EC%84%B8%EC%9A%94')"><p>무게감을 주는 강렬함</p></a></div></li>
		</ul>
	</div>	
</div>    
   
<%@include file="../../template/footer.jsp"%>