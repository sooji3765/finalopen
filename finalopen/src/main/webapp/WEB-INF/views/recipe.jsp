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
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src='https://developers.kakao.com/sdk/js/kakao.min.js'></script>
    <!-- Custom fonts for this template -->
    <link href="../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="/resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="/resources/css/freelancer.min.css" rel="stylesheet">
   
   	<style type="text/css">
		.button {display: inline-block;width: 150px;height: 54px;text-align: center;text-decoration: none;line-height: 54px;outline: none;position: relative;z-index: 2;background-color: #333;border: 2px solid #333;color: #fff;line-height: 50px;margin-bottom: 4rem;}
		.button:hover {	background-color: #fff;border-color: #18BC9C;color: #18BC9C;}
		.button::before,
		.button::after {position: absolute;z-index: -1;display: block;content: '';top: 0;width: 50%;height: 100%;background-color: #333;}
		.button,
		.button::before,
		.button::after {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;-webkit-transition: all .3s;transition: all .3s;}					
		.button::before {right: 0;}
		.button::after {left: 0;}
		.button:hover::before,
		.button:hover::after {width: 0;background-color: #18BC9C;}
		div img {
		   resize: both; /* 이미지 최대 사이즈에 적용 */
		   float: center; /* 가운데 정렬 */
		   max-width: 500px; /* 넓이를 지정 */
		   height: auto; /* 높이를 지정 */
		   margin: 5px 0; /* 여백을 적용 4가지 조건이 가능 위쪽, 오른쪽, 아래쪽, 왼쪽 순서 */
		   
		   
		   
	}
	.media-body{
         font-face: Georgia;
         font-size: 20px;
         margin-top: 200px;
      }
	</style>
	
	<script type="text/javascript">
	// 알림 카운트t()
	
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

	 //체크 검사
    function checkValue(){
    	var check = $("input:checkbox[id='word']").is(":checked");
    	if(check==false){
    		alert('재료를 선택하세요 ');
    		return false;
    	}
    }
	 
    function hangul()
	{
		if((event.keyCode< 12592) || (event.keyCode > 12687))
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
    <!-- Header -->
    <header class="masthead bg-primary text-white text-center">
      <div class="container" id="inputType" style="display:block">
        <h1 class="text-uppercase mb-0">레시피를 검색하세요.</h1>
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
      	<h1 class="text-uppercase mb-0">냉장고에서 검색하세요.</h1>
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
			
			<form method="post" action="search.do" onsubmit="return checkValue();">
			<!-- Tab panes -->
			<div class="tab-content bg-secondary">
			<div class="tab-pane active" id="home1" role="tabpanel">
			  	<c:forEach items="${refri}" var="refri">
			  		<input type="checkbox" class="word" id="word" name="word" value="${refri.r_item}"/>${refri.r_item}

			  	</c:forEach>
			  </div>
			  <div class="tab-pane" id="home" role="tabpanel">
			  	<c:forEach items="${refri}" var="refri">
			  		<c:if test="${refri.type_id=='2'||refri.type_id=='3'||refri.type_id=='5'||refri.type_id=='6'}">
			  			<input type="checkbox" class="word" id="word" name="word" value="${refri.r_item}"/>${refri.r_item}
			  		</c:if>
			  	</c:forEach>
			  </div>
			  <div class="tab-pane" id="profile" role="tabpanel">
			  <c:forEach items="${refri}" var="refri">
			  <c:if test="${refri.type_id=='7'||refri.type_id=='13'||refri.type_id=='14'||refri.type_id=='16'||refri.type_id=='9'}">
			  <input type="checkbox" class="word" name="word" id="word" value="${refri.r_item}"/>${refri.r_item}
			  </c:if>
			  </c:forEach>
			  </div>
			  <div class="tab-pane" id="messages" role="tabpanel">
			  <c:forEach items="${refri}" var="refri">
			  	<c:if test="${refri.type_id=='10'||refri.type_id=='11'||refri.type_id=='15'}">
			  	<input type="checkbox" class="word" name="word" id="word" value="${refri.r_item}"/>${refri.r_item}
			  	</c:if>
			  </c:forEach>
			  </div>
			<div class="tab-pane" id="settings" role="tabpanel">
			  	<c:forEach items="${refri}" var="refri">
			  		<c:if test="${refri.type_id=='12'}">
			  			<input type="checkbox" class="word" name="word" id="word" value="${refri.r_item}"/>${refri.r_item}
			  		</c:if>
			  	</c:forEach>
			  </div>
			<div class="tab-pane" id="milk" role="tabpanel">
			  	<c:forEach items="${refri}" var="refri">
			  		<c:if test="${refri.type_id=='4'}">
			  			<input type="checkbox" class="word" name="word" id="word" value="${refri.r_item}"/>${refri.r_item}
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
			<input type="submit" value="검색" class="btn btn-default btn-fill"/>
		 	</div>
		 	</form>
		 	</div>
	</div>
		</br>
       <div class="text-center"><input type="button" class="btn btn-success" id="changeBtn" onclick="changeRef()" value="냉장고에서 검색"></div>
    </header>
    
    
    <!-- Portfolio Grid Section -->   
    <section class="portfolio" id="portfolio">
    		<c:if test="${count==0}">
    		  <form method="post" action="/bookmark/bookmarkcheck.do">
		      <div style="position: fixed; right: 0px;  top: 550px;">
		      <input type="hidden" id="title" name="title" value="${title}"/>
		      <input type="hidden" id="url" name="url" value="${url}"/>
		      <input type="hidden" id="img" name="img" value="${img}"/>
		      <input type="hidden" id="check" name="check" value="1"/>
		      <input type="submit" class="button"  id="bookmarkSubmit" name="bookmarkSubmit" value="책갈피"/>
		      </div>
		      </form>
		    </c:if>
		    
		    <c:if test="${count==1}">
		      <form method="post" action="/bookmark/bookmarkdelete.do">
		      <div style="position: fixed; right: 0px; top: 550px;">
		      <input type="hidden" id="title" name="title" value="${title}"/>
		      <input type="hidden" id="url" name="url" value="${url}"/>
		      <input type="hidden" id="img" name="img" value="${img}"/>
		      <input type="hidden" id="check" name="check" value="0"/>
		      <input type="submit" class="button"  id="bookmarkSubmit" name="bookmarkSubmit" value="책갈피 해제"/>
		      </div>
		      </form>
		    </c:if>
		    <div class="btn btn-secondary" style="position: fixed; left:0 px; top: 550px; width: 400px;">
			   	내 냉장고<br>
			  	<c:forEach items="${refri}" var="refri" varStatus="status">
			  	
			  	<c:if test="${status.count%5!=0}">
			  	<input type="checkbox" class="word" name="word" value="${refri.r_item}"/>${refri.r_item}
			  	</c:if>
			  	<c:if test="${status.count%5==0}">
			  	</br>
			  	<input type="checkbox" class="word" name="word" value="${refri.r_item}"/>${refri.r_item}
			  	</c:if>
			  	</c:forEach><br>
			  	냉장고에 재료가있는지 체크해보세요
		    	
		    </div>
      <div class="container">
         <center>
         <h2>${title}</h2><br>
         <img src="${sumimg}"><br></center>
         <br><br>
      <table align="center" >   
         <tr align="center">
        <td align="center"><img src="/resources/img/icons/people.png"></td>
        <td align="center"><img src="/resources/img/icons/time.png">&nbsp;</td>
        <td align="center"><img src="/resources/img/icons/level.png"></td>
         </tr>
         <tr align="center">
            <td align="center"><h5>${people}</h5></td>
             <td align="center"><h5>${time}</h5></td>
             <td align="center"><h5>${level}</h5></td>
         </tr>
        </table>
        <h2 class="text-center text-uppercase text-secondary mb-0">재 료</h2>
        <hr class="star-dark mb-5">
        <h4>${sauce[0]}</h4><br>
        <h4>${sauce[1]}</h4><br>
        <h2 class="text-center text-uppercase text-secondary mb-0">레시피를 확인하세요.</h2>
        <hr class="star-dark mb-5">
        <center>
        ${link}        
        </center>
        </div>
        <div class="text-center">
        	<input type="button" value="리뷰 작성하기" onclick="location.href='/review/reviewForm.do?url=+${url}';" class="btn btn-success btn-lg"/>
        </div>
        
        </section>
        
        <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>


    <!-- Custom scripts for this template -->
    <script src="/resources/js/freelancer.min.js"></script>
        
        </body>
        </html>
        
        