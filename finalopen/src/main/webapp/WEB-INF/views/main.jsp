<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Welcome Our Site</title>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">	
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
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script src='https://developers.kakao.com/sdk/js/kakao.min.js'></script>
    
    <!-- 이메일 send 버튼  -->
    <script type="text/javascript">
    	function sendBtn(){
    		    $.ajax({
    		        url: '/mail.do',
    		        type: 'POST',
    		        data: {
    		          name: $('#name').val(),
    		          phone: $('#phone').val(),
    		          email: $('#email').val(),
    		          message: $('#message').val()
    		        },
    		        success: function() {
    		        	$('#success').html("<div class='alert alert-success'>");
    		            $('#success > .alert-success').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
    		              .append("</button>");
    		            $('#success > .alert-success')
    		              .append("<strong>Your message has been sent. </strong>");
    		            $('#success > .alert-success')
    		              .append('</div>');
    		          $('#contactForm').trigger("reset");
    		        },
    		        error: function() {
    		            // Fail message
    		            $('#success').html("<div class='alert alert-danger'>");
    		            $('#success > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
    		              .append("</button>");
    		            $('#success > .alert-danger').append($("<strong>").text("Sorry " + firstName + ", it seems that my mail server is not responding. Please try again later!"));
    		            $('#success > .alert-danger').append('</div>');
    		            //clear all fields
    		            $('#contactForm').trigger("reset");
    		          }      
			});

		}
    	
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
    
    //체크 검사
    function checkValue(){
    	var check = $("input:checkbox[id='word']").is(":checked");
    	if(check==false){
    		alert('재료를 선택하세요 ');
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
   
    $(document).ready(function(){
    	// Activate tooltips
    	$('[data-toggle="tooltip"]').tooltip();
        
    	// Filter table rows based on searched term
        $("#search").on("keyup", function() {
            var term = $(this).val().toLowerCase();
            	$("table tbody tr").each(function(){
                	$row = $(this);
                	var name = $row.find("td:nth-child(1)").text().toLowerCase();
                	console.log(name);
                	if(name.search(term) < 0){                
                    	$row.hide();
                	} else{
                    	$row.show();
                	}
            	});
        	});
    	});
    	
    
    	//한글만 가능
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
      <div class="container" id="inputType" style="display:block">
        <h1 class="text-uppercase mb-0">레시피를 검색하세요.</h1>
        <hr class="star-light">
        <form action="search.do" method="post" onsubmit="return formCheck();">
        <div class="input-group">
        <input type="text" name="word" class="form-control" onKeyPress="hangul();" placeholder="검색 키워드를 입력하세요!"> 
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
			
			<form method="post" action="search.do" onsubmit="return checkValue()">
			<!-- Tab panes -->
			<div class="tab-content bg-secondary">
			<div class="tab-pane active" id="home1" role="tabpanel">
			  	<c:forEach items="${refri}" var="refri">
			  		<input type="checkbox" width="50" height="50" id="word" class="word" name="word" value="${refri.r_item}"/>${refri.r_item}
			  	</c:forEach>
			  	<br/>
				</div>

			  <div class="tab-pane" id="home" role="tabpanel">
			  	<c:forEach items="${refri}" var="refri">
			  		<c:if test="${refri.type_id=='2'||refri.type_id=='3'||refri.type_id=='5'||refri.type_id=='6'}">
			  			<input type="checkbox" id="word" class="word" name="word" value="${refri.r_item}"/>${refri.r_item}
			  		</c:if>
			  	</c:forEach>
			  	<br/>
			  </div>
			  <div class="tab-pane" id="profile" role="tabpanel">
			  <c:forEach items="${refri}" var="refri">
			  <c:if test="${refri.type_id=='7'||refri.type_id=='13'||refri.type_id=='14'||refri.type_id=='16'||refri.type_id=='9'}">
			  <input type="checkbox" class="word" id="word" name="word" value="${refri.r_item}"/>${refri.r_item}
			  </c:if>
			  </c:forEach>
			  <br/>
			  </div>
			  <div class="tab-pane" id="messages" role="tabpanel">
			  <c:forEach items="${refri}" var="refri">
			  	<c:if test="${refri.type_id=='10'||refri.type_id=='11'||refri.type_id=='15'}">
			  	<input type="checkbox" class="word" id="word" name="word" value="${refri.r_item}"/>${refri.r_item}
			  	</c:if>
			  </c:forEach>
			  <br/>
			  </div>
			<div class="tab-pane" id="settings" role="tabpanel">
			  	<c:forEach items="${refri}" var="refri">
			  		<c:if test="${refri.type_id=='12'}">
			  			<input type="checkbox" class="word" id="word" name="word" value="${refri.r_item}"/>${refri.r_item}
			  		</c:if>
			  	</c:forEach>
			  	<br/>
			  </div>
			<div class="tab-pane" id="milk" role="tabpanel">
			  	<c:forEach items="${refri}" var="refri">
			  		<c:if test="${refri.type_id=='4'}">
			  			<input type="checkbox" class="word" id="word" name="word" value="${refri.r_item}"/>${refri.r_item}
			  		</c:if>
			  	</c:forEach>
			  	<br/>
			 </div>
			 <div class="tab-pane" id="sweet" role="tabpanel">
			  	<c:forEach items="${refri}" var="refri">
			  		<c:if test="${refri.type_id=='8'||refri.type_id=='1'}">
			  			<input type="checkbox" class="word" name="word" id="word" value="${refri.r_item}"/>${refri.r_item}
			  		</c:if>
			  	</c:forEach>
			  	<br/>
			 </div>
			<div class="text-center">  
			<input type="submit" value="검색" class="btn btn-default btn-fill btn-lg" />
		 	</div>
		 	</form>
		 	</div>
			</div>
		</br>
		</div>
       <div class="text-center"><input type="button" class="btn btn-success" id="changeBtn" onclick="changeRef()" value="냉장고에서 검색"></div>
   
    </header>
    
    <section class="portfolio" id="portfolio">
      <div class="container">
        <div class="table-title">
                <div class="row">
					<div class="col-sm-5">
						<h2>내 <b>냉장고</b></h2>
					</div>
					<div class="col-sm-5">
                        <div class="search-box">
							<div class="input-group">								
								<input type="text" id="search" class="form-control" placeholder="Search by Name">
							</div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="btn btn-danger add"><a href="/ref/selectRef.do"><span>추가</span></a></div>
                    </div>
                    
                </div>
            </div>
            <table class="table table-striped">
                <thead>
                    <tr>
                      
					    <th>쟤료명</th>
						<th>수량/용량</th>
						<th>구매일</th>
						<th>보관위치</th>
						<th>신선도</th>
						<th>보관일</th>				
                        <th>Actions</th>
                    </tr>
               </thead>
                <tbody>
                	<c:forEach var="refri" items="${refri}">
							<tr>
								
								<td>${refri.r_item }</td>
								<td>${refri.r_item_amount } ${refri.r_item_unit}</td>
								<td><fmt:formatDate value="${refri.r_date}" pattern="yyyy-MM-dd"/></td>
								<td>${refri.r_item_space}</td>
								<td>${refri.r_item_state}</td>
								<td>${refri.r_item_time}</td>
								<td>
								<a href="#deleteEmployeeModal${refri.r_num}" class="btn btn-danger" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="삭제">&#xE872;</i></a>
                            	<a href="#modifyEmployeeModal${refri.r_num}" class="btn btn-success" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="수정">settings</i></a>
                            	
                         	   	</td>
							</tr>
							
						<!-- Delete Modal HTML -->
					   <div id="deleteEmployeeModal${refri.r_num}" class="modal fade">
					      <div class="modal-dialog">
					         <div class="modal-content">
					            <form method="post" action="/myPage/deletePro2.do">
					               <div class="modal-header">                  
					                  <h4 class="modal-title">삭제</h4>
					                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					               </div>
					               <div class="modal-body">               
					                  <p>${refri.r_item }을 삭제하시겠습니까?</p>
					                  
		               			</div>
					               <div class="modal-footer">
					               		<input type="hidden" name="r_item" id="r_item" value="${refri.r_item}">
					               		<input type="hidden" name="num" id="num" value="${refri.r_num}">
					                  <input type="button" class="btn btn-default" data-dismiss="modal" value="취소">
					                  <input type="submit" class="btn btn-success" value="확인">
					               </div>
					          </form>
					         </div>
					      </div>
					   </div>
					   
					   <!-- Modify Modal HTML /// 수정필요 -->
					   <div id="modifyEmployeeModal${refri.r_num}" class="modal fade">
					      <div class="modal-dialog">
					         <div class="modal-content">
					            <form method="post" action="/myPage/editPro2.do">
					               <div class="modal-header">                  
					                  <h4 class="modal-title">${refri.r_item } 수정하기</h4>
					                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					               </div>
					               <div class="modal-body">               
					               <input type="hidden" id="r_num" name="r_num" value="${refri.r_num}">
					               <div>
					               	수량 :   <input type="number" id="r_item_amount" name="r_item_amount" value="${refri.r_item_amount}"> ${refri.r_item_unit}
      								</div>
      								<div>	
      								신선도 : <select id="r_item_state" value="${refri.r_item_state}" name="r_item_state">
							        		<option>신선</option>
							        		<option>보통</option>
							        		<option>위험</option>
							        	</select>
							        	</div>
							        	<div>
							               보관위치 :	<select id="r_item_space" value="${refri.r_item_space}" name="r_item_space">
								        		<option>냉장</option>
								        		<option>냉동</option>
								        		<option>상온</option>
								        	</select>
								        	</div>
								        	<div>
								       구매날짜 :  <input name="r_date" type="date" id="r_date" size="10" maxlength="10" value="<fmt:formatDate value="${refri.r_date}" pattern="yyyy-MM-dd"/>">  	
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
					  
					   		
					</c:forEach>
                </tbody>
            </table>   
        </div>
      </div>
    </section>

<hr size="10" >
    <!-- Contact Section -->
    <section  id="contact">
      <div class="container">
        <h2 class="text-center text-uppercase text-secondary mb-0">Contact Me</h2>
        <hr class="star-dark mb-5">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
            <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
            <form name="sentMessage" id="contactForm" novalidate="novalidate">
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>이름</label>
                  <input class="form-control" id="name" type="text" placeholder="이름" required="required" data-validation-required-message="Please enter your name.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>Email </label>
                  <input class="form-control" id="email" type="email" placeholder="Email" required="required" data-validation-required-message="Please enter your email address.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>전화 번호</label>
                  <input class="form-control" id="phone" type="tel" placeholder="전화번호" required="required" data-validation-required-message="Please enter your phone number.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>보낼 메세지</label>
                  <textarea class="form-control" id="message" rows="5" placeholder="메세지" required="required" data-validation-required-message="Please enter a message."></textarea>
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <br>
              <div id="success"></div>
              <div class="form-group text-center">
                <input type="button" class="btn btn-primary btn-xl" id="sendButton" value="보내기" onclick="sendBtn()"/>
              </div>
            </form>
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


   
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>


    <!-- Custom scripts for this template -->
    <script src="/resources/js/freelancer.min.js"></script>

  </body>

</html>