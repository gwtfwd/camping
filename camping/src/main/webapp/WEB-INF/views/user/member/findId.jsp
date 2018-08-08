<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>아이디 찾기</title>

	<!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
   	
   	<style type="text/css">
   	
   	.btnSearch{
   		font-size:16px; 
   		width:300px; 
   		background-color:#16a085; 
   		border-radius:40px; 
   		border:0px; 
   		padding:10px; 
   		color:#fff; 
   		margin-top:45px;
   	}
   	</style>
   	
   	<!-- mask -->
	<script>
		$(document).ready(function(){
			  $('#phone').mask('(000)-0000-0000', {placeholder: "(___)-____-____"});
		});
	</script>
   	

</head>
<body>

	<div class="fontH" style="background-image: linear-gradient(-60deg, #f4d03f 0%, #16a085 100%); color:#fff; padding:20px;">
		아이디 찾기
	</div>

 	<div class="container">
		<form method="post" id="formId" style="margin-top:30px;">
		
			<div>
				<label class="control-label fontH" for="name" style="margin-left:20px;">이름</label>
				<input type="text" class="form-control fontH" id="name" name="name" style="margin-left:20px; width:440px;" autocomplete="off" tabindex=1><br>
			
				<label class="control-label fontH" for="phone" style="margin-left:20px;">전화번호</label>
				<input type="text" class="form-control fontH" id="phone" name="phone" style="margin-left:20px; width:440px;" autocomplete="off" tabindex=2>
			</div>
			
			
			<div style="text-align:center;">
				<button type="submit" class="btnSearch">Search</button>
			</div>
		</form>
	</div> 

</body>
</html>