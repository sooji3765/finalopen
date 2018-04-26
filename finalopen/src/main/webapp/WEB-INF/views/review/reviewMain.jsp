<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>리뷰 공유</title>
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
	 <script src='https://developers.kakao.com/sdk/js/kakao.min.js'></script>
    <!-- Custom styles for this template -->
    <link href="/resources/css/freelancer.min.css" rel="stylesheet">

    <script type="text/javascript">
    
    function commentInsertBtn(bno){
    	var content = $('#content_comm').val();
    	
    	if(content!=null){
	    	$.ajax({
	    		url :'/review/commentInsert.do',
	    		type:'POST',
	    		data :{bno : bno, //리뷰 번호
	    			   content : content}, // 댓글 내용
	    		success : function(data){ // 성공시
	    					$('#content_comm').val('');
	    					location.reload();
	                	  }
	    		});
    	}else{
    		alert('댓글 내용을 입력해주세요');
    	}
    }
    
    //게시판 삭제
    function modifyReview(renum){
    	 var bool = confirm("삭제하시겠습니까?");
    	if(bool){
	    	$.ajax({
	    		url :'/review/reviewModify.do',
	    		type:'POST',
	    		data :{renum : renum}, //리뷰 번호
	    		success : function(){ // 성공시
	    				alert("삭제완료");
	    				location.reload();
	            }
	    	});
    	}
    }
    
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
    </br>
    </br>
    <!-- Review Grid Section -->
    <section class="portfolio" id="portfolio">
      <div class="container">
        <h2 class="text-center text-uppercase text-secondary mb-0">리뷰 게시판</h2>
        <hr class="star-dark mb-5">
        <div class="col-sm-5">
        </div>
        <div class="text-right">              
          <input type="button" class="btn btn-success" onClick="location.href='/review/reviewForm.do';" value="리뷰 쓰기"/></br></br>
       	</div>
          
        <div class="row">
          <c:forEach var="review" items="${review}">
          <div class="col-md-6 col-lg-4" id="modalOne">
            <a class="portfolio-item d-block mx-auto" href="#${review.re_num}">
              <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
                <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
                  <i class="fa fa-search-plus fa-3x"></i>
                </div>
              </div>
              <img class="img-fluid" style="width:100% ; height:30% " src="/resources/save/${review.re_image}" alt="">
              <div class="text-center" id="title_search"><h4>${review.re_title }</h4></div>
            </a>
          </div>
          
           <!-- Review Modal -->

    		<!-- Review Modal One -->
          
          <div class="portfolio-modal mfp-hide" id="${review.re_num}">
      <div class="portfolio-modal-dialog bg-white">
        <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
          <i class="fa fa-3x fa-times"></i>
        </a>
        <div class="container text-center">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <h2 class="text-secondary text-uppercase mb-0">${review.re_title}</h2>
              <hr class="star-dark mb-5">
              <img class="img-fluid mb-5" src="/resources/save/${review.re_image}" alt="">
              <p class="mb-5">${review.re_content }</p>
              <a href="${review.re_blog_url }">참고한 레시피 사이트로 이동</a>
              <!-- 댓글 -->
              <div class="container">
              <hr size="5">
              <div class="text-left"><label for="content"><h3>댓글</h3> </label></div>
              <form id="commentInsertForm">
              	<div class="input-group">
              		<input type="text" class="form-control" id="content_comm" name="content_comm" placeholder="내용을 입력하세요."/>
                    <input type="button" class="btn btn-default" value="등록" onclick="commentInsertBtn('${review.re_num}')" />
              	</div>
              </form>
              </div>
              <div class="container" id="listComment">
              <jsp:include page="/review/commentList.do?bno=${review.re_num}" flush="true"/>
              </div>
              </br></br>
              <c:if test="${review.m_id == id}">
              <input type="button" value="리뷰 삭제" class="btn btn-danger btn-lg" onclick="modifyReview('${review.re_num}')">
              </c:if>
              <a class="btn btn-info btn-lg rounded-pill portfolio-modal-dismiss" href="#">
                <i class="fa fa-close"></i>
                Close</a>
            </div>
          </div>
        </div>
      </div>
    </div>
          
          </c:forEach>
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
