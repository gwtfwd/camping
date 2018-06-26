<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>camping information</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/css/half-slider.css" rel="stylesheet">
    
    <!-- icon -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	 <!-- Bootstrap core JavaScript -->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	
	<!-- Header -->
  	<jsp:include page="WEB-INF/views/common/header.jsp"></jsp:include>
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
          <div class="carousel-item active" style="background-image: url('https://cdn.namuwikiusercontent.com/s/90a8852e97e6263aad77ce578c066c5089c9d9965df967ce4e770b32dd0aff9ac4c44ce790d520a0581b9bda767406a7ea63a174525066658369406f5aadb40e14f99bfb82790f23ed474c18c1834818?e=1533025272&k=0jzSO3jqAwhqaLpx9z9m1A')">
           <div class="carousel-caption d-none d-md-block ">
           		<p style=" font-size:26px; font-weight:bold; ">The Better More Enjoyable!</p>
            	<p style=" font-size:43px; font-weight:bold; margin-top:-15px;">2018 NEW OPEN & RENEWAL</p>
           		<p style=" font-size:15px; font-weight:bold; margin-top:-15px;">2018��! ���Ӱ� ������ ķ������ ����������</p>
            	<button class="button button-white" >�ڼ��� ����</button>
            </div> 
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item"><img src='resources/images/beach.jpg'  >
            <div class="carousel-caption2 d-none d-md-block">
            	<p style=" font-size:26px; font-weight:bold; "> Healing In The Sea</p>
            	<p style=" font-size:40px; font-weight:bold; margin-top:-15px; ">�ٴ� �տ��� ���� ���� �۷���</p>
             	<p style=" font-size:15px; font-weight:bold; margin-top:-10px;">ŹƮ�� �ٴ������� ������ ������ ������� </p>
            	<button class="button button-dark" >�ڼ��� ����</button>
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('http://www.wealthmanagement.com/sites/wealthmanagement.com/files/city-blur-night.jpg')">  
            <div class="carousel-caption d-none d-md-block">
           	 <p style="font-size:26px; font-weight:bold; "> Oasis In The City </p>
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
        <div class="container-fluid clearfix">
        	<h2 style="text-align:center; font-weight:bold; font-family:���ﳲ�� ��üM;">Campsite Search</h2><br>
	        <div class="img-container">
	        		<a href="#"><img src='resources/images/map3.ico' width="180px" height="180px" ></a><br><br>
	        		<p style="font-family:���ﳲ�� ��üM; font-size:30px; font-weight:bold;">������ �˻�
	         </div>
	         <div class="img-container">		
	       			<a href="#"><img src='resources/images/camp.png' width="180px" height="180px" ></a><br><br>
	       			<p style="font-family:���ﳲ�� ��üM; font-size:30px; font-weight:bold;">������ �˻�
			</div>		        
        </div> 
      </div>
    </section> 
   	
   	<section class="py-5" style="background-color:#343a40">
      <div class="container" >
        <div class="container-fluid">
			<h2 style="text-align:center; font-weight:bold; font-family:���ﳲ�� ��üM; color:white;">�ǽð� �����ϱ�</h2><br>
        	<div>
        		<p style="text-align:center;"><a href="#" ><img src='resources/images/calendar.png' width="100px" height="100px" style="color:white;"></a></p>
			</div>        
        </div> 
      </div>
    </section>
   	
    <section class="py-5">
      <div class="container" >
        <div class="container-fluid clearfix">
        	<h3 style="text-align:center; font-weight:bold; font-family:���ﳲ�� ��üM;">Campsite Search</h3><br>
	        <div class="img-container">
	        		<a href="#"><img src='resources/images/map3.ico' width="180px" height="180px" ></a><br><br>
	        		<p style="font-family:���ﳲ�� ��üM; font-size:30px; font-weight:bold;">������ �˻�
	         </div>
	         <div class="img-container">		
	       			<a href="#"><img src='resources/images/camp.png' width="180px" height="180px" ></a><br><br>
	       			<p style="font-family:���ﳲ�� ��üM; font-size:30px; font-weight:bold;">������ �˻�
			</div>		        
        </div> 
      </div>
    </section>
   
   	<!-- contents -->
   	
   	
   	<!-- Footer -->
  	<jsp:include page="WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>