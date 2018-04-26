<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">	
<link href="/resources/css/alarm_table.css" rel="stylesheet">
<script type="text/javascript">
$(document).ready(function(){
	// Activate tooltips
	$('[data-toggle="tooltip"]').tooltip();
    
	// Filter table rows based on searched term
    $("#search").on("keyup", function() {
        var term = $(this).val().toLowerCase();
        	$("table tbody tr").each(function(){
            	$row = $(this);
            	var name = $row.find("td:nth-child(2)").text().toLowerCase();
            	console.log(name);
            	if(name.search(term) < 0){                
                	$row.hide();
            	} else{
                	$row.show();
            	}
        	});
    	});
	});
	
	function deleteBtn(num,item){
		
		window.name="parantForm"
		window.open("/myPage/deleteIngre.do?r_num="+num+"&r_item="+item,"deleteform","width=500 , height=300, resizable =no, scrollbars =no");
	}
	
	function editBtn(r_num){
		window.name="parantForm"
		window.open("/myPage/editIngre.do?r_num="+r_num,"editform","width=500 , height=300, resizable =no, scrollbars =no");
	}


</script>    
</head>
<body>
<div class="container">
        <div class="table-wrapper">			
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
                        <div class="btn btn-danger add"><a href="/ref/selectRef.do"><i class="material-icons">add</i><span>Add</span></a></div>
                    </div>
                    
                </div>
            </div>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>#</th>
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
                	<c:forEach var="refri" items="${refrige}">
							<tr>
								<td>${refri.r_num}</td>
								<td>${refri.r_item }</td>
								<td>${refri.r_item_amount } ${refri.r_item_unit}</td>
								<td><fmt:formatDate value="${refri.r_date}" pattern="yyyy-MM-dd"/></td>
								<td>${refri.r_item_space}</td>
								<td>${refri.r_item_state}</td>
								<td>${refri.r_item_time}</td>
								<td>
                            	<input class ="btn btn-primary" type="button" value="Edit" onclick="editBtn('${refri.r_num}')">
                            	<input class ="btn btn-danger" type="button" value="Delete" onclick="deleteBtn('${refri.r_num}','${refri.r_item }')">
                         	   	</td>
							</tr>		
					</c:forEach>
                </tbody>
            </table>   
        </div>
    </div>
    
 
</body>
</html>
