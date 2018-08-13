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
			
				<br><h6>&nbsp;<b>${area}</b>의 야영장 목록입니다 (${totalCount})</h6><hr>
<!-- 				<br><h6>&nbsp;지역을 선택해주세요</h6><hr> -->
				
				<!-- 리스트 -->
				<div class="ex3">
				
					<!-- <div class="row" > 
						<label class="control-label fontH" style="font-size:23px;"><span id="regionCnt"></span> Comments</label>
					</div><br> -->
					<div class="fontH" style="margin-left:10px;">
						<c:forEach items="${list}" var="camp">
							<a href="/camping/search/type/detail?no=${camp.no}" style="color:black;">${camp.camp_name}</a><br>
						</c:forEach>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	
	
	<!-- <div class="container" style="height:950px">	
		<br><br><br><br>
		<h4 class="fontH" style="text-align:center;">지역별 야영장 찾기</h4>
		
		<div class="row" style="margin-top:100px;"> 
		
			<div class="fontH" id="map">
			
				<a href="#" id="map-seoul">서울</a>
				<a href="#" id="map-incheon">인천</a>
				<a href="#" id="map-gyeonggi">경기도</a>
				<a href="#" id="map-gangwon">강원도</a>
				<a href="#" id="map-chungnam">충청남도</a>
				<a href="#" id="map-daejeon">대전</a>
				<a href="#" id="map-sejong">세종</a>
				<a href="#" id="map-chungbuk">충청북도</a>
				<a href="#" id="map-gyeongbuk">경상북도</a>
				<a href="#" id="map-daegu">대구</a>
				<a href="#" id="map-gyeongnam">경상남도</a>
				<a href="#" id="map-ulsan">울산</a>
				<a href="#" id="map-busan">부산</a>
				<a href="#" id="map-jeonbuk">전라북도</a>
				<a href="#" id="map-jeonnam">전라남도</a>
				<a href="#" id="map-gwangju">광주</a>
				<a href="#" id="map-jeju">제주도</a>
			
			</div>

			
			<div class="fontH" id="map-list">
			
				<br><h6>&nbsp;지역을 선택해주세요</h6><hr>
				
				리스트
				<div class="ex3">
					<div class="row" > 
						<label class="control-label fontH" style="font-size:23px;"><span id="regionCnt"></span> Comments</label>
					</div><br>
					<div>
						<div id="regionList"></div>
					</div>
				</div>
				
			</div>
		</div>
	</div> -->
	 
	 
	 
	<script>
		/* $.ajax({ 
	        type : "GET", //보내는 타입을 Post방식으로 할지,  GET방식으로 할지 결정
	        url : "/camping/search/kr.green.camping.dao.user.SearchMapper/getSeoul.do", // /내 프로젝트명/XML파일의namespace/내가불러올XML의Query이름.do 
	        //dataType:"html",   //데이터를 어떻게 받을지 지정하는 부분인데, 처음에 Json으로 받으려고 했을때 안되서 
	                             //찾아보니 입력하지 않으면 자동으로 알아서 지정해준다고 해서 주석처리 했더니 됨 
	        // data: getFileParam, //파라미터 넘겨줄 부분? : 이게 할말이 많은데 원래 GET방식으로 하라했다가 
	                               //다시 POST방식으로 하게됬는데 파라미터를 넘겨줄 값이 없어서 다시 GET으로 바꾸면서 주석 
	        contentType : "application/x-www-form-urlencoded; charset=utf-8",  // 기본값이라고 하니까 건들이지 않았고 
	        success : function(res) {
	             //성공시에 res값을 받아와 아래를 실행 
	            $("#map-seoul").attr("href", res[0].value);  // .attr : jQuery함수 아래에서 설명 
									                        //DB테이블에서 내가 필요한 값은  value값이다. 
									                       //.attr() 함수는 선택된 요소들 중에서 제일 처음 요소의 속성값을 가지고 오는 함수이기 때문에
									                       //[0], [1] 이라고 알려주는 것 같다
	        },
	        error : function(request, status, error) {
	            alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
	        }
	    }); */
	    
	    
	    
	</script>
	
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>