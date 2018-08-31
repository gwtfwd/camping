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
	<script src="/camping/resources/vendor/jquery/jquery-1.11.3.min.js"></script>
	<script src="/camping/resources/vendor/jquery/star.js"></script>
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
		.star-input>.input,
		.star-input>.input>label:hover,
		.star-input>.input>input:focus+label,
		.star-input>.input>input:checked+label {
			display: inline-block;
			vertical-align:middle;
			background:url('resources/images/grade_img.png') no-repeat;
		}
		.star-input {
			display:inline-block; 
			white-space:nowrap;
			width:160px;
			height:40px;
			padding:0px;
			line-height:30px;
		}
		.star-input>.input {
			display:inline-block;
			width:150px;
			background-size:150px;
			height:28px;
			white-space:nowrap;
			overflow:hidden;
			position: relative;
		}
		.star-input>.input>input{
			position:absolute;
			width:1px;
			height:1px;
			opacity:0;
		}
		star-input>.input.focus{
			outline:1px dotted #ddd;
		}
		.star-input>.input>label{
			width:30px;
			height:0;
			padding:28px 0 0 0;
			overflow: hidden;
			float:left;
			cursor: pointer;
			position: absolute;
			top: 0;
			left: 0;
		}
		.star-input>.input>label:hover,
		.star-input>.input>input:focus+label,
		.star-input>.input>input:checked+label{
			background-size: 150px;
			background-position: 0 bottom;
		}
		.star-input>.input>label:hover~label{
			background-image: none;
		}
		.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
		.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
		.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
		.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
		.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
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
			
			<div class="row" style="border-bottom:1px solid #C8CACC; border-top:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;"> 
					<label class="control-label" for="subject">제목</label>
				</div>
				<div class="col-md-4 fontH">
					<input type="text" class="form-control" id="subject" name="subject" style="background-color:white; border-width:0px;" autocomplete="off">
				</div>
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="id">작성자</label>
				</div>
				<div class="col-md-4 fontH">
					<input type="text" class="form-control" id="id" name="id" style="background-color:white; border-width:0px;" value="${user.id}" readonly>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="file">첨부파일</label>
				</div>
				<div class="col-md-9 fontH" style="padding-top:5px;">
					<input type="file" name="file">
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="contents">내용</label>
				</div>
				<div class="col-md-9 fontH" style="margin-left: 9px;">
					<textarea rows="20" cols="100" id="contents" name="contents" style="background-color:white; border-width:0px; padding-top:7px;" autocomplete="off"></textarea>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-12 fontH" style="padding-top:7px; margin-left:20px;">
					<label class="control-label" for="star">평점</label>
					<span class="star-input" style="margin-left:20px;">
						<span class="input" style="border:0px;">
					    	<input type="radio" name="star" value="1" id="p1">
					    	<label for="p1">1</label>
					    	<input type="radio" name="star" value="2" id="p2">
					    	<label for="p2">2</label>
					    	<input type="radio" name="star" value="3" id="p3" >
					    	<label for="p3">3</label>
					    	<input type="radio" name="star" value="4" id="p4">
					    	<label for="p4">4</label>
					    	<input type="radio" name="star" value="5" id="p5">
					    	<label for="p5">5</label>
					  	</span>
					</span>
				</div>
			</div><br><br>
			
			<div style="text-align:center;">			
	       		<a href="/camping/review/write">
	       			<button type="submit" class="btn11 btn-primary11 fontH" style="margin-left:10px">완료</button>
	       		</a>
				<a href="/camping/review/list">
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