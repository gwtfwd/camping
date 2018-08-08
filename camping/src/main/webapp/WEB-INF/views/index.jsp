<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html lang="en">

<head>
    
    <!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
    
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

	<section class="py-5" style="margin-top:200px;">
	      <div class="container" >
	      	<div class="row" style="width: 1540px; margin-left:-200px;">
	      		
	      		<div class="img-container col-md-1">		
				</div>
				
				
		        <div class="img-container col-md-4" style="background-image: url('resources/images/tree2.png'); height:500px;">
	        		<h2 style="font-weight:bold; font-family:Segoe Print; margin-top:40%; font-weight:bold;">
	        			<a href="/camping/notice/list" style="color:#fff;">NOTICE</a>
	        		</h2>
		        	<p class="fontH" style="margin-top:5px; color:#fff; font-size:15px;">�߿����� ���ο� �ҽ��� ���������� </p>
		        </div>
		         
		         <div class="img-container col-md-2" style="background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%); height:250px;">	
		         	<h5 class="fontH" style="margin-top:15%" ><a href="/camping/search/region/list" style="color:#343a40; font-weight:bold;">������ ã��</a></h5>
		         	<a href="/camping/search/region/list"><img src='resources/images/route.png' style="width:75px; height:75px; margin-top:15%;"></a>	
				</div>
				
		         <div class="img-container col-md-2" style="background-image: linear-gradient(60deg, #29323c 0%, #485563 100%); height:250px;">	
		         	<h5 class="fontH" style="margin-top:15%" ><a href="/camping/search/type/list" style="color:#fff; font-weight:bold;">������ ã��</a></h5>
		         	<a href="/camping/search/type/list"><img src='resources/images/type.png' style="width:75px; height:75px; margin-top:15%;"></a>	
				</div>
				
		         <div class="img-container col-md-2" style="background-color:#C9BA97; height:250px;">	
		         	<h5 class="fontH" style="margin-top:15%" ><a href="#" style="color:#594104; font-weight:bold;">�̿� �ȳ�</a></h5>
		         	<a href="#"><img src='resources/images/info.png' style="width:80px; height:80px; margin-top:15%;"></a>	
				</div>
				
				<div class="img-container col-md-1">		
				</div>
				
				
				<!-- ////////////////////////////////////////////// -->
				
				
				<div class="img-container col-md-1">		
				</div>
				
				<div class="img-container col-md-4" style=" height:0px;">
		        </div>
		        
		         <div class="img-container col-md-2" style="background-image: linear-gradient(to right, #ff758c 0%, #ff7eb3 100%); height:250px; margin-top:-250px;">		
					<h5 style="margin-top:15%" ><a href="#" style="color:#fff; font-weight:bold; font-family:Meiryo;">REVIEW</a></h5>
		         	<a href="#"><img src='resources/images/rating.png' style="width:80px; height:80px; margin-top:15%;"></a>	
				</div>
				
		         <div class="img-container col-md-4" style="background-image: url('resources/images/jeju.jpg'); height:250px; margin-top:-250px;">	
					<p style="margin-top:15%" ><a href="#" style="color:#343a40; font-weight:bold; font-family:Meiryo; font-size:30px; text-decoration: underline;">Jeju Island</a></p>
				</div>
				
		         <div class="img-container col-md-1">		
				</div>
			</div>
	      </div>
    </section>
    
    
   	<section class="py-5" style="margin-top:120px;">
      <div class="container" >
         <div class="container-fluid fontH tbbox" style="width: 1540px; margin-left:-200px; text-align:center;"><br><br><br><br><br>
<!--          <div class="container-fluid fontH" style="background-image: linear-gradient(to top, #d5d4d0 0%, #d5d4d0 1%, #eeeeec 31%, #efeeec 75%, #e9e9e7 100%); width: 1540px; margin-left:-200px; text-align:center;"><br><br><br><br> -->
			<h4 style=" font-weight:bold; font-color:#343a40;">��ſ� ������ ����, ���� �ٷ� �����ϼ���!</h4><br>
			<a href="#"><button class="btn11" style="vertical-align:middle; margin-bottom:50px; font-weight:bold;"><span>�ǽð� ����</span></button></a>
			<br><br><br><br>     
        </div>
      </div>
    </section>
    
    
    <section class="py-5" style="margin-top:90px;"> 
		<div class="container">
			<div class="container-fluid clearfix">
				<h2 class="fontH" style="text-align: center; font-weight: bold;">BEST 10</h2>
				<p class="fontH" style="text-align: center; font-weight: bold;">������ ����Ʈ!&nbsp;&nbsp;���� ���� �߿����� �Ұ��մϴ�</p>
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
	        </div> <br><br>
	        <br>
	      </div>
    </section>
   
   	<!-- contents -->
   	
   	
   	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>