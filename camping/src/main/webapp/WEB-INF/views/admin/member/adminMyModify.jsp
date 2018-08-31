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
		<h3 class="fontH" style="text-align:center;">회원정보수정</h3> <br><br>
		
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
					<label class="control-label fontH" for="adminName">이름<b style="color: red;">&nbsp;*</b></label>
				</div>
				<div class="col-md-7">
					<input type="text" class="form-control fontH" id="adminName" name="adminName" value="${adminJoin.adminName}" style="background-color:white;"autocomplete="off">
				</div>
				<div class="col-md-1"></div>
			</div><br>
			
			<div class="row"> 
				<div class="col-md-1"></div>
				<div class="col-md-2" style="text-align:right; padding-top:7px;" >
					<label class="control-label fontH" for="adminPw">비밀번호<b style="color: red;">&nbsp;*</b></label>
				</div>
				<div class="col-md-7">
					<input type="password" class="form-control fontH" id="adminPw" name="adminPw" style="background-color:white;">
				</div>
				<div class="col-md-1"></div>
			</div><br>
			
			<div class="row"> 
				<div class="col-md-1"></div>
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="adminPwck">비밀번호확인<b style="color: red;">&nbsp;*</b></label>
				</div>
				<div class="col-md-7">
					<input type="password" class="form-control fontH" id="adminPwck" name="adminPwck" tabindex=3>
				</div>
				<div class="col-md-1"></div>
			</div><br>
			
			<div class="row"> 
				<div class="col-md-1"></div>
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="adminPhone">휴대전화<b style="color: red;">&nbsp;*</b></label>
				</div>
				<div class="col-md-7">
					<input type="text" class="form-control fontH" id="adminPhone" name="adminPhone" value="${adminJoin.adminPhone}" style="background-color:white;"autocomplete="off">
				</div>
				<div class="col-md-1"></div>
			</div><br>
			
			<div class="row"> 
				<div class="col-md-1"></div>
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="adminEmail">이메일<b style="color: red;">&nbsp;*</b></label>
				</div>
				<div class="col-md-7">
					<input type="email" class="form-control fontH" id="adminEmail" name="adminEmail" value="${adminJoin.adminEmail}" style="background-color:white;"autocomplete="off">
				</div>
				<div class="col-md-1"></div>
			</div><br><br>
			
			<div style="text-align:center;">			
				<a href="/camping/admin/member/mypageDetail"> 
		       		<button type="button" class="btn11 btn-primary11 fontH" style="margin-left:10px">취소</button>
		        </a>			
				<a href="/camping/admin/member/mypageModify"> 
		       		<button type="submit" class="btn11 btn-primary11 fontH" style="margin-left:10px" id="modify">완료</button>
		        </a>			
			</div>
		</form>
	</div>
	
	<!-- mask -->
	<script>
		$(document).ready(function(){
			
			  $('#adminPhone').mask('(000)-0000-0000', {placeholder: "(___)-____-____"});	
			  
			  $('#modify').click(function() {
			       var str = document.getElementById('formId');
			       str.submit();
			       
			       if (confirm("수정하시겠습니까?") == true){    //확인
			    	   alert("회원정보수정이 성공적으로 완료되었습니다."); 
			    	   document.form.submit();
			    	    
			    	}else{   //취소
			    	    return false;
			    	}
			    });
		});
		
	/* 회원가입 유효성 검사 */
		$(function() {
			$("form")
				.validate( {
					rules : {
						adminPw : {
							minlength : 8,
							regex : /^(?=\w{8,20})(\w*((\d[a-zA-Z])|([a-zA-Z]\d))\w*)$/
						},
						adminpwck : {
							equalTo : adminPw
						},
						adminName : {
							required : true,
							minlength : 2
						},
						adminPhone : {
							required : true,
						},
						adminEmail : {
							required : true,
							email : true
						}
				},
				
				//규칙체크 실패시 출력될 메시지
				messages : {
					adminPw : {
						minlength : "최소 8글자이상이어야 합니다",
						regex : "비밀번호는 영문자와 숫자가 1개이상 포함되어 있어야 하며, 8~20자 이어야 합니다."
					},
					adminpwck : {
						equalTo : "비밀번호가 일치하지 않습니다."
					},
					adminName : {
						required : "필수로입력하세요",
						minlength : "최소 2글자이상이어야 합니다"
					},
					adminPhone : {
						required : "필수로입력하세요",
					},
					adminEmail : {
						required : "필수로입력하세요",
						email : "메일규칙에 어긋납니다 ex) camping@gmail.com"
					}
				}
			});
		})
		
		$.validator.addMethod(
				"regex", 
				function(value, element, regexp) {
					var re = new RegExp(regexp);
					return this.optional(element) || re.test(value);
				}, 
				"Please check your input."
		);
	</script>
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>