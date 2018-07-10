<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html lang="en">

<head>
    
    <!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- Header -->
    
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
           		<p style=" font-size:15px; font-weight:bold; margin-top:-15px;">2018��! ���Ӱ� ������ ķ������ ����������</p>
            	<button class="button button-white" >�ڼ��� ����</button>
            </div> 
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item"  style="background-image: url('resources/images/beach.jpg')">
            <div class="carousel-caption d-none d-md-block">
            	<p style=" font-size:26px; font-weight:bold; ">Healing In The Sea</p>
            	<p style=" font-size:40px; font-weight:bold; margin-top:-15px; ">�ٴ� �տ��� ���� ���� �۷���</p>
             	<p style=" font-size:15px; font-weight:bold; margin-top:-10px;">ŹƮ�� �ٴ������� ������ ������ ������� </p>
            	<button class="button button-white" >�ڼ��� ����</button>
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('resources/images/city.jpg')">  
            <div class="carousel-caption d-none d-md-block">
           	 <p style="font-size:26px; font-weight:bold; margin-left: 6px;">Oasis In The City </p>
             <p style="font-size:43px; font-weight:bold; margin-top:-15px;">���� �۷����� ��</p>
             <p style="font-size:15px; font-weight:bold; margin-top:-10px;">�ÿ��� �ٶ��� ǳ��, ������ ������ �ѵ� ��췯�� �ִ� �̰����� ���ٸ� �۷��� �����⸦ �����غ�����</p>
             <button class="button button-white" >�ڼ��� ����</button>
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
      <section class="py-5">
	      <div class="container" >
	        <div class="container-fluid clearfix"><br><br>
	        	<h2 style="text-align:center; font-weight:bold; font-family:consolas;">Campsite Search</h2><br><br><br>
		        <div class="img-container">
		        		<a href="#"><img src='resources/images/map.png' width="180px" height="180px" ></a><br><br>
		        		<p class="fontH" style="font-size:30px; font-weight:bold;">������ �˻�
		         </div>
		         <div class="img-container">		
		       			<a href="#"><img src='resources/images/camp.png' width="180px" height="180px" ></a><br><br>
		       			<p class="fontH" style="font-size:30px; font-weight:bold;">������ �˻�
				</div>
	        </div> 
	        <br><br><br>
	      </div>
    </section>

   	
   	<section class="py-5" style="background-color:#343a40">
      <div class="container" >
        <div class="container-fluid fontH"><br><br>
			<h2 style="text-align:center; font-weight:bold; color:white;">�ǽð� �����ϱ�</h2><br><br>
        	<div>
        		<p style="text-align:center;"><a href="#" ><img src='resources/images/calendar.png' width="100px" height="100px" style="color:white;"></a></p>
			</div> 
			<br><br>      
        </div> 
      </div>
    </section>
    
     <section class="py-5">
	      <div class="container" >
	        <div class="container-fluid clearfix"><br><br>
	        	<h2 style="text-align:center; font-weight:bold; font-family:consolas;">Campsite Search</h2><br><br><br>
		        <div class="img-container">
		        		<a href="#"><img src='resources/images/map.png' width="180px" height="180px" ></a><br><br>
		        		<p class="fontH" style="font-size:30px; font-weight:bold;">������ �˻�
		         </div>
		         <div class="img-container">		
		       			<a href="#"><img src='resources/images/camp.png' width="180px" height="180px" ></a><br><br>
		       			<p class="fontH" style="font-size:30px; font-weight:bold;">������ �˻�
				</div>
	        </div> 
	        <br><br><br>
	      </div>
    </section>
   	
    <section class="py-5" style="background-color:#343a40">
	      <div class="container" >
	        <div class="container-fluid clearfix" style="margin-bottom:-60px;">
	        	<h2 style="text-align:center; font-weight:bold; font-family:consolas; color:white;">Customer center</h2><br>
	        	<div class="img-container">
	        		<p style="text-align:center; font-weight:bold; font-family:consolas; font-size:30px; color:white;">CALL</p>
	        		<p style="text-align:center; font-family:consolas; font-size:30px; color:white;">1588 - 1588</p>
		        	<p style="text-align:center; font-family:consolas; font-size:16px;  margin-top:-10px; color:white;">AM 9:00 ~ PM 5:00</p>
		         </div>
	        	<div class="img-container">	
	        		<p style="text-align:center; font-weight:bold; font-family:consolas; font-size:30px; color:white;">Q & A</p>
			        <p style="text-align:center; font-family:consolas; font-size:20px; color:white;">KakaoTalk : camping_info</p>
			        <p style="text-align:center; font-family:consolas; font-size:20px; margin-top:-10px; color:white;">E-mail : camping @ gmail.com</p>
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