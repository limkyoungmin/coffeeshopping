/**
 * 
 */
(function (){

    /*
    *공통 객체
    */
    var common = {
    init: function() {
        common.initLazyLoading();
        common.initHeaderFixed();
        common.initHeaderWd();
        common.initScrollBtn();
        //common.initTabComm();
        common.initToggle();
        common.initPopup();
        //common.initTab();
        common.initSwiper();
        common.initCheckComm();
        common.initCheckSignUp();
        common.initCheckHide();
        common.initInputDel();
        common.initCartSticky();
        //common.initDatepicker();
        common.initToastPop();
        common.initAbout();
        common.initAni();

        //scroll event
        $(window).scroll(function (){
            common.initHeaderFixed();
            common.initCartSticky();
            common.initAni();
        })
    },

    initLazyLoading: function() {
        const images = document.querySelectorAll('[data-src]');
        const intersectionObserver = new IntersectionObserver((entries,observer)=>{
            entries.forEach(entry=>{
                if(!entry.isIntersecting) return;
                const src = entry.target.getAttribute('data-src');
                entry.target.src=src;
                observer.unobserve(entry.target);
            })
        },
        {
            threshold:0,
        })
        
        images.forEach(image=>{
            intersectionObserver.observe(image);
        })
    },

    //헤더 고정
    initHeaderFixed: function() {
        var headerPos = $('body > .header');
        if(headerPos.length > 0) {
            headerPos.css({'height' : headerPos.height()});
            var headerPs = headerPos.offset().top;
            if($(document).scrollTop() > headerPs) {
                $('body').addClass('scroll');
            } else {
                $('body').removeClass('scroll');
            }
        };
    },
        
    //헤더 카테고리 넓이
    initHeaderWd: function() {
        if($('body > .header .gnbList .depth1:last-child a').width() < 77) {//고객센터 > 비회원 1:1문의
            $('.gnbList .depth1').each(function(){
                var categoryWd = $(this).find('a');
                categoryWd.css({'width' : categoryWd.width() + 20});
            });
        }
    },

    //스크롤버튼
    initScrollBtn: function() {
        $(window).scroll(function() {
            ($(this).scrollTop() > 0) ? $('.btnScroll').addClass('on') : $('.btnScroll').removeClass('on');
        });
        $('.btnScroll').on('click', '.up', function(e){
            e.preventDefault();
            $('body, html').animate({scrollTop: 0}, 200);
        }).on('click', '.down', function(e){
            e.preventDefault();
            var scrollHt = $(document).height();
            $('body, html').animate({scrollTop: scrollHt}, 200);
        });
    },

    //탭 메뉴
    //initTabComm: function() {
    //    var tabMenu = $('.tabMenu a');
    //    tabMenu.on('click', function(e){
    //        e.preventDefault();
    //        var tabActive = $(this),
    //            idx = tabActive.index(),
    //            tabCont = tabActive.parent().next('.tabContArea').children('.tabCont').eq(idx);
//
    //        tabActive.addClass('on').siblings('a').removeClass('on');
    //        tabCont.addClass('on').siblings().removeClass('on');
    //    });
    //},

    //토글 공통
    initToggle: function() {
        $(".togBtn").on('click', function(e) {
            e.preventDefault();
            var $this = $( this );
            $this.parents('.togAct').toggleClass('on');

            //리스트페이지 헤더에 카테고리 포함된 경우
            if ($this.parent().hasClass("headerCatArea")) {
                if($('body').hasClass("fixed")) {
                $('body').removeClass("fixed");
                } else {
                $('body').addClass("fixed")
                }
            }
            
            //문의::다른 togACt 닫기
            if ($this.parents().hasClass('togType2')) {
                $('.togType2').find('.togAct').not($this.parents('.togAct')).removeClass('on')
            }
        });
    },
    
    //토스트팝업
    initToastPop: function() {
        toastPop = function(tsMsg,tsNm,tsUrl,tsOpt,tsTg) {
            var msg = tsMsg ? tsMsg : "메시지를 입력해주세요", 
                nm = tsNm ? tsNm : "", 
                url = tsUrl ? tsUrl : "javascript:;", 
                opt = tsOpt ? tsOpt : "", //화살표 right or top or check
                tg = tsTg ? tsTg : "_self", 
                html = '<div class="popToast"><a href="'+url+'" rel="opener" target="'+tg+'" class="toastText '+opt+'"><span class="left">'+msg+'</span><span class="right">'+nm+'</span></a></div>';
            $('body').append(html);
            setTimeout(function(){
                $('body').find('.popToast').remove();
            }, 2600);
        }
        $('.channel.url a').on('click', function(e){//공유하기::url 복사
            e.preventDefault();
            $(this).parents('.slideWrap').removeClass('on');
            toastPop('URL이 복사되었습니다','','','check');
        });
        $('.slideChangeOption .fixedArea .btnOrder').on('click', function(e){//장바구니::옵션변경
            e.preventDefault();
            $(this).parents('.slideWrap').removeClass('on');
            toastPop('옵션이 변경되었습니다.','','','check');
        });
        $('.myStoreWrap .btnDel a').on('click', function(e){//나만의 매장 삭제
            e.preventDefault();
            toastPop('나만의 매장에서 삭제하였습니다.','','','check');
        });
    },

    //기본팝업
    initPopup: function() {
        $('.popOpen').on('click', function(e) {
            e.preventDefault();
            $('.popWrap').hide();
            var $href = $(this).attr('href');
            layerPopup($href);
        });
        function layerPopup(el) {
            var $el = $(el);
            //$('.popWrap').hide();
            $('body').addClass('layerPop');
            $el.show();
            $el.find('.popClose').on('click', function() {
                $('body').removeClass('layerPop');
                $el.hide();
                //$el.find('.togAct').removeClass('on');
                return false;
            });
        }
    },

    //탭 센터정렬
    //initTab: function() {
    //    $(".menuSlide ul.depth1 li a").on('click', function(e){
    //        if(!$(this).parents('.menuSlide').hasClass('category') || $(this).parents('.menuSlide').hasClass('category') && $(this).parents('ul').hasClass('depth2')) {//!!!다시 확인하기!!!
    //            e.preventDefault(e);
    //            var posX = 0;
    //            $(this).parent().siblings().removeClass('on');
    //            $(this).parent().addClass('on');
    //            $(this).parent().prevAll().each(function(){posX += $(this).outerWidth(true);});
    //            posX = (posX - ($(window).width() / 2) + ($(this).outerWidth(true) / 2) );
    //            $(this).parents('ul').animate({scrollLeft : posX + 25}, 400);
    //        }
    //    });
    //},

    //swiper slider
    initSwiper: function() {
        var $tSwiper = $('.tSwiper');
        if ( $tSwiper.length ) {
            $.each( $tSwiper ,function ($index, $item) {
                var $this = $(this);
                if ( !$this.attr('id') ) {
                $this.attr('id','swiper-' + $index );
                }
                var params = $this.data('params');
                if(!params) params = {};
                var tSwiper = new Swiper('#'+ $this.attr('id') ,$.extend( {
                
                } ,params ));
                /*$this.hover(function(){
                vSwiper.autoplay.stop(); 
                } ,function(){
                vSwiper.autoplay.start(); 
                });*/
            } );
        };
    },

    //체크박스
    initCheckComm: function() {
      //부분 선택
        if($('.checkAgree > .checkAll').length){
            $('.checkEach .check input').on('click', function() {
                ($('.checkEach .check input:not(:checked)').length == 0) ? $('.checkAll .check input').get(0).checked = true : $('.checkAll .check input').get(0).checked = false;
            });
        };
        
        //전체 선택
        $('.checkAll .check input').on('click', function() {
            var flag = this.checked;
            $('.checkEach .check input').each(function() {
                this.checked = flag;
            });
        });
    },

    //체크박스::옵션
    initCheckSignUp: function() {
        //동의 부분 선택.
        $('.checkAgree .checkEach .check input').click(function() {
            if ($(this).parent().hasClass("checkAll")) {
                $('.chkChoice .check input').prop('checked', function(){
                return !$('.chkChoice .check input').prop('checked');
                });
            }
            if ($('.choiceOption .check input').is(':checked')) {
                $('.chkChoice .checkAll input').get(0).checked = true;
            } else {
                $('.chkChoice .checkAll input').get(0).checked = false;
            }
            if($('.checkAgree > .checkAll').length){
                if ($('.checkAgree .checkEach .check input:not(:checked)').length == 0) {
                    $('.checkAgree > .checkAll .check input').get(0).checked = true;
                } else {
                    $('.checkAgree > .checkAll .check input').get(0).checked = false;
                }
            };
        });

        //동의 전체 선택
        $('.checkAgree > .checkAll .check input').on('click', function() {
            var flag = this.checked;
            $('.checkAgree .checkEach .check input').each(function() {
                this.checked = flag;
            });
        });
    },
    
    //체크박스::대리수령하기
    initCheckHide: function() {
        $('.checkOnOff').on('change', 'input[type="checkbox"]', function() {
            if($(this).is(':checked')) {
                $(this).parents('.checkOnOff').addClass('on')
            } else {
                $(this).parents('.checkOnOff').removeClass('on')
            }
        });
    },

    //input 삭제버튼
    initInputDel: function() {
        $('.formArea input').on('change keyup paste', function(e) {
            infoInput = $(this).val();
            if ($.trim(infoInput).length > 0) {
                $(this).parent().addClass('on');
            } else {
                $(this).parent().removeClass('on');
            }
        });
        $('.formArea .btnDel').on('click', function(e) {
            e.preventDefault();
            $(this).prev().val('').change().focus();
        });
    },

    //기간 설정
    initPeriod: function() {
        $('.periodSet input[type="radio"]').on('click', function(){
            var periodSelect = $(this).parents('.periodSet').find('.periodSelect');
            if($(this).hasClass('selectPeriod')){
                periodSelect.show();
            } else {
                periodSelect.hide();
            }
        });
    },

    //장바구니 sticky
    initCartSticky: function() {//다시 확인하기,,
        var colPos = $('.layoutCol'), 
            rgtHt = $('.layoutCol .tdRgt'),
            lftHt = $('.layoutCol .tdLft');
        if(colPos.length > 0) {
            var colPs = colPos.offset().top;
            if ($(document).scrollTop() > colPs - 160 && $(document).scrollTop() <  colPs + lftHt.height() - rgtHt.height() - 160) {
                rgtHt.removeClass('scrollBot').addClass('scrollTop')
            } else if($(document).scrollTop() > colPs - 160) {
                rgtHt.removeClass('scrollTop').addClass('scrollBot');
            } else {
                rgtHt.removeClass('scrollTop');
            }
        }
    },
    
    //datepicker
    //initDatepicker: function() {
        //$('.datePicker').datepicker({
        //    changeMonth: true,
        //    changeYear: true,
        //    currentText: '오늘',
        //    dateFormat: "yy.mm.dd",
        //    closeText: '닫기',
        //    nextText: '다음 달',
        //    prevText: '이전 달',
        //    yearSuffix: '년',
        //    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
        //    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        //    showButtonPanel: true,
        //    //yearRange: 'c-2:c+0',
        //    minDate: "-1Y", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        //    maxDate: "+0M", //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
        //});
        ////초기값을
        //$('.datePicker.start').datepicker('setDate', '-1M'); //일주일 전
        //$('.datePicker.end').datepicker('setDate', 'today'); //오늘
    //},
    
    initAbout: function() {
        if($('.accorList').length > 0) {
            $('.accorList .item').on('mouseenter', function() {
                $(this).addClass('on')
                $('.accorList .item').not('.on').find('.title').hide()
            });
            $('.item').on('mouseleave', function() {
                $(this).removeClass('on')
                $('.accorList .item').not('.on').find('.title').show()
            });
        }
    },
    
    initAni: function() {
        $('.contMid .col').each(function(){
            var scrTop = $(document).scrollTop(),
                scrOst = $(this).offset().top - 900,
                colEffect = $(this).attr('data-effect');
            if(scrTop >= scrOst){
                $(this).addClass(colEffect);
            }
        })
    },
};
    /*
    *상품상세
    */
    var detail = {
    init: function() {
        //detail.initCatFixed();
        detail.initAnchor();
        detail.initTabFixed();
        detail.initSlideThumb();

        //scroll event
        $(window).scroll(function (){
            detail.initTabFixed();
        })
    },
    //카테고리 고정
    //initCatFixed: function() {
    //    var categoryPos = $('.menuSlide');
    //    if(categoryPos.length > 0) {
    //        categoryPos.css({'height' : categoryPos.height() + 20});
    //        $(window).scroll(function (){
    //            var categoryPs = categoryPos.offset().top;
    //            if($(document).scrollTop() > categoryPs) {
    //                categoryPos.addClass('scroll');
    //            } else {
    //                categoryPos.removeClass('scroll');
    //            }
    //        });
    //    }
    //},

    //상품 슬라이드(썸네일)
    initSlideThumb: function() {
        var thumbOut = new Swiper(".zoomSection .out", {
            slidesPerView: 3,
            spaceBetween: 10,
            //watchSlidesProgress: true,
            watchSlidesVisibility: true,
            navigation: {
                nextEl: ".swiper-arrow.next",
                prevEl: ".swiper-arrow.prev",
            },
            //simulateTouch: true,
            allowTouchMove: false,
        });
        var thumbIn = new Swiper(".zoomSection .in", {
            slidesPerView: 1,
            allowTouchMove: false,
            thumbs: {
                swiper: thumbOut,
            },
        });

        $('.zoomSection .out .gallery').on('mouseenter', function() {//마우스오버 시 썸네일 변경
            var number = $(this).index();
            thumbIn.slideTo(number);
        });
    },

    //탭 클릭 시 해당 영역으로 이동
    initAnchor: function() {
        $('.anchorMenu a').on('click', function(e){
            e.preventDefault();
            //$(this).addClass('on').siblings().removeClass('on');
            var $href = $(this).attr('href'),
                elOsTop = $($href).offset().top,
                //elPs = elOsTop - 171;
                elPs = elOsTop - 235;
            $('html,body').animate({scrollTop:elPs}, 300);
        });

        $(window).scroll(function() {//스크롤 시 탭 활성화 //다시 확인하기
            $('.anchorCont > .section').each(function(){
                var $this = $(this),
                    idx = $this.index(),
                    $tabCont = $('.anchorInner a').eq(idx),
                    $tabContTop = $this.offset().top - 235;
                if($(document).scrollTop() >= $tabContTop) {
                    $tabCont.addClass('on').siblings().removeClass('on');
                }
            });
        });
    },

    //탭 고정
    initTabFixed: function() {
        var anchorPos = $('.anchorMenu');
        if(anchorPos.length > 0) {
            anchorPos.css({'height' : anchorPos.height()});
            var anchorPs = anchorPos.offset().top;
            if($(document).scrollTop() > anchorPs - 189) {
                anchorPos.addClass('scroll');
            } else {
                anchorPos.removeClass('scroll');
            }
        };
    },
};

    // UI 객체
    window._ui = {
        common: common,     //공통
        detail: detail,     //상품상세
    };
})();

//3자리 수 콤마.
function comma(str) {
    if(!$.isNumeric(str))
        return 0;
    else {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }
}

// 콤마제거.
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

