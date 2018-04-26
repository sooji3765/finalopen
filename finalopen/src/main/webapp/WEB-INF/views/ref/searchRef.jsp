<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>냉장고 검색</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
    
    <!-- Bootstrap core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src='https://developers.kakao.com/sdk/js/kakao.min.js'></script>
    <!-- Custom fonts for this template -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="/resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="/resources/css/freelancer.min.css" rel="stylesheet">
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">	
	// 냉장고 아이디 체크
	 $(document).ready(function(){
        $('#checkbtn').click(function(){
            $.ajax({
                type: 'POST',
                url: '/myPage/refCheck.do',
                data: {id : $('#id').val()},
                success: function(data){
                    if($.trim(data) == 0){
                        $('#msg').html('<p style="color:red">사용불가능</p>');
                        $('#useBtn').hide();
                    }
                    else{
                        $('#msg').html('<p style="color:blue">사용가능</p>');
                        $('#useBtn').show();
                    }
                }
            });        
        });        
    });

	$(document).ready(function(){
		$('#useBtn').click(function(){
			$.ajax({
				type :'POST',
				url :'/myPage/modifyPro.do',
				data: {id:$('#id').val()},
				success: function(){
					alert('변경완료');	
				}
			});
		});
	});

	</script>

</head>
<body>
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
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/alarm/mainAlarm.do">Alarm</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/bookmark/bookmarkMain.do">Mark</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/myPage/myPageMain.do">My HOME</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
        
	<!-- Header -->
    <header class="masthead bg-primary text-white text-center">
      	<div class="container">
      	 <div class="input-group">
		<input class="form-control col-xs-4" width="40%" type="text" id="id" placeholder="검색 냉장고 ID "/>
		<input type="button" value="검색" id="checkbtn" class="btn btn-default"/>
		<input id="useBtn" class="btn btn-info" style="display: none" type="button" value="변경" onclick="javascript:location.href='/myPage/myPageMain.do';"/>
		</div>
		<div class="text-center">
		<div id="msg"></div>
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
            <ul class="list-inline mb-0">
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" href="#">
                  <i class="fa fa-fw fa-facebook"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" href="#">
                  <i class="fa fa-fw fa-google-plus"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" href="#">
                  <i class="fa fa-fw fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" href="#">
                  <i class="fa fa-fw fa-linkedin"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" href="#">
                  <i class="fa fa-fw fa-dribbble"></i>
                </a>
              </li>
            </ul>
          </div>
          <div class="col-md-4">
            <h4 class="text-uppercase mb-4">About Freelancer</h4>
            <p class="lead mb-0">Freelance is a free to use, open source Bootstrap theme created by
              <a href="http://startbootstrap.com">Start Bootstrap</a>.</p>
          </div>
        </div>
      </div>
    </footer>

    <div class="copyright py-4 text-center text-white">
      <div class="container">
        <small>Copyright &copy; Our Website 2018</small>
      </div>
    </div>
    
</body>    
</html>