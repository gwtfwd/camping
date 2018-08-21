<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>야영장 찾기</title>

	<!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
   	
   	<style type="text/css">
	   	.btnFindCamp{
	   		font-size:16px; 
	   		width:250px; 
	   		background-color:#16a085; 
	   		border-radius:40px; 
	   		border:0px; 
	   		padding:10px; 
	   		color:#fff; 
	   		margin-top:35px;
	   	}
   	</style>
   	<script>
	   	$(document).ready(function(){ 
		    $('.campInfo').click(function(e){
		    	
 		    	var campName = $(this).text();
 		    	var campNo = $(this).attr('no');
		        
 		    	opener.document.getElementById("camp_name").value=campName;
 		    	opener.document.getElementById("camp_no").value=campNo;
 		    	
 		    	window.close();
	    	});
	    });
    </script>
</head>
<body>

	<div class="fontH" style="background-image: linear-gradient(-60deg, #f4d03f 0%, #16a085 100%); color:#fff; padding:20px;">
		야영장 찾기
	</div>

 	<div class="container">
		<h4 class="fontH" style="text-align:center; margin-top:50px;">' ${search} ' (으)로 검색된 결과입니다.</h4>
		<h6 class="fontH" style="text-align:center;">${totalCount}개의 야영장이 있습니다.</h6>
		
		<div style="margin-left:15px; margin-right:15px;">
			<c:if test="${camplist}">		
				<div class="fontH" style="text-align:center;margin-top:70px;border:1px solid #C8CACC; margin-bottom:70px;">
				
					<c:forEach items="${list}" var="camp">
						<div style="margin-top:8px;margin-bottom:8px;">
							<a href="#" class="campInfo" no="${camp.no}">${camp.camp_name}</a>
						</div>
					</c:forEach>
					
				</div>
			</c:if>
			
			<c:if test="${!camplist}">		
				<div class="fontH" style="text-align:center;margin-top:170px;">
					검색된 결과가 없습니다.
				</div>
			</c:if>
		</div>
	</div> 

</body>
</html>