<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
   	
	<style>
		.button {
		  display: inline-block;
		  border-radius: 25px;
		  background-color: #000;
		  /* border: 1px #000 solid; */
		  color: #FFF;
		  text-align: center;
		  font-size: 20px;
		  width: 300px;
		  height: 50px;
		  transition: all 0s;
		  cursor: pointer;
		  margin: 5px;
		}
		
		.button:hover {
		  display: inline-block;
		  border-radius: 25px;
		  background-color: #FFF;
		  border: 1.5px #000 solid; 
		  color: #000;
		  text-align: center;
		  font-size: 20px;
		  width: 300px;
		  height: 50px;
		  transition: all 0s;
		  cursor: pointer;
		  margin: 5px;
		}
		
		.button span {
		  cursor: pointer;
		  display: inline-block;
		  position: relative;
		  transition: 0.5s;
		}
		
		.button span:after {
		  content: '\00bb';
		  position: absolute;
		  opacity: 0;
		  top: 0;
		  right: -20px;
		  transition: 0.5s;
		}
		
		.button:hover span {
		  padding-right: 25px;
		}
		
		.button:hover span:after {
		  opacity: 1;
		  right: 0;
		}
	</style>



</head>
<body>
	
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
	
	
	 <section>
	      <div class="container" style="height:800px; margin-top:150px;">
	        <div class="container-fluid clearfix">
	        	<h4 class="fontH" style="text-align:center;"><b>회원가입</b>을 환영합니다!</h4><br><br>
	        	
		        <div class="img-container" style="margin-top:100px; border:#C5C6C7 1px solid; width:450px;">
	        		<a href="#"><img src='resources/images/user.png' width="180px" height="180px" style="margin-top:50px"></a><br><br>
	        		<!-- <p class="fontH" style="font-size:15px; color:#6c757d;">전국 야영장 정보를 알고싶은 분<br><br> -->
	        		<a href="/camping/member/join"><button class="button" style="vertical-align:middle; margin-bottom:50px;"><span>개인 회원 가입</span></button></a>
		         </div>
		         
		         <div class="img-container" style="margin-top:100px; border:#C5C6C7 1px solid; margin-left:40px;  width:450px;" >		
	       			<a href="#"><img src='resources/images/admin.png' width="180px" height="180px" style="margin-top:50px"></a><br><br>
	       			<!-- <p class="fontH" style="font-size:15px; ">야영장을 등록하고 관리하는 분<br><br> -->
	       			<a href="#"><button class="button" style="vertical-align:middle; margin-bottom:50px;"><span>관리자 회원 가입</span></button></a>
				</div>
				
	        </div> 
	      </div>
    </section>
	

	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer --> 
	
</body>
</html>