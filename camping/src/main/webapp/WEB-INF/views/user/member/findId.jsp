<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>아이디 찾기</title>

	<!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
   	
   	<style type="text/css">
	   	.btnFindId{
	   		font-size:16px; 
	   		width:300px; 
	   		background-color:#16a085; 
	   		border-radius:40px; 
	   		border:0px; 
	   		padding:10px; 
	   		color:#fff; 
	   		margin-top:35px;
	   	}
   	</style>
   	
   	<!-- mask -->
	<script>
		$(document).ready(function(){

			// mask
			$('#phone').mask('(000)-0000-0000', {
				placeholder : "(___)-____-____"
			});

			// id 찾기
			$('#formId').submit(function(){
				// id가 name인 객체를 name이라는 변수에 저장
				var name = $("#name");
				if(name.val() == ""){
					alert("이름을 입력하세요.");
					
					// return false 면 submit을 실행하지 않고 멈춤
					return false;
				}
				
				var phone = $("#phone");
				if(phone.val() == ""){
					alert("전화번호를 입력하세요.");
					return false;
				}
				return true;
			});
		});
	</script>
   	
</head>
<body>

	<div class="fontH" style="background-image: linear-gradient(-60deg, #f4d03f 0%, #16a085 100%); color:#fff; padding:20px;">
		아이디 찾기
	</div>

 	<div class="container">
		<form method="post" id="formId" action="/camping/member/login/findId" style="margin-top:30px;">
			<div>
				<label class="control-label fontH" for="name" style="margin-left:20px;">이름</label>
				<input type="text" class="form-control fontH" id="name" name="name" style="margin-left:20px; width:445px;" autocomplete="off" tabindex=1><br>
				<label class="control-label fontH" for="phone" style="margin-left:20px;">전화번호</label>
				<input type="text" class="form-control fontH" id="phone" name="phone" style="margin-left:20px; width:445px;" autocomplete="off" tabindex=2>
			</div>
			<div style="text-align:center;">
				<button type="submit" class="btnFindId">Search</button>
			</div>
			<div style="width:445px; margin-left:20px; border-top: 1px solid #ced4da;  margin-top:30px; font-size:85%" ><br>
                이름과 전화번호를 입력해주세요.
            </div>
		</form>
	</div> 

</body>
</html>