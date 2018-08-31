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
	<script src="//code.jquery.com/jquery.min.js"></script>
	
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
		}
		.btn11 {
		  font-size: 15px;
		  padding: 4px 15px;
		  line-height: 20px;
		  font-weight: 400;
		  color:white; 
		  width:100px; 
		  height:30px;
		  text-align:center;
		  -moz-border-radius: 0px;
		  -webkit-border-radius: 0px;
		  border-radius: 0px;
		  -webkit-transition: all 200ms ease;
		  -moz-transition: all 200ms ease;
		  -ms-transition: all 200ms ease;
		  -o-transition: all 200ms ease;
		  transition: all 200ms ease;
		}
		
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
		<h4 style="text-align:center; font-family:Segoe Print;">Write</h4> <br><br>
		
		<!-- 사진, 동영상 등 글자가 아닌 파일은 모드 Multipart 형식의 데이터 -->
		<form method="post" id="formDetail" enctype="multipart/form-data">
		
			<c:if test="${admin.admin.compareTo('superadmin')==0}">
				<div class="row" style="border-top:1px solid #C8CACC;"> 
					<div class="col-md-12 fontH checkbox custom" style="padding-top:7px;"> 
						<input id="checkbox1" name="notice" value="true" type="checkbox"> 
	      				<label for="checkbox1">공지</label>
					</div>
				</div>
			</c:if>	
			
			<div class="row" style="border-bottom:1px solid #C8CACC;border-top:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;background-color:#fafafa;"> 
					<label class="control-label" for="subject">제목</label>
				</div>
				<div class="col-md-7 fontH" style="adding-top:7px;border-right:1px solid #C8CACC;">
					<input type="text" class="form-control" id="subject" name="subject" style="background-color:white; border-width:0px;">
				</div>
				<div class="col-md-1 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;background-color:#fafafa;">
					<label class="control-label" for="id">작성자</label>
				</div>
				<div class="col-md-2 fontH">
					<c:if test="${member}">
						<input type="text" class="form-control" id="id" name="id" style="background-color:white; border-width:0px;" value="${user.id}" readonly>
					</c:if>	
					<c:if test="${adminMember}">
						<input type="text" class="form-control" id="id" name="id" style="background-color:white; border-width:0px;" value="${admin.adminId}" readonly>
					</c:if>	
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;background-color:#fafafa;">
					<label class="control-label" for="file">첨부파일</label>
				</div>
				<div class="col-md-9 fontH" style="padding-top:5px;">
					<input type="file" name="file">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;background-color:#fafafa;">
					<label class="control-label" for="contents">내용</label>
				</div>
				<div class="col-md-9 fontH" style="margin-left: 9px;">
					<textarea rows="20" cols="100" id="contents" name="contents" style="background-color:white; border-width:0px; padding-top:7px;"></textarea>
				</div>
				
			</div><br><br>
			
			<div style="text-align:center;">			
	       		<a href="/camping/free/write">
	       			<button type="submit" class="btn11 btn-primary11 fontH" style="margin-left:10px">완료</button>
	       		</a>
				<a href="/camping/free/list">
				  	<button class="btn11 btn-primary11 fontH">취소</button>
			 	</a>
			</div>
		</form>
	</div>
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>