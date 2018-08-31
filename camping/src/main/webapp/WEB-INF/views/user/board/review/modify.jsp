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
			width:225px;
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
		<h4 style="text-align:center; font-family:Segoe Print;">Modify</h4> <br><br>
		
		<form method="post" enctype="multipart/form-data">
		
			<div class="row" style="border-top:1px solid #C8CACC; border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px; border-right:1px solid #C8CACC; text-align:center;"> 
					<label class="control-label" for="subject">제목</label>
				</div>
				<div class="col-md-7 fontH" style="border-right:1px solid #C8CACC;">
					<input type="text" class="form-control" id="subject" name="subject" style="background-color:white; border-width:0px;"  value="${review.subject}" >
				</div>
				<div class="col-md-1 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;"> 
					<label class="control-label" for="star">평점</label>
				</div>
				<div class="col-md-2 fontH">
					<span class="star-input">
						<span class="input" style="border:0px;">
					    	<input type="radio" name="star" value="1" id="p1" <c:out value="${review.star==1?'checked':'' }"/>>
					    	<label for="p1">1</label>
					    	<input type="radio" name="star" value="2" id="p2" <c:out value="${review.star==2?'checked':'' }"/>>
					    	<label for="p2">2</label>
					    	<input type="radio" name="star" value="3" id="p3" <c:out value="${review.star==3?'checked':'' }"/>>
					    	<label for="p3">3</label>
					    	<input type="radio" name="star" value="4" id="p4" <c:out value="${review.star==4?'checked':'' }"/>>
					    	<label for="p4">4</label>
					    	<input type="radio" name="star" value="5" id="p5" <c:out value="${review.star==5?'checked':'' }"/>>
					    	<label for="p5">5</label>
					  	</span>
					</span>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="file">첨부파일</label>
				</div>
				<div class="col-md-7 fontH" name="fileName" style="padding-top:7px;border-right:1px solid #C8CACC;">
					<c:if test="${fileName != null }">
		      			<a href="/review/download?fileName=${review.filepath}"
		      			 target="_blank">${fileName}</a>
		      			<a href="/review/modify?np=${review.no}&del=1">
		      				<img src='resources/images/deleted.png'>
		      			</a>
		      		</c:if>
		      		<c:if test="${fileName == null }">
		      			첨부파일 없음
		      		</c:if>
				</div>
				<div class="col-md-1 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="id">작성자</label>
				</div>
				<div class="col-md-1 fontH">
					<input type="text" class="form-control" id="id" name="id" style="background-color:white; border-width:0px;" value="${review.user_id}" readonly>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="fileModify">첨부파일 수정</label>
				</div>
				<div class="col-md-9 fontH">
					<input type="file" class="form-control fontH" name="file" style="background-color:white; border-width:0px;"/>
				</div>
			</div>
			
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:4px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="contents">내용</label>
				</div>
				<div class="col-md-9 fontH" style="margin-left: 9px;">
					<textarea rows="20" cols="100" id="contents" name="contents" style="background-color:white; border-width:0px;">${review.contents}</textarea>
				</div>
			</div><br>
			
			<div style="text-align:center;">	
				<a href="/camping/review/list"> 
		       		<button type="button" class="btn11 btn-primary11 fontH">취소</button>
		        </a>		
				<a href="/camping/review/modify"> 
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