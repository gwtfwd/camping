<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

	<!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
   	
	<link href="<c:url value ='/resources/css/list.css'/>" rel="stylesheet">
	
	
	<base href="http://localhost:8080">
	
	
	<style type="text/css">
	
	.btn-primary11 {
	  background-color: #1b1e24;
	  border-color: #1b1e24;
	  color:white;
	}
	
	.btn11 {
	  font-size: 12px;
	  padding: 4px 15px;
	  line-height: 20px;
	  font-weight: 400;
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
   	
   	
   	
	<div class="container" style="height:950px">	
		<br><br><br><br>
		<h4 class="fontH" style="text-align:center;">지역별 야영장 찾기</h4>
		
		<div class="row" style="margin-top:100px;"> 
		
			<div class="fontH" id="map">
			
				<a href="/camping/search/region/list?area=서울" id="map-seoul">서울</a>
				<a href="/camping/search/region/list?area=인천" id="map-incheon">인천</a>
				<a href="/camping/search/region/list?area=경기도" id="map-gyeonggi">경기도</a>
				<a href="/camping/search/region/list?area=강원도" id="map-gangwon">강원도</a>
				<a href="/camping/search/region/list?area=충청남도" id="map-chungnam">충청남도</a>
				<a href="/camping/search/region/list?area=대전" id="map-daejeon">대전</a>
				<a href="/camping/search/region/list?area=세종" id="map-sejong">세종</a>
				<a href="/camping/search/region/list?area=충청북도" id="map-chungbuk">충청북도</a>
				<a href="/camping/search/region/list?area=경상북도" id="map-gyeongbuk">경상북도</a>
				<a href="/camping/search/region/list?area=대구" id="map-daegu">대구</a>
				<a href="/camping/search/region/list?area=경상남도" id="map-gyeongnam">경상남도</a>
				<a href="/camping/search/region/list?area=울산" id="map-ulsan">울산</a>
				<a href="/camping/search/region/list?area=부산" id="map-busan">부산</a>
				<a href="/camping/search/region/list?area=전라북도" id="map-jeonbuk">전라북도</a>
				<a href="/camping/search/region/list?area=전라남도" id="map-jeonnam">전라남도</a>
				<a href="/camping/search/region/list?area=광주" id="map-gwangju">광주</a>
				<a href="/camping/search/region/list?area=제주도" id="map-jeju">제주도</a>
			
			</div>

			
			<div class="fontH" id="map-list">
			
				<br><h6>&nbsp;지역을 선택해주세요</h6><hr>
				
				<!-- 리스트 -->
				<div class="ex3">
				
				</div>
				
			</div>
		</div>
	</div>
	 
	
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>