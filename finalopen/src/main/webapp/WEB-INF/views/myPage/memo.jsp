<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메모장</title>
<script type="text/javascript">
	function checkInput(){
		var input = $('#content').val();
		
		if(input==null){
			alert('내용을 입력해 주세요');
		}
	}
</script>
</head>
<body>
</br>
<h3>냉장고 패밀리 사용자 수 : ${count} 명</h3>
<hr size="10">
<div class="container">
 <div class="row">
	<c:forEach var="user" items="${user}">  
	        
	          <div class="col-md-6 col-lg-4">
	           
	              <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
	                <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
	                </div>
	              </div>
	              <img class="img-fluid" width="200" height="200" src="${user.m_profile}" alt="">
	              <div class="text-center">
	              <h3>${user.m_nickname}</h3>
	              </div>

	          </div>
	         
		</c:forEach>
</div>
</div>
</br>
<hr size="20">
<div class="container">
<h3>냉장고 패밀리 메모장</h3>

<div>
<form id="MemoInsertForm" action="/myPage/memoInsert.do" onsubmit="checkInput()" method="post">
        <div class="input-group input-group-lg">
              <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요."/>     
              <input type="submit" class="btn btn-primary btn-lg" value="등록" />
         </div>
</form>
</div>

<div class="container">
<c:forEach var="memo" items="${memo}">
	<table cellpadding="3" cellspacing="5" >
	<tr>
		<td rowspan="2" width="50"  align="center"><img src="${memo.profile}" width="80" height="80"></td>
		<td width="100" align="left"><h4> ${memo.nickname}</h4></td>
		<td width="100" align="left"><h6><fmt:formatDate value="${memo.regdate}" pattern="yyyy-MM-dd"/></h6></td>
		
	</tr>
	<tr>
		<td width="600" colspan="3">${memo.content}</td>
	<tr>

</table>
<hr>
</c:forEach>
</div>
</div>
</body>
</html>