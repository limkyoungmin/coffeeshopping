<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/novocozy1.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/novocozy2.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/novocozy3.css' />">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<c:url value='/js/common.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/swiper.js' />"></script>
<title>NOVOCOZY</title>
</head>
<body class="">
	<!-- loading -->
	<div class="loadingWrap">
		<div class="loadingArea">
			<span class="loader"></span>
		</div>
	</div>
	<!-- //loading -->

<!-- 띠 배너 -->
<script type="text/javascript" src="<c:url value='/js/textScroll.js' />"></script>
	<div id="toparea">
		<div class="promotionBanner">
			<div id="scrollstagetpl">
				<div id="scrollstage" style="height: 55px; padding: 0px; margin: 0px; overflow: hidden;">
					<div style="margin: 0px; height: 55px;">
						<a href="../product/Detail.jsp"><u><span style="font-weight:800;">디카페인 슬리피 베어</span></u> 출시 </a>
					</div>
					<div style="margin: 0px; height: 55px;">
						<a href="../prodcut/Detail.jsp"><u><span style="font-weight:800; ">게이샤 G1 워시드 에티오피아</span></u> 출시</a>
					</div>
					<div style="margin: 0px; height: 55px;">
						<a href="../board/Event.jsp"><span style="font-weight:800; "> 후기 작성하고 사은품 받자 <u>7.20 ~ 8.14</u> </span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //띠배너 -->

<!-- 띠 배너 작동 스크립트-->
<script type="text/javascript">
	var scrollCtrl = new ScrollControl('scrollstage', {freeze: 3600, inteval: 20, height: '55', line: 1, reverse: 'down'});
</script>
<!--// 띠 배너 -->

<script type="text/javascript">
    $(function() {
        window._ui.common.init();
    });
</script>

<script type="text/javascript">
	var cookieArray = new Array();
	var keywordCookieArray = new Array();
	
	$(function() {

		$('#keyword2').on("keydown", function(e) {
			if (e.keyCode == 13) {
				searchKeyword();
			}
		});

        $(".search.togAct").click(function() {
            if ($("#recmdKeywordList").html() == '') {
                $.ajax({
                    url : contextPath + "/search/suggestKeyword.inc",
                    type: "GET",
                    dataType: "html",
                    success: function(html) {
                        $("#recmdKeywordList").html(html);
                    }, 
                    error: function() {
                    }
                });
            }
        });

		/* getRecmdKeywordList(); */

		keywordCookieArray.push('keywordSearchProduct1689146207370|%uD2F0');
		keywordCookieContentSetting();

	});

	function removeCookie(name){
        var todayDate = new Date(); 
        todayDate.setDate( todayDate.getDate() - 1 );
        document.cookie = name + "=" + escape( '' ) + "; path=/; expires=" + todayDate.toGMTString() + ";";
    }

	function quickMenuContentSetting(){
		var str = "";
		for(var i = 0; i < cookieArray.length ; i++){
			var productInfo = unescape(cookieArray[i]).split("|");
			str += '<li class="thumb">';
			str += '<a href="/market/product/detail/' + productInfo[0]+'">';
			str += '<img src="' + productInfo[1] +'" alt="상품이미지" />';
			str += '<span class="blind">상품 상세 보기</span>';
			str += '</a>';
			str += '</li>';
		}
		$("#quickMenuContent").html(str);
	}

	function keywordCookieContentSetting() {
		var str = "";
		if(keywordCookieArray.length > 0) {
			for(var i= 0; i < keywordCookieArray.length; i++){
				var keywordInfo = unescape(keywordCookieArray[i]).split("|");
				str += '<li class="kwd">' 
					+ '<a href="'+ contextPath +'/product/search?keyword='+ keywordInfo[1] +'&sort=priority&direction=desc&rows=60" class="word">' + keywordInfo[1] +'</a>'
					+ '<button class="iconS del" onclick="javascript:keywordCookieRemove(' + i + ')"><span class="blind btn_del">검색어 삭제</span></button>'
					+ '</li>';
			}
			//$("#keywordHistoryNone").remove();
		}
		$("#keywordHistoryContent").html(str);
	}

	function keywordCookieRemoveAll() {
		if(keywordCookieArray.length > 0) {
			for(var i = keywordCookieArray.length -1; i >= 0; i--){
				 keywordCookieRemove(i);
			}
			location.reload();
		}
	}

	function keywordCookieRemove(index){
		//cookieArray[i] 제거
		if(keywordCookieArray[index]) {
			var keywordInfo = keywordCookieArray[index].split("|");
			keywordCookieArray.splice(index, 1);
			
			// cookie 삭제
			var todayDate = new Date(); 
		    todayDate.setDate( todayDate.getDate() - 1 );
		    document.cookie = keywordInfo[0] + "=" + escape( '' ) + "; path=/; expires=" + todayDate.toGMTString() + ";";
		}
		
		// 화면 재 설정
	    keywordCookieContentSetting();
	}

	function searchKeyword(id) {
		var keyword = id ? $.trim($("#" + id).val()) : $.trim($("#keyword2").val());
		addKeywordCookie(keyword);
		addSearchKeywordHistory();
		$("#keyword2").val("");
		location.href = contextPath +'/product/search?keyword='+ keyword +'&sort=priority&direction=desc&rows=60';
	}

	function addKeywordCookie(keyword) {
		//검색어 쿠키 설정
		var d = new Date();
		var cookieVal = escape( keyword );
		var name = "keywordSearchProduct" + new Date().getTime();
		var todayDate = new Date(); 
		todayDate.setDate( todayDate.getDate() + 14 ); // 14일

		if (document.cookie && document.cookie != '') {
			var cookies = document.cookie.split(';');
			for(var i = 0; i < cookies.length; i++) {
				var cookie = $.trim(cookies[i]);

				if(cookie.indexOf("keywordSearchProduct") >= 0) {
					var cName = cookie.substring(0, cookie.indexOf("="));
					var cValue = cookie.substring(cookie.indexOf("=") + 1);

					// 동일어가 있을 경우 기존 키워드 삭제
					if(cookieVal == cValue) {
						removeCookie(cName);
						break;
					}
				}
			}
		}

		// cookie 추가
		document.cookie = name + "=" + cookieVal + "; path=/; expires=" + todayDate.toGMTString() + ";";
	}

	function addSearchKeywordHistory() {
		
	}


	function getRecmdKeywordList() {
		$.ajax({
    		url : contextPath + "/search/recmdKeywordListHtml.inc",
    		type: "GET",
    		dataType: "html",
    		success: function(html) {
    			$("#recmdKeywordList").append(html);
    		}, 
    		error: function() {
			}
    	});
	}
</script>

<div id="skip_nav">
	<a href="#wrap">본문 바로가기</a>
</div>

	<header class="header" style="height: 135px;">
		<div class="headerArea">
			<div class="headerInside menu">
				<div class="inner">
					<c:if test="${empty user}">
					<ul class="personalMenu">
						<li class="pm"><a href="/member/login">로그인</a></li>
						<li class="pm"><a href="#popJoin" class="popOpen">회원가입</a></li>
						<li class="pm"><a href="/member/login">주문확인</a></li><!-- 로그인 유효성검사 필요  -->
						<li class="pm"><a href="/member/login">마이페이지</a></li>
					</ul>
					</c:if>
					<c:if test="${not empty user}">
						<ul class="personalMenu">
							<li class="pm"><a href="/member/logout">로그아웃</a></li>
							<li class="pm"><a href="../mypage/OrderList.jsp">주문확인</a></li><!-- 로그인 유효성검사 필요  -->
							<li class="pm"><a href="/mypage/mypage">마이페이지</a></li>
						</ul>
					</c:if>
				</div>
			</div>
			<div id="gnb" class="headerInside gnb">
				<div class="inner">
					<h1 class="logo">
                        <a href="/main">
                            <span>NOVOCOZY</span>
                        </a>
                    </h1>
					<ul class="gnbList">
						<!-- 마켓 -->
                        <li class="depth1 ">
							<a href="/productCoffeeList" onmouseover="this.innerHTML='상품'" onmouseout="this.innerHTML='PRODUCT'" style="width: 58.4062px;">PRODUCT</a>
						</li>
						<li class="depth1 ">
							<a href="/notice" onmouseover="this.innerHTML='게시판'" onmouseout="this.innerHTML='BOARD'" style="width: 121.984px;">BOARD</a>
						</li>
						<li class="depth1 ">
							<a href="/mybean" onmouseover="this.innerHTML='원두추천'" onmouseout="this.innerHTML='MYBEAN'" style="width: 78.9375px;">MYBEAN</a>
						</li>
						<li class="depth1 ">
							<a href="About.jsp" onmouseover="this.innerHTML='소개'" onmouseout="this.innerHTML='ABOUT'" style="width: 66.4688px;">ABOUT</a>
						</li>
                        <!-- // 마켓 --> 
					</ul>

					<ul class="utilList">
						<li class="depth1 search togAct"><a href="" class="iconS togBtn"><span class="blind">검색하기</span>
						</a> <!-- 검색공통 -->
							<div class="searchSlide">
								<strong class="blind">검색어 입력 영역</strong>
								<!-- 검색어 -->
								<div class="searchKwd">
									<div class="entry">
										<input type="text" class="ip_kwd" id="keyword2" placeholder="검색어를 입력하세요."> 
										<a href="#;" onclick="javascript:searchKeyword()" class="btnSearch iconS">
											<span class="blind">검색하기</span>
										</a>
									</div>
								</div>
								<!-- //검색어 -->
								<!-- 최근 검색어 -->
								<div class="searchSection recent">
									<strong class="title">최근 검색어</strong>
									<!-- 최근 검색어 없는 경우 -->
									<p class="noSearch" style="display: none">최근 검색어가 없습니다.</p>
									<!--// 최근 검색어 없는 경우 -->
									<ul class="kwdList" id="keywordHistoryContent">
										<li class="kwd">
											<a href="/product/search?keyword=티&amp;sort=priority&amp;direction=desc&amp;rows=60" class="word">티</a>
											<button class="iconS del" onclick="javascript:keywordCookieRemove(0)">
												<span class="blind btn_del">검색어 삭제</span>
											</button>
										</li>
									</ul>
									<a href="#;" onclick="javascript:keywordCookieRemoveAll()" class="btnAllDel">전체삭제</a>
								</div>
								<!-- //최근 검색어 -->
								<!-- 추천 검색어 -->
								<div class="searchSection popular">
									<strong class="title">추천 검색어</strong>
									<ol class="kwdList" id="recmdKeywordList"></ol>
								</div>
								<!-- //추천 검색어 -->
								<a href="" class="btnDel iconS togBtn"><span class="blind">검색 영역 닫기</span>
								</a>
							</div> <!-- //검색공통 --></li>
						<li class="depth1 cart">
						<a href="/order/cart" class="iconS"><span class="blind">장바구니</span> 
						<em class="count" id="cartCnt">0<span class="blind">개</span></em>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<!-- 공통::퀵메뉴 -->

<!-- 공통::스크롤버튼 -->
<div class="btnScroll">
	<a href="" class="iconS up"> <span class="blind">맨 위로 이동하기</span></a> 
	<a href="" class="iconS down"> <span class="blind">맨 아래로 이동하기</span></a>
</div>
<!-- //공통::스크롤버튼 -->

	<div id="popJoin" class="popWrap popJoin">
		<!-- 레이어팝업 공통 class="popWrap" -->
		<div class="popInner">
			<div class="popBox">
				<h2 class="popHeader">회원가입방법</h2>
				<div class="btnClose">
					<a href="" class="popClose iconS"><span class="blind">팝업 닫기</span></a>
				</div>
				<div class="popBody">
					<!-- 회원가입 버튼 -->
					<div class="btn">
						<a href="/member/join" class="btnStyle-2">일반 회원가입</a>
					</div>
					<!-- //회원가입 버튼 -->
					<!-- SNS 계정 회원가입 -->
					<div class="loginSns">
						<strong class="title">SNS 간편 가입</strong>
						<ul class="snsList">
							<li class="sns kakao"><a href="/social/login/kakao" class="iconS"><span class="blind">카카오로 회원가입하기</span></a></li>
							<li class="sns naver"><a href="/social/login/naver" class="iconS"><span class="blind">네이버로 회원가입하기</span></a></li>
						</ul>
					</div>
					<!-- //SNS 계정 회원가입 -->
					<div class="txtBottom">
						<p class="linkText">이미 가입하셨나요?</p>
						<a href="/member/login" class="btnLogin">로그인하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>