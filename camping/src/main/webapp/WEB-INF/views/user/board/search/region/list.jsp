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
	
	<base href="http://localhost:8080/camping/">
	
	<script>
		function showType(){
			$('#regionForm').submit();
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
   	
 	<div class="container">	
		<br><br><br><br>
		<h4 class="fontH" style="text-align:center;">지역별 야영장 찾기</h4>
		
		<div class="row" style="margin-top:100px;"> 
			<div class="fontH" id="map">
				<a href="search/region/list?area=서울" id="map-seoul">서울</a>
				<a href="search/region/list?area=인천" id="map-incheon">인천</a>
				<a href="search/region/list?area=경기도" id="map-gyeonggi">경기도</a>
				<a href="search/region/list?area=강원도" id="map-gangwon">강원도</a>
				<a href="search/region/list?area=충청남도" id="map-chungnam">충청남도</a>
				<a href="search/region/list?area=대전" id="map-daejeon">대전</a>
				<a href="search/region/list?area=세종" id="map-sejong">세종</a>
				<a href="search/region/list?area=충청북도" id="map-chungbuk">충청북도</a>
				<a href="search/region/list?area=경상북도" id="map-gyeongbuk">경상북도</a>
				<a href="search/region/list?area=대구" id="map-daegu">대구</a>
				<a href="search/region/list?area=경상남도" id="map-gyeongnam">경상남도</a>
				<a href="search/region/list?area=울산" id="map-ulsan">울산</a>
				<a href="search/region/list?area=부산" id="map-busan">부산</a>
				<a href="search/region/list?area=전라북도" id="map-jeonbuk">전라북도</a>
				<a href="search/region/list?area=전라남도" id="map-jeonnam">전라남도</a>
				<a href="search/region/list?area=광주" id="map-gwangju">광주</a>
				<a href="search/region/list?area=제주도" id="map-jeju">제주도</a>
			</div>
			
			<div class="fontH" id="map-list" style="margin-bottom:50px;">
			
				<div style="border-bottom:1px solid #C8CACC;">
					<c:if test="${areaSelect and !typeSelect}">
						<br><h6 style="margin-left:5px; margin-top:-10px; margin-bottom:13px;">&nbsp;<b>${area}</b> (${totalCount})</h6>
					</c:if>
					<c:if test="${areaSelect and typeSelect}">
							<br><h6 style="margin-left:5px; margin-top:-10px; margin-bottom:13px;">&nbsp;<b>${area} ${type}</b> (${totalCount})</h6>
					</c:if> 
					<c:if test="${!areaSelect}">
	 					<br><h6 style="margin-left:5px; margin-top:-10px; margin-bottom:13px;">&nbsp;지역을 선택해주세요</h6>
					</c:if>
				</div>
				<div style="padding:10px;">
					<c:if test="${area=='경기도'}">
							<form id="regionForm" method="post">
								<select class="form-control11 fontH" name="type" onchange="showType(this.value)" style="width:300px;">
									<option value="">Select Region</option>
									<option value="가평군">가평군</option>
									<option value="과천시">과천시</option>
									<option value="광명시">광명시</option>
									<option value="광주시">광주시</option>
									<option value="구리시">구리시</option>
									<option value="군포시">군포시</option>
									<option value="김포시">김포시</option>
									<option value="남양주시">남양주시</option>
									<option value="동두천시">동두천시</option>
									<option value="부천시">부천시</option>
									<option value="성남시">성남시</option>
									<option value="시흥시">시흥시</option>
									<option value="안산시">안산시</option>
									<option value="양주시">양주시</option>
									<option value="여주시">여주시</option>
									<option value="연천군">연천군</option>
									<option value="오산시">오산시</option>
									<option value="용인시">용인시</option>
									<option value="의왕시">의왕시</option>
									<option value="의정부시">의정부시</option>
									<option value="이천시">이천시</option>
									<option value="파주시">파주시</option>
									<option value="평택시">평택시</option>
									<option value="포천시">포천시</option>
									<option value="화성시">화성시</option>
								</select>
							</form>
						</c:if>
						<c:if test="${area=='강원도'}">
							<form id="regionForm" method="post">
								<select class="form-control11 fontH" name="type" onchange="showType(this.value)" style="width:300px;">
									<option value="">Select Region</option>
									<option value="강릉시">강릉시</option>
									<option value="강원도고성군">고성군</option>
									<option value="동해시">동해시</option>
									<option value="삼척시">삼척시</option>
									<option value="양구군">양구군</option>
									<option value="양양군">양양군</option>
									<option value="원주시">원주시</option>
									<option value="인제군">인제군</option>
									<option value="정선군">정선군</option>
									<option value="춘천시">춘천시</option>
									<option value="홍천군">홍천군</option>
									<option value="화천군">화천군</option>
									<option value="횡성군">횡성군</option>
								</select>
							</form>
						</c:if>
						<c:if test="${area=='충청남도'}">
							<form id="regionForm" method="post">
								<select class="form-control11 fontH" name="type" onchange="showType(this.value)" style="width:300px;">
									<option value="">Select Region</option>
									<option value="공주시">공주시</option>
									<option value="논산시">논산시</option>
									<option value="부여군">부여군</option>
									<option value="서천군">서천군</option>
									<option value="아산시">아산시</option>
									<option value="천안시">천안시</option>
									<option value="청양군">청양군</option>
								</select>
							</form>
						</c:if>
						<c:if test="${area=='충청북도'}">
							<form id="regionForm" method="post">
								<select class="form-control11 fontH" name="type" onchange="showType(this.value)" style="width:300px;">
									<option value="">Select Region</option>
									<option value="괴산군">괴산군</option>
									<option value="단양군">단양군</option>
									<option value="영동군">영동군</option>
									<option value="옥천군">옥천군</option>
									<option value="음성군">음성군</option>
									<option value="제천시">제천시</option>
									<option value="증평군">증평군</option>
									<option value="진천군">진천군</option>
									<option value="청주시">청주시</option>
									<option value="충주시">충주시</option>
								</select>
							</form>
						</c:if>
						<c:if test="${area=='전라북도'}">
							<form id="regionForm" method="post">
								<select class="form-control11 fontH" name="type" onchange="showType(this.value)" style="width:300px;">
									<option value="">Select Region</option>
									<option value="군산시">군산시</option>
									<option value="남원시">남원시</option>
									<option value="순창군">순창군</option>
									<option value="완주군">완주군</option>
									<option value="익산시">익산시</option>
									<option value="임실군">임실군</option>
									<option value="전주시">전주시</option>
									<option value="정읍시">정읍시</option>
								</select>
							</form>
						</c:if>
						<c:if test="${area=='전라남도'}">
							<form id="regionForm" method="post">
								<select class="form-control11 fontH" name="type" onchange="showType(this.value)" style="width:300px;">
									<option value="">Select Region</option>
									<option value="곡성군">곡성군</option>
									<option value="광양시">광양시</option>
									<option value="구례군">구례군</option>
									<option value="무안군">무안군</option>
									<option value="보성시">보성시</option>
									<option value="신안군">신안군</option>
									<option value="여수시">여수시</option>
									<option value="영광군">영광군</option>
									<option value="영암군">영암군</option>
									<option value="장성군">장성군</option>
									<option value="함평군">함평군</option>
									<option value="화순군">화순군</option>
								</select>
							</form>
						</c:if>
						<c:if test="${area=='경상북도'}">
							<form id="regionForm" method="post">
								<select class="form-control11 fontH" name="type" onchange="showType(this.value)" style="width:300px;">
									<option value="">Select Region</option>
									<option value="경주시">경주시</option>
									<option value="구미시">구미시</option>
									<option value="김천시">김천시</option>
									<option value="문경시">문경시</option>
									<option value="봉화군">봉화군</option>
									<option value="상주시">상주시</option>
									<option value="성주군">성주군</option>
									<option value="영덕군">영덕군</option>
									<option value="영양군">영양군</option>
									<option value="영주시">영주시</option>
									<option value="영천시">영천시</option>
									<option value="예천군">예천군</option>
									<option value="울진군">울진군</option>
									<option value="청도군">청도군</option>
									<option value="청송군">청송군</option>
									<option value="칠곡군">칠곡군</option>
									<option value="포항시">포항시</option>
								</select>
							</form>
						</c:if>
						<c:if test="${area=='경상남도'}">
							<form id="regionForm" method="post">
								<select class="form-control11 fontH" name="type" onchange="showType(this.value)" style="width:300px;">
									<option value="">Select Region</option>
									<option value="거제시">거제시</option>
									<option value="거창군">거창군</option>
									<option value="경상남도고성군">고성군</option>
									<option value="김해시">김해시</option>
									<option value="남해군">남해군</option>
									<option value="밀양시">밀양시</option>
									<option value="사천시">사천시</option>
									<option value="산청군">산청군</option>
									<option value="양산시">양산시</option>
									<option value="의령군">의령군</option>
									<option value="진주시">진주시</option>
									<option value="창원시">창원시</option>
									<option value="통영시">통영시</option>
									<option value="하동군">하동군</option>
									<option value="함안군">함안군</option>
									<option value="함양군">함양군</option>
									<option value="합천군">합천군</option>
								</select>
							</form>
						</c:if>
						<c:if test="${area=='제주도'}">
							<form id="regionForm" method="post">
								<select class="form-control11 fontH" name="type" onchange="showType(this.value)" style="width:300px;">
									<option value="">Select Region</option>
									<option value="서귀포시">서귀포시</option>
									<option value="제주시">제주시</option>
								</select>
							</form>
						</c:if>
				</div>
				
				<!-- 리스트 -->
				<div class="ex3">
					<div class="fontH" style="margin-left:10px;">
						
						<c:forEach items="${list}" var="camp">
							<a href="/camping/search/region/detail?no=${camp.no}" style="color:black;"> - ${camp.camp_name}</a><br>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>