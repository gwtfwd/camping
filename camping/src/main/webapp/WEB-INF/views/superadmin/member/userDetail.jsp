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
		<h3 style="text-align:center; font-family:Segoe Print;">User</h3> <br><br>
		
		<form method="post" id="formId">
			
			<div class="row"> 
				<div class="col-md-1"></div>
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="id">아이디</label>
				</div>
				<div class="col-md-7">
					<input type="text" class="form-control fontH" id="id" name="id" autocomplete="off" value="${user.id}" style="background-color:white;"readonly>
				</div>
				<div class="col-md-1"></div>
			</div><br>
			
			<div class="row"> 
				<div class="col-md-1"></div>
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="name">이름</label>
				</div>
				<div class="col-md-7">
					<input type="text" class="form-control fontH" id="name" name="name" value="${user.name}" autocomplete="off" style="background-color:white;"readonly>
				</div>
				<div class="col-md-1"></div>
			</div><br>
			
			<div class="row"> 
				<div class="col-md-1"></div>
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="gender">성별</label>
				</div>
				<div class="col-md-7">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio"  name="gender" value="male" style="font-size:13px; margin-top:12px;" <c:out value="${user.gender.compareTo('male')==0?'checked':'' }"/> disabled>&nbsp;남자 &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio"  name="gender" value="female" style="font-size:13px; margin-top:12px;" <c:out value="${user.gender.compareTo('female')==0?'checked':'' }"/> disabled>&nbsp;여자
				</div>
				<div class="col-md-1"></div>
			</div><br>
			
			<div class="row"> 
				<div class="col-md-1"></div>
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="phone">휴대전화</label>
				</div>
				<div class="col-md-7">
					<input type="text" class="form-control fontH" id="phone" name="phone" value="${user.phone}" autocomplete="off" style="background-color:white;"readonly>
				</div>
				<div class="col-md-1"></div>
			</div><br>
			
			<div class="row"> 
				<div class="col-md-1"></div>
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="email">이메일</label>
				</div>
				<div class="col-md-7">
					<input type="email" class="form-control fontH" id="email" name="email" value="${user.email}" autocomplete="off" style="background-color:white;"readonly>
				</div>
				<div class="col-md-1"></div>
			</div><br>
			
			<div class="row"> 
				<div class="col-md-1"></div>
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="birth">생년월일</label>
				</div>
				<div class="col-md-7">
					<input type="text" class="form-control fontH" id="birth" name="birth" value="${user.birth}" autocomplete="off" style="background-color:white;"readonly> 
				</div>
				<div class="col-md-1"></div>
			</div><br>
			
			<div class="row"> 
				<div class="col-md-1"></div>
				<div class="col-md-2" style="text-align:right; padding-top:7px;">
					<label class="control-label fontH" for="address">주소</label>
				</div>
				<div class="col-md-7">
					<div class="row">
						<div class="col-md-3"><input type="text" class="form-control fontH" id="postcode" name="postcode" value="${user.postcode}" style="background-color:white;"readonly></div>
						<div class="col-md-9"></div>
					</div><br>
					<input type="text" class="form-control fontH" autocomplete="off" id="address" name ="address" value="${user.address}" style="background-color:white;"readonly><br>
					<input type="text" class="form-control fontH" autocomplete="off" id="address_detail" name="address_detail" value="${user.address_detail}" style="background-color:white;"readonly>
				</div>
				<div class="col-md-1"></div>
			</div><br><br>
		</form>
	</div>
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>