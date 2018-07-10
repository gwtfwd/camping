<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
			  $('#birth').mask('0000/00/00',{placeholder: "____/__/__"});			/* ,{placeholder: "__/__/____"} */
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
		
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2" style="text-align:right; padding-top:7px;">
				<label class="control-label fontH" for="id">아이디</label>
			</div>
			
			<div class="col-md-7">
				<input type="text" class="form-control fontH" id="id" name="id" autocomplete="off">
			</div>
				
			<div class="col-md-1">
				<button type="button" class="btn22 btn-primary22 fontH" style="margin-left:-10px">중복확인</button>
			</div>
		</div>
		<br>
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2" style="text-align:right; padding-top:7px;">
				<label class="control-label fontH" for="name">이름</label>
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
				<label class="control-label fontH" for="birth">성별</label>
			</div>
			
			<div class="col-md-7">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="gender" value="male" style="font-size:13px; margin-top:12px;">남 &nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="gender" value="female" style="font-size:13px; margin-top:12px;">여
			</div>
			<div class="col-md-1"></div>
		</div>
		<br>
		
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2" style="text-align:right; padding-top:7px;">
				<label class="control-label fontH" for="pw">비밀번호</label>
			</div>
			
			<div class="col-md-7">
				<input type="password" class="form-control fontH" id="pw" name="pw">
			</div>
			
			<div class="col-md-1"></div>
		</div>
		<br>
		
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2" style="text-align:right; padding-top:7px;">
				<label class="control-label fontH" for="pw_chk">비밀번호확인</label>
			</div>
			
			<div class="col-md-7">
				<input type="password" class="form-control fontH" id="pw_chk" name="pw_chk">
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
				<input type="text" class="form-control fontH" id="birth" name="birth" autocomplete="off" > 
			</div>
			<div class="col-md-1"></div>
		</div>
		<br>
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2" style="text-align:right; padding-top:7px;">
				<label class="control-label fontH" for="phone">전화번호</label>
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
				<label class="control-label fontH" for="email">이메일</label>
			</div>
			
			<div class="col-md-7">
				<input type="text" class="form-control fontH" id="email" name="email" autocomplete="off">
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
				<input type="text" class="form-control fontH" id="address" name="address" autocomplete="off"><br>
				<input type="text" class="form-control fontH" id="address" name="address" autocomplete="off">
			</div>
			
			<div class="col-md-1"></div>
		</div>
		<br><br>
		
			<!-- <label for="num">첨부파일:</label> -->
			
		<div style="text-align:center;">			
			<a href="/camping"> 
	       		<button type="button" class="btn11 btn-primary11 fontH" style="margin-left:10px">취소</button>
	        </a>			
			<a href="#"> 
	       		<button type="submit" class="btn11 btn-primary11 fontH" style="margin-left:10px">완료</button>
	        </a>			
		</div>
					
	</div>
		
		
				
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>