<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../template/header.jsp"%>

<script type="text/javascript">
    var intervalId;
    var pattern1 = /[0-9]/g;
    var pattern2 = /[a-zA-Z]/ig;
    var pattern3 = /[~!@#$%<>^&*+-]/ig;
	$(document).ready(
		function() {
			$('#username, #password').on("keydown", function(e) {
			if (e.keyCode == 13) {
				if ($.trim($('#username').val()) != "" && $.trim($("#password").val()) == "") {
					$password.focus();
				} else if ($.trim($('#username').val()) != "" && $.trim($("#password").val()) != "") {
					doLogin();
				} else {
					alert("아이디를 입력해주세요.");
					$('#username').focus();
				}
			}
		});

        $("input[name=idCertify]").on("change", function() {
            $(".infoFind").hide();
            if ($(this).attr("id") == 'idCertifyTel') {
                $(".infoFind.tel").show();
            } else {
                $(".infoFind.email").show();
            }
        })

	});

	/**
	 * 로그인
	 */
	function doLogin() {
		var userId = $('#username').val();
		var password = $('#password').val()

		if (userId == '') {
			alert('아이디를 입력해주세요.');
			return;
		}

		if (password == '') {
			alert('비밀번호를 입력해주세요.');
			return;
		}

		var $loginForm = $("#loginForm");
		$loginForm.submit();
	}

</script>
<div id="wrap" class="subWrap mypageWrap">
   <!-- 내용 -->
		<div class="contents incCat">
			<!-- 공통::상단 -->
			<div class="userInfo">
				<div class="innerInfo">
					<div class="innerBox info">
						<strong class="infoTop "> 
						<a href="EditInfo.jsp">
							<span class="userId">회원</span>님, 반갑습니다.
						</a>
						</strong>
						<div class="infoBot">
							<div class="set grade">
								<em class="title">등급</em> <span class="value">BRONZE</span> 
								<a href="/event/memberBenefit" class="btnBenefit">등급별 혜택보기</a>
							</div>
							<div class="set point">
								<em class="title">적립금</em> <a href="#" class="value"> 0원 </a>
							</div>
						</div>
					</div>
					<div class="innerBox coupon">
						<a href="#" class="iconS"> 쿠폰 <em class="number">0장</em></a>
					</div>
					<div class="innerBox order">
						<a href="OrderList.jsp" class="iconS"> 주문/배송 <em class="number">0건</em></a>
					</div>
					<div class="innerBox qna">
						<a href="MypageQna.jspt" class="iconS"> 1:1문의 <em class="number">0건</em></a>
					</div>
				</div>
			</div>
			<!-- //공통::상단 -->
			<div class="mypageCol">
				<div class="userMenu togType2">
					<strong class="menuTit"><a href="Mypage.jsp">마이페이지</a></strong>
					<ul class="depth1">
						<li class=""><a href="OrderList.jsp">주문/배송내역</a></li>
						<li class=""><a href="ReturnList.jsp">반품/교환내역</a></li>
						<li class=""><a href="AddressMg.jsp">배송지 관리</a></li>
						<li class=""><a href="#">적립금 내역</a></li>
						<li class=""><a href="MyWrite.jsp">작성한 글</a></li>
						<li class=""><a href="EditInfo.jsp">개인정보 수정</a></li>
					</ul>
				</div>
				<!-- 컨텐츠 -->

<script type="text/javascript">
    var page = 1;
	var isLoading = false;
	var totalPage = '0';
	
    $(document).ready(function() {
	    var height = $(document).scrollTop();
	    $(window).scroll(function() {
	    	if (!isLoading && ($(window).scrollTop() >= $(document).height() - $(window).height() - 110))
		    	getQuestionResult(++page);
	    });

	    $('.qnaListArea').on('click', '.infoTit', function(e) {
	    	e.preventDefault();
	    	var $this = $( this );
	        var $parent = $this.parents('.togAct').toggleClass('on');
	        var replyCount = $this.data("reply-count");
	        var qnaContentNo = $this.data("no");
	        // replyCount가 있는경우 > 리스트 불러오기.
	        if (Number(replyCount) > 0 && $parent.find(".qnaReply").length < 1) {
	        	$.ajax({
    	    		url : contextPath + "/help/qna/" + qnaContentNo + "/reply",
    	    		type: "GET",
    	    		dataType: "html",
    	    		success: function(html) {
    	    			$parent.append(html);
    	    		}, 
    	    		error: function() {
    				}
    	    	});
		    }
		});
    });

    function questionDelete(qnaContentNo) {
        if (confirm('정말 삭제하시겠습니까?\n삭제 후 복구할 수 없습니다.')) {
        	$.ajax({
    			url: contextPath + "/help/question/" + qnaContentNo,
    			type: "DELETE",
    			dataType: "json",
    			success: function(response) {
    				if (response.resultCode == '0000') {
    					alert('삭제되었습니다.', 500);
    					location.reload();
    				} else {
    					alert(response.message, 2600);
    				}
    			}
    			
    		});
        }
    }

    function getQuestionResult() {
    	isLoading = true;
		
		var $qnaListForm = $("#qnaListForm");
		var totalPages = '0';

		$qnaListForm.find("input[name='page']").val(page);
		
		var sort = $qnaListForm.find("input[name='sort']").val();
		var direction = $qnaListForm.find("input[name='direction']").val();
		var rows = $qnaListForm.find("input[name='rows']").val();
		var period = $qnaListForm.find("input[name='period']").val();

		if(page <= '0') {
			$.ajax({
	    		url : contextPath + "/help/subQnaList",
	    		type: "GET",
	    		dataType: "html",
	    		data: { rows : rows, page : page, period : period, sort : sort, direction : direction },
	    		success: function(html) {
	    			$("#qnaList").append(html);
	    		    isLoading = false;
	    		}, 
	    		error: function() {
	    			isLoading = false;
				}
	    	});
		}
    }

    function searchQuestion(period) {
     	$form = $("#qnaListForm");
     	if (period) {
         	$form.find("input[name='period']").val(period);
        }   
        $form.submit();
    }
</script>
				<div class="userCont">
				    <div class="contBox">
				        <div class="colTitle">
				            <h2 class="title">문의 <span class="desc">(<em class="emphasis">0</em>)</span></h2>
				        </div>
				        <!-- 문의 리스트 -->
				        <div class="myTable">          
				              <div class="noHistory"><!-- 주문 내역 없을 때 -->
				                  <p class="text">작성한 문의 내역이 없습니다.</p><!-- nohistory 관련 코드 주문내역에서 가져오기 -->
				              </div>                 
				        </div>
				        <!-- //문의 리스트 -->
				    </div>
				    
				 <div class="contBox">
				        <div class="colTitle">
				            <h2 class="title">후기 <span class="desc">(<em class="emphasis">0</em>)</span></h2>
				        </div>
				        <!-- 문의 리스트 -->
				        <div class="myTable">          
				              <div class="noHistory"><!-- 주문 내역 없을 때 -->
				                  <p class="text">작성한 후기 내역이 없습니다.</p>
				              </div>                 
				        </div>
				        <!-- //문의 리스트 -->
				    </div>
				</div>
            <!-- //컨텐츠 -->
        </div>
    </div>
    <!-- //내용 -->
</div>
<!-- //컨텐츠 -->

<%@include file="../template/footer.jsp"%>