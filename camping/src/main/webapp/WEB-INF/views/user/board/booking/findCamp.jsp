<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>야영장 찾기</title>

	<!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
   	
   	<style type="text/css">
	   	.btnFindCamp{
	   		font-size:16px; 
	   		width:250px; 
	   		background-color:#16a085; 
	   		border-radius:40px; 
	   		border:0px; 
	   		padding:10px; 
	   		color:#fff; 
	   		margin-top:50px;
	   	}
   	</style>
   	
	<script>
		$(document).ready(function(){

			$('#search').focus();
			
			// 야영장찾기
			$('#formId').submit(function(){
				// id가 camp_name인 객체를 name이라는 변수에 저장
				var name = $("#camp_name");
				if(name.val() == ""){
					alert("야영장명을 입력하세요.");
					
					// return false 면 submit을 실행하지 않고 멈춤
					return false;
				}
				return true;
			});
		});
	</script>
   	
</head>
<body>

	<div class="fontH" style="background-image: linear-gradient(-60deg, #f4d03f 0%, #16a085 100%); color:#fff; padding:20px;">
		야영장 찾기
	</div>

 	<div class="container">
		<form id="formId" action="/camping/booking/findCampName" style="margin-top:70px;">
			<div>
				<label class="control-label fontH" for="search" style="margin-left:20px;">야영장명</label>
				<input type="text" class="form-control fontH" id="search" name="search" style="margin-left:20px; width:470px;" autocomplete="off" ><br>
			</div>
			<div style="text-align:center;">
				<button type="submit" class="btnFindCamp">Search</button>
			</div>
			<div style="width:470px; margin-left:20px; border-top: 1px solid #ced4da; margin-top:105px; font-size:85%" ><br>
                야영장명을 입력해주세요.
            </div>
		</form>
	</div> 

</body>
</html>