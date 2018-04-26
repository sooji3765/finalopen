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

   <link rel="stylesheet" href="/resources/css/alarm_table.css">
   <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
   <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
   <%
   String[] ingre = request.getParameterValues("ingre");
   %>

   <script type="text/javascript">
   
   $(document).ready(function(){
      if($('#ingre').val()==null){
         history.go(-1);
      }
   });

   function remove_this()
   {
      //ajax 를 이용해서 DATABASE 에서 idx 해당하는 내용을 지우도록 요청한다.

      if (! confirm("삭제하시겠습니까?")) return;

      // 이 부분은 seobangnim.com 의 소스를 완전참조했습니다.
      // http://seobangnim.com/zbxe/?document_srl=15893

      var lo_this       = window.event.srcElement; // 이벤트가 발생한 객체가져 옴 여기선 버튼 이겠지?
      var lo_table      = lo_this.parentNode.parentNode.parentNode  //버튼으로 부터 위로 4번째 객체는 테이블이지 
      var li_row_index  = lo_this.parentNode.parentNode.rowIndex; // 버튼으로 부터 위로 2번째니깐 TR 이겠지 그 TR 의 INDEX 값
      lo_table.deleteRow(li_row_index); // 위에서 찾은 인덱스에 해당하는 TR 을 삭제하라...
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
          </ul>
        </div>
      </div>
    </nav>

   
    <!-- Portfolio Grid Section -->
    <section class="portfolio" id="portfolio">
          <div class="container">
          </br>
          </br>
           <h2 class="text-center text-uppercase text-secondary mb-0">선택한 재료 목록 </h2>
           <hr class="star-dark mb-5">
          <form id="ingreInsert" method="post" action="/ref/insertIngre.do">
            <table name="list_ingre" class="table table-striped">
            <c:forEach items="${ingre}" var="ingre" varStatus="status">
               <tr>
                  <td>${ingre}
                     <input type="hidden" id="ingre" name="ingre" value="${ingre}"/>
                  </td>
                  <td><input type="number" id="r_item_amount" name="r_item_amount"/>
                     <select id="r_item_unit" name="r_item_unit">
                        <option>개</option>
                        <option>g</option>
                        <option>kg</option>
                        <option>mL</option>
                        <option>L</option>
                     </select>      
                  </td>
                  <td>보관 위치
                     <select id = "r_item_space" name = "r_item_space">
                        <option>냉장</option>
                        <option>냉동</option>
                        <option>상온</option>
                     </select>
                  </td>
                  <td>
                     <input type=button value="삭제" class ="btn btn-danger" onclick="remove_this();">
                  </td>
                  
               </tr>
               
               
            </c:forEach>
            </table>
               <div class="text-right">
               <input type="submit" class ="btn btn-success" value="내 냉장고에 저장"/>
               </div>
            </form>
     
   </div>
    </section>
    
    <!-- Footer -->
    <footer class="footer text-center">
      <div class="container">
        <div class="row">
          <div class="col-md-4 mb-5 mb-lg-0">
            <h4 class="text-uppercase mb-4">Location</h4>
            <p class="lead mb-0">2215 John Daniel Drive
              <br>Clark, MO 65243</p>
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