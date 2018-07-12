<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

	<!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
	
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="<c:url value='/resources/vendor/jquery/jquery.mask.js'/>"></script>

	
	<script>
		$(document).ready(function(){
			  $('#birth').mask('0000/00/00',{placeholder: "yyyy/mm/dd"});			/* ,{placeholder: "__/__/____"} */
			  $('#phone').mask('(000)-0000-0000', {placeholder: "(___)-____-____"});		/* , {placeholder: "(___)-____-____"} */
		});
	</script>
	
	<!-- <script>
		function phoneFomatter(num,type){
		    
		    var formatNum = '';
		    
		    if(num.length==11){
		        if(type==0){
		            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-****-$3');
		        }else{
		            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
		        }
		    }else if(num.length==8){
		        formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
		    }else{
		        if(num.indexOf('02')==0){
		            if(type==0){
		                formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-****-$3');
		            }else{
		                formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
		            }
		        }else{
		            if(type==0){
		                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-***-$3');
		            }else{
		                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
		            }
		        }
		    }
		    return formatNum;
		    
		}
	</script> -->
	
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
	  width:100px; 
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
	
	
	<div class="container" style="height:950px">	
		<br><br><br><br>
		
		<!-- <p style="text-align:center; font-family:Meiryo; color: #343a40; text-decoration:underline; font-size:18px;">NOTICE</p><br> -->
		<h3 style="text-align:center; font-family:Segoe Print;">Join</h3> <br><br>
		
		<form method="post" id="formId">
			<div class="row"> 
				<div class="col-md-1"></div>
				
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="id">���̵�</label>
				</div>
				
				<div class="col-md-7">
					<input type="text" class="form-control fontH" id="id" name="id" autocomplete="off" onchange="validationId(this)">
					<div class="fontH" style="color:#000; display:none;" id="inforId">
						���̵�� �����ڿ� ���ڷ� �̷���� ������, 5~10�� �̾�� �մϴ�.
					</div>
				</div>
					
				<div class="col-md-1">
					<button type="button" class="btn22 btn-primary22 fontH" style="margin-left:-10px">�ߺ�Ȯ��</button>
				</div>
			</div>
			<br>
			
			<div class="row"> 
				<div class="col-md-1"></div>
				
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="name">�̸�</label>
				</div>
				
				<div class="col-md-7">
					<input type="text" class="form-control fontH" id="name" name="name" autocomplete="off">
				</div>
				
				<div class="col-md-1"></div>
			</div>
			<br>
			
			<div class="row"> 
				<div class="col-md-1"></div>
				
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="birth">����</label>
				</div>
				
				<div class="col-md-7">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="gender" value="male" style="font-size:13px; margin-top:12px;">&nbsp;���� &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="gender" value="female" style="font-size:13px; margin-top:12px;">&nbsp;����
				</div>
				<div class="col-md-1"></div>
			</div>
			<br>
			
			
			<div class="row"> 
				<div class="col-md-1"></div>
				
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="pw">��й�ȣ</label>
				</div>
				
				<div class="col-md-7">
					<input type="password" class="form-control fontH" id="pw" name="pw" onchange="validationPw(this)">
					<div class="fontH" style="color:#000; display:none;" id="inforPw">
						��й�ȣ�� �����ڿ� ���ڰ� 1���̻� ���ԵǾ� �־�� �ϸ�, 8~20�� �̾�� �մϴ�.
					</div>
				</div>
				
				<div class="col-md-1"></div>
			</div>
			<br>
			
			
			<div class="row"> 
				<div class="col-md-1"></div>
				
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="pw_chk">��й�ȣȮ��</label>
				</div>
				
				<div class="col-md-7">
					<input type="password" class="form-control fontH" id="pw_chk" name="pw_chk" onchange="validationPw_chk(this)">
					<div class="fontH" style="color:#000; display:none;" id="inforPw_chk">
						��й�ȣ�� ��ġ���� �ʽ��ϴ�.
					</div>
				</div>
				
				<div class="col-md-1"></div>
			</div>
			<br>
			
			
			<div class="row"> 
				<div class="col-md-1"></div>
				
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="birth">�������</label>
				</div>
				
				<div class="col-md-7">
					<input type="text" class="form-control fontH" id="birth" name="birth" autocomplete="off" > 
				</div>
				<div class="col-md-1"></div>
			</div>
			<br>
			
			<div class="row"> 
				<div class="col-md-1"></div>
				
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="phone">��ȭ��ȣ</label>
				</div>
				
				<div class="col-md-7">
					<input type="text" class="form-control fontH" id="phone" name="phone" autocomplete="off" >
				</div>
	
				<div class="col-md-1"></div>
			</div>
			<br>
			
			
			<div class="row"> 
				<div class="col-md-1"></div>
				
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="email">�̸���</label>
				</div>
				
				<div class="col-md-7">
					<input type="email" class="form-control fontH" id="email" name="email" autocomplete="off">
				</div>
				
				<div class="col-md-1"></div>
			</div>
			<br>
			
			
			<div class="row"> 
				<div class="col-md-1"></div>
				
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="address">�ּ�</label>
				</div>
				
				<div class="col-md-7">
					<input type="text" class="form-control fontH" id="address" name="address" autocomplete="off"><br>
					<input type="text" class="form-control fontH" id="address" name="address" autocomplete="off">
				</div>
				
				<div class="col-md-1"></div>
			</div>
			<br><br>
			
				<!-- <label for="num">÷������:</label> -->
				
			<div style="text-align:center;">			
				<a href="/camping"> 
		       		<button type="button" class="btn11 btn-primary11 fontH" style="margin-left:10px">���</button>
		        </a>			
				<a href="/camping/member/join"> 
		       		<button type="submit" class="btn11 btn-primary11 fontH" style="margin-left:10px">�Ϸ�</button>
		        </a>			
			</div>
					
		</form>
	</div>
	
	
	<script >
		function validationId(id){
			
			var inforId = document.getElementById('inforId');
			var idText = id.value;
			var idRegex = /^\w{5,10}$/;
			inforId.style.display = 'none';

			if (idText != null && idRegex.test(idText)){
				return true;
			}
			else {
				inforId.style.display = 'block';
				return false;
			}
		}
		
		function validationPw(pw){
			
			var inforPw = document.getElementById('inforPw');
			var pwText = pw.value;
			var pwRegex = /^(?=\w{8,20})(\w*((\d[a-zA-Z])|([a-zA-Z]\d))\w*)$/;
			inforPw.style.display = 'none';
			
			if (pwText != null && pwRegex.test(pwText)){
				return true;
			}
			else {
				inforPw.style.display = 'block';
				return false;
			}
		}
		
		function validationPw_chk(pw,pw_chk){
			
			var inforPw = document.getElementById('inforPw');
			var inforPw_chk = document.getElementById('inforPw_chk');
			var pwText = pw.value;
			var pw_chkText = pw_chk.value;
			inforPw.style.display = 'none';
			
			if (pwText == pw_chkText)){
				return true;
			}
			else {
				inforPw.style.display = 'block';
				return false;
			}
		}
	
		
		var formId = document.getElementById('formId');
		formId.onsubmit = function(){
			
			var id = document.getElementById('id');							/* id�� pw�� input�±��� id�� */
			var pw = document.getElementById('pw');					
			var pw_chk = document.getElementById('pw_chk');					
			var isOK = true;												// ������ �Ұ��� ������ �����ϴ� ����
			
			if (!validationId(id)){
				isOK = false;
			}

			if (!validationPw(pw)){
				isOK = false;
			}
			if (!validationPw(pw_chk)){
				isOK = false;
			}
			if(!isOK){
				return false;
			}
			return true;
			
		}
		
		
		
	</script>
	
	
		
				
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>