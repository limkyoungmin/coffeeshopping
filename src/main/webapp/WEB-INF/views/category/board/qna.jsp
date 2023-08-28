<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

			<!-- //depth1 -->
		</div>
		<!-- 내용 -->
		<div class="contents mainArea">
			<div class="mypageCol">
				<div class="userCont" style="width: 1200px;">
					<div class="contBox" style="width: 1200px;">
						<div class="colTitle" style="width: 1200px;">
							<h1 class="title">문의</h1>
						</div>
						<!-- 리스트 -->
						<div class="noticeList myTable" style="width: 1200px;">
							<div class="formArea formBtn">
								<input type="text" class="ip_txt" id="noticeSearchKeyword"
									placeholder="검색어를 입력하세요." value=""> <a
									href="javascript:searchNotice()"
									class="btn btnStyle-1 btnInput">검색</a>
							</div>
							<table class="csTable">
								<caption>문의 리스트를 나타내는 표</caption>
								<colgroup>
									<col style="width: 200px">
									<col style="width: auto">
									<col style="width: 230px">
									<col style="width: 200px">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">제목</th>
										<th scope="col">등록일</th>
										<th scope="col">작성자</th>
									</tr>
								</thead>

								<tbody id="qna">
									<c:forEach items="${qnalist }" var="qnalist">
										<tr>
											<td class="sml">${qnalist.qna_num }</td>
											<td class="alignLeft fs16"><a
												href="javascript:passwdQna(${qnalist.qna_num})">${qnalist.qna_title }</a>
											</td>
											<td class="sml"><fmt:formatDate
													value="${qnalist.qna_date}" pattern="yyyy.MM.dd" /></td>
											<td class="sml">${qnalist.users_id }</td>
										</tr>
									</c:forEach>
								</tbody>

							</table>
							<div class="btn btnMore" style="width: 200px">
								<a href="javascript:openPopQuestion()" class="btnStyle-7"
									style="font-weight: bold">문의하기</a>
							</div>
							<br>
							<br>
							<br>
						</div>
						<!-- //리스트 -->
					</div>
				</div>
			</div>
		</div>
		<!-- //내용 -->

	</div>

	<div id="popQuestion" class="popWrap popQna" style="display: none;">
		<script type="text/javascript">

/* 강제로 열어둔것 이후 아이디값 받아서 넘길예정 common.js에 수정 */
function openPopQuestion() {
    $("#popQuestion").show();
}

function closePopQuestion() {
    $("#popQuestion").hide();
}

function questionAdd() {
	
	/* 추가 */
	if ($.trim($("#password").val()) == '') {
		$("#password").focus();
		alert("비밀번호를 입력해주세요.");
		return;
	}
 
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

    $form.submit(); 
}

</script>

		<div class="popInner">
			<div class="popBox">
				<h5 class="popHeader">문의 작성</h5>
				<div class="btnClose">
					<a href="javascript:closePopQuestion()" class="iconS"> <span
						class="blind">팝업 닫기</span>
					</a>
				</div>
				<div class="popBody">
					<form id="qnaForm" name="qnaForm" action="qnawrite" method="post">
						<div class="innerBox togType2">

							<div class="formArea" style="margin-bottom: -20px;">
								<input type="text" class="ip_txt" id="qna_title"
									name="qna_title" placeholder="제목을 입력해 주세요.">
							</div>
							<!-- //제목 -->
							<!--작성자  -->
							<div class="formArea" style="margin-bottom: -20px;">
								<input type="text" class="ip_txt" id="users_id" name="users_id"
									placeholder="" value="${sessionScope.user}" readonly>
							</div>
							<!--//작성자  -->

							<!-- 비밀번호 (추가) -->
							<div class="formArea" style="margin-bottom: 10px;">
								<input type="password" class="ip_txt" id="password"
									name="qna_passwd" placeholder="비밀번호를 입력해 주세요.">
							</div>
							<!-- //비밀번호 -->

							<!-- 내용 -->
							<div class="textarea">
								<textarea id="qna_content" name="qna_content"
									placeholder="상담과 무관한 내용이나 동일 문자의 반복 등 부적합한 내용일 때는 통보없이 삭제 될 수 있습니다. 내용을 입력해 주세요.(20자 이상 1,000자 미만)"
									maxlength="1000"></textarea>
								<span class="maxlength"><em id="qna_contentLength">0</em>
									/ 1,000</span>
							</div>
							<!-- //내용 -->
							<!-- 사진첨부 -->
							<div class="qnaSection">
								<strong class="qnaTtl">사진 첨부하기</strong>
								<ul class="photoList">
									<li class="photoBox" id="photoBox"><label> <input
											type="file" id="qna_img" name="file" data-id="1"
											class="blind" onchange="imageChage(1);">
									</label></li>
								</ul>
							</div>
							<!-- //사진첨부 -->
							<!-- 꼭 알아두세요! -->
							<div class="guideArea">
								<strong class="guideTitle">꼭 알아두세요!</strong>
								<ul class="guideList">
									<li>한번 등록한 문의 내용은 수정이 불가능합니다. 수정을 원하시는 경우, 삭제 후 재등록하셔야
										합니다.</li>
									<li>사진(이미지파일:jpg, gif, png)은 5Mb이하 1개까지 등록 가능합니다</li>
								</ul>
								<br>
							</div>
							<!-- //꼭 알아두세요! -->
							<div class="btn">

								<a href="javascript:closePopQuestion()" class="btnStyle-6">취소</a>
								<a href="javascript:questionAdd()" class="btnStyle-2">확인</a>
							</div>
						</div>
					</form>

				</div>
			</div>

		</div>
	</div>

	<div id="PasswdQna" class="popWrap popQna" style="display: none;">
		<div class="popInner">
			<div class="popBox">
				<h5 class="popHeader">비밀번호 입력</h5>
				<div class="btnClose">
					<a href="javascript:closePasswdQna()" class="iconS"> <span
						class="blind">팝업 닫기</span>
					</a>
				</div>
				<div class="popBody">
					<form id="SecretQna" name="passwdQna" action="passwdQna"
						method="post">
						<input type="hidden" id="qna_num_input" name="qna_num">
						<div class="innerBox togType2">
							<div class="formArea" style="margin-bottom: 20px;">
								<input type="password" class="ip_txt" id="password"
									name="qna_passwd" placeholder="비밀번호를 입력해 주세요.">
							</div>
							<div class="btn">
								<a href="javascript:closePopQuestion()" class="btnStyle-6">취소</a>
								<button type="submit" class="btnStyle-2">확인</button>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>
</div>

<script>
function passwdQna(qna_num) {
	$("#qna_num_input").val(qna_num); 
    $("#PasswdQna").show();
}

function closePasswdQna() {
    $("#PasswdQna").hide();
}

var message = "${message}";

if (message) {
    alert(message);
}
</script>
<%@include file="../../template/footer.jsp"%>