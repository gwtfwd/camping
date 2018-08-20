<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
   	
	<link href="<c:url value ='/resources/css/list.css'/>" rel="stylesheet">
	
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
		  -moz-border-radius: 0px;
		  -webkit-border-radius: 0px;
		  border-radius: 0px;
		  -webkit-transition: all 200ms ease;
		  -moz-transition: all 200ms ease;
		  -ms-transition: all 200ms ease;
		  -o-transition: all 200ms ease;
		  transition: all 200ms ease;
		}
		.test{
			width:350px;
			height: 200px;
		}
		@media(max-width:1200px){
			.test{
				width:270px;
				height: 160px;
			}
		}
		@media(max-width:1000px){
			.test{
				width:200px;
				height: 110px;
			}
		}
	</style>
	
</head>
<body>
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
   	
	<div class="container">
		<br><br><br><br>
		<h4 class="fontH" style="text-align: center;">야영장 후기</h4><br><br><br>

		
		<div class="row">
			<c:forEach items="${list}" var="review" varStatus="status">
				<div class="col-md-4" style="text-align:center;">
					<a href="/camping/review/detail?no=${review.no}">
						<img src="<c:out value='/camping/resources/upload${review.filepath}'/>" class="test">
					</a><br>	
					<a href="/camping/review/detail?no=${review.no}">${review.subject}</a><br>
					${review.user_name}<br><br><br>	
				</div>
			</c:forEach>
		</div>	
		
		<div class="row">	
			<div class="col-md-12" style="margin-top:7px;">
				<c:if test="${member}">
					<div style="height:32px;">
						<a href="/camping/review/write"><button type="button" class="btn11 btn-primary11 fontH pull-right" >Write</button></a><br>
					</div>
				</c:if>
				<c:if test="${!member}">
					<div style="height:32px;">
						<a href="/camping/member/needLogin"><button type="button" class="btn11 btn-primary11 fontH pull-right" >Write</button></a><br>
					</div>
				</c:if>
				
				<div>
					<ul class="pagination fontH" style="justify-content: center;">
						<c:if test="${pageMaker.prev }">
							<li class="page-item"><a class="page-link fontH" href="/camping/review/list?page=${pageMaker.startPage-1}"> < </a></li>
						</c:if>
						<c:forEach var="page" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class="page-item <c:out value="${page==cri.page?'active':''}"/>"><a class="page-link fontH" href="/camping/review/list?page=${page}">${page}</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li class="page-item"><a class="page-link fontH" href="/camping/review/list?page=${pageMaker.endPage+1}"> > </a></li>
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