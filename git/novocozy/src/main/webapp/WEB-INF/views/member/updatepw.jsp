<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../template/header.jsp"%>

<script type="text/javascript">
    var pattern1 = /[0-9]/g;
    var pattern2 = /[a-zA-Z]/ig;
    var pattern3 = /[~!@#$%<>^&*+-]/ig;

    $(document).ready(function() {
        $("#users_passwd").focusout(function() {
            $(this).parent().find('.errorMsg').html('').hide();
            var users_passwd = $("#users_passwd");
            if (users_passwd.length > 0 && (users_passwd.val() == "" || (users_passwd.val().length < 6 || users_passwd.val().length > 15) || users_passwd.val().search(pattern1) < 0 || users_passwd.val().search(pattern2) < 0 || users_passwd.val().search(pattern3) < 0)) {
                $(this).parent().find('.errorMsg').html('<em class="essential">*</em> 영문 소문자/숫자/특수문자 조합으로 8~15자로 비밀번호를 입력해 주세요. <br /><em class="essential">*</em> 입력 가능 특수문자 ~!@#$%<>^&*-+').show();
            }
        });
        
        $("#password2").focusout(function() {
            $(this).parent().find('.errorMsg').html('').hide();
            var users_passwd = $("#users_passwd");
            var password2 = $(this);
            if (users_passwd.length > 0 && users_passwd.val() != password2.val()) {
                $(this).parent().find('.errorMsg').html('<em class="essential">*</em> 비밀번호가 일치하지 않습니다.').show();
            }
        });

    });


    function resetPassword() {
    	var users_id=$("#users_id");
        var users_passwd = $("#users_passwd");
        var password2 = $("#password2");
        
        if (users_passwd.length > 0 && (users_passwd.val() == "" || (users_passwd.val().length < 6 || users_passwd.val().length > 15) || users_passwd.val().search(pattern1) < 0 || users_passwd.val().search(pattern2) < 0 || users_passwd.val().search(pattern3) < 0)) {
			toastPop('비밀번호를 조건에 맞게 설정해 주세요.');
			return;
		}

		if (users_passwd.length > 0 && users_passwd.val() != password2.val()) {
            toastPop('비밀번호가 일치하지 않습니다. 다시 확인해주세요.')
			return;
		}
		$("#updatepwForm").submit();
		
    }
</script>

<div id="wrap" class="subWrap accountWrap"><!-- 로그인 공통 class="loginWrap" -->
    <!-- 내용 -->
    <div class="contents">
        <h2 class="loginTitle">
            <a href="/main">비밀번호 재설정</a>
        </h2>
        <p class="subscript">영문 소문자/숫자/특수문자 조합으로 <br>8~15자 비밀번호를 입력해 주세요. <br>(입력 가능 특수문자 ~!@#$%&lt;&gt;^&amp;*-+)</p>
		<div class="hr tabArea">
			<!-- 탭 내용 -->
			<div class="tabContArea">
			<form action="updatepasswd" method="POST" id="updatepwForm">
				<div class="tabCont on" id="phoneTab">
                    <!-- 아이디 -->
					<div class="formArea">
						<input type="hidden" id="users_id" name="users_id" class="ip_txt" placeholder="아이디" value="${users_id}" >
						<input type="hidden" id="users_email" name="users_email" class="ip_txt" placeholder="아이디" value="${users_email}" >
						<a href="" class="btnDel"><span class="blind">삭제</span></a>
					</div>
                    <!-- //아이디 -->
					<div class="formArea">
						<input type="password" id="users_passwd" name="users_passwd" class="ip_txt" placeholder="새로 사용하실 비밀번호" autocomplete="new-password">
						<a href="" class="btnDel"><span class="blind">삭제</span></a>
                        <span class="errorMsg" style="padding-left:0"></span>
					</div>
					<div class="formArea">
						<input type="password" id="password2" name="password2" class="ip_txt" placeholder="새로 사용하실 비밀번호 확인" autocomplete="new-password">
						<a href="" class="btnDel"><span class="blind">삭제</span></a>
                        <span class="errorMsg" style="padding-left:0"></span>
					</div>
                    <div class="btn sml wd100">
                        <a href="javascript:resetPassword()" class="btnStyle-2">변경</a>
                    </div>
				</div>
			</form>
			</div>
			<!-- //탭 내용 -->

		</div>
    </div>
    <!-- //내용 -->
</div>

<%@include file="../template/footer.jsp"%>