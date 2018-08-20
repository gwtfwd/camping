<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
	
	<!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
   	
   	<!-- datepicker -->
   	<link href="<c:url value='/resources/css/datepicker.css'/>" rel="stylesheet">
	<script src="<c:url value='/resources/vendor/jquery/datepicker.js'/>"></script>
	
	<base href="http://localhost:8080/camping/">
	
	<script>
		// mask
		$(document).ready(function(){
			  $('#user_phone').mask('(000)-0000-0000', {placeholder: "(___)-____-____"});	
			  $('#coming_time').mask('00:00', {placeholder: "__:__  (ex 14:00)"});	
		});
		
		// 야영장찾기
		function openfindCamp(){  
		    window.open("/camping/booking/findCamp",'_blank','toolbar=no,location=no,status=no, menubar=no, scrollbars=auto, width=520, height=500, top=100, left=100');  
		} 
		</script>
	
	<style type="text/css">
		.container{
	      min-height:850px;
	   	}
	   	.container::-webkit-scrollbar { 
	       display: none; 
	   	}
	   	.btn-primary11 {
		  background-color: #1b1e24;
		  border-color: #1b1e24;
		}
		.btn11 {
		  font-size: 15px;
		  padding: 4px 15px;
		  line-height: 20px;
		  font-weight: 400;
		  color:white; 
		  width:100px; 
		  height:30px;
		  text-align:center;
		  -moz-border-radius: 0px;
		  -webkit-border-radius: 0px;
		  border-radius: 0px;
		  -webkit-transition: all 200ms ease;
		  -moz-transition: all 200ms ease;
		  -ms-transition: all 200ms ease;
		  -o-transition: all 200ms ease;
		  transition: all 200ms ease;
		}
	</style>
	
</head>
<body>
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
	
	<div class="container" >	
		<br><br><br><br>
		<h4 class="fontH" style="text-align:center;">실시간 예약하기</h4>
		
		<form method="post" id="fromId" style="border:0px solid #C8CACC; margin-top:100px;">
			
			<div class="row" >
				<div class="col-md-3 fontH">
					<label style="float:right; padding-top:7px;" for="camp_name">야영장명</label>				
				</div>
				<div class="col-md-6 fontH">
					<input type="text" class="form-control fontH" id="camp_name" name="camp_name" onClick="javascript:openfindCamp();" value="${campName}" placeholder="검색해서 찾기" tabindex=1>
					<input type="hidden" value="${campNo}">
				</div>
				<div class="col-md-1"></div>
			</div>
			<div class="row" style="margin-top:7px;">
				<div class="col-md-3 fontH">
					<label style="float:right; padding-top:7px;" for="user_name">예약자명</label>				
				</div>
				<div class="col-md-6 fontH">
					<input type="text" class="form-control fontH" id="user_name" name="user_name" autocomplete="off" value="${user.name}" style="background-color:#fff;" readonly>
				</div>
				<div class="col-md-1"></div>
			</div>
			<div class="row" style="margin-top:7px;">
				<div class="col-md-3 fontH">
					<label style="float:right; padding-top:7px;" for="user_phone">휴대전화</label>				
				</div>
				<div class="col-md-6 fontH">
					<input type="text" class="form-control fontH" id="user_phone" name="user_phone" autocomplete="off" tabindex=2>
				</div>
				<div class="col-md-1"></div>
			</div>
			<div class="row" style="margin-top:7px;">
				<div class="col-md-3 fontH">
					<label style="float:right; padding-top:7px;" for="booking_at">예약날짜/시간</label>				
				</div>
				<div class="col-md-6 fontH" >
					<input type="text" class="datepicker-here form-control fontH" id="booking_at" name="booking_at" data-timepicker="true" autocomplete="off" data-range="true" data-multiple-dates-separator=" - " data-language="en" tabindex=3/>
				</div>
			</div>
			<div class="row" style="margin-top:7px;">
				<div class="col-md-3 fontH">
					<label style="float:right; padding-top:7px;" for="people">인원수</label>				
				</div>
				<div class="col-md-6 fontH">
					<input type="text" class="form-control fontH" id="people" name="people" autocomplete="off" placeholder="숫자만 입력해주세요." tabindex=4>
				</div>
				<div class="col-md-1"></div>
			</div>
			
			<div style="text-align:center; margin-top: 100px;">			
				<a href="/camping" >
				  	<button class="btn11 btn-primary11 fontH">취소</button>
			 	</a>
			 	<a href="/camping/booking/write" >
	       			<button type="submit" class="btn11 btn-primary11 fontH" style="margin-left:10px">예약</button>
	       		</a>
			</div>
			
		</form>		
	</div>
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>