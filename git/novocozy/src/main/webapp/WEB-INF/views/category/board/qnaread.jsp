<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../template/header.jsp"%>

<div id="wrap" class="subWrap csWrap">
	<div class="menuSlide">
        <!-- depth1 -->
        <div class="innerSlide">
            <ul class="depth1">
                 <li><a href="/notice"><span>공지사항</span></a></li>
                 <li><a href="/faq"><span>자주 묻는 질문</span></a></li>
                 <li><a href="/event"><span>이벤트</span></a></li>
                 <li class="on"><a href="/qna"><span>문의</span></a></li>
            </ul>
        </div>
        <div class="currentPath" style=margin-left:350px;>
        	<a href="/main" class="iconS"><span class="blind">메인</span></a>              
        	<a href="/qna">문의</a> 
        </div>
        <!-- //depth1 -->
    </div>    
    <!-- 내용 -->
    <div class="contents mainArea">
        <div class="mypageCol">                  
<script type="text/javascript">
$(document).ready(function() {
	$("#noticeSearchKeyword").on("keydown", function(e) {
		if (e.keyCode == 13) {
			searchNotice();
		}
	});
});

function searchNotice() {
	var searchWord = $("#noticeSearchKeyword").val();
	
	if(searchWord != '') {
		location.href = contextPath + '/help/notice?page=1&searchWord=' + searchWord;
	}
}
</script>
<div class="userCont" style=width:1200px;>
    <div class="contBox" style=width:1200px;>
        <div class="colTitle" style=width:1200px;>
            <h1 class="title">문의</h1>        
        </div>       
        
        <!-- 리스트 -->        
            
        <div class="noticeList myTable" style=width:1200px;>
            <table class="csTable">
                <caption>문의 리스트를 나타내는 표</caption>
                <colgroup>
                    <col style="width:15%">
                    <col style="width:45%">
                    <col style="width:20%">
                    <col style="width:20%">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">제목</th>
                        <th scope="col">등록일</th>
                        <th scope="col">작성자</th>                     
                    </tr>
                </thead>
                          <tr>
	                        <td class="sml">${QnaVO.qna_num }</td>
	                        <td class="alignLeft fs16">${QnaVO.qna_title }</td>
	                        <td class="sml"><fmt:formatDate value="${QnaVO.qna_date}" pattern = "yyyy-MM-dd"/></td>
	                        <td class="sml">${QnaVO.users_id }</td>
	                   	  </tr>	           
                
	             <tr id="qna" style="background-color:#eaeced;">	             		  
	             		  <td class="sml" colspan="1"></td>	             		  
						  <td class="alignLeft fs16" colspan="3"><div><span >${QnaVO.qna_content}</span></div>
						  </td>
			     </tr>
			     <tr id="qna" style="background-color:#eaeced;">
	             		  <td class="sml" colspan="1"></td>	             		  
						  <td class="alignLeft fs16" colspan="3" ><div>						  
						  	<span>&nbsp;&nbsp;└ 답변 :${QnaVO.qna_adcontent}</span></div>
						  </td>
			     </tr>
	            
                </tbody> 
                </tbody>
                </table>
            <div class="btn-group btn-group-justified">
           <span class="btn btnMore" style="width:400px">           	
                <a href="javascript:openPopQuestion()" class="btnStyle-7" style=font-weight:bold>문의수정</a>
                <a href="qnadelete?qna_num=${QnaVO.qna_num}" class="btnStyle-7" style=font-weight:bold>글삭제</a>
            </span>
            </div>
                                                
        </div>
        <!-- //리스트 -->
    </div>
</div>
</div>
</div>					
<!-- //내용 -->
</div>     			
    	
    <!-- //내용 -->
<div id="popQuestion" class="popWrap popQna" style="display: none;">
<script type="text/javascript">

/* 강제로 열어둔것 이후 아이디값 받아서 넘길예정 common.js에 수정 */
function openPopQuestion() {
    $("#popQuestion").show();
}

function closePopQuestion() {
    $("#popQuestion").hide();
}

$(document).ready(function() {
	$("#qna_content").keyup(function() {
		$("#qna_contentLength").text($(this).val().length);
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

/* 	if ($("#qnaCategoryNo").val() == '') {
		$("#qnaCategoryNo").focus();
		alert("문의 유형을 선택해주세요.");
		return;
	} */
	
	/* 추가 */
	/* if ($.trim($("#password").val()) == '') {
		$("#password").focus();
		alert("비밀번호를 입력해주세요.");
		return;
	}
 */
	if ($.trim($("#qna_title").val()) == '') {
		$("#qna_title").focus();
		alert("제목을 입력해주세요.");
		return;
	}

	if ($.trim($("#qna_content").val()) == '') {
		$("#qna_content").focus();
		alert("문의 내용을 입력해주세요");
		return;
	}
	
    $form = $("#qnaForm");
    /*	$form.ajaxForm({
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
     });*/
     $form.submit();
}

function removeImage(idx) {

	if($("#img" + idx).data("qna_img") != null) {
		$("#qnaForm").append('<input type="hidden" name="removeFileIdList" value="' + $("#img" + idx).data("qna_img") + '">"');
	}
	
	$("#img" + idx).parent().parent().find("a").remove();
	$("#photoBox" + idx +" label").html('<span class="blind addPhoto">사진 추가하기</span>');
}

function imageUpload(idx) {
	
	if($("#img" + idx).data("qna_img") != null) {
		$("#qnaForm").append('<input type="hidden" name="removeFileIdList" value="' + $("#img" + idx).data("qna_img") + '">"');
		$("#img" + idx).attr("src", null);
		$("#img" + idx).data('qna_img', null);
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

<div class="popInner">
    <div class="popBox">
        <h5 class="popHeader">문의 수정</h5>
        <div class="btnClose">
            <a href="javascript:closePopQuestion()" class="iconS">
            	<span class="blind">팝업 닫기</span>
           	</a>
        </div>
        <div class="popBody">
        	<form id="qnaForm" action="qnaupdate" method="post">
        		<input type="hidden" name="qna_num" value="${QnaVO.qna_num}">        		
	            <div class="innerBox togType2">
	                <!-- 유형 -->
	                <!--주석처리한곳 -->
                    <!-- <div class="selectArea togAct" id="qnaCategoryNoWrap">
                        <a href="" class="sltCurrent togBtn">문의유형을 선택하세요.</a>  수정 삭제 ㄴ
                        <input type="hidden" name="qnaCategoryNo" id="qnaCategoryNo" value="">
                        <ul class="sltList" 수정 삭제 >                                        
                                <li><a href="#" data-key="1">상품/포장/배송</a></li>                 
                                <li><a href="#" data-key="2">주문/결제</a></li>
                                <li><a href="#" data-key="3">취소/반품/교환</a></li>
                                <li><a href="#" data-key="4">회원문의</a></li>   
                                <li><a href="#" data-key="5">홍보및기타문의</a></li>                            
                        </ul>
                        
                        <select class="sltCurrent togBtn">slt 클래스 강제추가 일단 셀렉트 박스로 설정
                        	<option value="">문의유형을 선택하세요.</option>
                        	<option value="상품/포장/배송">상품/포장/배송</option>
                        	<option value="주문/결제">주문/결제</option>
                        	<option value="취소/반품/교환">취소/반품/교환</option>
                        	<option value="회원문의">회원문의</option>
                        	<option value="홍보및기타문의">홍보및기타문의</option>
                        </select>
                    </div> -->
                    
	                <!-- //유형 -->
	                <!-- 비밀번호 (추가) -->
	                <!-- <div class="formArea" style=margin-bottom:-20px;>
	                    <input type="password" class="ip_txt" id="password" name="password" placeholder="비밀번호를 입력해 주세요.">
	                </div> -->
	                <!-- //비밀번호 -->
	                <!-- 제목 -->
	                <div class="formArea">
	                    <input type="text" class="ip_txt" id="qna_title" name="qna_title" value="${QnaVO.qna_title }" readonly>
	                </div>
	                <!-- //제목 -->
	                	                
	                <!--작성자  -->
	                <div class="formArea">
	                    <input type="text" class="ip_txt" id="users_id" name="users_id" placeholder="" value="${sessionScope.user}" readonly>
	                </div>
	                <!--//작성자  -->
	                
	                <!-- 내용 -->
	                <div class="textarea">
	                    <textarea id="qna_content" name="qna_content">${QnaVO.qna_content}</textarea>
	                    <span class="maxlength"><em id="qna_contentLength">0</em> / 1,000</span>
	                </div>
	                <!-- //내용 -->
	                
	                <!-- 사진첨부 -->
	                <div class="qnaSection">
	                    <strong class="qnaTtl">사진 첨부하기</strong>
	                    <ul class="photoList">							
								<li class="photoBox" id="photoBox1">
									<input type="file" id="photoImg1" name="file" data-id="1" class="blind" accept="image/*" onchange="imageChage(1);">
									<label onclick="javascript:imageUpload(1);">
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
	                        <li>한번 등록한 문의 내용은 수정이 불가능합니다. 수정을 원하시는 경우, 삭제 후 재등록하셔야 합니다.</li>
	                        <li>사진(이미지파일:jpg, gif, png)은 5Mb이하  1개까지 등록 가능합니다</li>							
	                    </ul>
	                    <br>
	                </div>
	                <!-- //꼭 알아두세요! -->
						<div class="btn">
							<a href="javascript:closePopQuestion()" class="btnStyle-6">취소</a>
							<a href="javascript:questionAdd()"  class="btnStyle-2">수정</a>
							<!-- <input id="qnaupdate" type="submit" value="확인" class="btnStyle-2"> -->
						</div>
					</div>
                <!-- <input type="hidden" name="users_id" value="asdf"> -->
                <input type="hidden" name="parentsQnaContentNo" value="">
                <input type="hidden" name="smsAlarmYn" id="smsAlarmYn">
            </form>
            
        </div>
    </div>
   
</div>
</div> 


<%@include file="../../template/footer.jsp"%>