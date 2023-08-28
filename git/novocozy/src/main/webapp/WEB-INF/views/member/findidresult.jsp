<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../template/header.jsp"%>

<div id="wrap" class="subWrap accountWrap"><!-- 로그인 공통 class="loginWrap" -->
    <!-- 내용 -->
    <div class="contents">
        <h2 class="loginTitle">
            <a href="/main">아이디 찾기</a>
        </h2>
        <p class="subscript">고객님의 정보와 일치하는 아이디는 아래와 같습니다.</p>
		<div class="hr">
            <div class="resultText">                                   
                    <div class="item userId">
                        <span class="blind">아이디</span>
                        <span class="result" style=font-size:28px;><em class="userId">${users_id}</em></span>
                    </div>
                    <div class="item">                       
                        <span class="">가입일자 : </span>
                        <span class="result">${users_date}</span>
                    </div>           
            </div>
            <div class="btn sml wd100">
                <a href="/member/login" class="btnStyle-2">로그인하기</a>
                <a href="/join/findPw" class="btnStyle-14">비밀번호 변경</a>
            </div>
		</div>
    </div>
    <!-- //내용 -->
</div>

<%@include file="../template/footer.jsp"%>