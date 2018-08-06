<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

	<!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
	
	<script src="//code.jquery.com/jquery.min.js"></script>
	
	<style type="text/css">
	
	.btn-primary11 {
	  background-color: #1b1e24;
	  border-color: #1b1e24;
	}
	
	.btn11 {
	  font-size: 15px;
	  padding: 4px 15px;
	  line-height: 20px;
	  font-weight: 400;
	  color:white; 
	  width:100px; 
	  height:30px;
	  text-align:center;
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
	
	<div class="container" style="height:880px">	
		<br><br><br><br>
		
		<!-- <p style="text-align:center; font-family:Meiryo; color: #343a40; text-decoration:underline; font-size:18px;">NOTICE</p><br> -->
		<h4 style="text-align:center; font-family:Segoe Print;">Detail</h4> <br><br>
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2 fontH" style="text-align:right; padding-top:7px;">
				<label class="control-label" for="name">야영장명</label>
			</div>
			
			<div class="col-md-7 fontH">
				<input type="text" class="form-control" id="name" name="name" style="background-color:white;" value="${camp.camp_name}" disabled>
			</div>
			
			<div class="col-md-1"></div>
		</div>
		<br>
		
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2 fontH" style="text-align:right; padding-top:7px;">
				<label class="control-label" for="address_jibun">지번 주소</label>
			</div>
			
			<div class="col-md-7 fontH">
				<input type="text" class="form-control" id="address_jibun" name="address_jibun" style="background-color:white;"  value="${camp.address_jibun}"disabled>
			</div>
			
			<div class="col-md-1"></div>
		</div>
		<br>
		
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2 fontH" style="text-align:right; padding-top:7px;">
				<label class="control-label" for="address_road">도로명 주소</label>
			</div>
			
			<div class="col-md-7 fontH">
				<input type="text" class="form-control" id="address_road" name="address_road" style="background-color:white;"  value="${camp.address_road}"disabled>
			</div>
			
			<div class="col-md-1"></div>
		</div>
		<br>
		
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2 fontH" style="text-align:right; padding-top:7px;">
				<label class="control-label" for="camp_tel">전화번호</label>
			</div>
			
			<div class="col-md-7 fontH">
				<input type="text" class="form-control" id="camp_tel" name="camp_tel" style="background-color:white;" value="${camp.camp_tel}" disabled>
			</div>
			
			<div class="col-md-1"></div>
		</div>
		<br>
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2 fontH" style="text-align:right; padding-top:7px;">
				<label class="control-label" for="man_agency_name">관리기관명</label>
			</div>
			
			<div class="col-md-7 fontH">
				<input type="text" class="form-control" id="man_agency_name" name="man_agency_name" style="background-color:white;" value="${camp.man_agency_name}" disabled>
			</div>
			
			<div class="col-md-1"></div>
		</div>
		<br>
		
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2 fontH" style="text-align:right; padding-top:7px;">
				<label class="control-label" for="man_agency_tel">관리기관 전화번호</label>
			</div>
			
			<div class="col-md-7 fontH">
				<input type="text" class="form-control" id="man_agency_tel" name="man_agency_tel" style="background-color:white;" value="${camp.man_agency_tel}" disabled>
			</div>
			
			<div class="col-md-1"></div>
		</div>
		<br>
		
		<div style="text-align:center;">			
			<a href="/camping/search/type/list"> 
	       		<button type="button" class="btn11 btn-primary11 fontH">목록</button>
	        </a>			
		</div>
					
	</div>
		
		
				
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>