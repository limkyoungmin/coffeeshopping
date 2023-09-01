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

<script type="text/javascript">
    $(function() {
        $(".popWrap").on("click", ".popClose", function(e) {
            e.preventDefault();
            $(this).parents(".popWrap").removeClass("on");
        })
    })
</script>
<%@include file="mypagetemplate.jsp"%>
			<!-- 컨텐츠 -->
			<div class="userCont">
			    <!-- 최근 주문내역 -->
			    <div class="contBox history">
			        <div class="colTitle">
			            <h2 class="title">최근 주문내역</h2>
			            <p class="sub">최근 주문하신 3개월 이내 내역만 보여집니다.</p>
			        </div>
			        <!-- <div class="noHistory" style="display:none"><!--최근 주문 내역 없을 때 -->
			        <div class="noHistory">
			            <p class="text">최근 주문 내역이 없습니다.</p>
			        </div>
			        <div class="orderList"><!--최근 주문 내역 있을 때 -->
			            <ul class="cartList">              

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