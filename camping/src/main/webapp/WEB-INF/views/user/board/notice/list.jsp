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
	

	<!-- <script type="text/javascript" class="init">
		$(document).ready(function() {
			$('#example').DataTable();
			stateSave : true
		} );

	</script> -->

</head>
<body>
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
	
	<div class="container" style="height:900px">	
		<br><br><br><br>
		<!-- <p style="text-align:center; font-family:Meiryo; color: #343a40; text-decoration:underline; font-size:18px;">NOTICE</p><br> -->
		<h4 style="text-align:center; font-family:Segoe Print;">Notice</h4><br><br>
		
		<div class="row"> 
		
			<div class="col-md-1"></div>
			
			<div class="col-md-10">
				<table class="table table-hover" style="width:100%">
			        <thead style="text-align:center;">
			            <tr>
			                <th style="width:10%">No</th>
			                <th style="width:40%">Subject</th>
			                <th style="width:20%">Name</th>
			                <th style="width:20%">Date</th>
			                <th style="width:10%">View</th>
			            </tr>
			        </thead>
			        <tbody style="text-align:center;">
			           <c:forEach items="${list}" var="notice">
				    	<tr>
			    			<td>${notice.no}</td>
				        	<td><a href="/camping/notice/detail?no=${notice.no}" style="color:black;">${notice.subject}</a></td>
				        	<td>${notice.name}</td>
				        	<td><fmt:formatDate value="${notice.registered_at}" pattern="yyyy-MM-dd" /></td>
				        	<td>${notice.view}</td>
				        </tr>
				        </c:forEach>
			        </tbody>
				  </table>
				  <ul class="pagination" style="justify-content:center;">
					  <c:if test="${pageMaker.prev }">
						<li class="page-item"><a class="page-link" href="/camping/notice/list?page=${pageMaker.startPage-1}">Prev</a></li>
					  </c:if>
					  <c:forEach var="page" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
					  	<li class="page-item"><a class="page-link" href="/camping/notice/list?page=${page }">${page }</a></li>
					  </c:forEach>
					  <c:if test="${pageMaker.next }">
					  	<li class="page-item"><a class="page-link" href="/camping/notice/list?page=${pageMaker.endPage+1}">Next</a></li>
				   	  </c:if>	
				   </ul>
			  </div> 
			  <div class="col-md-1"></div>
		  </div>
		  
	</div>
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>