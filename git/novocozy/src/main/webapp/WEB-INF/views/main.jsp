<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="template/header.jsp"%>
	<div id="wrap" class="mainWrap">
		<!-- 메인 공통 class="mainWrap" -->
		<!-- 내용 -->
		<div class="mainContents">
			<!-- 비주얼 -->
			<div class="mainVisual tSwiper swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events" data-params="{ &quot;slidesPerView&quot;:1, &quot;navigation&quot; : {&quot;nextEl&quot;:&quot;.mainVisual .swiperNav.next&quot;, &quot;prevEl&quot;:&quot;.mainVisual .swiperNav.prev&quot;}, &quot;pagination&quot; : {&quot;el&quot;:&quot;.mainVisual .swiper-fraction&quot;, &quot;type&quot;:&quot;fraction&quot;}, &quot;autoplay&quot;:{ &quot;delay&quot;:&quot;3000&quot;, &quot;disableOnInteraction&quot;:false }, &quot;loop&quot;:true }" id="swiper-0">
				<ul class="swiper-wrapper" id="swiper-wrapper-a351c941b10104e929" aria-live="off" style="transform: translate3d(-1200px, 0px, 0px); transition-duration: 0ms;">
					<li class="swiper-slide swiper-slide-duplicate swiper-slide-prev" data-swiper-slide-index="6" role="group" aria-label="1 / 9" style="width: 1200px;">
					<a href="/store/21/detail"> 
						<img src="https://renew.terarosa.com:9000/display/banner/cae55dbc-2234-4eb0-b777-849797eb3ee9.png" alt="배너 이미지">
					</a>
					</li>

					<li class="swiper-slide swiper-slide-active" data-swiper-slide-index="0" role="group" aria-label="2 / 9" style="width: 1200px;">
					<a href="/market/product/detail/156-156?categoryId=5"> 
						<img src="https://renew.terarosa.com:9000/display/banner/656159db-625e-45c5-ac6d-743a6e8e5769.png" alt="배너 이미지">
					</a>
					</li>

					<li class="swiper-slide swiper-slide-next" data-swiper-slide-index="1" role="group" aria-label="3 / 9" style="width: 1200px;">
					<a href="/product/search?keyword=카페라테&amp;sort=priority&amp;direction=desc&amp;rows=60">
						<img src="https://renew.terarosa.com:9000/display/banner/cae55dbc-2234-4eb0-b777-849797eb3ee9.png" alt="배너 이미지">
					</a>
					</li>

					<li class="swiper-slide" data-swiper-slide-index="2" role="group" aria-label="4 / 9" style="width: 1200px;">
					<a href="/market/product/detail/154-154?categoryId=5"> 
						<img src="https://renew.terarosa.com:9000/display/banner/656159db-625e-45c5-ac6d-743a6e8e5769.png" alt="배너 이미지">
					</a>
					</li>

					<li class="swiper-slide" data-swiper-slide-index="3" role="group" aria-label="5 / 9" style="width: 1200px;"><a href="#"> 
						<img src="https://renew.terarosa.com:9000/display/banner/cae55dbc-2234-4eb0-b777-849797eb3ee9.png" alt=" 배너 이미지">
					</a>
					</li>

					<li class="swiper-slide" data-swiper-slide-index="4" role="group" aria-label="6 / 9" style="width: 1200px;">
					<a href="/product/search?keyword=%EB%AF%B8%EB%A5%B4&amp;sort=priority&amp;direction=desc&amp;rows=60">
						<img src="https://renew.terarosa.com:9000/display/banner/656159db-625e-45c5-ac6d-743a6e8e5769.png" alt="배너 이미지">
					</a>
					</li>

					<li class="swiper-slide" data-swiper-slide-index="5" role="group" aria-label="7 / 9" style="width: 1200px;">
					<a href="/market/product/detail/4-4?categoryId=5"> 
						<img src="https://renew.terarosa.com:9000/display/banner/cae55dbc-2234-4eb0-b777-849797eb3ee9.png" alt="배너 이미지">
					</a>
					</li>

					<li class="swiper-slide swiper-slide-duplicate-prev" data-swiper-slide-index="6" role="group" aria-label="8 / 9" style="width: 1200px;">
					<a href="/store/21/detail"> 
						<img src="https://renew.terarosa.com:9000/display/banner/656159db-625e-45c5-ac6d-743a6e8e5769.png" alt="배너 이미지">
					</a>
					</li>

					<li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" data-swiper-slide-index="0" role="group" aria-label="9 / 9" style="width: 1200px;">
					<a href="/market/product/detail/156-156?categoryId=5"> 
						<img src="https://renew.terarosa.com:9000/display/banner/cae55dbc-2234-4eb0-b777-849797eb3ee9.png" alt="배너 이미지">
					</a>
					</li>
				</ul>
				<!-- 페이징 -->
				<div class="swiper-fraction swiper-pagination-fraction">
					<span class="swiper-pagination-current">1</span> / <span class="swiper-pagination-total">7</span>
				</div>
				<!-- 네비게이션 -->
				<div class="swiperNav prev" tabindex="0" role="button" aria-label="Previous slide" aria-controls="swiper-wrapper-a351c941b10104e929"></div>
				<div class="swiperNav next" tabindex="0" role="button" aria-label="Next slide" aria-controls="swiper-wrapper-a351c941b10104e929"></div>
				<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
			</div>
			<!-- //비주얼 -->

<script type="text/javascript">
    $(document).ready(function() {
        var totalPages = '2';
        var total = '5';
        $(".listCount").find("span > em").text(comma(total));
        $("#totalPages").val(totalPages);
    });
</script>

<!-- 핫한원두 -->
	<div class="section">
		<h1 class="mainTitle en" style=font-family:Pretendard>
			<span style=font-size:22px;>일단 마셔봐</span><br>
			<span style=font-size:40px;font-weight:bold;>올해 가장 핫한 원두</span>
		</h1>
		<!-- 상품 -->
		<div class="listStyle">
			<ul class="listWrap">
				<li class="listSet swiper-slide">
					<!-- 썸네일 이미지 -->
					<div class="imgArea">
						<div class="thumbImg">
							<img data-src="/images/product/blend/blend1_1.png" alt="에스프레소 블렌드 썸네일 이미지" src="../images/product/blend/blend1_1.png">
						</div>
					</div> 
					<!-- //썸네일 이미지 --> 
					<!-- 정보 -->
					<div class="infoArea">
						<strong class="title">에스프레소 블렌드</strong> 
						<span class="enTitle">Ethiopia Sidamo Hamasho Washed New Crop</span> 
						<span class="subScript">달콤한 복숭아 과즙과<br>꽃내음이 어우러진 화사한 커피<br>
						<br>500g 32,500원
						</span> <span class="subScript">로스팅 2023.07.09</span> <em class="price">32,500원</em>
					</div> 
					<!-- //정보 --> 
					<a href="../product/Detail.jsp" class="btnViewDetail"><span class="blind">상품 상세 보기</span></a>
				</li>
				<li class="listSet swiper-slide">
				<!-- 썸네일 이미지 -->
				<div class="imgArea">
					<div class="thumbImg">
						<img data-src="../images/product/decaffein/decaffein1_1.png" alt="The Pride of Africa 썸네일 이미지" src="../images/product/decaffein/decaffein1_1.png">
					</div>
				</div> 
				<!-- //썸네일 이미지 --> 
				<!-- 정보 -->
				<div class="infoArea">
					<strong class="title">디카페인 슬리피 베어</strong> 
					<span class="enTitle">[Decaffein] Special</span> 
					<span class="subScript">한 대륙에 속해 있는 아프리카 산지들의 세가지 맛을 함께<br>각 100g씩 경험할 수 있는 세트 상품<br>
					</span> <span class="subScript">로스팅 2023.07.09</span> <em class="price">35,000원</em>
				</div> 
				<!-- //정보 --> 
				<a href="../product/Detail.jsp" class="btnViewDetail"><span class="blind">상품 상세 보기</span></a>
				</li>

				<li class="listSet swiper-slide">
				<!-- 썸네일 이미지 -->
					<div class="imgArea">
						<div class="thumbImg">
							<img data-src="../images/product/dripbag/dripbag1_1.png" alt="NOVOCOZY 드립백 썸네일 이미지" src="../images/product/dripbag/dripbag1_1.png">
						</div>
					</div> 
					<!-- //썸네일 이미지 --> 
					<!-- 정보 -->
					<div class="infoArea">
						<strong class="title">NOBOCOZY 드립백 10EA</strong> 
						<span class="enTitle">Dripbag</span> 
						<span class="subScript">자두의 새콤달콤한 풍미와<br>청사과의 상큼함이 어우러진 커피<br>
						</span> <span class="subScript">로스팅 2023.07.09</span> <em class="price">25,000원</em>
						</div> 
				<!-- //정보 --> 
				<a href="../product/Detail.jsp" class="btnViewDetail"><span class="blind">상품 상세 보기</span></a>
				</li>

				<li class="listSet swiper-slide">
					<!-- 썸네일 이미지 -->
						<div class="imgArea">
							<div class="thumbImg">
								<img data-src="../images/product/single/single1_1.png" alt="과테말라 안티구아 썸네일 이미지" src="../images/product/single/single1_1.png">
							</div>
						</div> <!-- //썸네일 이미지 --> <!-- 정보 -->
					<div class="infoArea">
						<strong class="title">과테말라 안티구아 SHB</strong> 
						<span class="enTitle">SHB</span> <span class="subScript">간편하게 즐기는 고소한 풍미의 카페라테 6개입</span> 
						<span class="subScript">로스팅 2023.07.09</span> 
						<em class="price">21,000원</em>
					</div> <!-- //정보 --> 
				<a href="../product/Detail.jsp" class="btnViewDetail"><span class="blind">상품 상세 보기</span></a>
				</li>
			</ul>
		</div>
		<!-- //상품 -->
	</div>
<!-- //핫한원두 -->
			
<script type="text/javascript">
    $(document).ready(function() {
        var totalPages = '';
        var total = '';
        $(".listCount").find("span > em").text(comma(total));
        $("#totalPages").val(totalPages);
    });
</script>
		
<!-- 추천원두 -->
<div style=background-color:#f8f8f8;height:800px;width:100%;padding-top:-400px;>
	<div class="section">
		<h1 class="mainTitle en" style=font-family:Pretendard>
			<span style=font-size:22px;>추천해주는데는 이유가있어</span><br>
			<span style=font-size:40px;font-weight:bold;>NOBOCOZY 추천 원두</span>
		</h1>
		<div class="listStyle">
			<ul class="listWrap">
				<li class="listSet swiper-slide">
					<!-- 썸네일 이미지 -->
					<div class="imgArea">
						<div class="thumbImg">
							<img data-src="../images/product/special/special1_1.png" alt="에티오피아 시다모 하마쇼 워시드 햇커피 썸네일 이미지">
						</div>
					</div> 
					<!-- //썸네일 이미지 --> 
					<!-- 정보 -->
					<div class="infoArea">
						<strong class="title">게이샤 G1 워시드 에피오피아</strong> 
						<span class="enTitle">special</span> 
						<span class="subScript">달콤한 복숭아 과즙과<br>꽃내음이 어우러진 화사한 커피<br>
						<br>500g 32,500원
						</span> <span class="subScript">로스팅 2023.07.09</span> <em class="price">32,500원</em>
					</div> 
					<!-- //정보 --> 
					<a href="../product/Detail.jsp" class="btnViewDetail"><span class="blind">상품 상세 보기</span></a>
					</li>

					<li class="listSet swiper-slide">
					<!-- 썸네일 이미지 -->
					<div class="imgArea">
						<div class="thumbImg">
							<img data-src="../images/product/blend/blend1_1.png" alt="클래식 에스프레소 블렌드 썸네일 이미지">
						</div>
					</div> 
					<!-- //썸네일 이미지 -->
					 <!-- 정보 -->
					<div class="infoArea">
						<strong class="title">에스프레스 블렌드</strong> 
						<span class="enTitle">blend</span> 
						<span class="subScript">다크초콜릿의 묵직한 풍미와<br>부드러운 질감이 느껴지는 커피<br>
						<br>1kg 42,000원
						</span> <span class="subScript">로스팅 2023.07.07</span> <em class="price">42,000원</em>
					</div> 
					<!-- //정보 --> 
					<a href="../product/Detail.jsp" class="btnViewDetail"><span class="blind">상품 상세 보기</span></a>
					</li>

					<li class="listSet swiper-slide">
					<!-- 썸네일 이미지 -->
						<div class="imgArea">
							<div class="thumbImg">
								<img data-src="../images/product/single/single2_1.png" alt="피지 서머 블렌드 썸네일 이미지">
							</div>
						</div> 
						<!-- //썸네일 이미지 --> 
						<!-- 정보 -->
						<div class="infoArea">
							<strong class="title">브라질 산토스NY2</strong> 
							<span class="enTitle">single</span> 
							<span class="subScript">자두의 새콤달콤한 풍미와<br>청사과의 상큼함이 어우러진 커피<br>
							<br>250g 25,000원
							</span> <span class="subScript">로스팅 2023.07.09</span> <em class="price">25,000원</em>
						</div> 
						<!-- //정보 --> 
						<a href="../product/Detail.jsp" class="btnViewDetail"><span class="blind">상품 상세 보기</span></a>
						</li>

						<li class="listSet swiper-slide">
						<!-- 썸네일 이미지 -->
							<div class="imgArea">
								<div class="thumbImg">
									<img data-src="../images/product/special/special2_1.png" alt="드립백 실속형 (10개/30개) 썸네일 이미지">
								</div>
							</div> 
							<!-- //썸네일 이미지 --> 
							<!-- 정보 -->
							<div class="infoArea">
								<strong class="title">케냐 AA TOP</strong> 
								<span class="enTitle">special (Package Free)</span> 
								<span class="subScript">선물상자 미포함. 드립백 실속 구성, <br>10개 또는 30개 선택<br>
								<br>10개입 15,000원 | 30개입 35,000원
								</span> <span class="subScript">로스팅 2023.07.07</span> <em class="price">15,000원</em>
							</div> 
							<!-- //정보 --> 
							<a href="../product/Detail.jsp" class="btnViewDetail"><span class="blind">상품 상세 보기</span></a>
						</li>
				</ul>
		</div>
	</div>
</div>
<!-- //추천원두상품 -->

<script type="text/javascript">
    $(document).ready(function() {
        var totalPages = '1';
        var total = '10';
        $(".listCount").find("span > em").text(comma(total));
        $("#totalPages").val(totalPages);
    });
</script>

	<!--EVENT BOARD  -->
	<div style=background-color:#eeeae3;height:800px;width:100%;padding-top:-400px;>
		<div class="section type3">
			<div class="container">
				<h1 class="mainTitle en" style=font-family:Pretendard>
					<span style=font-size:22px;>줄 수 있는건 다 준다</span><br>
					<span style=font-size:40px;font-weight:bold;>진행중인 이벤트</span>
				</h1>
				<div class="inner">
					<!-- 상품 -->
					<div id="wrap" class="subWrap EventListWrap">
					<!-- 서브 공통 class="subWrap" -->
					<!-- 내용 -->
						<div class="contents incCat">
							<div class="innerContents">
								<div class="mainSection">
									<div class="listStyle">
										<ul class="listWrap">
										<!-- 원래 script 자리 -->
											<li class="listSet swiper-slide" data-product-id="156"><!-- 이벤트 고유번호로 수정 부분 --><!-- 위치도 4개일 경우에만 맞음 3개 이하일때 왼쪽으로 쏠림 -->
											<!-- 썸네일 이미지 -->
												<div class="imgArea">
													<div class="thumbImg">
														<img data-src="../images/event/event1_1.png" alt="그때 그 가격 이벤트 썸네일 이미지" src="../images/event/event1_1.png">
													</div>
												</div> 
												<!-- //썸네일 이미지 --> 
												<!-- 정보 -->
												<div class="infoArea">
													<strong class="title" style="text-align: center; font-size: 25px;">그때 그 가격 이벤트</strong> 
													<span class="subScript">이벤트 시작 날짜 : </span> 
													<span class="subScript">이벤트 종료 날짜 : </span>
												</div> 
												<!-- //정보 --> 
												<a href="../board/Content.jsp" class="btnViewDetail"><span class="blind">이벤트 상세 보기</span></a>
											</li>
											
											<li class="listSet swiper-slide" data-product-id="156">
											<!-- 썸네일 이미지 -->
												<div class="imgArea">
													<div class="thumbImg">
														<img data-src="../images/event/event1_1.png" alt="그때 그 가격 이벤트 썸네일 이미지" src="../images/event/event1_1.png">
													</div>
												</div> 
												<!-- //썸네일 이미지 --> 
												<!-- 정보 -->
												<div class="infoArea">
													<strong class="title" style="text-align: center; font-size: 25px;">그때 그 가격 이벤트</strong> 
													<span class="subScript">이벤트 시작 날짜 : </span> 
													<span class="subScript">이벤트 종료 날짜 : </span>
												</div> 
												<!-- //정보 --> 
												<a href="../board/Content.jsp" class="btnViewDetail"><span class="blind">이벤트 상세 보기</span></a>
											</li>
											
											<li class="listSet swiper-slide" data-product-id="156">
											<!-- 썸네일 이미지 -->
												<div class="imgArea">
													<div class="thumbImg">
														<img data-src="../images/event/event1_1.png" alt="그때 그 가격 이벤트 썸네일 이미지" src="../images/event/event1_1.png">
													</div>
												</div> 
												<!-- //썸네일 이미지 --> 
												<!-- 정보 -->
												<div class="infoArea">
													<strong class="title" style="text-align: center; font-size: 25px;">그때 그 가격 이벤트</strong> 
													<span class="subScript">이벤트 시작 날짜 : </span> 
													<span class="subScript">이벤트 종료 날짜 : </span>
												</div> 
												<!-- //정보 --> 
												<a href="../board/Content.jsp" class="btnViewDetail"><span class="blind">이벤트 상세 보기</span></a>
											</li>
											
											<li class="listSet swiper-slide" data-product-id="156">
											<!-- 썸네일 이미지 -->
												<div class="imgArea">
													<div class="thumbImg">
														<img data-src="../images/event/event1_1.png" alt="그때 그 가격 이벤트 썸네일 이미지" src="../images/event/event1_1.png">
													</div>
												</div> 
												<!-- //썸네일 이미지 --> 
												<!-- 정보 -->
												<div class="infoArea">
													<strong class="title" style="text-align: center; font-size: 25px;">그때 그 가격 이벤트</strong> 
													<span class="subScript">이벤트 시작 날짜 : </span> 
													<span class="subScript">이벤트 종료 날짜 : </span>
												</div> 
												<!-- //정보 --> 
												<a href="../board/Content.jsp" class="btnViewDetail"><span class="blind">이벤트 상세 보기</span></a>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--EVENT BOARD  -->
			</div>
		</div>
	</div>
</div>
<!-- //내용 -->
</div>
<!-- //컨텐츠 -->

<%@include file="template/footer.jsp"%>