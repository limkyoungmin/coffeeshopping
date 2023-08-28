<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../../template/header.jsp"%>

<script type="text/javascript">
function increseReadCount(contentNo) {
	$.ajax({
		url : contextPath + "/contents/FAQ/increaseReadCount/" + contentNo,
		type: "GET",
		dataType: "json",
		success: function(html) {
		}, 
		error: function() {
		}
	});
}

function changeCategory(contentCategoryNo) {
	location.href = contextPath + "/help/faq?contentCategoryNo=" + (contentCategoryNo ? contentCategoryNo : ''); 
}
</script>

	<div id="wrap" class="subWrap csWrap">
		<div class="menuSlide">
	    	<!-- depth1 -->
	        <div class="innerSlide">
	            <ul class="depth1">
		             <li><a href="Notice.jsp"><span>공지사항</span></a></li>
		             <li><a href="FAQ.jsp"><span>자주 묻는 질문</span></a></li>
		             <li><a href="Event.jsp"><span>이벤트</span></a></li>
		             <li class="on"><a href="Review.jsp"><span>후기</span></a></li>
		             <li><a href="QNA.jsp"><span>문의</span></a></li>
	            </ul>
	        </div>
	        <div class="currentPath" style=margin-left:350px;>
	        	<a href="../main/Main.jsp" class="iconS"><span class="blind">메인</span></a>              
	        	<a href="Review.jsp">후기</a> 
	        </div>
	         <!-- //depth1 -->
        </div>
		<!-- 내용 -->
		<div class="contents mainArea">
			<div class="mypageCol">
				<div class="userCont csGuideWrap" style=width:1200px;>
					<div class="contBox" style=width:1200px;>
						<div class="colTitle" style=width:1200px;>
							 <h1 class="title">후기</h1>
						</div>
						<!-- 후기 리스트 -->
						<div class="myTable" style=width:1200px;>
						<div class="formArea formBtn">
               				<input type="text" class="ip_txt" id="noticeSearchKeyword" placeholder="검색어를 입력하세요." value="">
                			<a href="javascript:searchNotice()" class="btn btnStyle-1 btnInput">검색</a>
            			</div>
							<table class="qnaTable type2 togType2">
								<caption>후기 작성하는 표</caption>
								<colgroup>
									<col style="width: 180px">
									<col style="width: auto">
									<col style="width: 230px">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">제목</th>
										<th scope="col">등록일</th>
										<th scope="col">작성자</th>
									</tr>
								</thead>
								<tbody>
									<tr class="question togAct">
									<td class="sml" style=padding-right:30px;>4</td>
										<td class="alignLeft fs16">
										<a href="#" class="togBtn">
											<span>후기 제목</span><br>
											<span>별점</span>
										</a>
										</td>
										<td class="sml">2023.07.20</td>
	                          			<td class="sml">작성자</td>
									</tr>
									<tr class="answer">
										<td colspan="4">
											후기4에대한 답변
											<div><span style="background-color: transparent;">후기4에대한 답변 + 이미지</span></div>
										</td>
									</tr>
									
									<tr class="question togAct">
									<td class="sml" style=padding-right:30px;>3</td>
										<td class="alignLeft fs16">
										<a href="#" class="togBtn">
											<span>후기 제목 </span><br>
											<span>별점들</span>
										</a>
										</td>
										<td class="sml">2023.07.20</td>
	                          			<td class="sml">작성자</td>
									</tr>
									<tr class="answer">
										<td colspan="4">
											후기3에대한 답변
											<div><span style="background-color: transparent;">후기3에대한 답변 + 이미지</span></div>
										</td>
									</tr>
									
									<tr class="question togAct">
									<td class="sml" style=padding-right:30px;>2</td>
										<td class="alignLeft fs16">
										<a href="#" class="togBtn">
											<span>후기 제목</span><br>
											<span>별점</span>
										</a>
										</td>
										<td class="sml">2023.07.20</td>
	                          			<td class="sml">작성자</td>
									</tr>
									<tr class="answer">
										<td colspan="4">
										후기2에대한 답변
										<div><span style="background-color: transparent;">후기2에대한 답변 + 이미지</span></div>
										</td>
									</tr>
									
									<tr class="question togAct">
									<td class="sml" style=padding-right:30px;>1</td>
										<td class="alignLeft fs16">
										<a href="#" class="togBtn">
											<span>후기 제목</span><br>
											<span>별점</span>
										</a>
										</td>
										<td class="sml">2023.07.20</td>
	                          			<td class="sml">작성자</td>
									</tr>
									<tr class="answer">
										<td colspan="4">
										후기1에대한 답변
										<div><span style="background-color: transparent;">후기1에대한 답변 + 이미지</span></div>
										</td>
									</tr>							
								</tbody>
							</table>
						<div class="btn btnMore" style="width:200px">
                			<a href="javascript:openPopQuestion()" class="btnStyle-7" style=font-weight:bold>후기 작성하기</a>
           				 </div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //내용 -->
	</div>

<!-- 전체 내용 후기에 맞춰 수정 필요 -->
<script type="text/javascript">
/* 강제로 열어둔것 이후 아이디값 받아서 넘길예정 common.js에 수정 */
function openPopQuestion() {
    $("#popQuestion").show();
}

function closePopQuestion() {
    $("#popQuestion").hide();
}

$(document).ready(function() {
	$("#question").keyup(function() {
		$("#questionLength").text($(this).val().length);
	});
	
/* .selectArea.togAct -> selectArea togAct로 변경 */
    $(".selectArea togAct").on("click", function(e) {
        e.preventDefault();
        $(this).toggleClass("on");
    })
/* .selectArea.togAct -> selectArea togAct로 변경 근데 박스 선택이 안됨 */
    $(".selectArea.togAct .sltList a").on("click", function(e) {
        e.preventDefault();
        var key = $(this).data("key");
        var text = $(this).text();
        var $parents = $(this).parents(".selectArea togAct");
        $parents.find(".sltCurrent").text(text);
        $parents.find("input[type=hidden]").val(key);
    })
});

function questionAdd() {

	if ($("#qnaCategoryNo").val() == '') {
		$("#qnaCategoryNo").focus();
		alert("문의 유형을 선택해주세요.");
		return;
	}

	if ($.trim($("#title").val()) == '') {
		$("#title").focus();
		alert("제목을 입력해주세요.");
		return;
	}

	if ($.trim($("#question").val()) == '') {
		$("#question").focus();
		alert("문의 내용을 입력해주세요");
		return;
	}

	$("#smsAlarmYn").val($("input[name='checkSmsAlarmYn']:checkbox").is(':checked')?'Y':'N');
	
    $form = $("#qnaForm");
 	$form.ajaxForm({
         dataType: "json",
         success: function(response) {
             if (response.resultCode == "0000") {
            	 alert("등록되었습니다.");
            	 closePopQuestion();
            	 location.reload();
             }
             else {
            	 alert(response.message);
             }
         },
         error: function() {
        	 alert("문의 등록 중 오류가 발생했습니다.");
         }
     });
     $form.submit();
}

function removeImage(idx) {

	if($("#img" + idx).data("content_file_id") != null) {
		$("#qnaForm").append('<input type="hidden" name="removeFileIdList" value="' + $("#img" + idx).data("content_file_id") + '">"');
	}
	
	$("#img" + idx).parent().parent().find("a").remove();
	$("#photoBox" + idx +" label").html('<span class="blind addPhoto">사진 추가하기</span>');
}

function imageUpload(idx) {
	
	if($("#img" + idx).data("content_file_id") != null) {
		$("#qnaForm").append('<input type="hidden" name="removeFileIdList" value="' + $("#img" + idx).data("content_file_id") + '">"');
		$("#img" + idx).attr("src", null);
		$("#img" + idx).data('content_file_id', null);
	}
	
	$("#photoImg"+idx).trigger("click");
}

function imageChage(idx) {
	
	var file = $("#photoImg" + idx).val().split("\\");

    if(file != "") {
    	$("#photoBox" + idx +" label span").remove();
    	$("#photoBox" + idx +" label").html('<img id="img' + idx + '" alt="문의 이미지 ' + idx + '" style="height:100%; width:100%">');
    	$("#photoBox" + idx).append('<a href="javascript:removeImage(' + idx + ')" class="btnDel"><span class="blind">삭제</span></a>');

    	readFile("photoImg" + idx, $("#photoBox" + idx +" label img"));
    }
}
</script>

<div id="popQuestion" class="popWrap popQna" style="display: none;">
	<div class="popInner">
	    <div class="popBox">
	        <h5 class="popHeader">후기 작성</h5>
	        <div class="btnClose">
	            <a href="javascript:closePopQuestion()" class="iconS">
	            	<span class="blind">팝업 닫기</span>
	           	</a>
	        </div>
	        <div class="popBody">
	        	<form id="qnaForm" name="qnaForm" action="/help/question" method="post">
		            <div class="innerBox togType2">                
		                <!-- 제목 -->
		                <div class="formArea">
		                    <input type="text" class="ip_txt" id="title" name="title" placeholder="제목을 입력해 주세요.">
		                    <a href="" class="btnDel"><span class="blind">삭제</span></a>
		                </div>
		                <!-- //제목 -->
		                <!-- 내용 -->
		                <div class="textarea">
		                    <textarea id="question" name="question" placeholder="후기와 무관한 내용이나 부적합한 내용일 때는 통보없이 삭제 될 수 있습니다. 내용을 입력해 주세요.(20자 이상 1,000자 미만)" maxlength="1000"></textarea>
		                    <span class="maxlength"><em id="questionLength">0</em> / 1,000</span>
		                </div>
		                <!-- //내용 -->
		                <!-- 사진첨부 -->
		                <div class="qnaSection">
		                    <strong class="qnaTtl">사진 첨부하기</strong>
		                    <ul class="photoList">                      
								
									<li class="photoBox" id="photoBox1">
										<input type="file" id="photoImg1" name="inputFiles" data-id="1" class="blind" accept="image/*" onchange="imageChage(1);">
										<label onclick="javascript:imageUpload(1);">
											<span class="blind addPhoto">사진 추가하기</span>
										</label>
									</li>
								
									<li class="photoBox" id="photoBox2">
										<input type="file" id="photoImg2" name="inputFiles" data-id="2" class="blind" accept="image/*" onchange="imageChage(2);">
										<label onclick="javascript:imageUpload(2);">
											<span class="blind addPhoto">사진 추가하기</span>
										</label>
									</li>
								
									<li class="photoBox" id="photoBox3">
										<input type="file" id="photoImg3" name="inputFiles" data-id="3" class="blind" accept="image/*" onchange="imageChage(3);">
										<label onclick="javascript:imageUpload(3);">
											<span class="blind addPhoto">사진 추가하기</span>
										</label>
									</li>
								
									<li class="photoBox" id="photoBox4">
										<input type="file" id="photoImg4" name="inputFiles" data-id="4" class="blind" accept="image/*" onchange="imageChage(4);">
										<label onclick="javascript:imageUpload(4);">
											<span class="blind addPhoto">사진 추가하기</span>
										</label>
									</li>
								
		                    </ul>
		                </div>
		                <!-- //사진첨부 -->
		                <!-- 꼭 알아두세요! -->
		                <div class="guideArea">
		                    <strong class="guideTitle">꼭 알아두세요!</strong>
		                    <ul class="guideList">
		                        <li>한번 등록한 후기 내용은 수정이 불가능합니다. 수정을 원하시는 경우, 삭제 후 재등록하셔야 합니다. </li>
		                        <li>사진(이미지파일:jpg, gif, png)은 5Mb이하 최대 4개까지 등록 가능합니다</li>
		                    </ul>
		                </div>
		                <!-- //꼭 알아두세요! -->
		            </div>
	                <input type="hidden" name="qnaContentNo" value="">
	                <input type="hidden" name="parentsQnaContentNo" value="">
	                <input type="hidden" name="smsAlarmYn" id="smsAlarmYn">
	            </form>
	        </div>
	    </div>
	    <div class="btn">
	        <a href="javascript:closePopQuestion()" class="btnStyle-6">취소</a>
	        <a href="javascript:questionAdd()" class="btnStyle-2">확인</a>
	    </div>
	</div>
</div>

<%@include file="../../template/footer.jsp"%>