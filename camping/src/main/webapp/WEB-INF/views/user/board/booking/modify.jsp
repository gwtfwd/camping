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
	
	<script src="//code.jquery.com/jquery.min.js"></script>
	<base href="http://localhost:8080/camping/">
	<!-- GoogoleMap Asynchronously Loading the API ********************************************* -->	
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8LO7-L-nP5Zbi9z1L5RC94e0bPw5AEpk&callback=initMap"></script>
	<style type="text/css">
		.container{
	      min-height:850px;
	      margin-bottom:50px;
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
		  padding: 0px 15px;
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
	
	<script>
	
		$(document).ready(function(){
			  
			  $('#delete').click(function() {
			       var str = document.getElementById('formDetail');
			       str.submit();
			       
			       if (confirm("정말 삭제하시겠습니까?") == true){    //확인
			    	    document.form.submit();
			    	}else{   //취소
			    	    return false;
			    	}
			    });
		});

		function needLogin(x) {
	      window.location.href = "/camping/member/needLogin"
	    }
		
		function initMap() {
	    	  
	    	var latitude = ${camp.latitude};
		   	var longitude = ${camp.longitude};
		   	
		 	// id: map, body에 있는 div태그의 id와 같아야 함
	        var map = new google.maps.Map(document.getElementById('map'), {
	          zoom: 17,										// 지도 zoom단계
	          center: {lat: latitude, lng: longitude}		// 지도에서 가운데로 위치할 위도와 경도
	        });
			
	        var marker;
	        marker = new google.maps.Marker({
	          map: map,
	          draggable: false,
	          animation: google.maps.Animation.DROP,
	          position: {lat: latitude, lng: longitude}		// 마커가 위치할 위도와 경도
	        });
	        marker.addListener('click', toggleBounce);
	      }

	      function toggleBounce() {
	        if (marker.getAnimation() !== null) {
	          marker.setAnimation(null);
	        } else {
	          marker.setAnimation(google.maps.Animation.BOUNCE);
	        }
	      }
	</script>

</head>
<body>
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
	
	<div class="container" >	
		<br><br><br><br>
		<h6 style="text-align:center; font-family:Segoe Print;">예약상세확인</h6><br>
		<h4 class="fontH" style="text-align:center;">${booking.camp_name}</h4> <br><br><br>
		
		<form method="post" id="formDetail">
		
			<input type="hidden" id="camp_no" name="camp_no" value="${booking.camp_no}">
		
			<div class="row" style="border-bottom:1px solid #C8CACC; border-top:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="user_name">예약자명</label>
				</div>
				<div class="col-md-7 fontH" style="border-right:1px solid #C8CACC;">
					<input type="text" class="form-control" id="user_name" name="user_name" style="background-color:white; border-width:0px;" value="${booking.user_name}" readonly>
				</div>
				<div class="col-md-1 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="registered_at">작성일시</label>
				</div>
				<div class="col-md-2 fontH">
					<input type="text" class="form-control" id="registered_at" name="registered_at" style="background-color:white; border-width:0px;" value="<fmt:formatDate value="${booking.registered_at}" pattern="yyyy-MM-dd" />" readonly>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;"> 
					<label class="control-label" for="booking_at">예약일시</label>
				</div>
				<div class="col-md-7 fontH">
					<input type="text" class="datepicker-here form-control" id="booking_at" name="booking_at" data-timepicker="true" autocomplete="off" data-range="true" data-multiple-dates-separator=" - " data-language="en" style="background-color:white; padding-top:7px;border-width:0px;" value="${booking.booking_at}">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC; margin-bottom:100px;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="people">인원수</label>
				</div>
				<div class="col-md-9 fontH">
					<input type="text" class="form-control" id="people" name="people" style="background-color:white; border-width:0px;" value="${booking.people}">
				</div>
			</div>
			
			<div style="text-align:center;">	
				<a href="/camping/booking/detail?no=${booking.no}"> 
		       		<button type="button" class="btn11 btn-primary11 fontH">취소</button>
		        </a>		
				<a href="/camping/booking/modify"> 
		       		<button type="submit" class="btn11 btn-primary11 fontH" style="margin-left:10px">완료</button>
		        </a>	
			</div><br><br>
		</form>
		
	</div>
		
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>