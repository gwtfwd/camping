<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>댓글 리스트</title>

	<!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
   	
   	<style type="text/css">
	   	.btnFindId{
	   		font-size:16px; 
	   		width:300px; 
	   		background-color:#16a085; 
	   		border-radius:40px; 
	   		border:0px; 
	   		padding:10px; 
	   		color:#fff; 
	   		margin-top:35px;
	   	}
   	</style>
   	
</head>
<body>

	<div class="fontH" style="background-image: linear-gradient(-60deg, #f4d03f 0%, #16a085 100%); color:#fff; padding:20px;">
		댓글 리스트
	</div>

 	<div class="container fontH">
 		<div style="margin:20px 20px 20px 20px;">
			<c:forEach items="${list}" var="reply">
				<div style="border:1px solid #C8CACC;">
					<span style="padding:7px; font-size:14px;">${reply.reid}</span>
					<span style="margin-left:30px; padding:7px; font-size:14px;">${reply.redate}</span><br>
					<div style="border-top:1px solid #C8CACC;  padding:10px;">${reply.recontent}</div>
				</div>	
			</c:forEach><br>
	 		<div>
				<ul class="pagination fontH" style="justify-content: center;">
					<c:if test="${pageMaker.prev }">
						<li class="page-item"><a class="page-link fontH" href="/camping/free/list/replyList?page=${pageMaker.startPage-1}&bno=${bno}"> < </a></li>
					</c:if>
					<c:forEach var="page" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<li class="page-item <c:out value="${page==cri.page?'active':''}"/>"><a class="page-link fontH" href="/camping/free/list/replyList?page=${page }&bno=${bno}">${page }</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next }">
						<li class="page-item"><a class="page-link fontH" href="/camping/free/list/replyList?page=${pageMaker.endPage+1}&bno=${bno}"> > </a></li>
					</c:if>
				</ul>
			</div>
	 		
	 		
 		</div>
 	
	</div> 
	
	

</body>
</html>