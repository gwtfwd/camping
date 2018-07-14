<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html lang="en">

<head>
    
    <!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- Header -->
    
    <style>
		.button11 {
		  display: inline-block;
		  border-radius: 25px;
		  background-color: #6B6A6B;
		  border-color:#6B6A6B;
		  color: #FFF;
		  text-align: center;
		  font-size: 20px;
		  width: 230px;
		  height: 50px;
		  transition: all 0s;
		  cursor: pointer;
		  margin: 5px;
		}
		
		.button11:hover {
		  display: inline-block;
		  border-radius: 25px;
		  color: #FFF;
		  background-color: #6B6A6B;
		  border-color:#6B6A6B;
		  /* background-color: #FFF; */
		  /* border: 1.5px #6B6A6B solid; 
		  color: #343a40; */
		  text-align: center;
		  font-size: 20px;
		  width: 230px;
		  height: 50px;
		  transition: all 0s;
		  cursor: pointer;
		  margin: 5px;
		}
		
		.button11 span {
		  cursor: pointer;
		  display: inline-block;
		  position: relative;
		  transition: 0.5s;
		}
		
		.button11 span:after {
		  content: '\00bb';
		  position: absolute;
		  opacity: 0;
		  top: 0;
		  right: -20px;
		  transition: 0.5s;
		}
		
		.button11:hover span {
		  padding-right: 25px;
		}
		
		.button11:hover span:after {
		  opacity: 1;
		  right: 0;
		}
	</style>
    
    
    
</head>
<body>
	
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
   	
   	<!-- contents -->
   	 <header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item active" style="background-image: url('resources/images/forest.jpg')">
           <div class="carousel-caption d-none d-md-block ">
           		<p style=" font-size:26px; font-weight:bold; ">The Better More Enjoyable!</p>
            	<p style=" font-size:43px; font-weight:bold; margin-top:-15px;">2018 NEW OPEN & RENEWAL</p>
           		<p style=" font-size:15px; font-weight:bold; margin-top:-15px;">2018년! 새롭게 오픈할 캠핑장을 만나보세요</p>
            	<button class="button button-white" >자세히 보기</button>
            </div> 
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item"  style="background-image: url('resources/images/beach.jpg')">
            <div class="carousel-caption d-none d-md-block">
            	<p style=" font-size:26px; font-weight:bold; ">Healing In The Sea</p>
            	<p style=" font-size:40px; font-weight:bold; margin-top:-15px; ">바다 앞에서 즐기는 감성 글램핑</p>
             	<p style=" font-size:15px; font-weight:bold; margin-top:-10px;">탁트인 바다전경이 펼쳐진 곳으로 놀러오세요 </p>
            	<button class="button button-white" >자세히 보기</button>
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('resources/images/city.jpg')">  
            <div class="carousel-caption d-none d-md-block">
           	 <p style="font-size:26px; font-weight:bold; margin-left: 6px;">Oasis In The City </p>
             <p style="font-size:43px; font-weight:bold; margin-top:-15px;">도심 글램핑의 멋</p>
             <p style="font-size:15px; font-weight:bold; margin-top:-10px;">시원한 바람과 풍경, 도시의 조명이 한데 어우러져 있는 이곳에서 색다른 글램핑 분위기를 만끽해보세요</p>
             <button class="button button-white" >자세히 보기</button>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </header>
   	
   	<!-- Page Content -->
      <section class="py-5" style="margin-top:100px;">
	      <div class="container" >
	        <div class="container-fluid clearfix"><br><br>
					<!-- <h3 class="fontH" style="text-align:center; font-weight:bold;">야영장 검색</h3><br><br><br> -->
	 	        	<h3 style="text-align:center; font-weight:bold; font-family:Meiryo;">Campsite Search</h3><br><br><br>
		        <div class="img-container">
		        		<a href="/camping/search/region/list"><img src='resources/images/map.png' width="180px" height="180px" ></a><br><br>
		        		<p class="fontH" style="font-size:18px;"><b>지역별</b>로 검색하기
		         </div>
		         <div class="img-container">		
		       			<a href="#"><img src='resources/images/camp.png' width="180px" height="180px" ></a><br><br>
		       			<p class="fontH" style="font-size:18px;"><b>유형별</b>로 검색하기
				</div>
	        </div> 
	        <br><br>
	      </div>
    </section>

   	
   	<section class="py-5" >
      <div class="container" >
        <div class="container-fluid fontH" style="width: 1540px; margin-left:-200px; border:#C5C6C7 1.5px solid; text-align:center;"><br><br><br><br>
			<h4 style=" font-weight:bold; ">야영장 지금 바로 예약하세요!</h4><br>
			<a href="#"><button class="button11" style="vertical-align:middle; margin-bottom:50px;"><span>실시간 예약</span></button></a>
        	<!-- <div>
        		<p style="text-align:center;"><a href="#" ><img src='resources/images/calendar.png' width="100px" height="100px" style="color:white;"></a></p>
			</div> --> 
			<br><br><br>      
        </div> 
      </div>
    </section>
    
     <section class="py-5">
	      <div class="container" >
	        <div class="container-fluid clearfix"><br><br><br>
	        	<h2 class="fontH" style="text-align:center; font-weight:bold;">BEST 10</h2>
	        	<p calss="fontH" style="text-align:center; font-weight:bold;">올해의 베스트!&nbsp;&nbsp;가장 핫한 야영장을 소개합니다</p>
	        	<p style="text-align:center;"><a href="#" ><img src='resources/images/heart (1).png' width="100px" height="100px" style="color:white;"></a></p>
	        </div><br><br><br><br>
	      </div>
    </section>
   	
    <section class="py-5" style="background-color:#343a40">
	      <div class="container" >
	        <div class="container-fluid clearfix" style="margin-bottom:-60px;"><br><br>
	        	<h3 style="text-align:center; color:white; font-family:Meiryo;">Customer Center</h3><br>
	        	<div class="img-container">
	        		<!-- <p style="text-align:center; font-weight:bold; font-family:Meiryo; font-size:30px; color:white;">CALL</p> -->
	        		<img src='resources/images/call.png' width="45px" height="45px" style="margin-top:5px"><br><br>
	        		<p style="text-align:center; font-family:Meiryo; font-size:26px; color:white; margin-top:-7px;">1588 - 1588</p>
		        	<p style="text-align:center; font-family:Meiryo; font-size:16px;  margin-top:-10px; color:white;">AM 9:00 ~ PM 5:00</p>
		         </div>
	        	<div class="img-container">	
	        		<!-- <p style="text-align:center; font-weight:bold; font-family:Meiryo; font-size:30px; color:white;">Q & A</p> -->
	        		<img src='resources/images/qa.png' width="75px" height="75px" ><br>
			        <p style="text-align:center; font-family:Meiryo; font-size:18px; color:white;">KakaoTalk : camping_info</p>
			        <p style="text-align:center; font-family:Meiryo; font-size:18px; margin-top:-10px; color:white;">e-mail : camping@gmail.com</p>
				</div>
		        <!-- <p style="text-align:center; font-weight:bold; font-family:consolas; font-size:30px; color:white;">1588 - 1588</p>
		        <p style="text-align:center; font-family:consolas; font-size:20px;  margin-top:-10px; color:white;">AM 9:00 ~ PM 5:00</p><br>
		        <p style="text-align:center; font-weight:bold; font-family:consolas; font-size:30px; color:white;">Q & A</p>
		        <p style="text-align:center; font-family:consolas; font-size:20px; color:white;">KakaoTalk : camping_info</p>
		        <p style="text-align:center; font-family:consolas; font-size:20px; margin-top:-10px; color:white;">E-mail : camping @ gmail.com</p> -->
	        </div> 
	        <br>
	      </div>
    </section>
   
   	<!-- contents -->
   	
   	
   	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>