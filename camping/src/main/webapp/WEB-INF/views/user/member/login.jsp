<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
   	
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


	<script>
	
		/* 아이디저장 -> 아이디는 서버가 저장하는 것이 아님, 로그인시 아이디저장을 체크했다면 그 아이디는 쿠키파일로 클라이언트 컴퓨터에 저장됨 */
	    window.onload = function() {
	 
	        if (getCookie("id")) { // getCookie함수로 id라는 이름의 쿠키를 불러와서 있을경우
	            document.loginForm.id.value = getCookie("id"); //input 이름이 id인곳에 getCookie("id")값을 넣어줌
	            document.loginForm.idSave.checked = true; // 체크는 체크됨으로
	        }
	 
	    }
	 
	    function setCookie(name, value, expiredays) //쿠키 저장함수
	    {
	        var todayDate = new Date();
	        todayDate.setDate(todayDate.getDate() + expiredays);
	        document.cookie = name + "=" + escape(value) + "; path=/; expires="
	                + todayDate.toGMTString() + ";"
	    }
	 
	    function getCookie(Name) { // 쿠키 불러오는 함수
	        var search = Name + "=";
	        if (document.cookie.length > 0) { // if there are any cookies
	            offset = document.cookie.indexOf(search);
	            if (offset != -1) { // if cookie exists
	                offset += search.length; // set index of beginning of value
	                end = document.cookie.indexOf(";", offset); // set index of end of cookie value
	                if (end == -1)
	                    end = document.cookie.length;
	                return unescape(document.cookie.substring(offset, end));
	            }
	        }
	    }
	 
	    function sendit() {
	        var frm = document.loginForm;
	        if (!frm.id.value) { //아이디를 입력하지 않으면.
	            alert("아이디를 입력 해주세요!");
	            frm.id.focus();
	            return;
	        }
	        if (!frm.pw.value) { //패스워드를 입력하지 않으면.
	            alert("패스워드를 입력 해주세요!");
	            frm.pw.focus();
	            return;
	        }
	 
	        if (document.loginForm.idSave.checked == true) { // 아이디 저장을 체크 하였을때
	            setCookie("id", document.loginForm.id.value, 7); //쿠키이름을 id로 아이디입력필드값을 7일동안 저장
	        } else { // 아이디 저장을 체크 하지 않았을때
	            setCookie("id", document.loginForm.id.value, 0); //날짜를 0으로 저장하여 쿠키삭제
	        }
	 
	        document.loginForm.submit(); //유효성 검사가 통과되면 서버로 전송.
	 
	    }
	    
	    
	    
	    /* 아이디찾기 */
	    function openfindId(){  
		    window.open("/camping/member/login/findId",'_blank','toolbar=no,location=no,status=no, menubar=no, scrollbars=auto, width=490, height=530, top=100, left=100');  
		} 

	    /* 비밀번호찾기 */
	    function openfindPw(){  
		    window.open("/camping/member/login/findPw",'_blank','toolbar=no,location=no,status=no, menubar=no, scrollbars=auto, width=490, height=530, top=100, left=100');  
		} 


	    
	    
	    
	</script>


</head>
<body>
	
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
	
	
	<div class="container" style="height:800px">
		<div class="row">
		
			<div class="col-md-3"></div>
			
            <div class="col-md-6">
            	<form method="post" id="loginForm" name="loginForm" >
                    <div>
                        <div>
                            <br><br><br><br><br><br><br><br>
                            <h3 style="text-align:center; font-family:Segoe Print;">welcome</h3>
                            <br><br>
                        </div>
                        
                        
                        <div >  
                            <div class="form-group" >
                                <div class="col-md-12">                                            
                                    <div class="input-group">
                                        <input type="text" id="id" name="id" class="form-control" placeholder="ID" autocomplete="off"/>
                                    </div>                                            
                                </div>
                            </div>
                            
                            <div class="form-group" >
                                <div class="col-md-12 ">                                            
                                    <div class="input-group">
                                        <input type="password" id="pw" name="pw" class="form-control" placeholder="PASSWORD"/>
                                    </div>                                            
                                </div>
                            </div>
                            
                            <div class="col-md-12 fontH" style="font-size:13px;">                                                                                                                                        
                                <input type="checkbox" name="idSave" value="saveOk"/> 아이디 저장
                            </div>
                        
                            
                            <div class="col-md-12">
                            	<a href="/camping/member/login"><button type="submit" onclick="sendit()" class="btn11 btn-primary11 pull-right fontH">Login</button></a>
                        	</div>
                        	
                        	<div class="form-group">
                        		<br>
                                <label ><a href="#" onClick="javascript:openfindId();" class="col-md-3 col-xs-12 control-label fontH" style="font-size:13px; color:black;">아이디 찾기</a></label><br>
                                <label ><a href="#" onClick="javascript:openfindPw();" class="col-md-3 col-xs-12 control-label fontH" style="font-size:13px; color:black;">비밀번호 찾기</a></label>
                            </div>
                        	
                        	<div class="col-md-12 fontH" style="font-size:13px;">                                                                                                                                        
                                <label style="vertical-align: bottom;">아직 회원이 아니신가요?</label>
                               <a href="/camping/selectJoin"> <button type="button" class="btn11 btn-primary11 pull-right">Join</button></a>
                            </div>
                        </div>
                   	</div>
                   	
                 </form>
            </div>
            
            <div class="col-md-3"></div>
		</div>
	</div>
	

	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer --> 
	
</body>
</html>