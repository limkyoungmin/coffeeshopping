<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib  uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
<%@include file="../../template/header.jsp"%>

<div id="wrap" class="subWrap csWrap">
<div class="menuSlide">
            <!-- depth1 -->
            <div class="innerSlide">
                <ul class="depth1">
	                 <li><a href="/notice"><span>공지사항</span></a></li>
	                 <li class="on"><a href="/faq"><span>자주 묻는 질문</span></a></li>
	                 <li><a href="/event"><span>이벤트</span></a></li>
	                 <li><a href="/qna"><span>문의</span></a></li>
                </ul>
            </div>
            <!-- //depth1 -->
            <div class="currentPath" style=margin-left:350px;>
                <a href="/main" class="iconS"><span class="blind">메인</span></a>              
                 <a href="faqList.do">자주 묻는 질문</a> 
            </div>
        </div>
    
<script type="text/javascript">
/* 스크립트내 noticeSearch에서 각 게시판에 맞는 Search로 수정 필요 */
$(document).ready(function() {
	$("#noticeSearchKeyword").on("keydown", function(e) {
		if (e.keyCode == 13) {
			searchNotice();
		}
	});
});
</script>
 <!-- 내용 -->
 <div class="contents mainArea">
	<div class="mypageCol">            
		<div class="userCont" style=width:1200px;>
		    <div class="contBox" style=width:1200px;>
		        <div class="colTitle" style=width:1200px;>
		            <h1 class="title">자주 묻는 질문</h1>
		        </div>
		        <!-- 리스트 -->
		        <div class="noticeList myTable" style=width:1200px;>
		         <form action="faqList.do" method="GET">
		            <div class="formArea formBtn">
		                <input type="text" class="ip_txt" id="faqSearchKeyword" placeholder="검색어를 입력하세요." value="">
		                <input type="submit" value="검색" class="btn btnStyle-1 btnInput" />
		            </div>
		            </form>
		            <table class="qnaTable type2 togType2">
		                <caption>자주 묻는 질문 리스트를 나타내는 표</caption>
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
		                <tbody id="faqList">
		                	<c:forEach items="${faqlist}" var="FaqVO">           	
			                    <tr class="question togAct">
			                        <td class="sml" style=padding-right:30px;>${FaqVO.faq_num}</td>
			                        <td class="alignLeft fs16" style="text-align:center">
			                        	<a href="#" class="togBtn" >${FaqVO.faq_title}</a>
			                        </td>
			                        <td class="sml"><fmt:formatDate pattern = "yyyy.MM.dd" value="${FaqVO.faq_date}"/></td>
			                        <td class="sml">${FaqVO.admin_id}</td>
			                    </tr>
			                    <tr class="answer">
										<td colspan="4">
											<div><span style="background-color: transparent;">${FaqVO.faq_content}</span></div>
										</td>
									</tr>
			                </c:forEach>           
		                </tbody>
		            </table>
		            
		            <c:if test="${FaqVO.size()==0}">
	  					<h2>등록된 게시글이 없습니다.</h2>
	  				</c:if>
	  				
		            <div class="btn btnMore" style="display:none">
		                <a href="" class="btnStyle-7">더보기</a>
		            </div>
		        </div>
		        <!-- //리스트 -->
		        <div class="pagination">
		        	${pagingHtml}
		        </div>
		    </div>
		</div>
        </div>
    </div>
    <!-- //내용 -->
</div>
       
<%@include file="../../template/footer.jsp"%>