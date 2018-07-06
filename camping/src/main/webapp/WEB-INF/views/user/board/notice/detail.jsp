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
	

</head>
<body>
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
	
	<div class="container" style="height:850px">	
		<br><br><br><br>
		
		<!-- <p style="text-align:center; font-family:Meiryo; color: #343a40; text-decoration:underline; font-size:18px;">NOTICE</p><br> -->
		<h4 style="text-align:center; font-family:Segoe Print;">Detail</h4> <br><br>
		
		<div class="row"> 
		
			<div class="col-md-1"></div>
			
			<div class="col-md-10">
				<label for="num">번호:</label>
                <input type="text" class="form-control" id="num" name="number"   value="${notice.no}" disabled>
                <label for="usr">제목:</label>
                <input type="text" class="form-control" id="usr" name="title"   value="${notice.subject}"disabled >
                <label for="pwd">작성자:</label>
                <input type="text" class="form-control" id="pwd" name="author"  value="${notice.name}" disabled>
			</div>
			<a href="/camping/notice/list"> 
               		<button type="button" class="btn btn-primary">목록</button>
            </a>
				
			<div class="col-md-1"></div>
		</div>
		  
	</div>
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>