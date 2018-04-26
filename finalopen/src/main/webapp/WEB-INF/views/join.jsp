<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>회원가입</title>
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

    <!-- Plugin CSS -->
    <link href="/resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="/resources/css/freelancer.min.css" rel="stylesheet">

    <script type="text/javascript">
	
    function checkId(){
		$.ajax({
			url:'/checkid.do',
			data:{id:$('#id').val()},
				success:function(data){
					if(data==0){
					$('#msg').show();
					$('#msg').html('<p style="color:blue">사용가능</p>');
                    $('#useBtn').show();
				}else{
					$('#msg').show();
					$('#msg').html('<p style="color:red">사용불가능</p>');
                    $('#useBtn').hide();
				}
			}
		});
    }

    //닉네임 중복 체크
    function checkNick(){
		$.ajax({
			url:'/checkNick.do',
			data:{nickname:$('#nickname').val()},
				success:function(data){
					if(data==0){
					$('#msg2').show();
					$('#msg2').html('<p style="color:blue">사용가능</p>');
                    $('#useBtn').show();
				}else{
					$('#msg2').show();
					$('#msg2').html('<p style="color:red">사용불가능</p>');
                    $('#useBtn').hide();
				}
			}
		});
    }
   
   function checkValue(){
	   
	   var form = document.reviewInfo;
	   
	   if(!form.id.value){
		   alert("제목을 입력하세요");
		   return false;
	   }
	   if(!form.nickname.value){
		   alert("제목을 입력하세요");
		   return false;
	   }
	   if(!form.pass.value){
		   alert("비밀번호를 입력하세요");
		   return false;
	   }
	   if(!form.uploadFile.value){
		   alert("사진을 선택해주세요");
		   return false;
	   }
	   
	   var regId = /^[A-Za-z0-9]{4,12}$/;

		if(!regId.test(form.id.value)) {
			alert('아이디를 영문과 숫자 4~12자 이내로 입력하세요.');
			return false;

		}
   
   }
   
   function goBack(){
	   window.history.back();
   }
   

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
   
   function resetImage(){
	   $('#msg').hide();
	   $('#blah').hide();  
	   $('#useBtn').hide();
   }
  
    </script>

</head>
  <body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="/login.do">Open Refrigerator</a>
        <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/login.do">Login</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/join.do">Join</a>
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
        <h2 class="text-center text-uppercase text-secondary mb-0">회원가입</h2>
        <hr class="star-dark mb-5">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
            <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
            <form action="/joinPro.do" method="post" enctype="multipart/form-data" 
             name="reviewInfo" id="reviewInfo" novalidate="novalidate"  onsubmit="return checkValue()">
            
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>아이디</label>
                  <input id="id" type="text" name="id" placeholder="아이디를 적어주세요" >
                  <input type="button" class="btn btn-default" value="중복체크" onclick="checkId();">
                  <h6>영문/숫자의 조합으로 입력하세요</h6>
                  <div id="msg"></div>
                  
                </div>
              </div>
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>닉네임</label>
                  <input  id="nickname" type="text" name="nickname" placeholder="닉네임을 적어주세요">
                  <input type="button" class="btn btn-default" value="중복체크" onclick="checkNick();"><div id="msg2"></div>	
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
                  <label>IMAGE</label>
                  <img id="blah" src="#" alt="your image" width="100" height="100" style="display: none"/>
                  <input id="uploadFile" name="uploadFile" type="file" onchange="readURL(this);" required="required" data-validation-required-message="Select your Image.">
                </div>
              </div>
              
              <br>
              <div id="success"></div>
              <div class="form-group">
              <span style="float:right">
                <button type="submit" class="btn btn-primary btn-xl" id="useBtn" style="display: none">가입하기</button>
              	<input type="reset" class="btn btn-danger btn-xl" value="취소" onclick="resetImage()"/>
              	</span>
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
