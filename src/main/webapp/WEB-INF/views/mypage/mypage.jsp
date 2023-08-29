<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
<div id="wrap" class="subWrap mypageWrap">
    <!-- 내용 -->
		<div class="contents incCat">
			<!-- 공통::상단 -->
			<div class="userInfo">
				<div class="innerInfo">
					<div class="innerBox info">
						<strong class="infoTop "> 
						<a href="EditInfo.jsp">
							<span class="userId">${sessionScope.users_id}&nbsp;회원</span>님, 반갑습니다.
						</a>
						</strong>
						<div class="infoBot">
							<div class="set grade">
								<em class="title">등급</em> <span class="value">BRONZE</span> 
								<a href="/event/memberBenefit" class="btnBenefit">등급별 혜택보기</a>
							</div>
							<div class="set point">
								<em class="title">적립금</em> <a href="#" class="value"> 0원 </a>
							</div>
						</div>
					</div>
					<div class="innerBox coupon">
						<a href="#" class="iconS"> 쿠폰 <em class="number">0장</em></a>
					</div>
					<div class="innerBox order">
						<a href="/mypage/orderList" class="iconS"> 주문/배송 <em class="number">0건</em></a>
					</div>
					<div class="innerBox qna">
						<a href="MypageQna.jspt" class="iconS"> 1:1문의 <em class="number">0건</em></a>
					</div>
				</div>
			</div>
			<!-- //공통::상단 -->
			<div class="mypageCol">
				<div class="userMenu togType2">
					<strong class="menuTit"><a href="Mypage.jsp">마이페이지</a></strong>
					<ul class="depth1">
						<li class=""><a href="/mypage/orderlist">주문/배송내역</a></li>
						<li class=""><a href="ReturnList.jsp">반품/교환내역</a></li>
						<li class=""><a href="AddressMg.jsp">배송지 관리</a></li>
						<li class=""><a href="#">적립금 내역</a></li>
						<li class=""><a href="MyWrite.jsp">작성한 글</a></li>
						<li class=""><a href="/mypage/editinfo">개인정보 수정</a></li>
					</ul>
				</div>
				<!-- 컨텐츠 -->
				<input type="hidden" name="users_id" value="${users_id}"/> 

<script type="text/javascript">
    $(function() {
        $(".popWrap").on("click", ".popClose", function(e) {
            e.preventDefault();
            $(this).parents(".popWrap").removeClass("on");
        })
    })
</script>
			<!-- 컨텐츠 -->
			<div class="userCont">
			    <!-- 최근 주문내역 -->
			    <div class="contBox history">
			        <div class="colTitle">
			            <h2 class="title">최근 주문내역</h2>
			            <p class="sub">최근 주문하신 3개월 이내 내역만 보여집니다.</p>
			        </div>
			        <div class="noHistory" style="display:none"><!--최근 주문 내역 없을 때 -->
			            <p class="text">최근 주문 내역이 없습니다.</p>
			        </div>
			        <div class="orderList"><!--최근 주문 내역 있을 때 -->
			            <ul class="cartList">              
			
<script type="text/javascript">
    $(document).ready(function() {
       var totalPages = '';
       $("#totalPages").val('');
    })
</script>
			
<div class="noHistory">
         <p class="text">최근 주문 내역이 없습니다.</p>
</div>
			
			            </ul>
			        </div>
			    </div>
			    <!-- //최근 주문내역 -->
			</div>
			<!-- //컨텐츠 -->
        </div>
    </div>
    <!-- //내용 -->
</div>

<%@include file="../template/footer.jsp"%>