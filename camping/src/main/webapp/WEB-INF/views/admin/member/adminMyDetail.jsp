<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
   	
   	<!-- 우편번호 -->
   	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
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
		  padding: 0px 15px;
		  line-height: 20px;
		  font-weight: 400;
		  color:white; 
		  width:170px; 
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
	
	<div class="container">	
		<br><br><br><br>
		<h3 style="text-align:center; font-family:Segoe Print;">Mypage</h3> <br><br>
		
		<form method="post" id="formId">
			
			<div class="row"> 
				<div class="col-md-1"></div>
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="adminId">아이디</label>
				</div>
				<div class="col-md-7">
					<input type="text" class="form-control fontH" id="adminId" name="adminId" autocomplete="off" value="${adminJoin.adminId}" style="background-color:white;" readonly>
				</div>
				<div class="col-md-1"></div>
			</div><br>
			
			<div class="row"> 
				<div class="col-md-1"></div>
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="adminName">이름</label>
				</div>
				<div class="col-md-7">
					<input type="text" class="form-control fontH" id="adminName" name="adminName" value="${adminJoin.adminName}" style="background-color:white;"autocomplete="off" readonly>
				</div>
				<div class="col-md-1"></div>
			</div><br>
			
			<div class="row"> 
				<div class="col-md-1"></div>
				<div class="col-md-2" style="text-align:right; padding-top:7px;" >
					<label class="control-label fontH" for="adminPw">비밀번호</label>
				</div>
				<div class="col-md-7">
					<input type="password" class="form-control fontH" id="adminPw" name="adminPw" style="background-color:white;" readonly>
				</div>
				<div class="col-md-1"></div>
			</div><br>
			
			<div class="row"> 
				<div class="col-md-1"></div>
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="adminPhone">휴대전화</label>
				</div>
				<div class="col-md-7">
					<input type="text" class="form-control fontH" id="adminPhone" name="adminPhone" value="${adminJoin.adminPhone}" style="background-color:white;"autocomplete="off" readonly>
				</div>
				<div class="col-md-1"></div>
			</div><br>
			
			<div class="row"> 
				<div class="col-md-1"></div>
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="adminEmail">이메일</label>
				</div>
				<div class="col-md-7">
					<input type="email" class="form-control fontH" id="adminEmail" name="adminEmail" value="${adminJoin.adminEmail}" style="background-color:white;"autocomplete="off" readonly>
				</div>
				<div class="col-md-1"></div>
			</div><br><br>
			
			<div style="text-align:center;">	
				<a href="/camping/admin/member/mypageDelete?id=${adminJoin.adminId}"> 
		       		<button id="delete" type="button" class="btn11 btn-primary11 fontH" >회원탈퇴</button>
		        </a>		
				<a href="/camping/admin/member/mypageModify?id=${adminJoin.adminId}"> 
		       		<button type="button" class="btn11 btn-primary11 fontH" style="margin-left:20px">회원정보수정</button>
		        </a>			
			</div>
		</form>
	</div>
	
	<!-- mask -->
	<script>
		$(document).ready(function(){
			  $('#adminPhone').mask('(000)-0000-0000', {placeholder: "(___)-____-____"});	
		});
		
		$(document).ready(function(){
			  
			  $('#delete').click(function() {
			       var str = document.getElementById('formId');
			       str.submit();
			       
			       if (confirm("정말 탈퇴하시겠습니까?") == true){    //확인
			    	   alert("회원탈퇴가 성공적으로 완료되었습니다."); 
			    	   document.form.submit();
			    	    
			    	}else{   //취소
			    	    return false;
			    	}
			    });
		});
	</script>
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>