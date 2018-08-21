<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
   	
	<style>
		.container{
	      min-height:850px;
	   	}
	   	.container::-webkit-scrollbar { 
	       display: none; 
	   	}
		.button {
		  display: inline-block;
		  border-radius: 25px;
		  background-color: #3399ff;
		  /* border: 1px #000 solid; */
		  color: #FFF;
		  text-align: center;
		  font-size: 17px;
	      font-weight: 800;
		  width: 150px;
		  height: 40px;
		  transition: all 0s;
		  cursor: pointer;
		  margin: 5px;
		}
		.button:hover {
		  display: inline-block;
		  border-radius: 25px;
		  background-color: #FFF;
		  border: 1.5px #3399ff solid; 
		  color: #3399ff;
		  text-align: center;
		  font-size: 17px;
		  font-weight: 800;
		  width: 150px;
		  height: 40px;
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
		.button1 {
		  display: inline-block;
		  border-radius: 25px;
		  background-color: #090;
		  border: 1px #090 solid;
		  color: #FFF;
		  text-align: center;
		  font-size: 17px;
		  font-weight: 800;
		  width: 150px;
		  height: 40px;
		  transition: all 0s;
		  cursor: pointer;
		  margin: 5px;
		}
		.button1:hover {
		  display: inline-block;
		  border-radius: 25px;
		  background-color: #FFF;
		  border: 1.5px #090 solid; 
		  color: #090;
		  text-align: center;
		  font-size: 17px;
		  font-weight: 800;
		  width: 150px;
		  height: 40px;
		  transition: all 0s;
		  cursor: pointer;
		  margin: 5px;
		}
		.button1 span {
		  cursor: pointer;
		  display: inline-block;
		  position: relative;
		  transition: 0.5s;
		}
		.button1 span:after {
		  content: '\00bb';
		  position: absolute;
		  opacity: 0;
		  top: 0;
		  right: -20px;
		  transition: 0.5s;
		}
		.button1:hover span {
		  padding-right: 25px;
		}
		.button1:hover span:after {
		  opacity: 1;
		  right: 0;
		}
	</style>

</head>
<body>
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
	
      <div class="container" style="margin-top:150px;">
       	<h3 class="fontH" style="text-align:center;"><b>회원가입</b>을 환영합니다</h3><br><br>
       	
       	<div class="row" style="text-align:center;">
	        <div class="col-md-6 fontH" style="margin-top:100px; border:#C5C6C7 1px solid; width:450px; border-top:#3399ff 3px solid; "><br><br><br>
        		
        		<h3 style="color:#333;">개인회원</h3>
        		<label style="color:#666;">개인회원 가입을 원하시면 선택해주세요.</label><br><br>
        		<a href="/camping/member/join"><button class="button" style="vertical-align:middle; margin-bottom:50px;"><span>회원가입</span></button></a><br>
	         </div>
	         
	         <div class="col-md-6 fontH" style="margin-top:100px; border:#C5C6C7 1px solid; width:450px; border-top:#090 3px solid; border-left:0px;"><br><br><br>	
       			
       			<h3 style="color:#333;">관리자회원</h3>
        		<label style="color:#666;">관리자회원 가입을 원하시면 선택해주세요.</label><br><br>
       			
       			<a href="/camping/admin/member/join"><button class="button1" style="vertical-align:middle; margin-bottom:50px;"><span>회원가입</span></button></a><br>
			</div>
        </div> 
      </div>

	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer --> 
	
</body>
</html>