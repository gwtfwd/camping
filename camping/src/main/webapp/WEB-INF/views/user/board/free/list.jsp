<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

	<!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
	
	<style type="text/css">
	
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
	<div class="container" style="height: 950px">
		<br>
		<br>
		<br>
		<br>
		<!-- <p style="text-align:center; font-family:Meiryo; color: #343a40; text-decoration:underline; font-size:18px;">NOTICE</p><br> -->
		<h4 class="fontH" style="text-align: center;">자유게시판</h4>
		<br>
		<br>

		<form method="post" action="<c:url value='http://localhost:8080/camping/free/list'/>">
			<div class="row">
				<div class="col-md-12">
					<div class="input-group">
						<select class="form-control11 fontH" name="type" style="margin-right: 5px; margin-left:15px;">
							<option value="1" <c:out value="${type==1? 'selectes':''}"/>>제목</option>
							<option value="2" <c:out value="${type==2? 'selectes':''}"/>>내용</option>
							<option value="3" <c:out value="${type==3? 'selectes':''}"/>>글쓴이</option>
							<option value="4" <c:out value="${type==4? 'selectes':''}"/>>아이디</option>
						</select> <input type="text" name="search" autocomplete="off" style="margin-right: 5px;" value="${search}">
						<button type="submit" class="btn11 btn-primary11 fontH">Search</button>
					</div>
				</div>
			</div>
		</form>
		
		<div class="col-md-12" style="margin-top:7px;">
			<table class="table table-hover" style="width: 100%">
				<thead style="text-align: center;">
					<tr>
						<th style="width: 10%">No</th>
						<th style="width: 40%">Subject</th>
						<th style="width: 20%">Author</th>
						<th style="width: 20%">Date</th>
						<th style="width: 10%">View</th>
					</tr>
				</thead>
				<tbody class="fontH" style="text-align: center;">
					<c:forEach items="${list}" var="free">
						<tr>
							<td>${free.no}</td>
							<td><a href="/camping/free/detail?no=${free.no}" style="color: black;">${free.subject}</a>
								<span class="fontH" style="margin-left: 5px;">[${free.reply_cnt}]</span>
							</td>
							<td>${free.registered_id}</td>
							<td><fmt:formatDate value="${free.registered_at}" pattern="yyyy-MM-dd" /></td>
							<td>${free.view}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table><br>
			<!-- <a href="/camping/free/write"><button type="button" class="btn11 btn-primary11 fontH pull-right" style="margin-top: -80px; margin-right: 15px;">Write</button></a><br> -->
			<div style="height:32px;">
				<a href="/camping/free/write"><button type="button" class="btn11 btn-primary11 fontH pull-right" >Write</button></a><br>
			</div>
			<div>
				<ul class="pagination fontH" style="justify-content: center;">
				
					<c:if test="${pageMaker.prev }">
						<li class="page-item"><a class="page-link fontH" href="/camping/free/list?page=${pageMaker.startPage-1}&search=${search}&type=${type}"> < </a></li>
					</c:if>
					<c:forEach var="page" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<li class="page-item <c:out value="${page==cri.page?'active':''}"/>"><a class="page-link fontH" href="/camping/free/list?page=${page }&search=${search}&type=${type}">${page }</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next }">
						<li class="page-item"><a class="page-link fontH" href="/camping/free/list?page=${pageMaker.endPage+1}&search=${search}&type=${type}"> > </a></li>
					</c:if>
				</ul>
			</div>
		</div>
		
	</div>

	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>