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
	
	<!-- mask -->
	<script>
		$(document).ready(function(){
			  $('#birth').mask('0000/00/00',{placeholder: "yyyy/mm/dd"});			/* ,{placeholder: "__/__/____"} */
			  $('#phone').mask('(000)-0000-0000', {placeholder: "(___)-____-____"});		/* , {placeholder: "(___)-____-____"} */
		});
	</script>
	
	<!-- 회원가입 유효성 검사 -->
    <script>
		$(function() {
			$("form")
				.validate( {
					rules : {
						id : {
							required : true,
							minlength : 4,
							regex : /^[[A-Za-z]\w{4,9}$/
						},
						pw : {
							required : true,
							minlength : 8,
							regex : /^(?=\w{8,20})(\w*((\d[a-zA-Z])|([a-zA-Z]\d))\w*)$/
						},
						pw_chk : {
							required : true,
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
					id : {
						required : "필수로입력하세요",
						minlength : "최소 4글자이상이어야 합니다",
						regex : "아이디는 영문자와 숫자로 이루어져 있으며,첫글자는 알파벳이고 5~10자 이어야 합니다."
					},
					pw : {
						required : "필수로입력하세요",
						minlength : "최소 8글자이상이어야 합니다",
						regex : "비밀번호는 영문자와 숫자가 1개이상 포함되어 있어야 하며, 8~20자 이어야 합니다."
					},
					pw_chk : {
						required : "필수로입력하세요",
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
	</script>
    
    
    <!-- 아이디 중복체크 -->
    <!-- <script type="text/javascript">
    
		//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
		var idck = 0;
		
		$(function() {
			
		    //idck 버튼을 클릭했을 때 
		    $("#idck").click(function() {
		        
		        //userid 를 param.
		        var id =  $("#id").val(); 
		        
		        $.ajax({
		            async: true,
		            type : 'POST',
		            data : id,
		            url : "idcheck.do",
		            dataType : "json",
		            contentType: "application/json; charset=UTF-8",
		            success : function(data) {
		                if (data.cnt > 0) {
		                    
		                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
		                    //아이디가 존재할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
		                    $("#divInputId").addClass("has-error")
		                    $("#divInputId").removeClass("has-success")
		                    $("#id").focus();
		                    
		                
		                } else {
		                    alert("사용가능한 아이디입니다.");
		                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
		                    $("#divInputId").addClass("has-success")
		                    $("#divInputId").removeClass("has-error")
		                    $("#name").focus();
		                    //아이디가 중복하지 않으면  idck = 1 
		                    idck = 1;
		                    
		                }
		            },
		            error : function(error) {
		                
		                alert("error : " + error);
		            }
		        });
		    });
		});
	 
	</script> -->
    
   	<!-- 아이디 중복체크 -->
	<script>
	 function chkDupId(){
		 
		  var prmId = $('#id').val();
		  
		  if($("#id").val() == ''){alert('ID를 입력해주세요.'); return;}
		  
		  $.ajax({
		     type : 'POST',  
		     data:"prmId="+ prmId,
		     dataType : 'text',
		     url : '/chkDupId.do',  
		     success : function(rData, textStatus, xhr) {
		      var chkRst = rData;
		      if(chkRst == 0){
		       alert("사용가능한 ID 입니다.");
		       $("#idChk").val('Y');
		      }else{
		       alert("입력하신 ID는 이미 사용중 입니다.");
		       $("#idChk").val('N');
		      }
		     },
		     error : function(xhr, status, e) {  
		      alert(e);
		     }
		  });  
	 }
		
	 function insertChk(){
		  
		  var frm = document.companyForm; 
		  
		  if(!chkVal('id','아이디'))return false;
		  if($("#idChk").val() == 'N'){alert('ID중복확인을 해주세요.'); return;}
	 }

	</script>
    
    
    <!-- 우편번호조회 -->
    <script>
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
	                document.getElementById('address2').focus();
	            }
	        }).open();
	    }
	</script>
    
	
	<style type="text/css">
	
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
	
	
	<div class="container" style="height:1300px">	
		<br><br><br><br>
		
		<!-- <p style="text-align:center; font-family:Meiryo; color: #343a40; text-decoration:underline; font-size:18px;">NOTICE</p><br> -->
		<h3 style="text-align:center; font-family:Segoe Print;">Join</h3> <br><br>
		
		<form method="post" id="formId">
			<div class="row"> 
				<div class="col-md-1"></div>
				
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="id">아이디<b style="color: red;">&nbsp;*</b></label>
				</div>
				
				<div class="col-md-6">
					<input type="text" class="form-control fontH" id="id" name="id" autocomplete="off" style="width:540px;" tabindex=1>
				</div>
					
				<div class="col-md-2">
					<input type="hidden" id="idChk" value="N" /><!-- ID체크 했는지, 안했는지. -->
					<button type="button" class="btn22 btn-primary22 fontH" style="margin-left:-33px; width:100px;" onclick="javascript:chkDupId()">중복확인</button>
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
					<input type="text" class="form-control fontH" id="name" name="name" autocomplete="off" tabindex=2>
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
					<input type="radio"  name="gender" value="male" style="font-size:13px; margin-top:12px;" checked>&nbsp;남자 &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio"  name="gender" value="female" style="font-size:13px; margin-top:12px;">&nbsp;여자
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
					<input type="password" class="form-control fontH" id="pw" name="pw" tabindex=3>
				</div>
				
				<div class="col-md-1"></div>
			</div>
			<br>
			
			
			<div class="row"> 
				<div class="col-md-1"></div>
				
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="pw_chk">비밀번호확인<b style="color: red;">&nbsp;*</b></label>
				</div>
				
				<div class="col-md-7">
					<input type="password" class="form-control fontH" id="pw_chk" name="pw_chk" tabindex=4>
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
					<input type="text" class="form-control fontH" id="birth" name="birth" autocomplete="off" tabindex=5> 
				</div>
				<div class="col-md-1"></div>
			</div>
			<br>
			
			<div class="row"> 
				<div class="col-md-1"></div>
				
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="phone">전화번호<b style="color: red;">&nbsp;*</b></label>
				</div>
				
				<div class="col-md-7">
					<input type="text" class="form-control fontH" id="phone" name="phone" autocomplete="off" tabindex=6>
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
					<input type="email" class="form-control fontH" id="email" name="email" autocomplete="off" tabindex=7>
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
						<div class="col-md-3"><input type="text" class="form-control fontH" id="postcode" placeholder="우편번호" ></div>
						<div class="col-md-3"><input type="button" class="btn22 btn-primary22 fontH" style="width:105px; margin-left:-20px;" onclick="openPostcode()" value="우편번호 >"></div>
						<div class="col-md-6"></div>
					</div><br>
					
					
					<input type="text" class="form-control fontH" autocomplete="off" id="address" placeholder="주소"><br>
					<input type="text" class="form-control fontH" autocomplete="off" id="address2" placeholder="상세주소">
				</div>
				
				<div class="col-md-1"></div>
			</div>
			<br><br>
			
				<!-- <label for="num">첨부파일:</label> -->
				
			<div style="text-align:center;">			
				<a href="/camping"> 
		       		<button type="button" class="btn11 btn-primary11 fontH" style="margin-left:10px">취소</button>
		        </a>			
				<a href="/camping/member/join"> 
		       		<button type="submit" class="btn11 btn-primary11 fontH" style="margin-left:10px">완료</button>
		        </a>			
			</div>
					
		</form>
	</div>
	
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>