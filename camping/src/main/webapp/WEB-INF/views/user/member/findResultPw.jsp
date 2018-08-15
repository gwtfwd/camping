<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>비밀번호 찾기</title>
	
	<!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
   	
   	<style type="text/css">
   	.btnSearch{
   		font-size:16px; 
   		width:200px; 
   		background-color:#16a085; 
   		border-radius:40px; 
   		border:0px; 
   		padding:10px; 
   		color:#fff; 
   		margin-top:100px;
   	}
   	</style>
   	
   	<!-- mask -->
	<script>
		$(document).ready(function(){
			  $('#phone').mask('(000)-0000-0000', {placeholder: "(___)-____-____"});
		});
		
		function closefind(){  
		    window.close();  
		}
	</script>
   	
</head>
<body>
	<div class="fontH" style="background-image: linear-gradient(-60deg, #f4d03f 0%, #16a085 100%); color:#fff; padding:20px;">
		비밀번호 찾기
	</div>

 	<div class="container">
		<c:if test="${resultNum == 0}">
			<div class="fontH" style="text-align:center; margin-top:100px;">
				${email}로 임시비밀번호를 전송하였습니다.
			</div>
			<div style="text-align:center;">
				<a href="#" onClick="javascript:closefind();"><button type="button" class="btnSearch">닫기</button></a>
			</div>
		</c:if>
		
		<c:if test="${resultNum == 1}">
			<div class="fontH" style="text-align:center; margin-top:100px;">
				입력하신 정보는 잘못된 정보입니다.
			</div>
			<div style="text-align:center;">
				<a href="/camping/member/login/findPw"><button type="button" class="btnSearch">뒤로가기</button></a>
			</div>
		</c:if>
	</div> 

</body>
</html>