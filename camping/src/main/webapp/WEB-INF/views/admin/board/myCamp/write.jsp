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
	<!-- <script src="http://maps.google.com/maps?file=api&v=2&hl=ko&key=AIzaSyA8LO7-L-nP5Zbi9z1L5RC94e0bPw5AEpk" type="text/javascript"></script>

	<script>
		function fnAdjust(){
			var latitude = document.googleMap.latitude.value;
			var longitude = document.googleMap.longitude.value;
			alert(latitude);
			alert(longitude);
		}
		    
		function load() {
		  if (GBrowserIsCompatible()) {
			  
			var map = new GMap2(document.getElementById("map"));
			map.addControl(new GOverviewMapControl());
			map.addControl(new GLargeMapControl());
			map.addControl(new GMapTypeControl());
			map.addControl(new GScaleControl());
			map.enableDoubleClickZoom();
			var center = new GLatLng(35.68205, 139.76789);
			map.setCenter(center, 15, G_HYBRID_MAP);
			geocoder = new GClientGeocoder();
			var marker = new GMarker(center, {draggable: true}); 
			map.addOverlay(marker);
			document.getElementById("lat").value = center.lat().toFixed(5);
			document.getElementById("lng").value = center.lng().toFixed(5);
		    
		  	GEvent.addListener(marker, "dragend", function() {
		  		var point = marker.getPoint();
		  		map.panTo(point);
		   		document.getElementById("lat").value = point.lat().toFixed(5);
		  		document.getElementById("lng").value = point.lng().toFixed(5);
		    
			});
		    
		 	GEvent.addListener(map, "moveend", function() {
		  		map.clearOverlays();
				var center = map.getCenter();
		  		var marker = new GMarker(center, {draggable: true});
		  		map.addOverlay(marker);
		  		document.getElementById("lat").value = center.lat().toFixed(5);
		   		document.getElementById("lng").value = center.lng().toFixed(5);
		    
		 		GEvent.addListener(marker, "dragend", function() {
		  			var point =marker.getPoint();
					map.panTo(point);
			  		document.getElementById("lat").value = point.lat().toFixed(5);
			 		document.getElementById("lng").value = point.lng().toFixed(5);
			    
				});
			});
		  }
		}
		    
	   function showAddress(address) {
		   
		   var map = new GMap2(document.getElementById("map"));
		   map.addControl(new GSmallMapControl());
		   map.addControl(new GMapTypeControl());
		   
		   if (geocoder) {
				geocoder.getLatLng(
		  			address,
		  			function(point) {
						if (!point) {
		 					alert(address + " not found");
						} else {
		  					document.getElementById("lat").value = point.lat().toFixed(5);
		   					document.getElementById("lng").value = point.lng().toFixed(5);
		 					map.clearOverlays()
							map.setCenter(point, 14);
		  					var marker = new GMarker(point, {draggable: true}); 
		 					map.addOverlay(marker);
		    
							GEvent.addListener(marker, "dragend", function() {
							  	var pt = marker.getPoint();
							 	map.panTo(pt);
							  	document.getElementById("lat").value = pt.lat().toFixed(5);
							 	document.getElementById("lng").value = pt.lng().toFixed(5);
							});
		    
							GEvent.addListener(map, "moveend", function() {
							  	map.clearOverlays();
								var center = map.getCenter();
							  	var marker = new GMarker(center, {draggable: true});
							  	map.addOverlay(marker);
							  	document.getElementById("lat").value = center.lat().toFixed(5);
							   	document.getElementById("lng").value = center.lng().toFixed(5);
							    
							 	GEvent.addListener(marker, "dragend", function() {
							 		var pt = marker.getPoint();
									map.panTo(pt);
									document.getElementById("lat").value = pt.lat().toFixed(5);
							   		document.getElementById("lng").value = pt.lng().toFixed(5);
								});
							});
						}
		  			}
				);
		  	}
		}
    </script> -->
	
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
		<h4 class="fontH" style="text-align:center;">야영장 등록</h4> <br><br>
		<form method="post" action="/camping/mycamp/write">
			<div class="row" style="border-top:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px; border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="camp_name">야영장명</label>
				</div>
				<div class="col-md-9 fontH">
					<input type="text" class="form-control" id="camp_name" name="camp_name" autocomplete="off" style="background-color:white; border-width:0px;">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC; border-top:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px; border-right:1px solid #C8CACC; text-align:center;">
					<label class="control-label" for="camp_type">야영장 타입</label>
				</div>
				<div class="col-md-4 fontH" style="border-right:1px solid #C8CACC;padding:1px;">
					<select class="form-control11 fontH" id="camp_type" name="camp_type" style="width:300px;">
						<option value="">Select Type</option>
						<option value="야영장">야영장</option>
						<option value="야영장,자동차야영장">야영장,자동차야영장</option>
						<option value="자동차야영장">자동차야영장</option>
					</select>
				</div>
				<div class="col-md-2 fontH" style="padding-top:7px; border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="max_people">1일최대수용인원수</label>
				</div>
				<div class="col-md-4 fontH">
					<input type="text" class="form-control" id="max_people" name="max_people" placeholder="숫자만 입력해주세요." style="background-color:white; border-width:0px;"autocomplete="off">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px; border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="camp_tel">야영장 전화번호</label>
				</div>
				<div class="col-md-4 fontH" style="border-right:1px solid #C8CACC;">
					<input type="text" class="form-control" id="camp_tel" name="camp_tel" style="background-color:white; border-width:0px;" autocomplete="off">
				</div>
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="parking">주차장면수</label>
				</div>
				<div class="col-md-4 fontH">
					<input type="text" class="form-control" id="parking" name="parking" style="background-color:white; border-width:0px;" placeholder="숫자만 입력해주세요." autocomplete="off">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px; border-right:1px solid #C8CACC; text-align:center;">
					<label class="control-label" for="region_code">지역</label>
				</div>
				<div class="col-md-9 fontH" style="padding:1px;">
					<select class="form-control11 fontH" id="region_code" name="region_code" style="width:300px;">
						<option value="">Select Region</option>
						<option value="R001">서울</option>
						<option value="R002">인천</option>
						<option value="R003">경기도</option>
						<option value="R004">강원도</option>
						<option value="R007">충청북도</option>
						<option value="R005">충청남도</option>
						<option value="R006">대전</option>
						<option value="R008">세종</option>
						<option value="R009">경상북도</option>
						<option value="R014">경상남도</option>
						<option value="R010">대구</option>
						<option value="R016">부산</option>
						<option value="R015">울산</option>
						<option value="R011">전라북도</option>
						<option value="R013">전라남도</option>
						<option value="R012">광주</option>
						<option value="R017">제주도</option>
					</select>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="address_jibun">지번 주소</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="address_jibun" name="address_jibun" style="background-color:white; border-width:0px;" autocomplete="off">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="address_road">도로명 주소</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="address_road" name="address_road" style="background-color:white; border-width:0px;" autocomplete="off">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="latitude">위도</label>
				</div>
				<div class="col-md-4 fontH" style="border-right:1px solid #C8CACC;">
					<input type="text" class="form-control" id="latitude" name="latitude" style="background-color:white; border-width:0px;" placeholder="숫자만 입력해주세요."autocomplete="off">
				</div>
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="longitude">경도</label>
				</div>
				<div class="col-md-4 fontH">
					<input type="text" class="form-control" id="longitude" name="longitude" style="background-color:white; border-width:0px;" placeholder="숫자만 입력해주세요."autocomplete="off">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="area">부지면적</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="area" name="area" style="background-color:white; border-width:0px;" placeholder="숫자만 입력해주세요."autocomplete="off">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="convenience">편의시설</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="convenience" name="convenience" style="background-color:white; border-width:0px;" autocomplete="off">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="safety">안전시설</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="safety" name="safety" style="background-color:white; border-width:0px;" autocomplete="off">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="etc">기타부대시설</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="etc" name="etc" style="background-color:white; border-width:0px;" autocomplete="off">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="time">이용시간</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="time" name="time" style="background-color:white; border-width:0px;" autocomplete="off">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="charge">이용요금</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="charge" name="charge" style="background-color:white; border-width:0px;" autocomplete="off">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="man_agency_name">관리기관명</label>
				</div>
				<div class="col-md-4 fontH" style="border-right:1px solid #C8CACC;">
					<input type="text" class="form-control" id="man_agency_name" name="man_agency_name" style="background-color:white; border-width:0px;" autocomplete="off">
				</div>
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="man_agency_tel">관리기관 전화번호</label>
				</div>
				<div class="col-md-4 fontH">
					<input type="text" class="form-control" id="man_agency_tel" name="man_agency_tel" style="background-color:white; border-width:0px;" autocomplete="off">
				</div>
			</div>
	
	
	
	
			
			<br><br>
			<div style="text-align:center; ">			
       			<button type="submit" class="btn11 btn-primary11 fontH" style="margin-left:10px">완료</button>
				<a href="/camping/mycamp/list" >
				  	<button class="btn11 btn-primary11 fontH">취소</button>
			 	</a>	
			</div>
		</form>	
	</div>
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>