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
	   	}
	   	.container::-webkit-scrollbar { 
	       display: none; 
	   	}
		
		.page-item.active .page-link {
		  z-index: 1;
		  color: #000;
		  background-color: #fafafa;
		  border-color: #fafafa;
		}
		
		.myButton {
		-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
		-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
		box-shadow:inset 0px 1px 0px 0px #ffffff;
		background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffffff), color-stop(1, #f6f6f6));
		background:-moz-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
		background:-webkit-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
		background:-o-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
		background:-ms-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
		background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
		filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#f6f6f6',GradientType=0);
		background-color:#ffffff;
		-moz-border-radius:6px;
		-webkit-border-radius:6px;
		border-radius:6px;
		border:1px solid #dcdcdc;
		display:inline-block;
		cursor:pointer;
		color:#666666;
		font-family:fontH;
		font-size:14px;
		font-weight:bold;
		padding:6px 24px;
		text-decoration:none;
		text-shadow:0px 1px 0px #ffffff;
	}
	.myButton:hover {
		background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f6f6f6), color-stop(1, #ffffff));
		background:-moz-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
		background:-webkit-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
		background:-o-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
		background:-ms-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
		background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
		filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6', endColorstr='#ffffff',GradientType=0);
		background-color:#f6f6f6;
	}
	.myButton:active {
		position:relative;
		top:1px;
	}
	</style>

</head>
<body>
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
   	
	<div class="container">
		<br><br><br><br>
		<h4 class="fontH" style="text-align: center;">예약리스트</h4><br><br>

		
		<div class="row">
			<div class="col-md-12" style="margin-top:7px;">
				<table class="table table-hover" style="width: 100%">
					<thead style="text-align: center;">
						<tr>
							<th style="width: 40%">예약일시</th>
							<th style="width: 20%">예약자명</th>
							<th style="width: 20%">예약상태</th>
							<th style="width: 20%">취소상태</th>
						</tr>
					</thead>
					<tbody class="fontH" style="text-align: center;">
						<c:forEach items="${list}" var="adminBooking">
							<tr>
								<td><a href="/camping/admin/booking/detail?no=${adminBooking.no}" style="color: black;">${adminBooking.booking_at}</a></td>
								<td><a href="/camping/admin/booking/detail?no=${adminBooking.no}" style="color: black;">${adminBooking.user_name}</a></td>
								<td>
									<c:if test="${adminBooking.book_status.compareTo('예약대기')==0}">
										<a href="/camping/admin/booking/set?book_status=예약완료&page=${pageMaker.criteria.page}&no=${adminBooking.no}">
											<button class="myButton">예약대기</button>
										</a>
									</c:if>
									<c:if test="${adminBooking.book_status.compareTo('예약완료')==0}">
										<a href="/camping/admin/booking/set?book_status=예약대기&page=${pageMaker.criteria.page}&no=${adminBooking.no}">
											<button class="myButton">예약완료</button>
										</a>
									</c:if>
								</td>
								<td>
									<c:if test="${adminBooking.can_status.compareTo('취소대기')==0}">
										<a href="/camping/admin/booking/cancel/set?can_status=취소완료&page=${pageMaker.criteria.page}&no=${adminBooking.no}">
											<button class="myButton">취소대기</button>
										</a>
									</c:if>
									<c:if test="${adminBooking.can_status.compareTo('취소완료')==0}">
										<a href="/camping/admin/booking/cancel/set?can_status=취소대기&page=${pageMaker.criteria.page}&no=${adminBooking.no}">
											<button class="myButton">취소완료</button>
										</a>
									</c:if>
								</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table><br>
				
				<div>
					<ul class="pagination fontH" style="justify-content: center;">
						<c:if test="${pageMaker.prev }">
							<li class="page-item"><a class="page-link fontH" href="/camping/booking/list?page=${pageMaker.startPage-1}"> < </a></li>
						</c:if>
						<c:forEach var="page" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class="page-item <c:out value="${page==cri.page?'active':''}"/>"><a class="page-link fontH" href="/camping/booking/list?page=${page}">${page}</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li class="page-item"><a class="page-link fontH" href="/camping/booking/list?page=${pageMaker.endPage+1}"> > </a></li>
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