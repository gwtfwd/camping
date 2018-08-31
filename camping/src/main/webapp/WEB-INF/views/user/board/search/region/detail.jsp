<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
	
	<script src="//code.jquery.com/jquery.min.js"></script>
	<base href="http://localhost:8080/camping/">
	
	<!-- GoogoleMap Asynchronously Loading the API ********************************************* -->	
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8LO7-L-nP5Zbi9z1L5RC94e0bPw5AEpk&callback=initMap"></script>
	<script>
	
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

</head>
<body>
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
	
	<div class="container">	
		<br><br><br><br>
		<h4 class="fontH" style="text-align:center;"><b>${camp.camp_name}</b></h4> <br><br>
		
		<form method="post" id="formDetail">
			<div class="row" style="border-bottom:1px solid #C8CACC; border-top:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px; border-right:1px solid #C8CACC; text-align:center;">
					<label class="control-label" for="type">야영장타입</label>
				</div>
				<div class="col-md-4 fontH" style="border-right:1px solid #C8CACC;">
					<input type="text" class="form-control" id="type" name="type" style="background-color:white; border-width:0px;" value="${camp.camp_type}" readonly>
				</div>
				<div class="col-md-2 fontH" style="padding-top:7px; border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="max">1일최대수용인원수</label>
				</div>
				<div class="col-md-2 fontH">
					<input type="text" class="form-control" id="max" name="max" style="background-color:white; border-width:0px;" value="${camp.max_people}"readonly>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px; border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="camp_tel">전화번호</label>
				</div>
				<div class="col-md-4 fontH" style="border-right:1px solid #C8CACC;">
					<input type="text" class="form-control" id="camp_tel" name="camp_tel" style="background-color:white; border-width:0px;" value="${camp.camp_tel}" readonly>
				</div>
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="parking">주차장면수</label>
				</div>
				<div class="col-md-4 fontH">
					<input type="text" class="form-control" id="parking" name="parking" style="background-color:white; border-width:0px;" value="${camp.parking}"readonly>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="address_jibun">지번 주소</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="address_jibun" name="address_jibun" style="background-color:white; border-width:0px;" value="${camp.address_jibun}"readonly>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="address_road">도로명 주소</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="address_road" name="address_road" style="background-color:white; border-width:0px;" value="${camp.address_road}"readonly>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="convenient">편의시설</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="convenient" name="convenient" style="background-color:white; border-width:0px;" value="${camp.convenience}"readonly>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="">안전시설</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="" name="" style="background-color:white; border-width:0px;" value="${camp.safety}"readonly>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="">기타부대시설</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="" name="" style="background-color:white; border-width:0px;" value="${camp.etc}"readonly>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="">이용시간</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="" name="" style="background-color:white; border-width:0px;" value="${camp.time}"readonly>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="">이용요금</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="" name="" style="background-color:white; border-width:0px;" value="${camp.charge}"readonly>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="man_agency_name">관리기관명</label>
				</div>
				<div class="col-md-4 fontH" style="border-right:1px solid #C8CACC;">
					<input type="text" class="form-control" id="man_agency_name" name="man_agency_name" style="background-color:white; border-width:0px;" value="${camp.man_agency_name}" readonly>
				</div>
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="man_agency_tel">관리기관 전화번호</label>
				</div>
				<div class="col-md-4 fontH">
					<input type="text" class="form-control" id="man_agency_tel" name="man_agency_tel" style="background-color:white; border-width:0px;" value="${camp.man_agency_tel}" readonly>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC; padding-bottom:8px;"> 
				<div class="col-md-2"></div>
				<div class="col-md-8 fontH" style="text-align:right; padding-top:7px;">
					<input type="hidden" id="latitude" name="latitude" value="${camp.latitude }">
					<input type="hidden" id="longitude" name="longitude" value="${camp.longitude }">
					<div id="map" style="width: 100%; height: 400px"></div>
				</div>
				<div class="col-md-2"></div><br><br>
			</div>
		</form><br><br>
		
		<div style="text-align:center; margin-bottom:70px;">			
 			<a href="/camping/search/region/list"><button type="button" class="btn11 btn-primary11 fontH">뒤로가기</button></a>			
		</div>
	</div>
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>