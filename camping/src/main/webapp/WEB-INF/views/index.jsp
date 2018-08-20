<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
    <script>
		$(document).ready(function(){

			// 야영장명으로 찾기
			$('#formId').submit(function(){
				
				var search = $("#search");
				if(search.val() == ""){
					alert("야영장명을 입력하세요.");
					return false;
				}
				return true;
			});
		});
	</script>
    
    <style>
		.btn11 {
		  display: inline-block;
		  border-radius: 25px;
		  background-color: rgba(255, 0, 0, 0);
		  border: 0.5px #343a40 solid;
		  color: #343a40;
		  text-align: center;
		  font-size: 20px;
		  width: 230px;
		  height: 50px;
		  transition: all 0s;
		  cursor: pointer;
		  margin: 5px;
		}
		.btn11:hover {
		  display: inline-block;
		  border-radius: 25px;
		  color: #343a40;
		  border: 0.5px #343a40 solid;
		  background-color: rgba(255, 0, 0, 0);
		  text-align: center;
		  font-size: 20px;
		  width: 230px;
		  height: 50px;
		  transition: all 0s;
		  cursor: pointer;
		  margin: 5px;
		}
		.btn11 span {
		  cursor: pointer;
		  display: inline-block;
		  position: relative;
		  transition: 0.5s;
		}
		.btn11 span:after {
		  content: '\00bb';
		  position: absolute;
		  opacity: 0;
		  top: 0;
		  right: -20px;
		  transition: 0.5s;
		}
		.btn11:hover span {
		  padding-right: 25px;
		}
		.btn11:hover span:after {
		  opacity: 1;
		  right: 0;
		}
		.tbbox {
			border-top-width:1px; 
			border-top-style:solid;
			border-top-color:#6c757d;
		    border-bottom-width:1px;
			border-bottom-style:solid;
			border-bottom-color:#6c757d;
		}
		.btn-primary33 {
		  background-color: #56B37F;
		  border-color: #56B37F;
		}
		.btn33 {
		  font-size: 20px;
	 	  padding: 4px 15px;
		  line-height: 20px;
		  font-weight: 500;
		  color:#fff; 
		  height:51px;
		  width:150px;
		  border-width:0px;
		  text-align:center;
		  transition: all 200ms ease;
		  border-radius: 4px;
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
   	<section class="py-5" style="margin-top:120px;">
   		<form id="formId" action="/camping/search/name">
	      <div class="container fontH" >
	      	<div class="row">
				<div class="col-md-12" style="text-align:center;">
					<label style="font-size:26px; margin-right:10px; color: #343a40;">야영장 이름으로 검색</label>
					<input type="text" id="search" name="search" style="margin-right:10px;width:500px; height:50px; font-size:24px; border: 1px solid #ced4da;color: #555; padding: 0.375rem 0.75rem; border-radius: 4px;" autocomplete="off">
					<button class="btn33 btn-primary33" type="submit">Search</button>
				</div>
			</div>
	      </div>
	     </form>
    </section>
   	
	<section class="py-5" style="margin-top:120px;">
	      <div class="container" >
	      	<div class="row" style="width: 1540px; margin-left:-200px;">
	      		<div class="img-container col-md-1"></div>
		        <div class="img-container col-md-4" style="background-image: url('resources/images/tree2.png'); height:500px;">
	        		<h2 style="font-weight:bold; font-family:Segoe Print; margin-top:40%; font-weight:bold;">
	        			<a href="/camping/notice/list" style="color:#fff;">NOTICE</a>
	        		</h2>
		        	<p class="fontH" style="margin-top:5px; color:#fff; font-size:15px;">야영장의 새로운 소식을 만나보세요 </p>
		        </div>
		        <div class="img-container col-md-2" style="background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%); height:250px;">	
		         	<h5 class="fontH" style="margin-top:15%" ><a href="/camping/search/region/list" style="color:#343a40; font-weight:bold;">지역별 찾기</a></h5>
		         	<a href="/camping/search/region/list"><img src='resources/images/route.png' style="width:75px; height:75px; margin-top:15%;"></a>	
				</div>
		        <div class="img-container col-md-2" style="background-image: linear-gradient(60deg, #29323c 0%, #485563 100%); height:250px;">	
		         	<h5 class="fontH" style="margin-top:15%" ><a href="/camping/search/type/list" style="color:#fff; font-weight:bold;">유형별 찾기</a></h5>
		         	<a href="/camping/search/type/list"><img src='resources/images/type.png' style="width:75px; height:75px; margin-top:15%;"></a>	
				</div>
		        <div class="img-container col-md-2" style="background-color:#C9BA97; height:250px;">	
		         	<h5 class="fontH" style="margin-top:15%" ><a href="#" style="color:#594104; font-weight:bold;">이용 안내</a></h5>
		         	<a href="#"><img src='resources/images/info.png' style="width:80px; height:80px; margin-top:15%;"></a>	
				</div>
				<div class="img-container col-md-1"></div>
				
				<!-- ////////////////////////////////////////////// -->
				
				<div class="img-container col-md-1"></div>
				<div class="img-container col-md-4" style=" height:0px;"></div>
		         <div class="img-container col-md-2" style="background-image: linear-gradient(to right, #ff758c 0%, #ff7eb3 100%); height:250px; margin-top:-250px;">		
					<h5 style="margin-top:15%" ><a href="#" style="color:#fff; font-weight:bold; font-family:Meiryo;">REVIEW</a></h5>
		         	<a href="#"><img src='resources/images/rating.png' style="width:80px; height:80px; margin-top:15%;"></a>	
				</div>
		         <div class="img-container col-md-4" style="background-image: url('resources/images/jeju.jpg'); height:250px; margin-top:-250px;">	
					<p style="margin-top:15%" ><a href="#" style="color:#343a40; font-weight:bold; font-family:Meiryo; font-size:30px; text-decoration: underline;">Jeju Island</a></p>
				</div>
		         <div class="img-container col-md-1"></div>
			</div>
	      </div>
    </section>
    
   	<section class="py-5" style="margin-top:120px;">
      <div class="container" >
         <div class="container-fluid fontH tbbox" style="width: 1540px; margin-left:-200px; text-align:center;"><br><br><br><br><br>
			<h4 style=" font-weight:bold; font-color:#343a40;">즐거운 여행의 시작, 지금 바로 예약하세요!</h4><br>
			<c:if test="${!member}">
				<a href="/camping/member/needLogin"><button class="btn11" style="vertical-align:middle; margin-bottom:50px; font-weight:bold;"><span>실시간 예약</span></button></a>
			</c:if>
			<c:if test="${member}">
				<a href="/camping/booking/write"><button class="btn11" style="vertical-align:middle; margin-bottom:50px; font-weight:bold;"><span>실시간 예약</span></button></a>
			</c:if>
			<br><br><br><br>     
        </div>
      </div>
    </section>
    
    <section class="py-5" style="margin-top:90px;"> 
		<div class="container">
			<div class="container-fluid clearfix">
				<h2 class="fontH" style="text-align: center; font-weight: bold;">BEST 10</h2>
				<p class="fontH" style="text-align: center; font-weight: bold;">올해의 베스트!&nbsp;&nbsp;가장 핫한 야영장을 소개합니다</p>
				<p style="text-align: center;">
					<a href="#"><img src='resources/images/heart (1).png' width="100px" height="100px" style="color: white;"></a>
				</p>
			</div>
		</div>
	</section>
    
    <section class="py-5" style="background-color:#343a40; margin-top:120px;">
	      <div class="container" >
	        <div class="container-fluid clearfix" style="margin-bottom:-60px;"><br><br>
	        	<h3 style="text-align:center; color:white; font-family:Meiryo;">Customer Center</h3><br>
	        	<div class="img-container">
	        		<img src='resources/images/call.png' width="45px" height="45px" style="margin-top:5px"><br><br>
	        		<p style="text-align:center; font-family:Meiryo; font-size:26px; color:white; margin-top:-7px;">1588 - 1588</p>
		        	<p style="text-align:center; font-family:Meiryo; font-size:16px;  margin-top:-10px; color:white;">AM 9:00 ~ PM 5:00</p>
		         </div>
	        	<div class="img-container">	
	        		<img src='resources/images/qa.png' width="75px" height="75px" ><br>
			        <p style="text-align:center; font-family:Meiryo; font-size:18px; color:white;">KakaoTalk : camping_info</p>
			        <p style="text-align:center; font-family:Meiryo; font-size:18px; margin-top:-10px; color:white;">e-mail : camping@gmail.com</p>
				</div>
	        </div> <br><br><br>
	      </div>
    </section>
   	
   	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>