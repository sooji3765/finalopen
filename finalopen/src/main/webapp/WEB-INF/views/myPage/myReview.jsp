<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

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
    
    <script type="text/javascript">
    function commentInsertBtn(bno){
    	$.ajax({
    		url :'/review/commentInsert.do',
    		type:'POST',
    		data :{bno : bno, //리뷰 번호
    			   content : $('#content_comm').val()}, // 댓글 내용
    		success : function(data){ // 성공시
    					alert("success");
    					$('#content_comm').val('');
    					location.reload();
                	  }
    		});
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
    
    </script>
</head>
<body>
<!-- Review Grid Section -->
    <section class="portfolio" id="portfolio">
      <div class="container">
        <div class="row">
          <c:forEach var="review" items="${review}">
          <div class="col-md-6 col-lg-4">
            <a class="portfolio-item d-block mx-auto" href="#${review.re_num}">
              <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
                <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
                  <i class="fa fa-search-plus fa-3x"></i>
                </div>
              </div>
              <img class="img-fluid" style="width:100% ; height:30% " src="/resources/save/${review.re_image}" alt="">
            	<div class="text-center"><h3>${review.re_title }</h3></div>
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
              
              <div class="container">
              <div class="text-left"><label for="content">Comment</label></div>
              <form id="commentInsertForm">
              	<div class="input-group">
              		<input type="text" class="form-control" id="content_comm" name="content_comm" placeholder="내용을 입력하세요."/>
                    <input type="button" class="btn btn-primary" value="등록" onclick="commentInsertBtn('${review.re_num}')" />
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
</body>
</html>