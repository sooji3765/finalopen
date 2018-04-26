<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	// 냉장고 아이디 체크
	 $(document).ready(function(){
        $('#checkbtn').click(function(){
            $.ajax({
                url: '/myPage/refCheck.do',
                data: {id :$.trim($('#id').val())},
                success: function(data){
                    if($.trim(data) == 0){
                        $('#msg').html('<p style="color:red">사용불가능</p>');
                        $('#useBtn').hide();
                    }
                    else{
                        $('#msg').html('<p style="color:blue">사용가능</p>');
                        $('#useBtn').show();
                    }
                }
            });        
        });        
    });

	$(document).ready(function(){
		$('#useBtn').click(function(){
			$.ajax({
				type :'POST',
				url :'/myPage/modifyPro.do',
				data: {id:$.trim($('#id').val())},
				success: function(){
					 alert('변경완료');
					 window.location.reload();
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
	<div class="modal-header">
		<h2>냉장고 변경하기</h2>
	</div>
	<div class="modal-content">
		<div class="modal-body">
		냉장고 ID : <input type="text" id="id"/> <input type="button" class="btn" value="검색" id="checkbtn"/>
		<div id="msg"></div>
		</div>
		<div class="modal-footer">
			<input id="cancelBtn" type="button" value="닫기" class="btn btn-danger" onclick="window.close()"/>
			<input id="useBtn" type="button" style="display: none" value="변경" class="btn btn-success" />
		</div>
	</div>
</div>

</div>
</body>