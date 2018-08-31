<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	      margin-bottom:70px;
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
	
	<script>
		function showType(){
			$('#typeForm').submit();
		}
	</script>

</head>
<body >
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
	
	<div class="container">	
		<br><br><br><br>
		<h4 class="fontH" style="text-align:center;">유형별 야영장 찾기</h4><br><br>
		
		<div class="row" > 
			
			<div class="col-md-12"> 
				<div class="input-group">
					<form id="typeForm" method="post" action="<c:url value='http://localhost:8080/camping/search/type/list'/>">
						<select class="form-control11 fontH" name="type" onchange="showType()" style="width:200px;">
							<option value="0">Select Type</option>
							<option value="1">야영장</option>
							<option value="2">자동차야영장</option>
							<option value="3">야영장, 자동차야영장</option>
						</select>
					</form><br>
				</div>
			</div><br><br>

			<div class="col-md-12">	
				<form name='frm_read' id='frm_read' method="get">
					<table class="table table-hover" style="width:100%">
				        <thead style="text-align:center;">
				            <tr>
				                <!-- <th style="width:10%">no</th> -->
				                <th style="width:50%">야영장명</th>
				                <th style="width:50%">주소</th>
				            </tr>
				        </thead>
				        <tbody class="fontH" style="text-align:center;">
				           <c:forEach items="${list}" var="camp" >
						    	<tr>
						        	<%-- <td>${camp.no}</td> --%>
						        	<td><a href="/camping/search/type/detail?no=${camp.no}" style="color:black;">${camp.camp_name}</a></td>
						        	<td>${camp.address_road}</td>
						        </tr>
					        </c:forEach>
				        </tbody>
				  </table><br>
				  <div>
					  <ul class="pagination fontH" style="justify-content:center;">
						  <c:if test="${pageMaker.prev }">
							<li class="page-item"><a class="page-link fontH" href="/camping/search/type/list?page=${pageMaker.startPage-1}&search=${search}&type=${type}"> < </a></li>
						  </c:if>
						  <c:forEach var="page" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						  	<li class="page-item <c:out value="${page==cri.page?'active':''}"/>"><a class="page-link fontH" href="/camping/search/type/list?page=${page }&search=${search}&type=${type}">${page }</a></li>
						  </c:forEach>
						  <c:if test="${pageMaker.next }">
						  	<li class="page-item"><a class="page-link fontH" href="/camping/search/type/list?page=${pageMaker.endPage+1}&search=${search}&type=${type}"> > </a></li>
					   	  </c:if>	
					   </ul>
				   </div>
			   </form>
		 	</div> 
	 	</div>
	</div>
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>