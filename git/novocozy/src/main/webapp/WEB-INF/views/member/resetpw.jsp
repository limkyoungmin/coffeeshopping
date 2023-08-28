<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../template/header.jsp"%>

<script type="text/javascript">
	var intervalId;

	$(document).ready(function() {
		// 숫자만 입력되는 input 설정.
		$(document).on("keyup", "#tel", function() {
			$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
		});
	});

	 $(document).ready(function() {
		   $("#ResetPw").click(function(event) {
		      event.preventDefault();
		      FindPw();
		   });

		   function FindPw() {
		      var users_id = $('#users_id').val();
		      var users_email = $('#users_email').val();

		      if (users_id == null || users_id == '') {
		         toastPop('아이디를 입력해주세요.');
		         return;
		      }

		      if (users_email == null || users_email == '') {
		         toastPop('이메일을 확인해주세요');
		         return;
		      }

		      $("#ResetPwForm").submit();
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
            <a href="/main">비밀번호 재설정</a>
        </h2>
        <p class="subscript">가입시 등록한 이메일로 인증이 가능합니다.<p>
		<div class="tabArea">
			<!-- 탭 메뉴 -->
			<div class="tabMenu type1">
				<a href="#" style=font-weight:bold;font-size:23px;>이메일 인증</a>
			</div>
			<!-- //탭 메뉴 -->
			<!-- 탭 내용 -->
			<div class="tabContArea">
				<!-- 이메일 인증 -->
				<form action="resetPw" method="get" id="ResetPwForm">
				<div class="tabCont on" id="emailTab">
                    <div class="formArea">
						<input type="text" id="users_id" name="users_id" class="ip_txt" placeholder="아이디를 입력해주세요.">
						<a href="" class="btnDel"><span class="blind">삭제</span></a>
                    </div>
					<div class="formArea formBtn">
						<input type="email" id="users_email" name="users_email" class="ip_txt" placeholder="이메일을 입력해주세요.">
						<a href="" class="btnDel"><span class="blind">삭제</span></a>
						<button type="button" id="ResetPw" class="btn btnStyle-9 btnInput">인증요청</button>
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