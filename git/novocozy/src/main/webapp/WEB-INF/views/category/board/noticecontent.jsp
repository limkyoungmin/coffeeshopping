<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../template/header.jsp"%>

<div id="wrap" class="subWrap csWrap">
	<div class="menuSlide">
        <!-- depth1 -->
        <div class="innerSlide">
             <ul class="depth1">
                 <li class="on"><a href="notice"><span>공지사항</span></a></li>
                 <li><a href="faq.jsp"><span>자주 묻는 질문</span></a></li>
                 <li><a href="evenet.jsp"><span>이벤트</span></a></li>
                 <li><a href="review.jsp"><span>후기</span></a></li>
                 <li><a href="qna.jsp"><span>문의</span></a></li>
             </ul>
        </div>
        <!-- //depth1 -->
    </div>
    <!-- 내용 -->
    <div class="contents mainArea">
        <div class="mypageCol">        
			<div class="userCont" style=width:1200px;>
    			<div class="contBox" style=width:1200px;>
    				<div class="boardView" style=width:1200px;>
                	<!-- 제목 -->
                	<div class="boardHead">
                    	<strong class="title">${noticedetail.notice_title}</strong>
                    <div class="info">
                        <span class="date"><fmt:formatDate pattern = "yyyy.MM.dd" value="${noticedetail.notice_date }" /></span>&nbsp;&nbsp;<span>작성자 : </span>&nbsp;<span>관리자</span>
                    </div>
                	</div>
                	<!-- //제목 -->
                	<!-- 내용 -->
					<div class="boardDesc">
						<p></p>
						<div>
							<div>
								<img src="<c:url value='../${noticedetail.notice_img}' />"><br>
							</div>
							<div>
								<font face="Arial" size="3"><br></font>
							</div>
							<div>
								<font size="3" face="Arial"><br></font>
							</div>
							<div>
								${noticedetail.notice_content}
							</div>
						</div>
						<p></p>
					</div>
					<!-- //내용 -->
            	</div>
     			<div class="btn sml boardBtn">
                	<a href="notice" class="btnStyle-2">목록</a>
            	</div>
    		</div>
		</div>
    </div>
	</div>
    <!-- //내용 -->
</div>

<%@include file="../../template/footer.jsp"%>