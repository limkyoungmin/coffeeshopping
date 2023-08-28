<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../../template/header.jsp"%>
        
<script type="text/javascript">
    var isLoading = false;
    var page = 1;
    $(function() {
        $(window).scroll(function() {
            if (!isLoading && ($(window).scrollTop() >= $(document).height() - $(window).height() - 110)) {
                paging();
            }
        });

        showPopup()
    });

    function paging() {
        var totalPages = $("#totalPages").val();
        var categoryId = $("#productListForm").find("input[name=categoryId]").val();
        var rows = $("#productListForm").find("input[name=rows]").val();
        if (!isLoading) {
            if (++page <= totalPages) {
                isLoading = true;
                $.ajax({
                    url : contextPath + "/product/list",
                    type: "GET",
                    dataType: "html",
                    data: { page : page
                        , categoryId : categoryId
                        , rows: rows
                    },
                    success: function(html) {
                        $(".listWrap").append(html);
                        isLoading = false;
                    }, 
                    error: function() {
                        isLoading = false;
                    }
                });
            }
        }
    }

    function showPopup() {
        var popupCnt = 0;

        if(popupCnt > 0){
            cookiedata = document.cookie;
            if (cookiedata.indexOf("marketMainPopup=done") < 0 ) {
                $("#popMainFirst").show();
            }
        }
    };

</script>

<div id="wrap" class="subWrap productListWrap"><!-- 서브 공통 class="subWrap" -->
    <!-- 내용 -->
    <div class="contents incCat"><!-- 카테고리가 있는 경우 "incCat" -->
    	<!-- 카테고리 -->
        <div class="menuSlide"> 
            <div class="innerSlide">
                <ul class="depth1">
	                 <li><a href="/notice"><span>공지사항</span></a></li>
	                 <li><a href="/faq"><span>자주 묻는 질문</span></a></li>
	                 <li class="on"><a href="/event"><span>이벤트</span></a></li>
	                 <li><a href="/qna"><span>문의</span></a></li>
                </ul>
            </div>
            <!-- //카테고리 -->
            <!-- 경로 -->       
	        <div class="currentPath" style=margin-left:350px;>
                <a href="/main" class="iconS"><span class="blind">메인</span></a>              
                 <a href="event">이벤트</a> 
            </div>
            <h2 class="title" style=margin-top:20px;margin-bottom:100px;text-align:center;font-size:40px;>이벤트</h2>
              <!-- //경로 -->
        </div>
        <!-- //카테고리 탭 -->
        <div class="innerContents">
            <div class="mainSection">
                <div class="listStyle">
                    <ul class="listWrap">                    
					       <c:if test="${empty eventList}">
                                        <div style="margin: 150px auto; text-align: center;">
                                            <span>등록된 이벤트가 없습니다.</span>
                                        </div>
                                    </c:if>
						<c:forEach var="eventList" items="${eventList}">
							<li class="listSet swiper-slide" data-event-id="156">
								<!-- 썸네일 이미지 -->
								<div class="imgArea">
									<div class="thumbImg">
									<img data-src="${eventList.event_img}" alt="그때 그가격 이벤트 썸네일 이미지" src="${eventList.event_img}"></div>
								</div>
								<!-- //썸네일 이미지 -->
								<!-- 정보 -->
								<div class="infoArea">
									<strong class="title" style="text-align:center; font-size:25px;">${eventList.event_title}</strong>
									<span class="subScript">이벤트 시작 날짜 : ${eventList.event_startdate}</span>
									<span class="subScript">이벤트 종료 날짜 : ${eventList.event_enddate}</span>
								</div>
								<!-- //정보 -->
							    <a href="eventcontent?event_num=${eventList.event_num}" class="btnViewDetail"><span class="blind">이벤트 상세 보기</span></a>
							</li>
						</c:forEach>					
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- //내용 -->
</div>

<!-- 이벤트리스트로 수정 -->
<form id="productListForm">
    <input type="hidden" id="totalPages" name="totalPages" value="1">
    <input type="hidden" id="categoryId" name="categoryId" value="10">
    <input type="hidden" id="rows" name="rows" value="50">
</form>

<%@include file="../../template/footer.jsp"%>