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
		.btn11 {
		  background-color: #090;
		  border: 0px;
		  font-size: 17px;
		  padding: 0px 15px;
		  line-height: 30px;
		  font-weight: 800;
		  color:white; 
		  width:130px; 
		  height:35px;
		  text-align:center;
		  -moz-border-radius: 0px;
		  -webkit-border-radius: 0px;
		  border-radius: 25px;
		  -webkit-transition: all 200ms ease;
		  -moz-transition: all 200ms ease;
		  -ms-transition: all 200ms ease;
		  -o-transition: all 200ms ease;
		  transition: all 200ms ease;
		}
		.btn11:hover {
		  background-color: #fff;
		  border: 1px #090 solid;
		  font-size: 17px;
		  padding: 0px 15px;
		  line-height: 30px;
		  font-weight: 800;
		  color:#090; 
		  width:130px; 
		  height:35px;
		  text-align:center;
		  -moz-border-radius: 0px;
		  -webkit-border-radius: 0px;
		  border-radius: 25px;
		  -webkit-transition: all 200ms ease;
		  -moz-transition: all 200ms ease;
		  -ms-transition: all 200ms ease;
		  -o-transition: all 200ms ease;
		  transition: all 200ms ease;
		}
		.btn22 {
		  background-color: #fff;
		  border-color: #000;
		  font-size: 15px;
		  padding: 4px 15px;
		  line-height: 25px;
		  font-weight: 400;
		  color:black; 
		  height:36px;
		  border-width:1px;
		  text-align:center;
		  -moz-border-radius: 0px;
		  -webkit-border-radius: 0px;
		  border-radius: 4px;
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
	
	<div class="container fontH">	<br><br><br><br>
		<h3 style="text-align:center;">관리자회원가입</h3> <br><br>
		
		<form method="post" id="formId">
			<div style="border:#C5C6C7 1px solid; border-top:#090 3px solid; ">
				<div class="row" style="margin-top:60px;"> 
					<div class="col-md-1"></div>
					<div class="col-md-2" style="text-align:right; padding-top:7px;">
						<label class="control-label fontH" for="adminId">아이디<b style="color: red;">&nbsp;*</b></label>
					</div>
					<div class="col-md-6">
						<input type="text" class="form-control fontH" id="adminId" name="adminId" autocomplete="off" style="width:540px;" tabindex=1>
					</div>
					<div class="col-md-2">
						<button type="button" class="btn22 fontH" id="dup" style="margin-left:-33px; width:100px;" >중복확인</button>
					</div>
					<div class="col-md-1"></div>
				</div><br>
				
				<div class="row"> 
					<div class="col-md-1"></div>
					<div class="col-md-2" style="text-align:right; padding-top:7px;">
						<label class="control-label fontH" for="adminName">이름<b style="color: red;">&nbsp;*</b></label>
					</div>
					<div class="col-md-7">
						<input type="text" class="form-control fontH" id="adminName" name="adminName" autocomplete="off" tabindex=2>
					</div>
					<div class="col-md-1"></div>
				</div><br>
				
				
				<div class="row"> 
					<div class="col-md-1"></div>
					<div class="col-md-2" style="text-align:right; padding-top:7px;" >
						<label class="control-label fontH" for="adminPw">비밀번호<b style="color: red;">&nbsp;*</b></label>
					</div>
					<div class="col-md-7">
						<input type="password" class="form-control fontH" id="adminPw" name="adminPw" tabindex=3>
					</div>
					<div class="col-md-1"></div>
				</div><br>
				
				<div class="row"> 
					<div class="col-md-1"></div>
					<div class="col-md-2" style="text-align:right; padding-top:7px;">
						<label class="control-label fontH" for="adminPwck">비밀번호확인<b style="color: red;">&nbsp;*</b></label>
					</div>
					<div class="col-md-7">
						<input type="password" class="form-control fontH" id="adminPwck" name="adminPwck" tabindex=4>
					</div>
					<div class="col-md-1"></div>
				</div><br>
				
				<div class="row"> 
					<div class="col-md-1"></div>
					<div class="col-md-2" style="text-align:right; padding-top:7px;">
						<label class="control-label fontH" for="adminPhone">휴대전화<b style="color: red;">&nbsp;*</b></label>
					</div>
					<div class="col-md-7">
						<input type="text" class="form-control fontH" id="adminPhone" name="adminPhone" autocomplete="off" tabindex=5>
					</div>
					<div class="col-md-1"></div>
				</div><br>
				
				<div class="row" style="margin-bottom:15px;"> 
					<div class="col-md-1"></div>
					<div class="col-md-2" style="text-align:right; padding-top:7px;">
						<label class="control-label fontH" for="adminEmail">이메일<b style="color: red;">&nbsp;*</b></label>
					</div>
					<div class="col-md-7">
						<input type="email" class="form-control fontH" id="adminEmail" name="adminEmail" autocomplete="off" tabindex=6>
					</div>
					<div class="col-md-1"></div>
				</div><br><br>
			</div>	
			<div style="text-align:center; margin-top:30px;">			
				<a href="/camping"> 
		       		<button type="button" class="btn11 fontH" style="margin-left:10px">취소</button>
		        </a>			
				<a href="/camping/admin/member/join"> 
		       		<button type="submit" class="btn11 fontH" style="margin-left:10px" id="save">완료</button>
		        </a>			
			</div>
		</form>
	</div>
	
	<!-- mask -->
	<script>
		$(document).ready(function(){
			  $('#adminPhone').mask('(000)-0000-0000', {placeholder: "(___)-____-____"});	
			  
			  $('#save').click(function() {
			       var str = document.getElementById('formId');
			       str.submit();
			       alert("회원가입이 성공적으로 완료되었습니다.");
			    });
		});

		/*아이디중복검사 */
		$("#dup").on("click",function(){
			var adminId = $("#adminId").val();			
			
			if($("#adminId").val() == ''){alert('ID를 입력해주세요.'); return;}
			
			$.ajax({
				async:true,
				type:'POST',
				data:adminId,
				url:"/camping/admin/member/dup",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
					if(data.cnt > 0){
						alert("입력하신 아이디는 이미 존재합니다.");
					}else{
						alert("입력하신 아이디는 사용 가능합니다.");
					}
				}
			});
		});
		
	/* 회원가입 유효성 검사 */
		$(function() {
			$("form")
				.validate( {
					rules : {
						adminId : {
							required : true,
							minlength : 4,
							regex : /^[[A-Za-z]\w{4,9}$/
						},
						adminPw : {
							required : true,
							minlength : 8,
							regex : /^(?=\w{8,20})(\w*((\d[a-zA-Z])|([a-zA-Z]\d))\w*)$/
						},
						adminPwck : {
							required : true,
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
					adminId : {
						required : "필수로입력하세요",
						minlength : "최소 4글자이상이어야 합니다",
						regex : "아이디는 영문자와 숫자로 이루어져 있으며, 첫글자는 알파벳이고 5~10자 이어야 합니다."
					},
					adminPw : {
						required : "필수로입력하세요",
						minlength : "최소 8글자이상이어야 합니다",
						regex : "비밀번호는 영문자와 숫자가 1개이상 포함되어 있어야 하며, 8~20자 이어야 합니다."
					},
					adminPwck : {
						required : "필수로입력하세요",
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