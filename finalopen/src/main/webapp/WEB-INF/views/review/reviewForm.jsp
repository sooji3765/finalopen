<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>리뷰 작성</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap core CSS -->
    <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<script src="/resources/vendor/jquery/jquery.min.js"></script>
    <!-- Custom fonts for this template -->
    <link href="../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	 <script src='https://developers.kakao.com/sdk/js/kakao.min.js'></script>
    <!-- Plugin CSS -->
    <link href="/resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="/resources/css/freelancer.min.css" rel="stylesheet">

    <script type="text/javascript">

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


   function readURL(input) {
     if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function (e) {
    	 $('#blah').show();  
         $('#blah').attr('src', e.target.result);
         }
       reader.readAsDataURL(input.files[0]);
       }
     }
   
   function checkValue(){
	   
	   var form = document.reviewInfo;
	   
	   if(!form.title.value){
		   alert("제목을 입력하세요");
		   return false;
	   }
	   if(!form.content.value){
		   alert("내용을 입력하세요");
		   return false;
	   }
	   if(!form.pass.value){
		   alert("비밀번호를 입력하세요");
		   return false;
	   }
	   if(!form.url.value){
		   alert("URL을 입력하세요");
		   return false;
	   }
	   if(!form.uploadFile.value){
		   alert("사진을 선택해주세요");
		   return false;
	   }
	     
   }
   
   function resetImage(){
	   $('#blah').hide();   
   }
   
   function goBack(){
	   window.history.back();
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
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="logout();">logout</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    </br>
    </br>
    
    <!-- 리뷰 작성 부분 -->
	<section id="contact">
      <div class="container">
        <h2 class="text-center text-uppercase text-secondary mb-0">리뷰 작성하기</h2>
        <hr class="star-dark mb-5">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
            <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
            <form action="/review/reviewPro.do" method="post" enctype="multipart/form-data" 
             name="reviewInfo" id="reviewInfo" novalidate="novalidate"  onsubmit="return checkValue()">
            
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>제목</label>
                  <input class="form-control" id="title" type="text" name="title" placeholder="리뷰의 제목을 적어주세요" required="required" data-validation-required-message="Please enter your subject.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>비밀번호</label>
                  <input class="form-control" id="pass" name="pass" type="password" placeholder="비밀번호를 입력하세요" required="required" data-validation-required-message="Please enter your passoword.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>URL</label>
                  <input class="form-control" id="url" name="url" type="text" placeholder="url을 입력하세요" value="${url}" required="required" data-validation-required-message="Please enter your url.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>IMAGE</label>
                  <input class="form-control" id="uploadFile" name="uploadFile" type="file" onchange="readURL(this);" required="required" data-validation-required-message="Select your Image.">
                  <img id="blah" src="#" alt="your image" width="100" height="100" style="display: none"/>
                </div>
              </div>
       
              
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>내용</label>
                  <textarea class="form-control" id="content" name="content" rows="5" placeholder="내용을 적어주세요" required="required" data-validation-required-message="Please enter a message."></textarea>
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <br>
              <div id="success"></div>
              <div class="form-group">
                <button type="submit" class="btn btn-primary btn-xl" id="sendMessageButton">저장</button>
              	<input type="reset" class="btn btn-danger btn-xl" value="취소" onclick="resetImage()"/>
        		<input type="button" class="btn btn-default btn-xl" value="뒤로가기" onclick="goBack();">
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>


     <!-- Bootstrap core JavaScript -->

    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="/resources/js/jqBootstrapValidation.js"></script>
    <script src="/resources/js/contact_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="/resources/js/freelancer.min.js"></script>

  </body>

</html>
