<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원관리 페이지</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap core CSS -->
    <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src='https://developers.kakao.com/sdk/js/kakao.min.js'></script>
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

    <!-- Header -->
    <header class="masthead bg-primary text-white text-center">
      <div class="container">
        <h2 class="text-uppercase">${user.m_nickname}님 마이페이지에 오신것을 환영합니다.</h2>
        </br>
        <input type="button" value="로그아웃" class="btn btn-default btn-lg" onclick="logout();">
      </div>
    </header>

    <!-- Portfolio Grid Section -->
    <section class="portfolio">
      <div class="container">
	  <ul class="nav nav-pills"> 
	    <li class="active"><a data-toggle="tab" href="#home"> 사용자 정보 </a></li>
	    <li><a data-toggle="tab" href="#menu1"> 내가 쓴 리뷰 </a></li>
	    <li><a data-toggle="tab" href="#menu2"> 내 냉장고 </a></li>
	    <li><a data-toggle="tab" href="#menu3"> 메모 </a></li>
	  </ul>
	
	  <div class="tab-content">
	    <div id="home" class="tab-pane fade in active">
	      </br>	
	      </br>
	      <jsp:include page="/myPage/userInfo.do" flush="true"></jsp:include>
	    </div>
	    <div id="menu1" class="tab-pane fade">
	      <jsp:include page="/myPage/myReview.do" flush="true"></jsp:include>
	    </div>
	    <div id="menu2" class="tab-pane fade">
	      <jsp:include page="/myPage/myRef.do" flush="true"></jsp:include>
	    </div>
	    <div id="menu3" class="tab-pane fade">
	      <jsp:include page="/myPage/memo.do" flush="true"></jsp:include>
	    </div>
	    
 	 </div>
	</div>
    </section>

   
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

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-to-top d-lg-none position-fixed ">
      <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
        <i class="fa fa-chevron-up"></i>
      </a>
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
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  </body>

</html>