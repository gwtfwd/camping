<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
	<base href="http://localhost:8080/camping/">
	<style type="text/css">
		.container{
	      min-height:850px;
	      margin-bottom:50px;
	   	}
	   	.container::-webkit-scrollbar { 
	       display: none; 
	   	}
		.btn-primary11 {
		  background-color: #1b1e24;
		  border-color: #1b1e24;
		  color:white;
		}
		.btn11 {
		  font-size: 12px;
		  padding: 4px 15px;
		  line-height: 20px;
		  font-weight: 400;
		  border-radius: 0px;
		  transition: all 200ms ease;
		}
		.page-item.active .page-link {
		  z-index: 1;
		  color: #000;
		  background-color: #fafafa;
		  border-color: #fafafa;
		}
	</style>

</head>
<body>
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
   	
	<div class="container">
		<br><br><br><br>
		<h4 class="fontH" style="text-align: center;">나의 야영장리스트</h4><br><br>

		
		<div class="row">
			<div class="col-md-12" style="margin-top:7px;">
			<a href="/camping/mycamp/write"><button type="button" class="btn11 btn-primary11 fontH pull-right" >Write</button></a><br><br>
				<table class="table table-hover" style="width: 100%">
					<thead style="text-align: center;">
						<tr>
							<th style="width: 50%">야영장번호</th>
							<th style="width: 50%">야영장명</th>
						</tr>
					</thead>
					<tbody class="fontH" style="text-align: center;">
						<c:forEach items="${list}" var="camp">
							<tr>
								<td><a href="/camping/mycamp/detail?no=${camp.no}" style="color: black;">${camp.no}</a></td>
								<td><a href="/camping/mycamp/detail?no=${camp.no}" style="color: black;">${camp.camp_name}</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table><br>
				
				<div>
					<ul class="pagination fontH" style="justify-content: center;">
						<c:if test="${pageMaker.prev }">
							<li class="page-item"><a class="page-link fontH" href="/camping/mycamp/list?page=${pageMaker.startPage-1}"> < </a></li>
						</c:if>
						<c:forEach var="page" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class="page-item <c:out value="${page==cri.page?'active':''}"/>"><a class="page-link fontH" href="/camping/mycamp/list?page=${page}">${page}</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li class="page-item"><a class="page-link fontH" href="/camping/mycamp/list?page=${pageMaker.endPage+1}"> > </a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>