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
	
	<script>
		$(document).ready(function(){ 
		 $('.replyCnt').click(function(e){
			
			 var bno = $(this).attr('freeNo');
			 // alert(bno);
			 
			window.open("/camping/free/list/replyList?bno="+bno,'_blank','toolbar=no,location=no,status=no, menubar=no, scrollbars=auto, width=490, height=530, top=100, left=700');  
		
		 });
		});
		
		// 체크박스 모두선택, 모두해제
		 $( document ).ready( function() {
	        $( '.check-all' ).click( function() {
	          $( '.ab' ).prop( 'checked', this.checked );
	        } );
	      } );
	</script>
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
/* 		.subject {display: block;text-overflow:ellipsis;overflow: hidden;white-space: nowrap;}
 */	
		/* 체크박스css */
		input[type="checkbox"]{
		  border: 0;
		  clip: rect(0 0 0 0);
		  height: 1px;
		  margin: -1px;
		  overflow: hidden;
		  padding: 0;
		  position: absolute;
		  width: 1px;
		}
		input[type="checkbox"]:hover + label:before{
		  border-color: #999;
		}
		input[type="checkbox"]:active + label:before{
		  transition-duration: 0;
		  filter: brightness(0.2);
		}
		input[type="checkbox"] + label{
		  position: relative;
		  padding-left: 26px;
		  font-weight: normal;
		}
		input[type="checkbox"] + label:before, input[type="checkbox"] + label:after{
		  box-sizing: content-box;
		  position: absolute;
		  content: '';
		  display: block;
		  left: 0;
		}
		input[type="checkbox"] + label:before{
		  top: 50%;
		  width: 16px;
		  height: 16px;
		  margin-top: -10px;
		  border: 2px solid #d9d9d9;
		  text-align: center;
		}
		input[type="checkbox"] + label:after{
		  background-color: #00bad2;
		  top: 50%;
		  left: 6px;
		  width: 8px;
		  height: 8px;
		  margin-top: -4px;
		  transform: scale(0);
		  transform-origin: 50%;
		  transition: transform 200ms ease-out;
		}
		input[type="checkbox"] + label:after {
		  background-color: transparent;
		  top: 50%;
		  left: 5px;
		  width: 7px;
		  height: 4px;
		  margin-top: -5px;
		  border-style: solid;
		  border-color: #00bad2;
		  border-width: 0 0 3px 3px;
		  -moz-transform: rotate(-45deg) scale(0);
		  -ms-transform: rotate(-45deg) scale(0);
		  -webkit-transform: rotate(-45deg) scale(0);
		  transform: rotate(-45deg) scale(0);
		  -moz-transition: none;
		  -o-transition: none;
		  -webkit-transition: none;
		  transition: none;
		}
		input[type="checkbox"]:checked + label:before {
		  -moz-animation: borderscale 200ms ease-in;
		  -webkit-animation: borderscale 200ms ease-in;
		  animation: borderscale 200ms ease-in;
		}
		input[type="checkbox"]:checked + label:after {
		  content: '';
		  -moz-transform: rotate(-45deg) scale(1);
		  -ms-transform: rotate(-45deg) scale(1);
		  -webkit-transform: rotate(-45deg) scale(1);
		  transform: rotate(-45deg) scale(1);
		  -moz-transition: -moz-transform 200ms ease-out;
		  -o-transition: -o-transform 200ms ease-out;
		  -webkit-transition: -webkit-transform 200ms ease-out;
		  transition: transform 200ms ease-out;
		} 
 
 	</style>

</head>
<body>
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
   	
	<div class="container">
		<br><br><br><br>
		<h4 class="fontH" style="text-align: center;">자유게시판</h4><br><br>

		<form method="post" action="<c:url value='http://localhost:8080/camping/free/list'/>">
			<div class="row">
				<div class="col-md-12">
					<div class="input-group">
						<select class="form-control11 fontH" name="type" style="margin-right: 5px;">
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
		<form action="/camping/free/admin/delete">
			<div class="row">
				<div class="col-md-12" style="margin-top:7px;">
					<table class="table" style="width: 100%">
						<thead style="text-align: center;">
							<tr>
								<c:if test="${admin.admin.compareTo('superadmin')==0}">
									<th style="width: 5%;"><input class="check-all" id="checkbox0" name="check-all" type="checkbox"><label for="checkbox0"></label></th>
								</c:if>
								<th style="width: 5%;">No</th>
								<th style="width: 53%;">제목</th>
								<th style="width: 15%;">작성자</th>
								<th style="width: 15%;">작성일</th>
								<th style="width: 7%;">조회수</th>
							</tr>
						</thead>
	
						<tbody class="fontH" style="text-align: center;">
							<c:forEach items="${notice}" var="notice">
								<tr style="background-color:rgba(0, 0, 0, 0.075);">
									<c:if test="${admin.admin.compareTo('superadmin')==0}">
										<td></td>
									</c:if>
									<td style="color:blue;"><b>공지</b></td>
									<td style="text-align:left;"><a class="subject" href="/camping/free/detail?no=${notice.no}" style="color:black;"><b>${notice.subject}</b></a>
										<c:if test="${free.filepath != null}">
											<img src='resources/images/file.png' style="width:13px; height:13px; margin-left:5px;">
										</c:if>
										
										<jsp:useBean id="now1" class="java.util.Date" />
										<fmt:formatDate value="${notice.registered_at}" pattern="yyyy-MM-dd" var="registered_at1"/>
										<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today1" />
										<c:if test="${today1 == registered_at1 }">
											<img src='resources/images/new.png' style="width:13px; height:13px; margin-left:5px;">
										</c:if>
									</td>
									<c:if test='${notice.admin.compareTo("admin")==0}'>	
										<td>${notice.registered_id}<img src='resources/images/admin.png' style="width:16px; height:16px; margin-left:5px;"></td>
									</c:if>
									<c:if test='${notice.admin.compareTo("superadmin")==0}'>	
										<td>${notice.registered_id}<img src='resources/images/superadmin.png' style="width:16px; height:16px; margin-left:5px;"></td>
									</c:if>
									<td><fmt:formatDate value="${notice.registered_at}" pattern="yyyy-MM-dd" /></td>
									<td>${notice.view}</td>
								</tr>
							</c:forEach>
							
							
							<c:forEach items="${list}" var="free" varStatus="status">
								<tr>
									<c:if test="${admin.admin.compareTo('superadmin')==0}">
										<td>
											<input id="checkbox${status.count}" class="ab" name="checkbox" type="checkbox" value="${free.no}">
											<label for="checkbox${status.count}"></label> 
					      				</td>
									</c:if>	
									<td>${free.no}</td>
									<td style="text-align:left;"><a class="subject" href="/camping/free/detail?no=${free.no}" style="color: black;">${free.subject}</a>
										<c:if test="${free.filepath != null}">
											<img src='resources/images/file.png' style="width:13px; height:13px; margin-left:5px;">
										</c:if>
										<span class="fontH replyCnt" freeNo="${free.no}" style="margin-left: 5px; color:red; font-size:13px; cursor:pointer;">[<b>${free.reply_cnt}</b>]</span>
										
										<jsp:useBean id="now" class="java.util.Date" />
										<fmt:formatDate value="${free.registered_at}" pattern="yyyy-MM-dd" var="registered_at"/>
										<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
										<c:if test="${today == registered_at }">
											<img src='resources/images/new.png' style="width:13px; height:13px; margin-left:5px;">
										</c:if>
									</td>
									<c:if test='${free.admin.compareTo("user")==0}'>
										<td>${free.registered_id}</td>
									</c:if>
									<c:if test='${free.admin.compareTo("admin")==0}'>	
										<td>${free.registered_id}<img src='resources/images/admin.png' style="width:16px; height:16px; margin-left:5px;"></td>
									</c:if>
									<c:if test='${free.admin.compareTo("superadmin")==0}'>	
										<td>${free.registered_id}<img src='resources/images/superadmin.png' style="width:16px; height:16px; margin-left:5px;"></td>
									</c:if>
									<td><fmt:formatDate value="${free.registered_at}" pattern="yyyy-MM-dd" /></td>
									<td>${free.view}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table><br>
					
					<div style="height:32px;">
						<a href="/camping/free/write"><button type="button" class="btn11 btn-primary11 fontH pull-right" >Write</button></a>
						<c:if test="${admin.admin.compareTo('superadmin')==0}">
				       		<button id="delete" type="submit" class="btn11 btn-primary11 fontH pull-right" style="margin-right:10px;">삭제</button>
				        </c:if>
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
		</form>
	</div>

	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>