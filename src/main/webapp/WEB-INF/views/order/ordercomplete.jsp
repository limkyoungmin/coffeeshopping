<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../template/header.jsp"%>

<div id="wrap" class="subWrap cartListWrap"><!-- 서브 공통 class="subWrap" -->
    <!-- 내용 -->
    <div class="contents orderArea">
        <h2 class="areaTitle">주문완료</h2>
        <!-- 단계 -->
            <div class="step">
                <a href="javascript:;">01 장바구니</a>
                <a href="javascript:;">02 주문결제</a>
                <a href="javascript:;" class="on">03 주문완료</a>
            </div>
     <!-- //단계 -->
    <div class="tabArea">
    <!-- 탭 메뉴 -->
    	<div class="tabMenu type1">
    		<a href="/market/cart/list" class="on">주문완료 상품 </a>
        </div>         
            <!-- //탭 메뉴 -->
            <!-- 탭 내용 -->
            <div class="tabContArea">
                <!-- 일반배송 -->
                <div class="tabCont on">
                    <div class="layoutCol">
                        <!-- 상품 리스트 -->
                        <div class="layoutTd tdLft" style=height:500px>
                            <!-- 주문 리스트 -->
                            <div class="orderList" style=width:1200px;>
                                <div class="checkEach">                                                            
                                            <ul class="cartList"> 
                                             	<li class="cart-item " data-id="69902">
                                                	<!-- 썸네일 이미지 -->
                                                    <div class="imgArea">
                                                    	<a href="../Detail.jsp" class="thumbImg">
                                                        	<img src="../images/product/special/special1_1.png" alt="게이샤 g1 워시드 에티오피아 썸네일 이미지">
                                                        </a>  
                                                    </div>
                                                    <!-- //썸네일 이미지 -->
                                                    <!-- 정보 -->
                                                    <div class="infoArea">
                                                        <strong class="title">
                                                            <a href="../product/Detail.jsp">test</a>
                                                        </strong>
                                                        <div class="option">
                                                        </div>     
                                                    </div>
                                                    <!-- //정보 -->
                                                    <div class="total">
                                                        <span class="price">3,500원</span>
                                                    </div>                                                        
                                                    </li>  
                                                    <li>
                                                    	<div class="option">
                                                    		<em class="name">주문날짜 : </em><span>2023. 08. 18</span><br><br>
                                                        	<em class="name">주문번호 : </em><span>298712</span><br><br>
                                                        	<em class="name">받는분 성함 : </em><span>안진영</span>
                                                     	</div>               
                                                     </li>                       
                                            </ul>   
                                </div>
                            </div>
                            
                            <!-- 버튼 -->
                            <div class="btnSelect">
                                <a href="/productCoffeeList" class="btnStyle-8" style="margin-left:350px;">계속 쇼핑하기</a>
                                <a href="#" class="btnStyle-8">주문내역 확인하기</a>
                            </div>
                            <!-- //버튼 -->                            
                            <!-- //주문 리스트 -->
                        </div>
                        <!-- //상품 리스트 -->
                        <!-- 배송지/금액/주문버튼 -->
                        <!-- //배송지/금액/주문버튼 -->
                    </div>
                </div>
                <!-- //일반배송 -->
            </div>
            <!-- //탭 내용 -->
        </div>
    </div>
    <!-- //내용 -->
</div>

<%@include file="../template/footer.jsp"%>