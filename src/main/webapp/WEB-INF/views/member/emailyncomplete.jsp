<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../template/header.jsp"%>

<div id="wrap" class="subWrap accountWrap"><!-- 로그인 공통 class="loginWrap" -->
    <!-- 내용 -->
    <div class="contents">
        <h2 class="loginTitle">
            <a href="/main">"감사합니다"</a>
        </h2>
        <p class="subscript" style="font-size:20px;">이메일인증이 완료 되었습니다</p>
		<div class="hr">
            <div class="resultText">                                   
                    <div class="item userId">
                        <span class="result">                                                                                            
                        	<em class="" style="font-size:20px;">
                        		이제 저희 페이지를 정상적으로 이용하실 수 있습니다.
                        	</em>                                                           
                        </span><br><br>
                    </div>          
            </div>
            <div class="btn sml wd100">
                <a href="/member/login" class="btnStyle-2">로그인하기</a>
                <a href="/join/findPw" class="btnStyle-14">메인페이지 이동</a>
            </div>
		</div>
    </div>
    <!-- //내용 -->
</div>

<%@include file="../template/footer.jsp"%>