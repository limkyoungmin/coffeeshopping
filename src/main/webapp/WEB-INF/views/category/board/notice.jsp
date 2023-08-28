<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../template/header.jsp"%>

<div id="wrap" class="subWrap csWrap">
	<div class="menuSlide">
     <!-- depth1 -->
      	<div class="innerSlide">
             <ul class="depth1">
	                 <li class="on"><a href="/notice"><span>공지사항</span></a></li>
	                 <li><a href="/faq"><span>자주 묻는 질문</span></a></li>
	                 <li><a href="/event"><span>이벤트</span></a></li>
	                 <li><a href="/qna"><span>문의</span></a></li>
                </ul>
          </div>
          <!-- //depth1 -->
          <div class="currentPath" style=margin-left:350px;>
                <a href="/main" class="iconS"><span class="blind">메인</span></a>              
                 <a href="notice">공지사항</a> 
            </div>
      </div>
        
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
    <!-- 내용 -->
<div class="contents mainArea">
    <div class="mypageCol">            
		<div class="userCont" style=width:1200px;>
		    <div class="contBox" style=width:1200px;>
		        <div class="colTitle" style=width:1200px;>
		            <h1 class="title">공지사항</h1>
		        </div>
		        <!-- 리스트 -->
		        <div class="noticeList myTable" style=width:1200px;>
		            <div class="formArea formBtn">
		                <input type="text" class="ip_txt" id="noticeSearchKeyword" placeholder="검색어를 입력하세요." value="">
		                <a href="javascript:searchNotice()" class="btn btnStyle-1 btnInput">검색</a>
		            </div>
		            <table class="csTable">
		                <caption>공지사항 리스트를 나타내는 표</caption>
		                <colgroup>
		                    <col style="width:200px">
		                    <col style="width:auto">
		                    <col style="width:230px">
		                    <col style="width:200px">
		                </colgroup>
		                <thead>
		                    <tr>
		                        <th scope="col">번호</th>
		                        <th scope="col">제목</th>
		                        <th scope="col">등록일</th>
		                        <th scope="col">작성자</th>
		                    </tr>
		                </thead>
		                <tbody id="noticeList">
							<c:forEach var="noticeList" items="${noticeList}">
			                    <tr>
			                        <td class="sml">${noticeList.notice_num}</td>
			                        <td class="alignLeft fs16" style="text-align:center">
			                        	<a href="noticecontent?notice_num=${noticeList.notice_num}">${noticeList.notice_title}</a>
			                        </td>
			                        <td class="sml"><fmt:formatDate pattern = "yyyy.MM.dd" value="${noticeList.notice_date }" /></td>
									<td class="sml">관리자</td>
			                    </tr>      
			                 </c:forEach>   
		                </tbody>
		            </table>
		            <div class="btn btnMore" style="display:none">
		                <a href="" class="btnStyle-7">더보기</a>
		            </div>
		        </div>
		        <!-- //리스트 -->
		    </div>
		</div>
     </div>
  </div>
<!-- //내용 -->
</div>     

<%@include file="../../template/footer.jsp"%>