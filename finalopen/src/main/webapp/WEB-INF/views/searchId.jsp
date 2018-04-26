<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>아이디 비밀번호 찾기</title>
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
	
    function searchId(){
		$.ajax({
			method: 'POST',
			url:'/searchNick.do',
			data:{nickname :$.trim($('#nickname').val())},
				success:function(data){
				$('#msg').html('<p>'+data+'</p>');		
			}
		});
    }
    
    function searchPass(){
    	
		$.ajax({
			method: 'POST',
			url:'/searchPass.do',
			data:{id :$.trim($('#id').val()), 
				nickname :$.trim($('#name').val())},
			success:function(data){
				if(data==1){
					$('#modify').show();
				}else{
					alert("등록되지 않은 id이거나 존재하지 않는 닉네임 입니다.");
				}
			}
		});
    }
    
    function goBack(){
 	   window.history.back();
    }
   
    function checkPass(){
	    if(!userinput.idchange.value) {
	        alert("ID를 입력하세요");
	        return false;
	    }
	    
	    if(!userinput.passwd1.value ) {
	        alert("비밀번호를 입력하세요");
	        return false;
	    }
	    if(userinput.passwd1.value != userinput.passwd2.value)
	    {
	        alert("비밀번호를 동일하게 입력하세요");
	        return false;
	    }
    }
  
    </script>

</head>
  <body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#">Open Refrigerator</a>
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
    
   
	<section id="contact">
      <div class="container">
        <h2 class="text-center text-uppercase text-secondary mb-0">아이디/비밀번호 찾기</h2>
        <hr class="star-dark mb-5">
        <div class="row">
          <div class="col-lg-8 mx-auto">
          
            <div class="modal-content">
              <div class="modal-header"><div class="text-center">아이디 찾기</div></div>
              <div class="modal-body">
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>닉네임</label>
                  <input id="nickname" type="text" name="nickname" placeholder="닉네임을 적어주세요" >
                   
                  <input type="button" class="btn btn-default" value="[아이디 찾기]" onclick="searchId();"/>
                  
                </div>
                  <div id="msg"></div>
              </div>

              </div>
              </div>
              </br>
              
              
              <div class="modal-content">
              <div class="modal-header"><div class="text-center"><h5>비밀번호를 잊었을때</h5></div></div>
              <div class="modal-body">
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>아이디</label>
                  <input class="form-control" id="id" name="id" type="text" placeholder="아이디를 입력하세요">
                </div>
              </div>
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>닉네임</label>
                  <input class="form-control" id="name" name="name" type="text" placeholder="닉네임을 입력하세요">	
                </div>
                <input type="button" class="btn btn-default" value="비밀번호 찾기" onclick="searchPass();">
               
                 <a href="#deleteEmployeeModal" class="btn btn-danger" style="display: none" id="modify" data-toggle="modal">비밀번호 변경</a>
              </div>
             </div>
             </div>
              
              <br>
              <div id="success"></div>
              <div class="form-group text-right">
             
              	<input type="button" class="btn btn-info btn-xl" value="뒤로가기" onclick="goBack();"/>
        		
              </div>
            </form>
          </div>
        </div>
      </div>
      
      
      <!-- Delete Modal HTML -->
	   <div id="deleteEmployeeModal" class="modal fade">
	      <div class="modal-dialog">
	         <div class="modal-content">
	            <form method="post" action="/changePass.do" onsubmit="return checkPass();" name="userinput">
	           
	               <div class="modal-header">                  
	                  <h4 class="modal-title">비밀번호 변경</h4>
	                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	               </div>
	               <div class="modal-body">
               			<div>
               			아이디 입력 : <input type="text" id="idchange" name="idchange">
               			</div>
               			<div>            
	                  	비밀번호 입력 :<input type="password" id="passwd1" name="passwd1">
	                  	</div>
	                  	<div>	               
	                  	비밀번호 확인 :<input type="password" id="passwd2" name="passwd2">
	                  	</div>
             		</div>
	               <div class="modal-footer">
	                  <input type="button" class="btn btn-default" data-dismiss="modal" value="취소">
	                  <input type="submit" class="btn btn-success" value="변경">
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
