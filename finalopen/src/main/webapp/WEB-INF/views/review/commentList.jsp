<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<script type="text/javascript">
	function deleteComment(cno){
		var bool = confirm("삭제하시겠습니까?");
    	if(bool){
	    	$.ajax({
	    		url :'/review/commentdelete.do',
	    		type:'POST',
	    		data :{cno : cno}, //리뷰 번호
	    		success : function(){ // 성공시
	    				alert("삭제완료");
	    				location.reload();
	            }
	    	});
    	}
	}
	
	function modifyComment(cno){
		var content = prompt("수정 하시겠습니까?"," ");
    	if(content!=null){
	    	$.ajax({
	    		url :'/review/commentModify.do',
	    		type:'POST',
	    		data :{cno : cno,
	    				content : content	
	    		}, //리뷰 번호
	    		success : function(){ // 성공시
	    				alert("수정완료");
	    				location.reload();
	            }
	    	});
    	}
	}
	
	
</script>	
</head>
<body>

<c:forEach items="${comment}" var="comment">
	<table cellpadding="3" cellspacing="5" >
	<tr>
		<td rowspan="2" width="50"  align="center"><i class="material-icons md-60">face</i></td>
		<td width="100" align="left"><h6> ${comment.nickname}</h6></td>
		<td width="100" align="left"><h6><fmt:formatDate value="${comment.regdate}" pattern="yyyy-MM-dd"/></h6></td>
		<c:if test="${comment.writer==id}">
		<td width="200"> <a href="#" onclick="deleteComment('${comment.cno}')" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="삭제">delete</i></a>
			<a href="#" onclick="modifyComment('${comment.cno}')" class="modify" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="수정">build</i></a>
		</td>
		</c:if>
	</tr>
	<tr>
		<td width="600" colspan="3">${comment.content}</td>
	<tr>

</table>
<hr>
</c:forEach>

</body>
</html>