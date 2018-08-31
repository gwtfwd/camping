<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
	
	<script src="//code.jquery.com/jquery.min.js"></script>
	<base href="http://localhost:8080/camping/">
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
		.btn-primary33 {
		  background-color: #6bacce;
		  border-color: #6bacce;
		}
		.btn33 {
		  font-size: 14px;
	 	  padding: 4px 15px;
		  line-height: 15px;
		  font-weight: 400;
		  color:#fff; 
		  height:40px;
		  width:80px;
		  border-width:0px;
		  text-align:center;
		  border-radius: 35px;
		  transition: all 200ms ease;
	 	}
	 	.star-input>.input,
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
		.star-input>.input>input:checked+label{
			background-size: 150px;
			background-position: 0 bottom;
		}
		.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
		.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
		.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
		.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
		.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
	</style>
	
	<script>
		//새로고침, 뒤로가기 막기
		document.onkeydown = function(e) {
			
			 key = (e) ? e.keyCode : event.keyCode;
			 
			 if(key==8 || key==116) {
				  if(e) {
				  	e.preventDefault();
				  } 
				  else {
				  	event.keyCode = 0;
				  	event.returnValue = false;
				  }
			 }
		}
	
		$(document).ready(function(){
			  
			  $('#delete').click(function() {
			       var str = document.getElementById('formDetail');
			       str.submit();
			       
			       if (confirm("정말 삭제하시겠습니까?") == true){    //확인
			    	    document.form.submit();
			    	}else{   //취소
			    	    return false;
			    	}
			    });
		});
	
		function needLogin(x) {
	      window.location.href = "/camping/member/needLogin"
	    }
		
		// 썸네일
		function readURL(input) { 
			if (input.files && input.files[0]) {
			   var reader = new FileReader();
			   reader.onload = function (e) { 
				   $('#viewimg').attr('src', e.target.result); 
			   }
			   reader.readAsDataURL(input.files[0]); 
			 }
		}
	</script>

</head>
<body>
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
	
	<div class="container" >	
		<br><br><br><br>
		<h4 style="text-align:center; font-family:Segoe Print;">Detail</h4> <br><br>
		
		<form method="post" id="formDetail">
		
			<div class="row" style="border-top:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;"> 
					<label class="control-label" for="subject">제목</label>
				</div>
				<div class="col-md-7 fontH" style="border-right:1px solid #C8CACC;">
					<input type="text" class="form-control" id="subject" name="subject" style="background-color:white; border-width:0px;"  value="${review.subject}" readonly>
					
				</div>
				<div class="col-md-1 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;"> 
					<label class="control-label" for="star">평점</label>
				</div>
				<div class="col-md-2 fontH" style="text-align:center;">
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
			
			<div class="row" style="border-bottom:1px solid #C8CACC; border-top:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="user_name">작성자</label>
				</div>
				<div class="col-md-7 fontH" style="border-right:1px solid #C8CACC;">
					<input type="text" class="form-control" id="user_name" name="user_name" style="background-color:white; border-width:0px;" value="${review.user_name}" readonly>
				</div>
				
				<div class="col-md-1 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="view">조회수</label>
				</div>
				<div class="col-md-2 fontH">
					<input type="text" class="form-control" id="view" name="view" style="background-color:white; border-width:0px;" value="${review.view}" readonly>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;" name="file" id="file" > 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="file">첨부파일</label>
				</div>
				<div class="col-md-4 fontH" style="border-right:1px solid #C8CACC;padding-top:7px;">
					<c:if test="${fileName != null }">
		      			<a href="/camping/review/download?fileName=${review.filepath}" target="_blank">${fileName}</a>
		      		</c:if>
		      		<c:if test="${fileName == null }">
		      			첨부파일 없음
		      		</c:if>
				
				
				</div>
				<div class="col-md-1 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="registered_at">작성일자</label>
				</div>
				<div class="col-md-2 fontH" style="border-right:1px solid #C8CACC;">
					<input type="text" class="form-control" id="registered_at" name="registered_at" style="background-color:white; border-width:0px;" value="<fmt:formatDate value="${review.registered_at}" pattern="yyyy-MM-dd" />" readonly>
				</div>
				<div class="col-md-1 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="updated_at">수정일자</label>
				</div>
				<div class="col-md-2 fontH" >
					<input type="text" class="form-control" id="updated_at" name="updated_at" style="background-color:white; border-width:0px;" value="<fmt:formatDate value="${review.updated_at}" pattern="yyyy-MM-dd" />" readonly>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:10px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="contents">내용</label>
				</div>
				<div class="col-md-10 fontH" style="padding-top:10px;">
					<div style="text-align:center;">
						<img id="viewimg" src="/camping/resources/upload${review.filepath}" alt="your image" width="800" height="400"/>
					</div><br>
					<textarea rows="10" cols="100" id="contents" name="contents" style="background-color:white; border-width:0px;" readonly>${review.contents}</textarea>
				</div>
			</div><br>
			
			<div style="text-align:center;">			
				<a href="/camping/review/list"> 
		       		<button type="button" class="btn11 btn-primary11 fontH pull-right" style="margin-left:10px">목록</button>
		        </a>			
		        <c:if test="${user.id.compareTo(review.user_id) == 0 }">
					<a href="/camping/review/modify?no=${review.no}"> 
			       		<button type="button" class="btn11 btn-primary11 fontH pull-right" style="margin-left:10px">수정</button>
			        </a>			
					<a href="/camping/review/delete?no=${review.no}"> 
			       		<button id="delete" type="button" class="btn11 btn-primary11 fontH pull-right" >삭제</button>
			        </a>	
		        </c:if>		
			</div><br><br>
		</form>
	</div>
		
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>