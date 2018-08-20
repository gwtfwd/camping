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
	</style>
	
</head>
<body>
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
   	
 	<div class="container">	
		<br><br><br><br>
		<h4 class="fontH" style="text-align:center;">' ${search} ' (으)로 검색된 결과입니다.</h4>
		<h6 class="fontH" style="text-align:center;">${totalCount}개의 야영장이 있습니다.</h6>

		<c:if test="${camplist}">		
			<div class="fontH" style="text-align:center;margin-top:70px;border:1px solid #C8CACC; margin-bottom:70px;">
				<div class="row" style="margin-top:8px;margin-bottom:8px;">
					<div class="col-md-1"></div>
					<div class="col-md-4"><b>야영장명</b></div>
					<div class="col-md-6"><b>주소</b></div>
				</div>
				<c:forEach items="${list}" var="camp">
					<div class="row" style="margin-top:8px;margin-bottom:8px;">
						<div class="col-md-1"></div>
						<div class="col-md-4">
							<a href="/camping/search/name/detail?no=${camp.no}" style="color: black;">${camp.camp_name}</a>	
						</div>
						<div class="col-md-6">${camp.address_road}</div>
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
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>