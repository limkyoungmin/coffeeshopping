<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../template/header.jsp"%>

<script type="text/javascript">
	var intervalId;

	$(document).ready(function() {
		// 숫자만 입력되는 input 설정.
		$(document).on("keyup", "#users_phone", function() {
			$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
		});

         $(".tabMenu a").on("click", function(e) {
            e.preventDefault();
            $(".tabMenu a").removeClass("on");
            $(".tabCont").removeClass("on");
            $(this).addClass("on");
            var tabId = $(this).data("tab-id");
            $("#" + tabId).addClass("on");
        }) 
	});

    /**
	 * 아이디 찾기 확인요청(번호)
	 */
	 $(document).ready(function() {
		   $("#FindIdPhone").click(function(event) {
		      event.preventDefault();
		      FindPhone(); // FindPhone 함수 호출
		   });

		   function FindPhone() {
		      var users_name = $('#users_name').val();
		      var users_phone = $('#users_phone').val();

		      if (users_name == null || users_name == '') {
		         toastPop('이름을 입력해주세요.');
		         return;
		      }

		      if (users_phone == null || users_phone == '' || users_phone.length < 10) {
		         toastPop('전화번호를 확인해주세요');
		         return;
		      }

		      $("#PhoneForm").submit();
		   }
		});
    
	 $(document).ready(function() {
		   $("#FindIdEmail").click(function(event) {
		      event.preventDefault();
		      FindEmail(); // FindPhone 함수 호출
		   });

		   function FindEmail() {
		      var users_name = $('#users_name2').val();
		      var users_email = $('#users_email').val();

		      if (users_name == null || users_name == '') {
		         toastPop('이름을 입력해주세요.');
		         return;
		      }

		      if (users_email == null || users_email == '') {
		         toastPop('이메일을 확인해주세요');
		         return;
		      }

		      $("#EmailForm").submit();
		   }
		});

	var message = "${message}";
	 if (message) {
	      alert(message);
	 }
	 
</script>

<div id="wrap" class="subWrap accountWrap"><!-- 로그인 공통 class="loginWrap" -->
    <!-- 내용 -->
    <div class="contents">
        <h2 class="loginTitle">
            <a href="/main">아이디 찾기</a>
        </h2>
        <p class="subscript">가입하신 방법에 따라 아이디 찾기가 가능합니다.<p>
		<div class="tabArea">
			<!-- 탭 메뉴 -->
			<div class="tabMenu type3">
				<a href="#;" data-tab-id="phoneTab" class="on">휴대폰번호로 찾기</a>
				<a href="#;" data-tab-id="emailTab">이메일로 찾기</a>
			</div>
			<!-- //탭 메뉴 -->
			<!-- 탭 내용 -->
			<div class="tabContArea">
				<!-- 휴대폰 인증 -->
				<form action="findidP" method="get" id="PhoneForm">
				<div class="tabCont on" id="phoneTab">
					<div class="formArea">
						<input type="text" id="users_name" name="users_name" class="ip_txt" placeholder="이름을 입력해주세요.">
						<a href="" class="btnDel"><span class="blind">삭제</span></a>
                    </div>
					<div class="formArea formBtn">
						<input type="number" id="users_phone" name="users_phone" inputmode="numeric" pattern="[0-9]*" class="ip_txt" placeholder="핸드폰번호를 입력해주세요." maxlength="12" oninput="maxLengthChk(this)">
						<a href="" class="btnDel"><span class="blind">삭제</span></a>
						<button type="button" id="FindIdPhone" class="btn btnStyle-9 btnInput">확인</button>
					</div>
				</div>
				</form>
				<!-- //휴대폰 인증 -->
				<!-- 이메일 인증 -->
				<form action="findidE" method="get" id="EmailForm">
				<div class="tabCont" id="emailTab">
                    <div class="formArea">
						<input type="text" id="users_name2" name="users_name" class="ip_txt" placeholder="이름을 입력해주세요.">
						<a href="" class="btnDel"><span class="blind">삭제</span></a>
                    </div>
					<div class="formArea formBtn">
						<input type="email" id="users_email" name="users_email" class="ip_txt" placeholder="이메일을 입력해주세요.">
						<a href="" class="btnDel"><span class="blind">삭제</span></a>
						<button type="button" id="FindIdEmail" class="btn btnStyle-9 btnInput">확인</button>
					</div>
				</div>
				</form>
				<!-- //이메일 인증 -->
			</div>
			<!-- //탭 내용 -->
		</div>
    </div>
    <!-- //내용 -->
</div>

<%@include file="../template/footer.jsp"%>