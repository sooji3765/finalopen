<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
	<!-- Bootstrap core JavaScript -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
    
    <!-- 카카오톡 로그인 -->
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <!-- naver -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="/resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="/resources/css/freelancer.min.css" rel="stylesheet">
	
	<script type="text/javascript">
	
	function checkUser(){
		var form = document.loginform;
		
	   if(!form.id.value){
		   alert("아이디를 입력하세요");
		   return false;
	   }
	   if(!form.pass.value){
		   alert("비밀번호를 입력하세요");
		   return false;
	   }
	   
	   	   
	}
	</script>
</head>
  <body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">Open Refrigerator</a>
        <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#portfolio">Login</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/join.do">Join</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Header -->
    <header class="masthead bg-primary text-white text-center">
      <div class="container">
      	<h1 class="text-uppercase mb-0">JOIN US</h1>
      	<h5 class="font-weight-light mb-0">기존에 사용하시는 계정으로 간단하게 회원가입 하세요.</h5>
      	<hr class="star-light">
		 <div class="container mb-0 col-md-6 bg-secondary">
      	<div class="row">
        <div class="col-md-12 ">
          <div class="login-box well">
          <div class="form-group"></br><h2>로그인</h2>
          </div>
        <form accept-charset="UTF-8" role="form" method="post" action="/logincheck.do" onsubmit="return checkUser();"
        name="loginform" id="loginform">
            <div class="form-group">
                
                <input name="id" id="id" placeholder="Username" type="text" class="form-control" />
            </div>
            <div class="form-group">
         
                <input name="pass" id="pass" placeholder="Password" type="password" class="form-control" />
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary btn-login-submit btn-block m-t-md" value="로그인" />
            </div>
             <span class='text-center'><a href="/searchId.do" class="text-sm">아이디 찾기</a></span>
           
            <span class='text-center'><a href="/searchId.do" class="text-sm">비밀번호 찾기</a></span>
            <hr />
            <div class="form-group">
                <a href="/join.do" class="btn btn-default btn-block m-t-md">회원가입</a>
            </div>
            <input type="hidden" name="type" id="type" value="local"/>
            <div class="form-group">
               <a id="kakao-login-btn"></a>
       	 <script type='text/javascript'>
       	var id;
        var nickname;
        var profile_image;
     	 //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('f9d11ad5a866d8080d8f0f77144fa42c');
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
          container: '#kakao-login-btn',
          success: function(authObj) {
        	  Kakao.API.request({
                  url: '/v1/user/me',
                  success: function(res) {
                    //alert(JSON.stringify(res));
                    id = res.id;
                    nickname = res.properties.nickname;
                    profile_image=res.properties.profile_image;
                    location.href="/logincheck.do?id="+id+"&nickname="+nickname+"&image="+profile_image+"&pass="+id+"&type=kakao";
                  },
                  fail: function(error) {
                    alert(JSON.stringify(error));
                  }
                });
          },
          fail: function(err) {
             alert(JSON.stringify(err));
          }
        });
      //]]>
    	</script>
            </div>
        </form>
          </div>
        </div>
      </div>
    </div>

    </div>
    </header>

    <!-- Footer -->
    <footer class="footer text-center">
      <div class="container">
        <div class="row">
          <div class="col-md-4 mb-5 mb-lg-0">
            <h4 class="text-uppercase mb-4">Location</h4>
            <p class="lead mb-0">Seoul National Univ.Station
              <br>Global IT</p>
          </div>
          <div class="col-md-4 mb-5 mb-lg-0">
            <h4 class="text-uppercase mb-4">Around the Web</h4>
            
          </div>
          <div class="col-md-4">
            <h4 class="text-uppercase mb-4">About Us</h4>
            <p class="lead mb-0">Website created by our team.</p>
          </div>
        </div>
      </div>
    </footer>

    <div class="copyright py-4 text-center text-white">
      <div class="container">
        <small>Copyright &copy; Our Website 2018</small>
      </div>
    </div>

  
    <!-- Bootstrap core JavaScript -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
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