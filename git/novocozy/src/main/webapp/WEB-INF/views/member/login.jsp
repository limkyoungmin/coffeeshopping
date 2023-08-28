<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../template/header.jsp"%>
<script type="text/javascript">
	/**
	 * 로그인창에서 엔터키 사용
	 */
    var intervalId;
    var pattern1 = /[0-9]/g;
    var pattern2 = /[a-zA-Z]/ig;
    var pattern3 = /[~!@#$%<>^&*+-]/ig;
	$(document).ready(function() {
			$('#users_id, #users_passwd').on("keydown", function(e) {
			if (e.keyCode == 13) {
				if ($.trim($('#users_id').val()) != "" && $.trim($("#users_passwd").val()) == "") {
					$("#users_passwd").focus();
				} else if ($.trim($('#users_id').val()) != "" && $.trim($("#users_passwd").val()) != "") {
					loginBtn();
				} else {
					alert("아이디를 입력해주세요.");
					$('#users_id').focus();
				}
			}
		});

		/**
		 * 로그인버튼 
		 */
		function loginBtn() {
		   event.preventDefault(); // 오류일 경우 폼 제출 막기
		
		   var users_id = $('#users_id').val();
		   var users_passwd = $('#users_passwd').val();
		   
		   if (users_id == '') {
		      alert('아이디를 입력해주세요.');
		      return;
		   }
		
		   if (users_passwd == '') {
		      alert('비밀번호를 입력해주세요.');
		      return;
		   }

		   $("#loginForm").submit(); // 완료되면 폼 제출
		}
		
		$("#loginBtn").click(loginBtn);
	});
	
	var message = "${message}";
	 if (message) {
	      alert(message);
	 }

</script>
    <div id="wrap" class="loginWrap"><!-- 로그인 공통 class="loginWrap" -->
        <!-- 내용 -->
        <div class="contents">
            <h2 class="loginTitle">로그인</h2>
            <div class="loginArea">
                <div class="loginForm">
                	<form id="loginForm" name="loginForm" method="post" action="login">
                    <!-- 아이디 -->
                    <div class="formArea">
                        <input type="text" id="users_id" name="users_id" class="ip_big" placeholder="아이디를 입력해주세요">
                        <a href="" class="btnDel"><span class="blind">삭제</span></a>
                    </div>
                    <!-- //아이디 -->                   
                    <!-- 비밀번호 -->
                    <div class="formArea">
                        <input type="password" id="users_passwd" name="users_passwd" class="ip_big" placeholder="비밀번호를 입력해주세요">
                        <a href="" class="btnDel"><span class="blind">삭제</span></a>
                    </div>
                    <!-- //비밀번호 -->
                    <span class="errorMsg" style="display:block"></span>
                    <!-- 로그인 버튼 -->
                    <div class="btn btnLogin">
                        <button type="submit" id="loginBtn" class="btnStyle-2">로그인하기</button>
                    </div>
                    <!-- //로그인 버튼 -->   
                    </form>
                    
                    <!-- 버튼/아이디찾기/비밀번호 찾기 -->
                    <div class="loginSearch">
                        <div class="findAccount">
                            <a href="/member/findid">아이디 찾기</a>
                            <a href="/member/resetpw">비밀번호 재설정</a>
                        </div>
                    </div>
                    <!-- //버튼/아이디찾기/비밀번호 찾기 -->
                </div>
            </div>
            <!-- SNS 계정 로그인 -->
             
		<!-- //SNS 계정 로그인 -->
            <!-- 회원가입 -->
            <div class="btnBottom">
                <a href="#popJoin" class="popOpen btnStyle-13">회원가입</a>   
            </div>
            <!-- //회원가입 -->
        </div>
        <!-- //내용 -->
    </div>
    
    <!-- 팝업::회원가입 -->
    <div id="popJoin" class="popWrap popJoin"><!-- 레이어팝업 공통 class="popWrap" -->
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
                        <a href="/member/login" class="popClose btnLogin">로그인하기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- //팝업::회원가입 -->
    

<div id="identityVerificationWrap"></div>

<%@include file="../template/footer.jsp"%>

