<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib  uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@include file="../template/header.jsp"%>

<%@include file="mypagetemplate.jsp"%>
				
<script type="text/javascript">
$(document).ready(function() { 
	  var birthday = $('#users_birthday').val();
	  var dateArray = birthday.split('-');
	  var year = dateArray[0];
	  var month = dateArray[1]; 
	  var day = dateArray[2]; 

	  $('#birthdayY').val(year);
	  $('#birthdayM').val(month);
	  $('#birthdayD').val(day);

	  $('#birthdayY').find(`option[value=${year}]`).prop('selected', true);
	  $('#birthdayM').find(`option[value=${month}]`).prop('selected', true);
	  $('#birthdayD').find(`option[value=${day}]`).prop('selected', true);
	});

	$(document).ready(function() {

		// 비밀번호 체크
		$("#users_passwd").focusout(function() {
			var pattern1 = /[0-9]/;
			var pattern2 = /[a-zA-Z]/;
			var pattern3 = /[~!@#$%<>^&*+-]/;
			//$(this).parent().next().html('');
			$(this).parent().find('.errorMsg').html('');
			var users_passwd = $(this).val();
			if (users_passwd == "" || (users_passwd.length < 6 || users_passwd.length > 15)
					|| !pattern1.test(users_passwd) || !pattern2.test(users_passwd) || !pattern3.test(users_passwd)) {
				$(this).parent().find('.errorMsg').html('<em class="essential">*</em>비밀번호는 영문 소문자/숫자/특수문자 조합으로 8~15자 비밀번호를 입력해 주세요.(입력 가능 특수문자 ~!@#$%<>^&*-+)');
			}
		});

		$("#users_passwd2").focusout(function() {
			//$(this).parent().next().html('');
			$(this).parent().find('.errorMsg').html('');
			var users_passwd = $("#users_passwd").val();
			var users_passwd2 = $(this).val();
			if (users_passwd2 != users_passwd) {
				$(this).parent().find('.errorMsg').html('<em class="essential">*</em>비밀번호가 일치하지 않습니다.');
			}
		});

		$("#users_name").focusout(function() {
			//$(this).parent().next().html('');
			$(this).parent().find('.errorMsg').html('');
			var users_name = $(this).val();
			if (users_name == '') {
				$(this).parent().find('.errorMsg').html('<em class="essential">*</em>이름을 입력해주세요.');
			}
		});

		$("#users_email").focusout(function() {
			//$(this).parent().next().html('');
			$(this).parent().find('.errorMsg').html('');
			var users_email = $(this).val();
			var users_emailValidation = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			if (!users_emailValidation.test(users_email)) {
				$(this).parent().find('.errorMsg').html('<em class="essential">*</em>잘못된 이메일 형식입니다.');
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
        // 생년월일 변경 끝
	});

	// 유저정보 업데이트.
	function updateUserInfo() {
		if (!confirm('수정하겠습니까?')) {
			return;
		}

		var users_passwd = $("#users_passwd");
		var users_passwd2 = $("#users_passwd2");
		var users_phone = $("#users_phone");
		var users_email = $("#users_email");
		var users_name = $("#users_name");
		
		var zonecode = $("#zonecode");
		var postCode = $("#postCode");
		var address = $("#address");
		var oldAddress = $("#oldAddress");
		var addressdetail = $("#addressdetail");
		
		var users_birthday = $("#users_birthday");
        var birthdayY = $("#birthdayY");
        var birthdayM = $("#birthdayM");
        var birthdayD = $("#birthdayD");

        if (birthdayY.val() != '' && birthdayM.val() != '' && birthdayD.val() != '') {
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

		var dateRegex = RegExp(/^\d{4}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[01])$/);
		
		if(users_birthday.val() != '') {
			if(!dateRegex.test(users_birthday.val())) {
				alert('생년월일 양식이 잘못되었습니다.');
				birthday.focus();
				return;
			}
		}
		
		if (address.val() == "" || addressdetail.val() == "") {
			address.focus();
			alert('주소를 입력해 주세요.');
			return;
		}
		
		if(true && users_passwd.val() != "") {
			var pattern1 = /[0-9]/;
			var pattern2 = /[a-zA-Z]/;
			var pattern3 = /[~!@#$%<>^&*+-]/;
			
			if ((users_passwd.val().length < 6 || users_passwd.val().length > 15)
					|| !pattern1.test(users_passwd.val()) || !pattern2.test(users_passwd.val()) || !pattern3.test(users_passwd.val())) {
				alert('비밀번호는 영문 소문자/숫자/특수문자 조합으로 8~15자로 비밀번호를 입력해 주세요.(입력 가능 특수문자 ~!@#$%<>^&*-+)');
				users_passwd.focus();
				return;
			}
	
			if (users_passwd.val() != users_passwd2.val()) {
				alert('비밀번호가 일치하지 않습니다.');
				users_passwd2.focus();
				return;
			}
			checkPassword();
		}
		else {
			updateInfo();
		}
	}

	function checkPassword() {
		   $.ajax({
		      url: '/mypage/pwCheck',
		      type: "POST",
		      data: {
		         "users_id": $("#users_id").val(),
		         "users_passwd": $("#editInfoPw").val()
		      },
		      dataType: "json",
		      success: function(response) {
		         if (response.data == 0) {
		            updateInfo();
		         } else {
		            alert('기존 비밀번호가 일치하지 않습니다.');
		         }
		      },
		      error: function() {
		         alert('비밀번호 확인 중 오류 발생');
		      }
		   });
		}

 	function updateInfo() {
 		var users_id=$("#users_id");
		var users_passwd = $("#users_passwd");
		var users_phone = $("#users_phone");
		var users_email = $("#users_email");
		var users_name = $("#users_name");
		var users_birthday = $("#users_birthday");
		var users_zonecode = $("#zonecode");
		var users_address = $("#address");
		var users_addressdetail = $("#addressdetail");

		$.ajax({
			url : '/mypage/updateInfo',
			type : "POST",
			data : {
				users_id : users_id.val(),
				users_passwd : users_passwd.val(),
				users_phone : $.trim(users_phone.val()),
				users_email : $.trim(users_email.val()),
				users_name : $.trim(users_name.val()),
				users_birthday : $.trim(users_birthday.val()),
				users_zonecode : users_zonecode.val(),
				users_address : users_address.val(),
				users_addressdetail : users_addressdetail.val(),
			},
			success : function(response) {
                if (response == 1) {
                    toastPop('수정되었습니다.');
                    setTimeout("location.reload()", 1000);
                } else {
					alert('수정에 실패하였습니다.')
                }
				
			}, error : function() {
				alert('수정 중 오류가 발생했습니다.');
			}
		});
	}

	// 회원탈퇴.
	function dropUser() {
        if ($("#membershipAgree").prop("checked")) {
            if (confirm('탈퇴하시겠습니까?')) {
                $.ajax({
                    url : '/mypage/users/drop',
                    type : "POST",
                    data: {
                        "users_id": $("#users_id").val(),
                     },
                    success : function(response) {
                        if (response == 1) {
                            toastPop('탈퇴처리 되었습니다. 그동안 이용해주셔서 감사합니다.');
                            setTimeout(() => { location.href = "/member/logout" }, 1500);
                        } else {
                            alert('회원 탈퇴에 실패하였습니다.');
                        }                      
                    }, error : function() {
                        alert('회원탈퇴 시도 중 오류가 발생했습니다.');
                    }
                });
		    }
        } else {
            toastPop('회원 탈퇴 약관에 동의해주세요.');
        }
	}
	
	 function findPostCode() {
		    new daum.Postcode({
		        oncomplete : function(data) {
		            var oldAddress = data.jibunAddress.length > 0 ? data.jibunAddress : data.autoJibunAddress;
		            var zonecode = data.zonecode;
		            var roadAddress = data.roadAddress.length > 0 ? data.roadAddress : data.autoRoadAddress;
		            var buildingCode = data.buildingCode;
		            var postcode = data.postcode;

		            $("#zonecode").val(zonecode);
		            $("#oldAddress").val(oldAddress);
		            $("#address").val(roadAddress);
		            $("#postCode").val(postcode);
		            $("#addressdetail").val("").focus();
		            $("#buildingCode").val(buildingCode);

		        }
		    }).open();
		}
</script>
<div class="userCont joinWrap">
    <div class="contBox">
        <div class="colTitle">
            <h2 class="title">개인정보수정</h2>
            <div class="guideArea">
                <ul class="guideList">
                    <li>정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인 합니다.</li>
                    <li>노보코지는 회원님의 개인정보를 신중히 취급하며, 회원님의 동의없이는 기재하신 회원정보를 공개 및 변경하지 않습니다.</li>
                </ul>
            </div>
        </div>
        <div class="contSection">
            <!-- 아이디 -->
            <div class="formArea">
                <label for="userId">아이디</label>
                <input type="text" id="users_id" name="users_id" class="ip_txt" value="${userView.users_id}" readonly>
            </div>
            <!-- //아이디 -->
            
                <!-- 현재 비밀번호 -->
                <div class="formArea">
                    <label for="nowPw">현재 비밀번호</label>
                    <input type="password" id="editInfoPw" name="editInfoPw" class="ip_txt" placeholder="비밀번호를 입력해주세요">
                </div>
                <!-- //현재 비밀번호 -->
                
                <!-- 새 비밀번호 -->
                <div class="formArea">
                    <label for="newPw">새 비밀번호</label>
                    <input type="password" id="users_passwd" name="users_passwd" class="ip_txt" placeholder="새 비밀번호(영문 소문자/숫자/특수문자 8~15자)">
                </div>
                <!-- //새 비밀번호 -->
                
                <!-- 새 비밀번호 확인 -->
                <div class="formArea">
                    <label for="newPwChk">새 비밀번호 확인</label>
                    <input type="password" id="users_passwd2" name="users_passwd2" class="ip_txt" placeholder="비밀번호를 다시 입력해주세요">
                    <span class="errorMsg">비밀번호가 일치하지 않습니다.</span>
                </div>
                <!-- //새 비밀번호 확인 -->
            
            <!-- 이름 -->
            <div class="formArea">
                <label for="userName">이름</label>
                <input type="text" id="users_name" name="users_name" class="ip_txt" placeholder="이름을 입력해주세요" value="${userView.users_name}">
                <span class="errorMsg"></span>
            </div>
            <!-- //이름 -->
            
            <!-- 휴대전화 번호 -->
            <div class="formArea formBtn">
                <label for="userTel">휴대전화 번호</label>
                <input type="number" inputmode="numeric" pattern="[0-9]*" id="users_phone" name="users_phone" class="ip_txt" placeholder="숫자만 입력해주세요" value="${userView.users_phone}" maxlength="12" oninput="maxLengthChk(this)">
                <span class="errorMsg"></span>
            </div>
            <!-- //휴대전화 번호 -->
            
            <!-- 이메일 -->
            <div class="formArea">
                <label for="userEmail">이메일</label>
                	<input type="email" id="users_email" name="users_email" class="ip_txt" placeholder="이메일을 입력해주세요" value="${userView.users_email}">
                <span class="errorMsg"></span>
            </div>
            <!-- 주소 -->
            <div class="formArea formBtn address">
				<label for="inputSample">주소</label> 
				<input type="text" id="zonecode" name="users_zonecode" class="ip_txt" readonly="readonly" style="width:324px;" value="${userView.users_zonecode}"> 
				<input type="hidden" id="postCode" name="postCode"> 
				<a href="javascript:findPostCode()" class="btnStyle-4 btnInput">우편번호 검색</a>
						
				<div class="innerFormArea">
					<input type="text" id="address" name="users_address" class="ip_txt" readonly="readonly" value="${userView.users_address}">
				</div>
					
				<div class="innerFormArea">
					<input type="text" id="addressdetail" name="users_addressdetail" class="ip_txt" placeholder="상세주소를 입력해 주세요" value="${userView.users_addressdetail}"> 
					<input type="hidden" id="oldAddress" name="oldAddress" readonly="readonly"> 
					<input type="hidden" id="buildingCode" name="buildingCode">
					<button class="btnDel">
						<span class="blind">삭제</span>
					</button>
				</div>
			</div>
            <!-- //이메일 -->
        </div>
        <!-- 기본정보 -->

        <!-- 추가정보 -->
        <div class="contSection">
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
                    
                    <input type="hidden" name="users_birthday" id="users_birthday" value="${userView.users_birthday}">
                </div>
            </div>
            <!-- //생년월일 -->
        </div>
        <!-- //추가정보 -->
        <!-- 가입 정보 -->
        <div class="contSection">
            <div class="infoArea">
                <strong class="formLabel">가입일</strong>
                <span class="date">${userView.users_date}</span>
            </div>
        </div>
        <!-- //가입 정보 -->
        <!-- 약관 동의 -->
        <div class="contSection">
            <div class="infoArea type2">
                <strong class="formLabel">마케팅동의</strong>
                <div class="checkMaketing">
                    <!-- 전체 동의 -->
                    <div class="checkAll">
                        <div class="check">
                            <input type="checkbox" name="editInfoChkAgree3" id="editInfoChkAgree3">
                            <label for="editInfoChkAgree3">혜택/정보 등 마케팅 수신 동의 (선택)</label>
                        </div>
                    </div>
                    <!-- //전체 동의 -->
                    <!-- 약관 동의 -->
                    <div class="checkEach">
                        <ul>
                            <li>
                                <div class="check">
                                    <input type="checkbox" name="editInfoChkSms" id="editInfoChkSms">
                                    <label for="editInfoChkSms">SMS</label>
                                </div>
                            </li>
                            <li>
                                <div class="check">
                                    <input type="checkbox" name="editInfoChkEmail" id="editInfoChkEmail">
                                    <label for="editInfoChkEmail">E-mail</label>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!-- //약관 동의 -->
                </div>
                <div class="guideText">
                    <p class="text">이메일/SMS 수신 동의를 하시면 다양한 할인혜택과 이벤트/신상품 등의 정보를 빠르게 만나실 수 있습니다. <br>단,주문 및 배송관련 정보는 수신동의와 상관없이 자동 발송됩니다.</p>
                </div>
            </div>
        </div>
        <!-- //약관 동의 -->
        <!-- 탈퇴하기 -->
        <div class="contSection">
            <div class="infoArea">
                <strong class="formLabel">회원탈퇴</strong>
                <div class="infoText">
                    <div class="btnInner"><a href="#popDropUser" class="popOpen btnStyle-5">탈퇴하기</a></div>
                </div>
            </div>
        </div>
        <!-- //탈퇴하기 -->
        <!-- 회원가입 버튼 -->
        <div class="btn sml">
            <a href="javascript:updateUserInfo()" class="btnStyle-2">정보수정</a>
        </div>
        <!-- //회원가입 버튼 -->
    </div>
</div>
                

<!-- 팝업::회원탈퇴 -->
<div id="popDropUser" class="popWrap popDropUser"><!-- 레이어팝업 공통 class="popWrap" -->
    <div class="popInner">
        <div class="popBox">
            <h5 class="popHeader">회원탈퇴</h5>
            <div class="btnClose">
                <a href="" class="popClose iconS"><span class="blind">팝업 닫기</span></a>
            </div>
            <div class="popBody">
                <!-- 서비스 현황 -->
                <div class="statusBox">                   
                    <p class="date"><span class="name">${userView.users_name}</span>님의<br>
                    <c:set var="currentDate" value="<%= new java.util.Date() %>" />
                    <fmt:formatDate value="${currentDate}" pattern="yyyy년 MM월 dd일" /> 서비스 현황입니다.</p>

                    <span class="service">BRONZE 등급</span>
                    <span class="service"><em class="title">사용 가능 쿠폰: 0 개</em></span>
                </div>
                <!-- //서비스 현황 -->

                <!-- 꼭 알아두세요! -->
                <div class="section guideArea">
                    <strong class="guideTitle iconS">회원 탈퇴 시 유의사항</strong>
                    <ul class="guideList">                   
                        <li>회원 탈퇴 후 고객님의 개인정보 및 주문정보가 모두 삭제되어 더 이상 회원혜택을 받으실 수 없습니다.</li>
                        <li>주문 진행 중인 내역 등이 있는 경우 배송 완료일로부터 9일 이후 회원 탈퇴가 가능합니다.</li>
                        <li>회원 탈퇴한 날로부터 30일 이후 회원가입이 가능합니다.</li>
                    </ul>
                    <div class="check">
                        <input type="checkbox" name="membershipAgree" id="membershipAgree">
                        <label for="membershipAgree">회원 탈퇴 후 노보코지 혜택 상실에 대해 동의합니다.</label>
                    </div>
                </div>
                <!-- //꼭 알아두세요! -->
            </div>
        </div>
        <div class="popBtn btn">
            <a href="javascript:dropUser()" class="btnStyle-2">확인</a>
        </div>
    </div>
</div>
<!-- //팝업::회원탈퇴 -->
            <!-- //컨텐츠 -->
        </div>
    </div>
    <!-- //내용 -->
</div>
<!-- //컨텐츠 -->

<%@include file="../template/footer.jsp"%>