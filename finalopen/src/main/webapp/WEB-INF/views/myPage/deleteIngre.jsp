<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$('#itemdel').click(function(){
		$.ajax({
            type: 'POST',
            url: '/myPage/deletePro.do',
            data: {num : $('#num').val()},
            success: function(){
            	alert('삭제 완료');
            	opener.parent.location.reload();
            	window.close();
            }
        }); 
	});
});

</script>
</head>
<body>
<div class="container">
		<div class="modal-dialog">

			<div class="modal-content">
			<div class="modal-body">
			<div class="text-center"><h3>${item} 삭제하기</h3></div>
			<input type="hidden" id="num" value="${num}">
			<div class="modal-footer text-center">
				<input type="button" class="btn btn-default" value="닫기" onclick="opener.parent.location.reload(); window.close()">
				<input type="button" value="삭제" class="btn btn-danger" id="itemdel">
			</div>
			</div>
			</div>
		</div>
</div>
</body>
</html>