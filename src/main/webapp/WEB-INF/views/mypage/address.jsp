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

	/* 로그인 */
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
							<span class="userId">회원</span>님, 반갑습니다.
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
						<a href="OrderList.jsp" class="iconS"> 주문/배송 <em class="number">0건</em></a>
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
						<li class=""><a href="OrderList.jsp">주문/배송내역</a></li>
						<li class=""><a href="ReturnList.jsp">반품/교환내역</a></li>
						<li class=""><a href="AddressMg.jsp">배송지 관리</a></li>
						<li class=""><a href="#">적립금 내역</a></li>
						<li class=""><a href="MyWrite.jsp">작성한 글</a></li>
						<li class=""><a href="EditInfo.jsp">개인정보 수정</a></li>
					</ul>
				</div>
				<!-- 컨텐츠 -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $("#deliveryName").on("focusout", function() {
        var deliveryName = $(this).val();
        console.log(deliveryName);
        var $receiverName = $("#deliveryAddressForm").find("input[name=receiverName]");
        if ($receiverName.val() == '') {
            $receiverName.val(deliveryName);
        }
    })
});

function chageDefaultAddress() {
	var $checkedAddress = $("input[name='addressList']:radio:checked");

	$.ajax({
		url : contextPath + "/delivery/changeDeliveryAddress/" + $checkedAddress.val(),
		type: "GET",
		success: function(response) {
			if(response.resultCode == '0000') {
				toastPop('배송지가 변경되었습니다.');
			}
			else {
				toastPop(response.message);
			}
		}, 
		error: function() {
			toastPop('배송지 변경중 오류가 발생되었습니다. 잠시후 다시 시도바랍니다.');
		}
	});
}

function deleteUserDeliveryAddress(addressNo, obj) {
    if (confirm('삭제 하시겠습니까?')) {
        $.ajax({
            url : contextPath + "/delivery/address/" + addressNo,
            type: "DELETE",
            success: function(response) {
                if(response.resultCode == '0000') {
                    $(obj).parent().parent().remove();
                    alert('삭제되었습니다.');
                }
                else {
                    alert(response.message);
                }
            }, 
            error: function() {
                alert('삭제중 오류가 발생되었습니다. 잠시후 다시 시도바랍니다.');
            }
	    });
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

            $("#zoneCode").val(zonecode);
            $("#oldAddress").val(oldAddress);
            $("#address").val(roadAddress);
            $("#postCode").val(postcode);
            $("#addressDetail").val("").focus();
            $("#buildingCode").val(buildingCode);
        }
    }).open();
}

function saveDeliveryAddress() {
    var receiverName = $("#receiverName").val();
    var tel = $("#tel").val();
    var deliveryName = $("#deliveryName").val();
    var zoneCode = $("#zoneCode").val();
    var postCode = $("#postCode").val();
    var address = $("#address").val();
    var addressDetail = $("#addressDetail").val();
    var oldAddress = $("#oldAddress").val();
    var doorKey = $("#doorKey").val();

    if (deliveryName == '') {
    	alert('배송지명을 입력해주세요.');
        $("#deliveryName").focus();
        return;
    }

    if (receiverName == '') {
        alert('받는 분 성함을 입력해주세요.');
        $("#receiverName").focus();
        return;
    }

    if (tel == null || tel == '' || tel.length < 10) {
    	alert('휴대전화 번호를 확인해주세요.');
        $("#tel").focus();
        return;
    }

    if (address == '') {
    	alert('주소를 입력해주세요.');
        $("#address").focus();
        return;
    }

    if (addressDetail == '') {
    	alert('상세 주소를 입력해주세요.');
        $("#addressDetail").focus();
        return;
    }

    if ($("#entranceMethodY").prop("checked")) {
        if (doorKey == '') {
        	alert('공동현관 출입번호를 입력해주세요.');
            $("#doorKey").focus();
            return;
        }
    } else if ($("#entranceMethodN").prop("checked")) {
        $("#doorKey").val("");
    }

    if($.trim($("#deliveryAddressForm input").val()) == '') {
      $("#addressBtn").removeClass("btnStyle-5");
      $("#addressBtn").addClass("btnStyle-12");
    } else{
      $("#addressBtn").removeClass("btnStyle-12");
      $("#addressBtn").addClass("btnStyle-5");
    }

    $("#defaultAddressYn").val($("input[name='checkDefaultAddressYn']:checkbox").is(':checked')?'Y':'N');

    var msg = '등록';
    if($("#addressNo").val() != '') {
        msg = '수정';
    }
    
    $("#deliveryAddressForm").ajaxForm({
        success: function() {
        	alert('배송지가 ' + msg + '되었습니다.');
            location.reload()
        },
        error : function(xhr,status,error) {
            //console.log(xhr);
            //console.log(status);
            //console.log(error);
            alert('배송지 '+ msg + '에 실패하였습니다.');
        }
    });
    $("#deliveryAddressForm").submit();
}

function registDeliveryAddr() {
    deliveryFormClear();
	$("#popAddressTitle").text("배송지 등록");
	$("#popAddressBtnName").text("등록하기");
	$("#popDeliveryRegist").show();
}

function modifyDeliveryAddr(addressNo, obj) {
    deliveryFormClear();

	$("#popAddressTitle").text("배송지 수정");
	$("#popAddressBtnName").text("수정하기");
	$("#popDeliveryRegist").show();


    var deliveryName = $(obj).data("delivery-name");
    var receiverName = $(obj).data("receiver-name");
    var tel = $(obj).data("tel");
    var zoneCode = $(obj).data("zoneCode");
    var address = $(obj).data("address");
    var addressDetail = $(obj).data("address-detail");
    var oldAddress = $(obj).data("old-address");
    var addressNo = $(obj).data("address-no");
    var postCode = $(obj).data("post-code");
    var isDefault = $(obj).data("is-default");

    $("#deliveryName").val(deliveryName);
    $("#receiverName").val(receiverName);
    $("#tel").val(tel);
    $("#zoneCode").val(zoneCode);
    $("#address").val(address);
    $("#addressDetail").val(addressDetail);
    $("#oldAddress").val(oldAddress);
    $("#addressNo").val(addressNo);
    $("#postCode").val(postCode);
    if (isDefault) {
        $("#checkDefaultAddressYn").prop("checked", true);
    }

}

function deliveryFormClear() {
    $("#deliveryName").val("");
    $("#receiverName").val("");
    $("#tel").val("");
    $("#zoneCode").val("");
    $("#address").val("");
    $("#addressDetail").val("");
    $("#oldAddress").val("");
    $("#addressNo").val("");
    $("#postCode").val("");
    $("#checkDefaultAddressYn").prop("checked", false);
}

function closeAddressPop() {
	$("#popDeliveryRegist").hide();
}
</script>
				<div class="userCont">
					<div class="contBox">
						<div class="colTitle">
							<h2 class="title">배송지 관리</h2>
						</div>
						<!-- 배송지 리스트 -->
						<div class="myTable">
							<!-- 배송지 추가 -->
							<div class="btnRight">
								<a href="#;" onclick="javascript:registDeliveryAddr()" class="btnStyle-5 icon">새 배송지 추가</a>
							</div>

							<!-- //배송지 추가 -->
							<table class="addressTable">
								<caption>배송지 리스트 표</caption>
								<colgroup>
									<col style="width: 84px">
									<col style="width: 130px">
									<col style="width: auto">
									<col style="width: 170px">
									<col style="width: 114px">
									<col style="width: 132px">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">선택</th>
										<th scope="col">배송지명</th>
										<th scope="col">주소</th>
										<th scope="col">받으실분</th>
										<th scope="col">연락처</th>
										<th scope="col"><span class="blind">수정/삭제 버튼</span></th>
									</tr>
								</thead>
								<tbody>

									<tr>
										<td>
											<div class="radio">
												<input type="radio" id="address32894" name="addressList" value="32894" onchange="chageDefaultAddress('32894')" checked="checked"> 
												<label for="address32894"><span class="blind">선택하기</span></label>
											</div>
										</td>
										<td class="alignLeft deliveryName"><span class="badge">기본배송지</span>홍길동</td>
										<td class="alignLeft">율도국 어딘가</td>
										<td>홍길동</td>
										<td>010-1234-1234</td>
										<td class="btnDel">
											<a href="#" onclick="javascript:modifyDeliveryAddr('32894', this)"
												class="iconS edit" data-delivery-name="홍길동"
												data-receiver-name="홍길동" data-tel="01012341234"
												data-zone-code="07003" data-post-code=""
												data-address="율도국 어딘가" data-address-detail="2층"
												data-old-address="율도국 어딘가" data-address-no="32894"
												data-is-default="true"> <span class="blind">해당 배송지 정보 수정하기</span>
											</a> 
											<a href="#;" onclick="javascript:deleteUserDeliveryAddress(32894, this)" class="iconS delete"> 
												<span class="blind">해당 배송지 삭제하기</span>
											</a>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- //배송지 리스트 -->
					</div>
				</div>

				<!-- 팝업::배송지 등록 -->
				<div id="popDeliveryRegist" class="popWrap popDeliveryRegist">
					<div class="popInner">
						<div class="popBox">
							<h5 class="popHeader" id="popAddressTitle">배송지 등록</h5>
							<div class="btnClose">
								<a href="#;" onclick="javascript:closeAddressPop()" class="popClose iconS"><span class="blind">팝업 닫기</span></a>
							</div>
							<div class="popBody">
								<form id="deliveryAddressForm" name="deliveryAddressForm" action="/delivery/address" method="post">
									<div class="formArea">
										<label for="deliveryName">배송지명<em class="essential">*</em></label>
										<input type="text" id="deliveryName" name="deliveryName" class="ip_txt">
										<button class="btnDel">
											<span class="blind">삭제</span>
										</button>
									</div>
									<div class="formArea">
										<label for="receiverName">받으시는 분<em class="essential">*</em></label>
										<input type="text" id="receiverName" name="receiverName" class="ip_txt">
										<button class="btnDel">
											<span class="blind">삭제</span>
										</button>
									</div>
									<div class="formArea">
										<label for="tel">휴대전화 번호<em class="essential">*</em></label> 
										<input type="number" inputmode="numeric" pattern="[0-9]*" id="tel" name="tel" class="ip_txt" maxlength="12" oninput="maxLengthChk(this)">
										<button class="btnDel">
											<span class="blind">삭제</span>
										</button>
									</div>
									<div class="formArea formBtn address">
										<label>배송지<em class="essential">*</em></label> 
										<input type="text" id="zoneCode" name="zoneCode" class="ip_txt" readonly="readonly"> 
										<input type="hidden" id="postCode" name="postCode"> 
										<a class="btnStyle-4 btnInput" href="javascript:findPostCode()" style="text-align: center;">우편번호 검색</a>
										<div class="innerFormArea">
											<input type="text" id="address" name="address" class="ip_txt" readonly="readonly">
										</div>
										<div class="innerFormArea">
											<input type="text" id="addressDetail" name="addressDetail" class="ip_txt" placeholder="상세주소를 입력해 주세요"> 
											<input type="hidden" id="oldAddress" name="oldAddress">
											<button class="btnDel">
												<span class="blind">삭제</span>
											</button>
										</div>
									</div>
									<div class="check">
										<input type="checkbox" name="checkDefaultAddressYn" id="checkDefaultAddressYn"> 
										<label for="checkDefaultAddressYn">기본 배송지로 설정</label>
									</div>
									<input type="hidden" id="addressNo" name="addressNo"> 
									<input type="hidden" id="buildingCode" name="buildingCode"> 
									<input type="hidden" id="defaultAddressYn" name="defaultAddressYn">
								</form>
							</div>
						</div>
						<div class="popBtn btn">
							<a href="#;" onclick="javascript:closeAddressPop()" class="btnStyle-6 popClose">취소</a> 
							<a href="javascript:saveDeliveryAddress()" class="btnStyle-2 btnToast" id="popAddressBtnName">등록하기</a>
						</div>
					</div>
				</div>
				<!-- //팝업::배송지 등록 -->
				<!-- //컨텐츠 -->
			</div>
		</div>
		<!-- //내용 -->
	</div>
	<!-- //컨텐츠 -->

<%@include file="../template/footer.jsp"%>