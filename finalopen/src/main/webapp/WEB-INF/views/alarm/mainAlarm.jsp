<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>알림 체크</title>
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
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  

	 <script src='https://developers.kakao.com/sdk/js/kakao.min.js'></script>
	<link rel="stylesheet" href="/resources/css/alarm_table.css">
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		// Activate tooltip
		//$('[data-toggle="tooltip"]').tooltip();
		
		// Select/Deselect checkboxes
		
		$("#selectAll").click(function(){
			checkbox = alarmUpdate.checkbox;
			
			if($("#selectAll").is(":checked")==true){
				//만약 전체 선택 체크박스가 체크된상태일경우
				if($("#selectAll").prop("checked")) {
					//해당화면에 전체 checkbox들을 체크해준다
					$("input[type=checkbox]").prop("checked",true);
					// 전체선택 체크박스가 해제된 경우
					} else {
						//해당화면에 모든 checkbox들의 체크를해제시킨다.
						$("input[type=checkbox]").prop("checked",false); 
					}

			} else{
				$("input[type=checkbox]").prop("checked",false);
			} 
		});
	});
	function deleteForm() { 
		var form = document.forms['alarmUpdate']; 
		form.action = '/alarm/alarmDelete.do'; 
		form.submit(); 
	}
	function deleteOneForm() { 
		var form = document.forms['alarmUpdate']; 
		form.action = '/alarm/alarmDeleteOne.do'; 
		form.submit(); 
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
        <h1 class="text-uppercase">알림을 확인해주세요.</h1>
        <hr class="star-light">
      </div>
    </header>

    <!-- Portfolio Grid Section -->
    <section class="portfolio" id="portfolio">
          <div class="container">
          <form id="alarmUpdate" name="alarmUpdate" method="post" action="/alarm/alarmUpdate.do">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
						<h2>Alarm</b></h2>
					</div>
					<div class="col-sm-6">
						<input type="button" class="btn btn-danger" value="삭제" onclick="deleteForm()"/>
						<input class="btn btn-success" type="submit" type="post" action="/alarm/alarmUpdate.do" value="확인"/>
					</div>
                </div>
            </div>
            
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
						<th>
							<span class="custom-checkbox">
								<input type="checkbox" id="selectAll" name="selectAll">
								<label for="selectAll"></label>
							</span>
						</th>
                        <th>Num</th>
                        <th>Title</th>
						<th>Content</th>
                        <th>Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${alarm}" var="alarm">
                    <c:if test="${alarm.al_check==1}">
                    <tr>
						<td>
							<span class="custom-checkbox">
								<input type="checkbox" class="checkbox" id="alarm" name="alarm" value="${alarm.al_num}"/>
								<label for="checkbox"></label>
							</span>
						</td>
                        <td>${alarm.al_num}</td>
                        <td>${alarm.al_title}</td>
						<td><a href="/alarm/alarmCheck.do?num=${alarm.al_num}">${alarm.al_content}</a></td>
                        <td><fmt:formatDate value="${alarm.al_time}" pattern="yyyy-MM-dd"/></td>
                        <td>
                          <a href="#deleteEmployeeModal${alarm.al_num}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                        </td>
                    </tr>
                    </c:if>
                    <c:if test="${alarm.al_check==0}">
                    <tr>
						<td>
							<span class="custom-checkbox">
								<input type="checkbox" class="checkbox" id="alarm" name="alarm" value="${alarm.al_num}"/>
								<label for="checkbox"></label>
							</span>
						</td>
                        <td>${alarm.al_num}</td>
                        <td>${alarm.al_title}</td>
						<td><h5><a href="/alarm/alarmCheck.do?num=${alarm.al_num}">${alarm.al_content}</a></h5></td>
                        <td><fmt:formatDate value="${alarm.al_time}" pattern="yyyy-MM-dd"/></td>
                        <td>
                          <a href="#deleteEmployeeModal${alarm.al_num}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                        </td>
                    </tr>
                    
                    </c:if>
                  	 <!-- Delete Modal HTML -->
					   <div id="deleteEmployeeModal${alarm.al_num}" class="modal fade">
					      <div class="modal-dialog">
					         <div class="modal-content">
					            
					               <div class="modal-header">                  
					                  <h4 class="modal-title">삭제</h4>
					                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					               </div>
					               <div class="modal-body">               
					                  <p>이 알람을 삭제하시겠습니까?</p>
					                
		               </div>
					               <div class="modal-footer">
					                  <input type="button" class="btn btn-default" data-dismiss="modal" value="취소">
					                  <input type="button" class="btn btn-danger" value="확인" onclick="location.href='/alarm/alarmDeleteOne.do?num=${alarm.al_num}'" >
					               </div>
					          
					         </div>
					      </div>
					   </div>
                    </c:forEach>
                     
                </tbody>
            </table>
            </form>

        </div>
    </div>
    </div>
		</div>
	</div>
    </section>
    
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
        <small>Copyright &copy; Your Website 2017</small>
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
    
    

  </body>

</html>