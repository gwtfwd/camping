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
	</style>

</head>
<body>
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
	
	<div class="container" style="height:880px">	
		<br><br><br><br>
		<h4 style="text-align:center; font-family:Segoe Print;">Modify</h4> <br><br>
		
		<form method="post">
		
			<div class="row" style="border-bottom:1px solid #C8CACC; border-top:1px solid #C8CACC;"> 
				<div class="col-md-1 fontH" style="padding-top:7px;">
					<label class="control-label" for="num">번호</label>
				</div>
				<div class="col-md-10 fontH">
					<input type="text" class="form-control" id="num" name="number" style="background-color:white; border-width:0px;" value="${free.no}" readonly>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-1 fontH" style="padding-top:7px;"> 
					<label class="control-label" for="subject">제목</label>
				</div>
				<div class="col-md-5 fontH">
					<input type="text" class="form-control" id="subject" name="subject" style="background-color:white; border-width:0px;"  value="${free.subject}" >
				</div>
				<div class="col-md-1 fontH" style="padding-top:7px;">
					<label class="control-label" for="id">작성자</label>
				</div>
				<div class="col-md-3 fontH">
					<input type="text" class="form-control" id="id" name="id" style="background-color:white; border-width:0px;" value="${free.registered_id}" readonly>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-1 fontH" style="padding-top:7px;">
					<label class="control-label" for="file">첨부파일</label>
				</div>
				<div class="col-md-10 fontH" >
					<input type="text" class="form-control" id="file" name="file" style="background-color:white; border-width:0px;" >
				</div>
			</div><br>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-1 fontH" style="padding-top:4px;">
					<label class="control-label" for="contents">내용</label>
				</div>
				<div class="col-md-10 fontH" style="margin-left: 9px;">
					<textarea rows="20" cols="140" id="contents" name="contents" style="background-color:white; border-width:0px;">${free.contents}</textarea>
				</div>
			</div><br>
			
			<div style="text-align:center;">	
				<a href="/camping/free/list"> 
		       		<button type="button" class="btn11 btn-primary11 fontH">취소</button>
		        </a>		
				<a href="/camping/free/modify"> 
		       		<button type="submit" class="btn11 btn-primary11 fontH" style="margin-left:10px">완료</button>
		        </a>	
			</div><br><br>
		</form>
	</div>
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>