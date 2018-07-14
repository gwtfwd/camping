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



</head>
<body>
	
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
	
	
	<div class="container" style="height:800px">
		<div class="row">
		
			<div class="col-md-3"></div>
			
            <div class="col-md-6">
            	<form method="post">
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
                                <input type="checkbox" value="chkId"/> 아이디 저장
                            </div>
                        
                            
                            <div class="col-md-12">
                            	<a href="/camping/member/login"><button type="submit" class="btn11 btn-primary11 pull-right fontH">Login</button></a>
                        	</div>
                        	
                        	<div class="form-group">
                        		<br>
                                <label ><a href="#" class="col-md-3 col-xs-12 control-label fontH" style="font-size:13px; color:black;">아이디 찾기</a></label><br>
                                <label ><a href="#" class="col-md-3 col-xs-12 control-label fontH" style="font-size:13px; color:black;">비밀번호 찾기</a></label>
                            </div>
                        	
                        	<div class="col-md-12 fontH" style="font-size:13px;">                                                                                                                                        
                                <label style="vertical-align: bottom;">아직 회원이 아니신가요?</label>
                               <a href="/camping/member/join"> <button type="button" class="btn11 btn-primary11 pull-right">Join</button></a>
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