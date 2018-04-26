<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Welcome Our Site</title>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap core CSS -->
    <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="/resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="/resources/css/freelancer.min.css" rel="stylesheet">
   <script src='https://developers.kakao.com/sdk/js/kakao.min.js'></script>
   <!-- 더보기 -->
   <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
   
   <style type="text/css">
      .js-load { display: none; }
      .js-load.active { display: inline-block; }
      .is_comp.js-load:after { display: none; }
      .lists { margin-bottom: 4rem; }
      .btn-wrap { text-align: center; }
      .button {display: inline-block;width: 200px;height: 54px;text-align: center;text-decoration: none;line-height: 54px;outline: none;position: relative;z-index: 2;background-color: #333;border: 2px solid #333;color: #fff;line-height: 50px;margin-bottom: 4rem;}
      .button:hover {   background-color: #fff;border-color: #18BC9C;color: #18BC9C;}
      .button::before,
      .button::after {position: absolute;z-index: -1;display: block;content: '';top: 0;width: 50%;height: 100%;background-color: #333;}
      .button,
      .button::before,
      .button::after {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;-webkit-transition: all .3s;transition: all .3s;}               
      .button::before {right: 0;}
      .button::after {left: 0;}
      .button:hover::before,
      .button:hover::after {width: 0;background-color: #18BC9C;}
      .txt_line { width:355px;
      			  padding:0 5px;
      			  overflow:hidden;
      			  text-overflow:ellipsis;
      			  white-space:nowrap;
      			  }
   </style>
   
   <script type="text/javascript">
   $(window).on('load', function () {
       load('#js-load', '6');
       $("#js-btn-wrap .button").on("click", function () {
           load('#js-load', '3', '#js-btn-wrap');
       })
   });
    
   function load(id, cnt, btn) {
       var girls_list = id + " .js-load:not(.active)";
       var girls_length = $(girls_list).length;
       var girls_total_cnt;
       if (cnt < girls_length) {
           girls_total_cnt = cnt;
       } else {
           girls_total_cnt = girls_length;
           $(button).hide();
       }
       $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
   }
   
    // 알림 카운트
    $(document).ready(function(){
      $.ajax({
         url:'/alarm/count.do',
         method:'POST',
         data:{view:"checkMain"},
            success:function(data){
               console.log(data);
               if(data>0){
               document.getElementById('spanCnt').innerHTML = data;
            }else{
               document.getElementById('spanCnt').innerHTML = "0";
            }
         }
      });
    });
   
   function changeRef(){
         
         var Btn_Name = $('#changeBtn').val();
         if(Btn_Name=='냉장고에서 검색'){
            $('#inputType').hide();
            $('#checkType').show();
            $('#changeBtn').val('검색어로 검색');
         }
         else{
            $('#inputType').show();
            $('#checkType').hide();
            $('#changeBtn').val('냉장고에서 검색');
         }
   }
   
   $(document).ready(function () {
         $('#myTab a:last').tab('show')
	});
	//한글만 가능
	function hangul()
	{
		if((event.keyCode < 12592) || (event.keyCode > 12687))
		alert('한글로만 입력해주세요');
		document.forms[0].word.focus();
		event.returnValue = false
	}
  	//빈값일경우 알람
	function formCheck(){
  		var word = document.forms[0].word.value;
  		if (word == null || word ==""){
  			alert('검색어를 입력해주세요');
  			document.forms[0].word.focus();
  			return false;
  		}
  	}
  	
	 //로그아웃
    function logout(){
 	   
 	   Kakao.init('f9d11ad5a866d8080d8f0f77144fa42c'); //카카오에서 제공 myceo.co.kr 수정
 	   Kakao.Auth.logout(
 	   function(obj) {
 	   if(obj==true){
 		   alert('로그아웃 성공');
 	   	   location.href='/logout.do';}
 	   	else{alert('로그아웃 실패')}
 	   }
 	   );
 	   
    }  
   </script>
   </head>

  <body id="page-top">
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="/main.do">Open Refrigerator</a>
        <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/review/reviewMain.do">Talk</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/alarm/mainAlarm.do">
              Alarm<span class="badge badge-success" id="spanCnt"></span></a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/bookmark/bookmarkMain.do">Mark</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/myPage/myPageMain.do">My HOME</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="logout();">Logout</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
   
   <!-- Header -->
    <header class="masthead bg-primary text-white text-center">
      <div class="container" id="inputType" style="display:block">
        <h1 class="text-uppercase mb-0">레시피를 검색하세요 :D</h1>
        <hr class="star-light">
        <form action="search.do" method="post" onsubmit="return formCheck();">
        <div class="input-group">
        <input type="text" name="word" onKeyPress="hangul();" class="form-control" placeholder="검색 키워드를 입력하세요!"> 
         <span class="input-group-btn">
         <input class="btn btn-secondary" type="submit" value="찾기">
        </span>
         </div>
         </form>
      </div>
      
      <div class="container " id="checkType" style="display: none">
         <h1 class="text-uppercase mb-0">냉장고에서 검색하세요 :D</h1>
         <hr class="star-light">
         <!-- 냉장고  -->
         
         <!-- Nav tabs -->
         
         <ul class="nav nav-tabs bg-secondary nav-fill nav-justified" role="tablist" >
           <li class="nav-item">
             <a class="nav-link active" data-toggle="tab" href="#home1" role="tab">전체</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" data-toggle="tab" href="#home" role="tab">곡류</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" data-toggle="tab" href="#profile" role="tab">육류</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" data-toggle="tab" href="#messages" role="tab">채소류</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" data-toggle="tab" href="#settings" role="tab">과일류</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" data-toggle="tab" href="#milk" role="tab">유제품류</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" data-toggle="tab" href="#sweet" role="tab">유지 당류</a>
           </li>
         </ul>
         
         <form method="post" action="search.do">
         <!-- Tab panes -->
         <div class="tab-content bg-secondary">
         <div class="tab-pane active" id="home1" role="tabpanel">
              <c:forEach items="${refri}" var="refri">
                 <input type="checkbox" class="word" name="word" value="${refri.r_item}"/>${refri.r_item}

              </c:forEach>
           </div>
           <div class="tab-pane" id="home" role="tabpanel">
              <c:forEach items="${refri}" var="refri">
                 <c:if test="${refri.type_id=='2'||refri.type_id=='3'||refri.type_id=='5'||refri.type_id=='6'}">
                    <input type="checkbox" class="word" name="word" value="${refri.r_item}"/>${refri.r_item}
                 </c:if>
              </c:forEach>
           </div>
           <div class="tab-pane" id="profile" role="tabpanel">
           <c:forEach items="${refri}" var="refri">
           <c:if test="${refri.type_id=='7'||refri.type_id=='13'||refri.type_id=='14'||refri.type_id=='16'||refri.type_id=='9'}">
           <input type="checkbox" class="word" name="word" value="${refri.r_item}"/>${refri.r_item}
           </c:if>
           </c:forEach>
           </div>
           <div class="tab-pane" id="messages" role="tabpanel">
           <c:forEach items="${refri}" var="refri">
              <c:if test="${refri.type_id=='10'||refri.type_id=='11'||refri.type_id=='15'}">
              <input type="checkbox" class="word" name="word" value="${refri.r_item}"/>${refri.r_item}
              </c:if>
           </c:forEach>
           </div>
         <div class="tab-pane" id="settings" role="tabpanel">
              <c:forEach items="${refri}" var="refri">
                 <c:if test="${refri.type_id=='12'}">
                    <input type="checkbox" class="word" name="word" value="${refri.r_item}"/>${refri.r_item}
                 </c:if>
              </c:forEach>
           </div>
         <div class="tab-pane" id="milk" role="tabpanel">
              <c:forEach items="${refri}" var="refri">
                 <c:if test="${refri.type_id=='4'}">
                    <input type="checkbox" class="word" name="word" value="${refri.r_item}"/>${refri.r_item}
                 </c:if>
              </c:forEach>
          </div>
          <div class="tab-pane" id="sweet" role="tabpanel">
              <c:forEach items="${refri}" var="refri">
                 <c:if test="${refri.type_id=='8'||refri.type_id=='1'}">
                    <input type="checkbox" class="word" name="word" value="${refri.r_item}"/>${refri.r_item}
                 </c:if>
              </c:forEach>
          </div>
         <div class="text-center">  
         <input type="submit" value="검색" class="btn btn-default btn-fill btn-lg"/>
          </div>
          </form>
          </div>
      </div>
      </br>
       <div class="text-center"><input type="button" class="btn btn-success" id="changeBtn" onclick="changeRef()" value="냉장고에서 검색"></div>
    </header>
   
    <!-- Portfolio Grid Section -->
    <section class="portfolio" id="portfolio">
      <div class="container">
        <h2 class="text-center text-uppercase text-secondary mb-0">총${total}개의 레시피가 있습니다.</h2>
        <hr class="star-dark mb-5">
        <!-- 게시글 -->
        <div class="row" id="js-load">
        <c:forEach var="dto" items="${list}">
          <div class="js-load col-md-6 col-lg-4" >
            <a class="portfolio-item d-block mx-auto" href="recipe.do?url=http://www.10000recipe.com${dto.foodlink}&img=${dto.foodimg}">
              <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
                <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
                  <i class="fa fa-search-plus fa-3x"></i>
                </div>
              </div>
                <img class="img-fluid" style=width:100% height=50% src="${dto.foodimg}" alt="">
                <font color="black"><h4 class="txt_line">${dto.foodtitle}</h4></font>
           		<h8>${dto.by}</h8></a>
          </div>                
      </c:forEach>
        </div>
        </br>
        </br>
        <div id="js-btn-wrap" class="btn-wrap"> <a href="javascript:;" class="button">더보기</a> </div>
      </div>
    </section>
       <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    </body>
</html>