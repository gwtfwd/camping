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
	
	<style>
		textarea.autosize { min-height: 50px; }
	</style>
	
	
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script>
	$("textarea.autosize").on('keydown keyup', function () {
	  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
	});
	</script>

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
			
			
			<div class="col-md-2" style="font-family:돋움; text-align:right; padding-top:7px;">
				
				<label class="control-label" for="num">번호</label><br><br>
				<label class="control-label" for="sub">제목</label><br><br>
				<label class="control-label" for="auth">작성자</label><br><br>
				<label class="control-label" for="cont">내용</label><br><br>
				
			
			</div>
			
			<div class="col-md-7" style="font-family:돋움;">
			
				<input type="text" class="input form-control" id="num" name="number"   value="${notice.no}" disabled><br>
				<input type="text" class="input form-control" id="sub" name="title"   value="${notice.subject}"disabled><br>
				<input type="text" class="input form-control" id="auth" name="author"  value="${notice.name}" disabled><br>
				<input type="text" class="input form-control" id="cont" name="contents" style="height:300px" value="${notice.contents}" disabled><br>
			</div>
			
				<%-- <div  style="font-family:돋움;">
					<div class="col-md-3">
						<label for="num">번호:</label>
					</div>
					<div class="col-md-6 ">
						<input type="text" class="form-control" id="num" name="number"   value="${notice.no}" disabled>
					</div>
					<div class="col-md-3"></div>
				</div>
				
				
				<div  style="font-family:돋움;">
					<div class="col-md-3">
						<label for="sub">제목:</label>
					</div>
					<div class="col-md-6 ">
						<input type="text" class="form-control" id="sub" name="title"   value="${notice.subject}"disabled>
					</div>
					<div class="col-md-3"></div>
				</div>
				
				
				<div  style="font-family:돋움;">
					<div class="col-md-3">
						<label class="col-md-3 " for="auth">작성자:</label>
					</div>
					<div class="col-md-6 ">
						 <input type="text" class="form-control" id="auth" name="author"  value="${notice.name}" disabled>
					</div>
					<div class="col-md-3"></div>
				</div>
				
				
				<div style="font-family:돋움;">
					<div class="col-md-3">
						<label class="col-md-3 " for="cont">내용:</label>
					</div>
					<div class="col-md-6 ">
						<input type="text" class="form-control" id="cont" name="contents"  value="${notice.contents}" disabled>
					</div>
					<div class="col-md-3"></div>
				</div> --%>
				
					
					<!-- <label for="num">첨부파일:</label> -->
					
				
	               
			<div class="col-md-1"></div>
		</div>
			<a href="/camping/notice/list"> 
               		<button type="button" class="btn btn-primary">목록</button>
            </a>
				
		  
	</div>
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>