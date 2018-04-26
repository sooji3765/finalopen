<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/resources/css/alarm_table.css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <style type="text/css">
    body{padding-top:30px;}

.glyphicon {  margin-bottom: 10px;margin-right: 10px;}

small {
display: block;
line-height: 1.428571429;
color: #999;
}
    </style>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function checkRef(){
		window.name ="parantForm";
		window.open("/myPage/modify.do", "chkForm","width=500 , height=300, resizable =no, scrollbars =no");
	}
</script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="well well-sm">
                <div class="row">
                    <div class="col-sm-6 col-md-4">
                    	<c:if test="${user.m_profile=='undefined'}">
                        	<img src="/resources/img/profile.png" alt="" class="img-rounded img-responsive" />
                        </c:if>
                        <c:if test="${user.m_profile!='undefined'}">
                        	<img src="${user.m_profile}" style="max-width: 100%; height: auto;" class="img-rounded img-responsive" />
                        </c:if>
                    </div>
                    <div class="col-sm-6 col-md-8">
                        </br>
                        <h4>${user.m_nickname }</h4>
                        <small><cite title="San Francisco, USA">Seoul, Korea <i class="glyphicon glyphicon-map-marker">
                        </i></cite></small>
                        <p>
                            <i class="glyphicon glyphicon-envelope"></i>ID : ${user.m_id}
                            <br/>
                            <i class="glyphicon glyphicon-globe"></i>냉장고 ID : R${user.m_ref }
                            <br/>
                            <i class="glyphicon glyphicon-gift"></i>마지막 로그인 : <fmt:formatDate value="${user.m_regdate}" pattern="yyyy-MM-dd"/></p>
                        	<input class="btn btn-success btn-lg" type="button" value="냉장고 변경" onclick="checkRef()">
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</div>
	

</body>
</html>