<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<base href="http://localhost:8080/">
	
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
	
	.btn-primary22 {
	  background-color: #fff;
	  border-color: #000;
	}
	
	.btn22 {
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
	
	
	<div class="container">	
		<br><br><br><br>
		
		<!-- <p style="text-align:center; font-family:Meiryo; color: #343a40; text-decoration:underline; font-size:18px;">NOTICE</p><br> -->
		<h4 class="fontH" style="text-align:center;">회원정보수정</h4> <br><br>
		
		<form method="post" id="formId">
			<div class="row"> 
				<div class="col-md-1"></div>
				
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="id">아이디</label>
				</div>
				
				<div class="col-md-7">
					<input type="text" class="form-control fontH" id="id" name="id" value="${join.id }" autocomplete="off" readonly>
				</div>
				<div class="col-md-1"></div>
			</div>
			<br>
			
			<div class="row"> 
				<div class="col-md-1"></div>
				
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="name">이름<b style="color: red;">&nbsp;*</b></label>
				</div>
				
				<div class="col-md-7">
					<input type="text" class="form-control fontH" id="name" name="name" autocomplete="off" value="${join.name}" tabindex=1>
				</div>
				
				<div class="col-md-1"></div>
			</div>
			<br>
			
			<div class="row"> 
				<div class="col-md-1"></div>
				
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="gender">성별<b style="color: red;">&nbsp;*</b></label>
				</div>
				
				<div class="col-md-7">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio"  name="gender" value="male" style="font-size:13px; margin-top:12px;" <c:out value="${join.gender.compareTo('male')==0?'checked':'' }"/> >&nbsp;남자 &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio"  name="gender" value="female" style="font-size:13px; margin-top:12px;" <c:out value="${join.gender.compareTo('female')==0?'checked':'' }"/>>&nbsp;여자
				</div>
				<div class="col-md-1"></div>
			</div>
			<br>
			
			
			<div class="row"> 
				<div class="col-md-1"></div>
				
				<div class="col-md-2" style="text-align:right; padding-top:7px;" >
					<label class="control-label fontH" for="pw">비밀번호<b style="color: red;">&nbsp;*</b></label>
				</div>
				
				<div class="col-md-7">
					<input type="password" class="form-control fontH" id="pw" name="pw" tabindex=2>
				</div>
				
				<div class="col-md-1"></div>
			</div>
			<br>
			
			
			<div class="row"> 
				<div class="col-md-1"></div>
				
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="pwck">비밀번호확인<b style="color: red;">&nbsp;*</b></label>
				</div>
				
				<div class="col-md-7">
					<input type="password" class="form-control fontH" id="pwck" name="pwck" tabindex=3>
				</div>
				
				<div class="col-md-1"></div>
			</div>
			<br>
			
			
			<div class="row"> 
				<div class="col-md-1"></div>
				
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="phone">휴대전화<b style="color: red;">&nbsp;*</b></label>
				</div>
				
				<div class="col-md-7">
					<input type="text" class="form-control fontH" id="phone" name="phone" autocomplete="off" value="${join.phone}" tabindex=4>
				</div>
	
				<div class="col-md-1"></div>
			</div>
			<br>
			
			
			<div class="row"> 
				<div class="col-md-1"></div>
				
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="email">이메일<b style="color: red;">&nbsp;*</b></label>
				</div>
				
				<div class="col-md-7">
					<input type="email" class="form-control fontH" id="email" name="email" autocomplete="off" value="${join.email}" tabindex=5>
				</div>
				
				<div class="col-md-1"></div>
			</div>
			<br>
			
			
			<div class="row"> 
				<div class="col-md-1"></div>
				
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="birth">생년월일</label>
				</div>
				
				<div class="col-md-7">
					<input type="text" class="form-control fontH" id="birth" name="birth" autocomplete="off" value="${join.birth}" tabindex=7> 
				</div>
				<div class="col-md-1"></div>
			</div>
			<br>
			
			
			<div class="row"> 
				<div class="col-md-1"></div>
				
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="address">주소</label>
				</div>
				
				<div class="col-md-7">
					<!-- <input type="text" class="form-control fontH" id="address" name="address" autocomplete="off" tabindex=8> -->
					<div class="row">
						<div class="col-md-3"><input type="text" class="form-control fontH" id="postcode" name="postcode" onclick="openPostcode()" value="${join.postcode}" placeholder="우편번호" ></div>
						<div class="col-md-3"><input type="button" class="btn22 btn-primary22 fontH" style="width:105px; margin-left:-20px;" onclick="openPostcode()" value="우편번호 >"></div>
						<div class="col-md-6"></div>
					</div><br>
					
					
					<input type="text" class="form-control fontH" autocomplete="off" id="address" name ="address" value="${join.address}" placeholder="주소"><br>
					<input type="text" class="form-control fontH" autocomplete="off" id="address_detail" name="address_detail" value="${join.address_detail}" placeholder="상세주소">
				</div>
				
				<div class="col-md-1"></div>
			</div>
			<br><br>
			
				
			<div style="text-align:center;">			
				<a href="/camping/member/mypageDetail"> 
		       		<button type="button" class="btn11 btn-primary11 fontH" style="margin-left:10px">취소</button>
		        </a>			
				<a href="/camping/member/mypageModify"> 
		       		<button type="submit" class="btn11 btn-primary11 fontH" style="margin-left:10px" id="modify">완료</button>
		        </a>			
			</div>
					
		</form>
	</div>
	
	
	<!-- mask -->
	<script>
		$(document).ready(function(){
			
			  $('#birth').mask('0000/00/00',{placeholder: "yyyy/mm/dd"});			
			  $('#phone').mask('(000)-0000-0000', {placeholder: "(___)-____-____"});	
			  
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
						pw : {
							minlength : 8,
							regex : /^(?=\w{8,20})(\w*((\d[a-zA-Z])|([a-zA-Z]\d))\w*)$/
						},
						pw_chk : {
							equalTo : pw
						},
						name : {
							required : true,
							minlength : 2
						},
						phone : {
							required : true,
						},
						email : {
							required : true,
							email : true
						}
				},
				
				//규칙체크 실패시 출력될 메시지
				messages : {
					pw : {
						minlength : "최소 8글자이상이어야 합니다",
						regex : "비밀번호는 영문자와 숫자가 1개이상 포함되어 있어야 하며, 8~20자 이어야 합니다."
					},
					pw_chk : {
						equalTo : "비밀번호가 일치하지 않습니다."
					},
					name : {
						required : "필수로입력하세요",
						minlength : "최소 2글자이상이어야 합니다"
					},
					phone : {
						required : "필수로입력하세요",
					},
					email : {
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
    
    
    
    
    /* 우편번호조회 */
	    function openPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수
	
	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;
	
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('address').value = fullAddr;
	
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById('address_detail').focus();
	            }
	        }).open();
	    }
	</script>
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>