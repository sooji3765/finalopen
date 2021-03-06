<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
	
	<script type="text/javascript">
	
	$(document).ready(function(){
		$('#modifyBtn').click(function(){
			$.ajax({
	            type: 'POST',
	            url: '/myPage/editPro.do',
	            data: {
	            	r_num : $('#r_num').val(),
	            	r_item_amount : $('#r_item_amount').val(),
	            	r_item_space : $('#r_item_space').val(),
	            	r_item_time : $('#r_item_time').val(),
	            	r_item_state :$('#r_item_state').val()
	            },
	            success: alert('변경 완료')
	        }); 
		});
	});
	
	$(function() {
		$("#r_item_time").datepicker({
			showOn: "both",
			dateFormat :"yy-mm-dd",
			buttonImage: "/resources/img/calendar.png",
            buttonImageOnly: true,
            defaultDate : "${refri.r_date}"
            
		});
	});
	
	</script>

</head>
<body>
<div class="container">
	<div class="text-center">
	<div class="modal-dialog">
	<div class="modal-content">
	<div class="modal-body">
	<input type="hidden" id="r_num" name="r_num" value="${refri.r_num}">
	<table class="table">
    <thead>
      <tr>
        <th>재료명</th>
        <th>${refri.r_item}</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>수량</td>
        <td><input type="number" id="r_item_amount" name="r_item_amount" value="${refri.r_item_amount}"> ${refri.r_item_unit}</td> 
      </tr>
      <tr>
      	<td>신선도</td>
      	<td>
      		<select id="r_item_state" value="${refri.r_item_state}" name="r_item_state">
        		<option>신선</option>
        		<option>보통</option>
        		<option>위험</option>
        	</select>
      	</td>
      </tr>
      <tr>
        <td>보관위치</td>
        <td>
        	<select id="r_item_space" value="${refri.r_item_space}" name="r_item_space">
        		<option>냉장</option>
        		<option>냉동</option>
        		<option>상온</option>
        	</select>
        </td>
      </tr>
      <tr>
      	<td>구매날짜</td>
      	<td>	
      	<input name="r_item_time" type="text" id="r_item_time" size="10" maxlength="10" value="${refri.r_date}">
      	</td>
      </tr>
    </tbody>
  </table>
  </div>
  	<div class="modal-footer">
  <input type="button" class="btn btn-danger" value="취소" onclick="window.close()">
  <input type="button" class="btn btn-success" value="변경" onclick="opener.parent.location.reload(); window.close()" id="modifyBtn" >
 	</div>
  </div>
  </div>
	</div>
</div>
</body>
</html>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               