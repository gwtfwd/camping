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
		
		
		function like_func(campNo, userId){
			  var frm_read = $('#frm_read');
			  console.log("campNo, userId : " + campNo +","+ userId);
			  
			  $.ajax({
			    url: "/camping/search/type/liketo/like.do",
			    type: "GET",
			    cache: false,
			    dataType: "json",
			    data: 'campNo=' +campNo+ '&userId=' +userId,
			    contentType:"application/json; charset=UTF-8",
			    success: function(data) {
			      var msg = '';
			      var like_img = '';
			      msg += data.msg;
			      alert(msg);
			      
			      if(data.like_check == 0){
			        like_img = "resources/images/dislike.png";
			      } else {
			        like_img = "resources/images/heart1.png";
			      }      
			      $('#like_img', frm_read).attr('src', like_img);
			      $('#like_cnt').html(data.like_cnt);
			      $('#like_check').html(data.like_check);
			    },
			    error: function(request, status, error){
			      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			  });
			}

	</script>

</head>
<body >
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
	
	<div class="container" style="height:950px">	
		<br><br><br><br>
		<!-- <p style="text-align:center; font-family:Meiryo; color: #343a40; text-decoration:underline; font-size:18px;">NOTICE</p><br> -->
		<h4 class="fontH" style="text-align:center;">유형별 야영장 찾기</h4><br><br>
		
		<div class="row"> 
			
			<div class="col-md-12"> 
				<div class="input-group">
					<form id="typeForm" method="post" action="<c:url value='http://localhost:8080/camping/search/type/list'/>">
						<select class="form-control11 fontH" name="type" onchange="showType(this.value)" style="width:200px;">
							<option value="">Select Type</option>
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
				                <!-- <th style="width:10%">No</th> -->
				                <th style="width:40%">야영장명</th>
				                <th style="width:50%">주소</th>
				                <th style="width:10%">추천</th>
				            </tr>
				        </thead>
				        <tbody class="fontH" style="text-align:center;">
				           <c:forEach items="${list}" var="camp" >
						    	<tr>
					    			<%-- <td>${camp.no}</td> --%>
						        	<td><a href="/camping/search/type/detail?no=${camp.no}" style="color:black;">${camp.camp_name}</a></td>
						        	<td>${camp.address_road}</td>
						        	<td>
									    <c:if test="${member}">
									     	<a href="javascript: like_func('${camp.no}', '${user.id}' )" ><img src='/camping/resources/images/dislike.png' id='like_img'></a>
									    </c:if>
									    <c:if test="${!member}">
									     	<a href="/camping/member/needLogin"><img src='/camping/resources/images/dislike.png'></a>
									    </c:if> 
									    <span id='like_cnt' style='margin-left: 5px;'>${like.like_cnt} Likes</span>
									    
					        			<%-- <c:choose>
										    <c:when test="${user_id ne null}">
										     <a href='javascript: like_func();'><img src='./images/dislike.png' id='like_img'></a>
										    </c:when>
										    <c:otherwise>
										     <a href="/camping/member/needLogin"><img src='./images/dislike.png'></a>
										    </c:otherwise> 
									    </c:choose> --%>
										   <%-- <br><span id='like_cnt' style='margin-left: 5px;'></span>${like_cnt},${camp.like} --%>
										   
										   
										   
							        	<%-- <c:if test="${isExistsFavoriteData }">
							        		<!-- <span id="favorite"><img src="resources/images/like1.png" style="width:20px; height:20px;"></span> -->
											<span id="favorite">♥</span>
										</c:if>
										<c:if test="${!isExistsFavoriteData }">
											<!-- <span id="favorite"><img src="resources/images/like2.png" style="width:20px; height:20px;"></span> -->
											<span id="favorite" >♡</span>
										</c:if> --%>
						        	</td>
						        </tr>
					        </c:forEach>
				        </tbody>
					  </table><br>
					  
					  <ul class="pagination fontH" style="justify-content:center;">
						  <c:if test="${pageMaker.prev }">
							<li class="page-item"><a class="page-link fontH" href="/camping/search/type/list?page=${pageMaker.startPage-1}&search=${search}&type=${type}"> < </a></li>
						  </c:if>
						  <c:forEach var="page" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						  	<li class="page-item"><a class="page-link fontH" href="/camping/search/type/list?page=${page }&search=${search}&type=${type}">${page }</a></li>
						  </c:forEach>
						  <c:if test="${pageMaker.next }">
						  	<li class="page-item"><a class="page-link fontH" href="/camping/search/type/list?page=${pageMaker.endPage+1}&search=${search}&type=${type}"> > </a></li>
					   	  </c:if>	
					   </ul>
				   </form>
			  </div> 
		  </div>
		  
	</div>
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>