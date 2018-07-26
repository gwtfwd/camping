<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
				<label class="control-label" for="num">��ȣ</label>
			</div>
			
			<div class="col-md-7 fontH">
				<input type="text" class="form-control" id="num" name="number" style="background-color:white;" value="${free.no}" disabled>
			</div>
			
			<div class="col-md-1"></div>
		</div>
		<br><br>
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2 fontH" style="text-align:right; padding-top:7px;">
				<label class="control-label" for="sub">����</label>
			</div>
			
			<div class="col-md-7 fontH">
				<input type="text" class="form-control" id="sub" name="title" style="background-color:white;"  value="${free.subject}"disabled>
			</div>
			
			<div class="col-md-1"></div>
		</div>
		<br><br>
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2 fontH" style="text-align:right; padding-top:7px;">
				<label class="control-label" for="auth">�ۼ���</label>
			</div>
			
			<div class="col-md-7 fontH">
				<input type="text" class="form-control" id="auth" name="author" style="background-color:white;" value="${free.registered_id}" disabled>
			</div>
			
			<div class="col-md-1"></div>
		</div>
		<br><br>
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2 fontH" style="text-align:right; padding-top:7px;">
				<label class="control-label" for="cont">����</label>
			</div>
			
			<div class="col-md-7 fontH">
				<textarea rows="8" cols="90" id="cont" name="contents" style="background-color:white; border-radius: 4px; border: 1px solid #ced4da;" disabled>${free.contents}</textarea>
			</div>
			
			<div class="col-md-1"></div>
		</div>
		<br>
		
			<!-- <label for="num">÷������:</label> -->
		<div style="text-align:center;">			
			<a href="/camping/notice/list"> 
	       		<button type="button" class="btn11 btn-primary11 fontH" style="margin-left:10px">���</button>
	        </a>			
			<%-- <a href="/camping/notice/modify?no=${notice.no}"> 
	       		<button type="button" class="btn11 btn-primary11 fontH" style="margin-left:10px">����</button>
	        </a>			
			<a href="#"> 
	       		<button type="button" class="btn11 btn-primary11 fontH" style="margin-left:10px">����</button>
	        </a> --%>			
		</div>
					
	</div>
		
		
				
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>