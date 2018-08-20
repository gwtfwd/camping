<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
   	
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
		  margin-left: 30px;
		  -moz-border-radius: 0px;
		  -webkit-border-radius: 0px;
		  border-radius: 60px;
		  -webkit-transition: all 200ms ease;
		  -moz-transition: all 200ms ease;
		  -ms-transition: all 200ms ease;
		  -o-transition: all 200ms ease;
		  transition: all 200ms ease;
		}
	</style> 
	
	<script>
	 function sendit() {
	        var frm = document.pwForm;
	        
	        if (!frm.pw.value) { //패스워드를 입력하지 않으면.
	            alert("비밀번호를 입력 해주세요!");
	            frm.pw.focus();
	            return;
	        }
	        document.pwForm.submit(); //유효성 검사가 통과되면 서버로 전송.
	    }
	 </script>

</head>
<body>
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
	
	<div class="container">
		<form id="pwForm" method="post">
			<div class="row" style="margin-top:250px;">
				<div class="col-md-3"></div>
				<div class="col-md-2 fontH">
					<label style="float:right;">password : </label>
				</div>
				<div class="col-md-4 fontH">
					<input type="password" id="pw" name="pw"/>
				</div>
				<div class="col-md-3"></div>
			</div><br><br>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6 fontH" style="margin-left:120px;">
					<a href="/camping"><button type="submit" class="btn11 btn-primary11 fontH">취소</button></a>
					<a href="/camping/member/confirmPw"><button type="submit" onclick="sendit()" class="btn11 btn-primary11 fontH">확인</button></a>
				</div>
				<div class="col-md-3"></div>
			</div>
		</form>
	</div>

	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer --> 
</body>
</html>