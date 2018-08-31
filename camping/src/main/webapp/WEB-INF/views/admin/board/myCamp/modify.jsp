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
	      margin-bottom:70px;
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
	
	<div class="container">	
		<br><br><br><br>
		<h4 class="fontH" style="text-align:center;"><b>${camp.camp_name}</b></h4> <br><br>
		
		<form method="post" id="formDetail">
			<div class="row" style="border-bottom:1px solid #C8CACC; border-top:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px; border-right:1px solid #C8CACC; text-align:center;">
					<label class="control-label" for="camp_name">야영장명</label>
				</div>
				<div class="col-md-9 fontH">
					<input type="text" class="form-control" id="camp_name" name="camp_name" value="${camp.camp_name }" style="background-color:white; border-width:0px;" >
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px; border-right:1px solid #C8CACC; text-align:center;">
					<label class="control-label" for="type">야영장타입</label>
				</div>
				<div class="col-md-4 fontH" style="border-right:1px solid #C8CACC;">
					<input type="text" class="form-control" id="type" name="type" style="background-color:white; border-width:0px;" >
				</div>
				<div class="col-md-2 fontH" style="padding-top:7px; border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="max">1일최대수용인원수</label>
				</div>
				<div class="col-md-4 fontH">
					<input type="text" class="form-control" id="max" name="max" style="background-color:white; border-width:0px;" >
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px; border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="camp_tel">전화번호</label>
				</div>
				<div class="col-md-4 fontH" style="border-right:1px solid #C8CACC;">
					<input type="text" class="form-control" id="camp_tel" name="camp_tel" style="background-color:white; border-width:0px;" value="${camp.camp_tel}">
				</div>
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="parking">주차장면수</label>
				</div>
				<div class="col-md-4 fontH">
					<input type="text" class="form-control" id="parking" name="parking" style="background-color:white; border-width:0px;" >
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="address_jibun">지번 주소</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="address_jibun" name="address_jibun" style="background-color:white; border-width:0px;" value="${camp.address_jibun}">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="address_road">도로명 주소</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="address_road" name="address_road" style="background-color:white; border-width:0px;" value="${camp.address_road}">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="convenient">편의시설</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="convenient" name="convenient" style="background-color:white; border-width:0px;">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="">안전시설</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="" name="" style="background-color:white; border-width:0px;" >
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="">기타부대시설</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="" name="" style="background-color:white; border-width:0px;">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="">이용시간</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="" name="" style="background-color:white; border-width:0px;">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="">이용요금</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="" name="" style="background-color:white; border-width:0px;">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="man_agency_name">관리기관명</label>
				</div>
				<div class="col-md-4 fontH" style="border-right:1px solid #C8CACC;">
					<input type="text" class="form-control" id="man_agency_name" name="man_agency_name" style="background-color:white; border-width:0px;" value="${camp.man_agency_name}">
				</div>
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="man_agency_tel">관리기관 전화번호</label>
				</div>
				<div class="col-md-4 fontH">
					<input type="text" class="form-control" id="man_agency_tel" name="man_agency_tel" style="background-color:white; border-width:0px;" value="${camp.man_agency_tel}">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="latitude">위도</label>
				</div>
				<div class="col-md-4 fontH" style="border-right:1px solid #C8CACC;">
					<input type="text" class="form-control" id="latitude" name="latitude" style="background-color:white; border-width:0px;" value="${camp.latitude }">
				</div>
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="longitude">경도</label>
				</div>
				<div class="col-md-4 fontH">
					<input type="text" class="form-control" id="longitude" name="longitude" style="background-color:white; border-width:0px;" value="${camp.longitude }">
				</div>
			</div><br><br>
			
			
			<div style="text-align:center;">	
				<a href="/camping/mycamp/list"> 
		       		<button type="button" class="btn11 btn-primary11 fontH">취소</button>
		        </a>		
				<a href="/camping/mycamp/modify"> 
		       		<button type="submit" class="btn11 btn-primary11 fontH" style="margin-left:10px">완료</button>
		        </a>	
			</div>
		</form>
		
		
	</div>
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>