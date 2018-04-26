<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% request.setCharacterEncoding("UTF-8");%>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow">

    <title>냉장고 재료 선택</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <style type="text/css">
    
/*  ppit tab */
div.ppit-tab-container{
  z-index: 10;
  background-color: #ffffff;
  padding: 0 !important;
  border-radius: 4px;
  -moz-border-radius: 4px;
  border:1px solid #ddd;
  margin-top: 20px;
  margin-left: 50px;
  -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
  box-shadow: 0 6px 12px rgba(0,0,0,.175);
  -moz-box-shadow: 0 6px 12px rgba(0,0,0,.175);
  background-clip: padding-box;
  opacity: 0.97;
  filter: alpha(opacity=97);
}
div.ppit-tab-menu{
  padding-right: 0;
  padding-left: 0;
  padding-bottom: 0;
}
div.ppit-tab-menu div.list-group{
  margin-bottom: 0;
}
div.ppit-tab-menu div.list-group>a{
  margin-bottom: 0;
}
div.ppit-tab-menu div.list-group>a .glyphicon,
div.ppit-tab-menu div.list-group>a .fa {
  color: #8d6cab;
}
div.ppit-tab-menu div.list-group>a:first-child{
  border-top-right-radius: 0;
  -moz-border-top-right-radius: 0;
}
div.ppit-tab-menu div.list-group>a:last-child{
  border-bottom-right-radius: 0;
  -moz-border-bottom-right-radius: 0;
}
div.ppit-tab-menu div.list-group>a.active,
div.ppit-tab-menu div.list-group>a.active .glyphicon,
div.ppit-tab-menu div.list-group>a.active .fa{
  background-color: #8d6cab;
  background-image: #8d6cab;
  color: #ffffff;
}
div.ppit-tab-menu div.list-group>a.active:after{
  content: '';
  position: absolute;
  left: 100%;
  top: 50%;
  margin-top: -13px;
  border-left: 0;
  border-bottom: 13px solid transparent;
  border-top: 13px solid transparent;
  border-left: 10px solid #8d6cab;
}

div.ppit-tab-content{
  background-color: #ffffff;
  /* border: 1px solid #eeeeee; */
  padding-left: 20px;
  padding-top: 10px;
}

div.ppit-tab div.ppit-tab-content:not(.active){
  display: none;
}
    </style>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        var defaultCSS = document.getElementById('bootstrap-css');
        function changeCSS(css){
            if(css) $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="'+ css +'" type="text/css" />'); 
            else $('head > link').filter(':first').replaceWith(defaultCSS); 
        }
        
        $( document ).ready(function() {
           $(".check").click(function(){
        	   if($(".check").is(":checked")==true){
	        	   ch = this.value; // 클릭한곳의 이름
	        	   item = $("#"+ch).val();
	        	   if(item == ch){
	        		   alert("이미 냉장고에 선택된 재료입니다");
	        		   this.checked=false;
	        	   }
        	   }
           });
          });
    </script> 


</head>
<body>
	<div class="container">
    <div class="row">
        <div class="col-lg-12 col-md-5 col-sm-8 col-xs-9 ppit-tab-container">
            <div class="col-lg-2 col-md-3 col-sm-3 col-xs-3 ppit-tab-menu">
              <div class="list-group">
              <a href="#" class="list-group-item active text-center">
                  <img src="/resources/image/pepper.png" style="width:20; height:20"> 양념류
                </a>
                <a href="#" class="list-group-item text-center">
                  <img src="/resources/image/2.png" style="width:20; height:20"> 곡류
                </a>
                <a href="#" class="list-group-item text-center" onclick="gotoDiv('account-summary-holder')">
          		   <img src="/resources/image/3.png" style="width:20; height:20"> 빵류
                </a>
                <a href="#" class="list-group-item text-center" onclick="gotoDiv('usage-holder')">
                  <img src="/resources/image/4.png" style="width:20; height:20"> 유제품/치즈류
                </a>
                <a href="#" class="list-group-item text-center" onclick="gotoDiv('payment-holder')">
                	<img src="/resources/image/5.png" style="width:20; height:20"> 면
                </a>
                <a href="#" class="list-group-item text-center" onclick="gotoDiv('search-holder')">
                  	<img src="/resources/image/6.png" style="width:20; height:20"> 감자/고구마
                </a>
                <a href="#" class="list-group-item text-center">
                  	<img src="/resources/image/7.png" style="width:20; height:20"> 햄/소시지
                </a>
                 <a href="#" class="list-group-item text-center">
                 	<img src="/resources/image/8.png" style="width:20; height:20"> 초콜렛/사탕
                </a>
                 <a href="#" class="list-group-item text-center">
                  	<img src="/resources/image/9.png" style="width:20; height:20"> 콩/견과류
                </a>
                <a href="#" class="list-group-item text-center">
                  	<img src="/resources/image/10.png" style="width:20; height:20"> 채소류
                </a>
                <a href="#" class="list-group-item text-center">
                  	<img src="/resources/image/11.png" style="width:20; height:20"> 버섯류
                </a>
                <a href="#" class="list-group-item text-center">
                  	<img src="/resources/image/12.png" style="width:20; height:20"> 과일류
                </a>
                <a href="#" class="list-group-item text-center">
                  	<img src="/resources/image/13.png" style="width:20; height:20"> 고기류
                </a>
                <a href="#" class="list-group-item text-center">
                  	<img src="/resources/image/14.png" style="width:20; height:20"> 어패류
                </a>
                <a href="#" class="list-group-item text-center">
                  	<img src="/resources/image/15.png" style="width:20; height:20"> 해초류
                </a>
                <a href="#" class="list-group-item text-center">
                  	<img src="/resources/image/16.png" style="width:20; height:20"> 계란류
                </a>
                
              </div>
            </div>
            <form id="ingreInput" name="ingreInput" method="post" action="/ref/result.do">
            <div class="col-lg-10 col-md-9 col-sm-9 col-xs-9 ppit-tab">
                <div class="ppit-tab-content active">
                    <center>
                      <p>
                      	<div>
								<table width="880">
								<tr><h3>양념류</h3></tr>
								<c:forEach items="${ings1}" var="ings1" varStatus="status">
									<c:if test="${status.count%8==1}">
										<tr width="880">
									</c:if>
									<td width="110" align="center">
										<label for="${ings1.ingredients_title}1">
									 		<img src="/resources/image/1.png"/> <br/>
									 		<input type="checkbox"  class="check" id="${ings1.ingredients_title}1" name="ingre" value="${ings1.ingredients_title}"/><br/>
											${ings1.ingredients_title}
										</label>
									</td>
									<c:if test="${status.count%8==0}">
										<tr/>
									</c:if>
								</c:forEach>
								</tr>
								</table>
								
							</div>
                      </p>
                    </center>
                </div>
                
                <div class="ppit-tab-content">
                    <center>
                      <p>
                        <div>
								<table width="910">
								<tr><h3>곡류</h3></tr>
								<c:forEach items="${ings2}" var="ings2" varStatus="status">
									<c:if test="${status.count%7==1}">
										<tr width="910">
									</c:if>
									<td width="130" align="center">
									<label for="${ings2.ingredients_title}1">
									 	<img src="/resources/image/2.png" style="width:32; height:32"/> <br/>
									 	<input type="checkbox" class="check" id="${ings2.ingredients_title}1" name="ingre" value="${ings2.ingredients_title}"/><br/>
										${ings2.ingredients_title}
									</label>
									</td>
									<c:if test="${status.count%7==0}">
										<tr/>
									</c:if>
								</c:forEach>
								</tr>
								</table>
								
							</div>
                      </p>
                    </center>
                </div>
    
                <div class="ppit-tab-content">
                    <center>
                      <p>
                          <div>
								<table width="880">
								<tr><h3>빵류</h3></tr>
								<c:forEach items="${ings3}" var="ings3" varStatus="status">
									<c:if test="${status.count%8==1}">
										<tr width="880">
									</c:if>
									<td width="110" align="center">
									 <label for="${ings3.ingredients_title}1">
									 	<img src="/resources/image/3.png" style="width:32; height:32"/> <br/>
									 	<input type="checkbox" class="check" id="${ings3.ingredients_title}1" name="ingre" value="${ings3.ingredients_title}"/><br/>
										${ings3.ingredients_title}
									</label>
									</td>
									<c:if test="${status.count%8==0}">
										<tr/>
									</c:if>
								</c:forEach>
								</tr>
								</table>
								
							</div>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                  		<div>
								<table width="880">
								<tr><h3>유제품/치즈류</h3></tr>
								<c:forEach items="${ings4}" var="ings4" varStatus="status">
									<c:if test="${status.count%8==1}">
										<tr width="880">
									</c:if>
									<td width="110" align="center">
									  <label for="${ings4.ingredients_title}1">
									 	<img src="/resources/image/4.png" style="width:32; height:32"/> <br/>
									 	<input type="checkbox" class="check" id="${ings4.ingredients_title}1" name="ingre" value="${ings4.ingredients_title}"/><br/>
										${ings4.ingredients_title}
									</label>
									</td>
									<c:if test="${status.count%8==0}">
										<tr/>
									</c:if>
								</c:forEach>
								</tr>
								</table>
								
							</div>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                          <div>
								<table width="910">
								<tr><h3>면</h3></tr>
								<c:forEach items="${ings5}" var="ings5" varStatus="status">
									<c:if test="${status.count%7==1}">
										<tr width="910">
									</c:if>
									<td width="130" align="center">
									  <label for="${ings5.ingredients_title}1">
									 	<img src="/resources/image/5.png" style="width:32; height:32"/> <br/>
									 	<input type="checkbox" class="check" id="${ings5.ingredients_title}1" name="ingre" value="${ings5.ingredients_title}"/><br/>
										${ings5.ingredients_title}
									</label>
									</td>
									<c:if test="${status.count%7==0}">
										<tr/>
									</c:if>
								</c:forEach>
								</tr>
								</table>
								
							</div>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                          <div>
								<table width="880">
								<tr><h3>감자/고구마</h3></tr>
								<c:forEach items="${ings6}" var="ings6" varStatus="status">
									<c:if test="${status.count%8==1}">
										<tr width="880">
									</c:if>
									<td width="110" align="center">
									  <label for="${ings6.ingredients_title}1">
									 	<img src="/resources/image/6.png" style="width:32; height:32"/> <br/>
									 	<input type="checkbox" class="check" id="${ings6.ingredients_title}1" name="ingre" value="${ings6.ingredients_title}"/><br/>
										${ings6.ingredients_title}
									</label>
									</td>
									<c:if test="${status.count%8==0}">
										<tr/>
									</c:if>
								</c:forEach>
								</tr>
								</table>
								
							</div>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                        <div>
								<table width="880">
								<tr><h3>햄/소시지</h3></tr>
								<c:forEach items="${ings7}" var="ings7" varStatus="status">
									<c:if test="${status.count%8==1}">
										<tr width="880">
									</c:if>
									<td width="110" align="center">
									  <label for="${ings7.ingredients_title}1">
									 	<img src="/resources/image/7.png" style="width:32; height:32"/> <br/>
									 	<input type="checkbox" class="check" id="${ings7.ingredients_title}1" name="ingre" value="${ings7.ingredients_title}"/><br/>
										${ings7.ingredients_title}
									</label>
									</td>
									<c:if test="${status.count%8==0}">
										<tr/>
									</c:if>
								</c:forEach>
								</tr>
								</table>
								
							</div>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                         <div>
								<table width="880">
								<tr><h3>초콜렛/사탕</h3></tr>
								<c:forEach items="${ings8}" var="ings8" varStatus="status">
									<c:if test="${status.count%8==1}">
										<tr width="880">
									</c:if>
									<td width="110" align="center">
									  <label for="${ings8.ingredients_title}1">
									 	<img src="/resources/image/8.png" style="width:32; height:32"/> <br/>
									 	<input type="checkbox" class="check" id="${ings8.ingredients_title}1" name="ingre" value="${ings8.ingredients_title}"/><br/>
										${ings8.ingredients_title}
									</label>
									</td>
									<c:if test="${status.count%8==0}">
										<tr/>
									</c:if>
								</c:forEach>
								</tr>
								</table>
								
							</div>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                         <div>
								<table width="880">
								<tr><h3>콩/견과류</h3></tr>
								<c:forEach items="${ings9}" var="ings9" varStatus="status">
									<c:if test="${status.count%8==1}">
										<tr width="880">
									</c:if>
									<td width="110" align="center">
									  <label for="${ings9.ingredients_title}1">
									 	<img src="/resources/image/9.png" style="width:32; height:32"/> <br/>
									 	<input type="checkbox" class="check" id="${ings9.ingredients_title}1" name="ingre" value="${ings9.ingredients_title}"/><br/>
										${ings9.ingredients_title}
									</label>
									</td>
									<c:if test="${status.count%8==0}">
										<tr/>
									</c:if>
								</c:forEach>
								</tr>
								</table>
								
							</div>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                         <div>
								<table width="880">
								<tr><h3>채소류</h3></tr>
								<c:forEach items="${ings10}" var="ings10" varStatus="status">
									<c:if test="${status.count%8==1}">
										<tr width="880">
									</c:if>
									<td width="110" align="center">
									  <label for="${ings10.ingredients_title}1">
									 	<img src="/resources/image/10.png" style="width:32; height:32"/> <br/>
									 	<input type="checkbox" class="check" id="${ings10.ingredients_title}1" name="ingre" value="${ings10.ingredients_title}"/><br/>
										${ings10.ingredients_title}
									</label>
									</td>
									<c:if test="${status.count%8==0}">
										<tr/>
									</c:if>
								</c:forEach>
								</tr>
								</table>
								
							</div>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                         <div>
								<table width="880">
								<tr><h3>버섯류</h3></tr>
								<c:forEach items="${ings11}" var="ings11" varStatus="status">
									<c:if test="${status.count%8==1}">
										<tr width="880">
									</c:if>
									<td width="110" align="center">
									  <label for="${ings11.ingredients_title}1">
									 	<img src="/resources/image/11.png" style="width:32; height:32"/> <br/>
									 	<input type="checkbox" class="check" id="${ings11.ingredients_title}1" name="ingre" value="${ings11.ingredients_title}"/><br/>
										${ings11.ingredients_title}
									</label>
									</td>
									<c:if test="${status.count%8==0}">
										<tr/>
									</c:if>
								</c:forEach>
								</tr>
								</table>
								
							</div>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                         <div>
								<table width="880">
								<tr><h3>과일류</h3></tr>
								<c:forEach items="${ings12}" var="ings12" varStatus="status">
									<c:if test="${status.count%8==1}">
										<tr width="880">
									</c:if>
									<td width="110" align="center">
									  <label for="${ings12.ingredients_title}1">
									 	<img src="/resources/image/12.png" style="width:32; height:32"/> <br/>
									 	<input type="checkbox" class="check" id="${ings12.ingredients_title}1" name="ingre" value="${ings12.ingredients_title}"/><br/>
										${ings12.ingredients_title}
									</label>
									</td>
									<c:if test="${status.count%8==0}">
										<tr/>
									</c:if>
								</c:forEach>
								</tr>
								</table>
								
							</div>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                         <div>
								<table width="880">
								<tr><h3>고기류</h3></tr>
								<c:forEach items="${ings13}" var="ings13" varStatus="status">
									<c:if test="${status.count%8==1}">
										<tr width="880">
									</c:if>
									<td width="110" align="center">
									  <label for="${ings13.ingredients_title}1">
									 	<img src="/resources/image/13.png" style="width:32; height:32"/> <br/>
									 	<input type="checkbox" class="check" id="${ings13.ingredients_title}1" name="ingre" value="${ings13.ingredients_title}"/><br/>
										${ings13.ingredients_title}
									</label>
									</td>
									<c:if test="${status.count%8==0}">
										<tr/>
									</c:if>
								</c:forEach>
								</tr>
								</table>
								
							</div>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                        <div>
								<table width="880">
								<tr><h3>어패류</h3></tr>
								<c:forEach items="${ings14}" var="ings14" varStatus="status">
									<c:if test="${status.count%8==1}">
										<tr width="880">
									</c:if>
									<td width="110" align="center">
									  <label for="${ings14.ingredients_title}1">
									 	<img src="/resources/image/14.png" style="width:32; height:32"/> <br/>
									 	<input type="checkbox" class="check" id="${ings14.ingredients_title}1" name="ingre" value="${ings14.ingredients_title}"/><br/>
										${ings14.ingredients_title}
									</label>
									</td>
									<c:if test="${status.count%8==0}">
										<tr/>
									</c:if>
								</c:forEach>
								</tr>
								</table>
								
							</div>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                         <div>
								<table width="880">
								<tr><h3>해초류</h3></tr>
								<c:forEach items="${ings15}" var="ings15" varStatus="status">
									<c:if test="${status.count%8==1}">
										<tr width="880">
									</c:if>
									<td width="110" align="center">
									  <label for="${ings15.ingredients_title}1">
									 	<img src="/resources/image/15.png" style="width:32; height:32"/> <br/>
									 	<input type="checkbox" class="check" id="${ings15.ingredients_title}1" name="ingre" value="${ings15.ingredients_title}"/><br/>
										${ings15.ingredients_title}
									</label>
									</td>
									<c:if test="${status.count%8==0}">
										<tr/>
									</c:if>
								</c:forEach>
								</tr>
								</table>
								
							</div>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                         <div>
								<table width="880">
								<tr><h3>계란류</h3></tr>
								<c:forEach items="${ings16}" var="ings16" varStatus="status">
									<c:if test="${status.count%8==1}">
										<tr width="880">
									</c:if>
									<td width="110" align="center">
									  <label for="${ings16.ingredients_title}1">
									 	<img src="/resources/image/16.png" style="width:32; height:32"/> <br/>
									 	<input type="checkbox" class="check" id="${ings16.ingredients_title}1" name="ingre" value="${ings16.ingredients_title}"/><br/>
										${ings16.ingredients_title}
									</label>
									</td>
									<c:if test="${status.count%8==0}">
										<tr/>
									</c:if>
								</c:forEach>
								</tr>
								</table>
								
							</div>
                      </p>
                    </center>
                </div>
            </div>
            <span style="float:right"><input type="submit" class="btn btn-primary btn-lg" value="냉장고에 저장" id="submit"/>
            <input type="button" class="btn btn-dafaul btn-lg" value="돌아가기" onclick="location='/main.do'"/></span>
            </form>
		
        </div>
        <div>
        	 <table class="table table-striped">
                <thead>
                    <tr>
                        <th>#</th>
					    <th>재료명</th>
						<th>수량/용량</th>
						<th>구매일</th>
						<th>보관위치</th>
						<th>신선도</th>
						<th>유통기한</th>				
                  
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="refri" items="${refri}">
							<tr>
								<td>${refri.r_num }</td>
								<td>
									<input type="hidden" id="${refri.r_item}" value="${refri.r_item }" />
									${refri.r_item }
								</td>
								<td>${refri.r_item_amount } ${refri.r_item_unit}</td>
								<td><fmt:formatDate value="${refri.r_date }" pattern="yyyy-MM-dd"/></td>
								<td>${refri.r_item_space}</td>
								<td>${refri.r_item_state}</td>
								<td>${refri.r_item_time}</td>
								
							</tr>
					</c:forEach>
                </tbody>
            </table>     
        </div>
  </div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
	    $("div.ppit-tab-menu>div.list-group>a").click(function(e) {
	        e.preventDefault();
	        $(this).siblings('a.active').removeClass("active");
	        $(this).addClass("active");
	        var index = $(this).index();
	        $("div.ppit-tab>div.ppit-tab-content").removeClass("active");
	        $("div.ppit-tab>div.ppit-tab-content").eq(index).addClass("active");
	    });
	});
	</script>	
</body>
</html>
