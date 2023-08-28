<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../template/header.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
var intervalId;
var pattern1 = /[0-9]/g;
var pattern2 = /[a-zA-Z]/ig;
var pattern3 = /[~!@#$%<>^&*+-]/ig;

$(document).ready(function() {

	// 숫자만 입력되는 input 설정.
	$(document).on("keyup", "#users_phone, #receiverTel", function() {
		$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
	});

	$("#users_id").on("keyup", function() {
		$(this).val( $(this).val().toLowerCase().replace(/[^a-zA-Z0-9]/gi,"") );
	});

    $("#users_name").on("focusout", function() {
		$(this).val( $(this).val().replace(/[^a-zA-Z0-9가-힇]/gi,"") );
	});
    

	// 아이디 체크
	$("#users_id").focusout(function() {
        $(this).parent().find('.errorMsg').html('').hide();
		var users_id = $(this).val();
		if (users_id == '') {
			$(this).parent().find('.errorMsg').html('<em class="essential">*</em> 아이디를 입력해주세요.').show();
			return;
		}

		if(users_id.length >= 4 && users_id.length <= 16)
			idCheck(users_id);
		else
			$(this).parent().find('.errorMsg').html('<em class="essential">*</em> 아이디는 영문 소문자/숫자, 4~16자로 입력해주세요').show();
	});

	// 비밀번호 체크
	$("#users_passwd").focusout(function() {
		var pattern1 = /[0-9]/;
		var pattern2 = /[a-zA-Z]/;
		var pattern3 = /[~!@#$%<>^&*+-]/;
        $(this).parent().find('.errorMsg').html('').hide();
		var users_passwd = $(this).val();
		if (users_passwd == "" || (users_passwd.length < 6 || users_passwd.length > 15)) {
			$(this).parent().find('.errorMsg').html('<em class="essential">*</em> 영문 소문자/숫자/특수문자 조합으로 8~15자 비밀번호를 입력해 주세요. <br /><em class="essential">*</em> 입력 가능 특수문자 ~!@#$%<>^&*-+').show();
		}
	});

	$("#users_passwd2").focusout(function() {
        $(this).parent().find('.errorMsg').html('').hide();
		var users_passwd = $("#users_passwd").val();
		var users_passwd2 = $(this).val();
		if (users_passwd2 != users_passwd) {
			$(this).parent().find('.errorMsg').html('<em class="essential">*</em> 비밀번호가 일치하지 않습니다.').show();
		}
	});

	$("#users_name").focusout(function() {
        $(this).parent().find('.errorMsg').html('').hide();
		var users_name = $(this).val();
		if (users_name == '') {
			$(this).parent().find('.errorMsg').html('<em class="essential">*</em> 이름을 입력해주세요.').show();
		}
	});


    // 생년월일 변경
    $("#birthdayY").on("change", function(e) {
        var birthdayY = $(this).val();
        var birthdayM = $("#birthdayM").val();
        $("#birthdayD").find("option").attr("disabled", false).show()
        if (birthdayM == 4 || birthdayM == 6 || birthdayM == 9 || birthdayM == 11) {
            if (Number($("#birthdayD").val()) == 31) {
                $("#birthdayD").val("");
            }
            $("#birthdayD").find("option.31").attr("disabled", true).hide();
        } else if (birthdayM == 2) {
            if (birthdayY % 4 != 0) {
                if (Number($("#birthdayD").val()) > 29) {
                    $("#birthdayD").val("");
                }
                $("#birthdayD").find("option.29").attr("disabled", true).hide();
            } else {
                if (Number($("#birthdayD").val()) > 28) {
                    $("#birthdayD").val("");
                }
            }
            $("#birthdayD").find("option.30").attr("disabled", true).hide();
            $("#birthdayD").find("option.31").attr("disabled", true).hide();
        }
    });

    $("#birthdayM").on("change", function(e) {
        var birthdayY = $("#birthdayY").val();
        var birthdayM =  $(this).val();
        $("#birthdayD").find("option").attr("disabled", false).show()
        if (birthdayM == 4 || birthdayM == 6 || birthdayM == 9 || birthdayM == 11) {
            if (Number($("#birthdayD").val()) == 31) {
                $("#birthdayD").val("");
            }
            $("#birthdayD").find("option.31").attr("disabled", true).hide();
        } else if (birthdayM == 2) {
            if (birthdayY % 4 != 0) {
                if (Number($("#birthdayD").val()) > 29) {
                    $("#birthdayD").val("");
                }
                $("#birthdayD").find("option.29").attr("disabled", true).hide();
            } else {
                if (Number($("#birthdayD").val()) > 28) {
                    $("#birthdayD").val("");
                }
            }
            $("#birthdayD").find("option.30").attr("disabled", true).hide();
            $("#birthdayD").find("option.31").attr("disabled", true).hide();
        }
    });
    // 생년월일 변경

});

/**
 * 아이디 중복체크 확인
 */
   function idCheck(users_id) {
		$("#users_id").data("checked", "false");
		$.ajax({
			url : '/member/idCheck/' + users_id,
			type : "POST",
			dataType : "json",
			success : function(result) {
				if (result == true) {
	                $("#users_id").parent().find('.errorMsg').html('<em class="essential">*</em> 중복된 아이디입니다.').show();
					toastPop('중복된 아이디입니다.', '', '', 'check');
				}
				else {
					$("#users_id").data("checked", "true");
	                $("#users_id").parent().find('.errorMsg').html("").hide()
					toastPop('사용 가능한 ID 입니다.');
				}
			}, error : function() {
				alert("에러등장")
			}
		});
	}  


/**
 * 회원가입
 */
 $(document).ready(function() {
	  $("#joinBtn").click(function(event) {
		  event.preventDefault(); //  오류일 경우 폼 제출 막기
		  
	var users_id = $("#users_id");
	var users_passwd = $("#users_passwd");
	var users_passwd2 = $("#users_passwd2");
	var users_phone = $("#users_phone");
	var users_email = $("#users_email");
	var users_name = $("#users_name");

	var birthdayY = $("#birthdayY");
	var birthdayM = $("#birthdayM");
	var birthdayD = $("#birthdayD");
	var users_birthday = $("#users_birthday");

	var zoneCode = $("#zoneCode");
	var postCode = $("#postCode");
	var address = $("#address");
	var oldAddress = $("#oldAddress");
	var addressDetail = $("#addressDetail");
	
	var signUpChkEmail = $("#signUpChkEmail");
	var signUpChkSms = $("#signUpChkSms");
	var signUpChkAgree1 = $("#signUpChkAgree1");
	var signUpChkAgree2 = $("#signUpChkAgree2");
	var signUpChkAgree3 = $("#signUpChkAgree3");

	var dateRegex = RegExp(/^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/);

	if (true) {
		if (users_id.length == 0 || users_id.val() == '') {
			users_id.focus();
			alert("아이디를 입력해 주세요");
			return;
		}

 		if (users_id.length > 0 && users_id.data("checked") == "false") {
			users_id.focus();
			alert("중복된 아이디입니다.")
			return;
		}  

		if (users_passwd.length > 0 && (users_passwd.val() == "" || (users_passwd.val().length < 6 || users_passwd.val().length > 15) || users_passwd.val().search(pattern1) < 0 || users_passwd.val().search(pattern2) < 0 || users_passwd.val().search(pattern3) < 0)) {
			users_passwd.focus();
			alert('비밀번호는 영문 소문자/숫자/특수문자 조합으로 8~15자로 비밀번호를 입력해 주세요');
			return;
		}

		if (users_passwd.length > 0 && users_passwd.val() != users_passwd2.val()) {
			users_passwd2.focus();
			alert('비밀번호가 일치하지 않습니다.');
			return;
		}
	}
	

	if (users_name.val() == "") {
		users_name.focus();
		alert('이름을 입력해 주세요.');
		return;
	}

    if (true) {
        if (users_phone.val() == "") {
        	users_phone.focus();
            alert('휴대전화 번호를 입력해 주세요.');
            return;
        }
    }

	if(true){
		if(users_email.val() == "") {
			users_email.focus();
			alert('이메일을 입력해 주세요.');
			return;
		}
	} 
	
	if (address.val() == "" || addressDetail.val() == "") {
		address.focus();
		alert('주소를 입력해 주세요.');
		return;
	}
    
	if (birthdayY.val() != '' && birthdayM.val() != '' && birthdayD.val() != '') {
        if (true) {
            var birth = birthdayY.val();
            var birthM;
            var birthD;
            if(Number(birthdayM.val()) < 1) birthM = '01';
            else if(Number(birthdayM.val()) < 10) birthM = '0' + Number(birthdayM.val());
            else if(Number(birthdayM.val()) > 12) birthM = '12';
            else birthM = Number(birthdayM.val());

            if(Number(birthdayD.val()) < 1) birthD = '01';
            else if(Number(birthdayD.val()) < 10) birthD = '0' + Number(birthdayD.val());
            else if(Number(birthdayD.val()) > 31) birthD = '31';
            else birthD = Number(birthdayD.val());

            users_birthday.val(String(birth) + String(birthM) + String(birthD));
        }
	}

     if (true) {
        if(users_birthday.val() != '') {
            if(!dateRegex.test(users_birthday.val())) {
                alert('생년월일 양식이 잘못되었습니다.');
                users_birthday.focus();
                return;
            }
        }
    } 

	if (!signUpChkAgree1.prop("checked")) {
		signUpChkAgree1.focus();
		alert('이용약관에 동의가 필요합니다.');
		return;
	}

	if (!signUpChkAgree2.prop("checked")) {
		signUpChkAgree2.focus();
		alert('개인정보 수집 및 이용 동의가 필요합니다.');
		return;
	}

	if (!signUpChkAgree3.prop("checked")) {
		signUpChkAgree3.focus();
		alert('14세 이상 연령확인이 필요합니다.');
		return;
	}
	
	 $("#signUpForm").submit(); // 완료되면 폼 제출

	});
 });
 
 function findPostCode() {
	    new daum.Postcode({
	        oncomplete : function(data) {
	            var oldAddress = data.jibunAddress.length > 0 ? data.jibunAddress : data.autoJibunAddress;
	            var zonecode = data.zonecode;
	            var roadAddress = data.roadAddress.length > 0 ? data.roadAddress : data.autoRoadAddress;
	            var buildingCode = data.buildingCode;
	            var postcode = data.postcode;

	            $("#zoneCode").val(zonecode);
	            $("#oldAddress").val(oldAddress);
	            $("#address").val(roadAddress);
	            $("#postCode").val(postcode);
	            $("#addressDetail").val("").focus();
	            $("#buildingCode").val(buildingCode);

	        }
	    }).open();
	}
</script>
<div id="wrap" class="joinWrap signUpWrap"><!-- 회원가입 공통 class="joinWrap" -->
        <!-- 내용 -->
        <div class="contents">
            <h2 class="areaTitle">회원가입</h2>
            <!-- 기본정보 -->
            <form name="signUpForm" id="signUpForm" action="/member/join" method="post">
				<div class="contSection">
					<!-- 아이디 -->
					<div class="formArea">
						<label for="users_id">아이디<em class="essential">*</em></label> 
						<input type="text" id="users_id" name="users_id" autocomplete="off" class="ip_txt" placeholder="영문 소문자/숫자,4~16자">
						<span class="errorMsg"></span>
					</div>
					<!-- //아이디 -->
					<!-- 비밀번호 -->
					<div class="formArea">
						<label for="inputSample">비밀번호<em class="essential">*</em></label>
						<input type="password" id="users_passwd" name="users_passwd" autocomplete="new-password" class="ip_txt" placeholder="영문 소문자,숫자,특수문자 조합 8~15자 이내">
						<span class="errorMsg"></span>
					</div>
					<!-- //비밀번호 -->
					<!-- 비밀번호 확인 -->
					<div class="formArea">
						<label for="inputSample">비밀번호 확인<em class="essential">*</em></label>
						<input type="password" id="users_passwd2" name="users_passwd2" class="ip_txt" placeholder="비밀번호를 다시 입력해주세요">
						<span class="errorMsg"></span>
					</div>
					<!-- //비밀번호 확인 -->

					<!-- 이름 -->
					<div class="formArea">
						<label for="inputSample">이름<em class="essential">*</em></label> 
						<input type="text" id="users_name" name="users_name" autocomplete="false" class="ip_txt" placeholder="이름을 입력해주세요" value="">
						<span class="errorMsg"></span>
					</div>
					<!-- //이름 -->

					<!-- 휴대전화 번호 -->
					<div class="formArea formBtn">
						<label for="users_phone">휴대전화 번호<em class="essential">*</em></label> 
						<input type="number" inputmode="numeric" pattern="[0-9]*" id="users_phone" name="users_phone" class="ip_txt" placeholder="숫자만 입력해주세요" maxlength="12" oninput="maxLengthChk(this)">
						</div>
					</div>
					<!-- //휴대전화 번호 -->

					<!-- 이메일 -->
					<div class="formArea formBtn" style=padding-top:20px;>
						<label for="inputSample">이메일<em class="essential">*</em></label>
						<input type="email" id="users_email" name="users_email" value="" class="ip_txt" placeholder="이메일을 입력해주세요">
					</div>
					
						<div class="formArea formBtn address">
							<label for="inputSample">주소<em class="essential">*</em></label> 
							<input type="text" id="zoneCode" name="users_zonecode" class="ip_txt" readonly="readonly"> 
							<input type="hidden" id="postCode" name="postCode"> 
							<a href="javascript:findPostCode()" class="btnStyle-4 btnInput">우편번호 검색</a>
							
						<div class="innerFormArea">
							<input type="text" id="address" name="users_address" class="ip_txt" readonly="readonly">
						</div>
						
						<div class="innerFormArea">
							<input type="text" id="addressDetail" name="users_addressdetail" class="ip_txt" placeholder="상세주소를 입력해 주세요"> 
							<input type="hidden" id="oldAddress" name="oldAddress" readonly="readonly"> 
							<input type="hidden" id="buildingCode" name="buildingCode">
							<button class="btnDel">
								<span class="blind">삭제</span>
							</button>
						</div>
					</div>
				<!-- 기본정보 끝 -->
				<!-- 추가정보 시작-->
				<div class="contSection" style=padding-top:20px;>
                        <!-- 생년월일 -->
                        <div class="infoArea type2">
                            <strong class="formLabel">생년월일</strong>
                            <div class="selectArea wd100">
                                <select name="birthdayY" id="birthdayY" class="sltCurrent">
                                    <option value="">YYYY</option> 
                                         <c:forEach var="i" begin="1950" end="2023">
    										<option value="${i}">${i}</option>
  										</c:forEach>                      
                                </select>
                                
                                <select name="birthdayM" id="birthdayM" class="sltCurrent">
                                    <option value="">MM</option>                           
                                    	<c:forEach var="i" begin="1" end="12">
											<c:choose>
												<c:when test="${i lt 10 }">
													<option value="0${i}">0${i}</option>
												</c:when>
												<c:otherwise>
													<option value="${i}">${i}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>      
                                </select>
                                
                                <select name="birthdayD" id="birthdayD" class="sltCurrent">
                                    <option value="">DD</option>
                                    	<c:forEach var="i" begin="1" end="31">
  											<c:choose>
     											<c:when test="${i lt 10 }">
          											<option value="0${i}">0${i}</option>
      											</c:when>
      											<c:otherwise>
          											<option value="${i}">${i}</option>
      											</c:otherwise>
  											</c:choose>
  										</c:forEach>     
                                </select>
                            </div>
                        </div>
                        <!-- //생년월일 -->
                    </div>                
	            <!-- //추가정보 -->
	            
	            <!-- 약관 동의 -->
	            <div class="contSection">
	                <div class="infoArea type2">
	                    <strong class="formLabel">이용약관동의<em class="essential">*</em></strong>
	                    <div class="checkAgree">
	                        <!-- 전체 동의 -->
	                        <div class="checkAll">
	                            <div class="check">
	                                <input type="checkbox" name="signUpChkAll" id="signUpChkAll">
	                                <label for="signUpChkAll">이용 약관 전체 동의 합니다.</label>
	                            </div>
	                        </div>
	                        <!-- //전체 동의 -->
	                        <!-- 약관 동의 -->
	                        <div class="checkEach">
	                            <div class="check">
	                                <input type="checkbox" name="signUpChkAgree1" id="signUpChkAgree1">
	                                <label for="signUpChkAgree1">이용약관 동의 <span class="essential">(필수)</span></label>
	                            </div>
	                            <div class="check">
	                                <input type="checkbox" name="signUpChkAgree2" id="signUpChkAgree2">
	                                <label for="signUpChkAgree2">개인정보 수집 및 이용 동의 <span class="essential">(필수)</span></label>
	                            </div>
	                            <div class="check">
	                                <input type="checkbox" name="signUpChkAgree2" id="signUpChkAgree3">
	                                <label for="signUpChkAgree3">본인은 만 14세 이상입니다 <span class="essential">(필수)</span></label>
	                            </div>
	                            <div class="chkChoice">
	                                <div class="check checkAll">
	                                    <input type="checkbox" name="signUpChkAgree4" id="signUpChkAgree4">
	                                    <label for="signUpChkAgree4">혜택/정보 등 마케팅 수신 동의 <span class="inessential">(선택)</span></label>
	                                </div>
	                                <div class="choiceOption">
	                                    <div class="check">
	                                        <input type="checkbox" name="signUpChkSms" id="signUpChkSms">
	                                        <label for="signUpChkSms">SMS</label>
	                                    </div>
	                                    <div class="check">
	                                        <input type="checkbox" name="signUpChkEmail" id="signUpChkEmail">
	                                        <label for="signUpChkEmail">E-mail</label>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <!-- //약관 동의 -->	                     
	                    </div>
	                </div>
            	</div>
            	 <div class="btn sml">
                	<button type="submit" id="joinBtn" class="btnStyle-2">가입하기</button>
           		</div> 
            
            	<input type="hidden" id="users_birthday" name="users_birthday" value="">
			</form>
        </div>
    </div>

<%@include file="../template/footer.jsp"%>