<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
	
	
	<div class="container">
		<div class="row">
            <div class="col-md-12">
            	<form>
                    <div>
                        <div>
                            <br><br><br>
                            <h3 style="text-align:center;">WELCOME</h3>
                            <br><br>
                        </div>
                        
                        
                        <div >  
                            <div class="form-group" >
                                <div class="col-md-6 col-xs-12">                                            
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="ID"/>
                                    </div>                                            
                                </div>
                            </div>
                            
                            <div class="form-group" >
                                <div class="col-md-6 col-xs-12">                                            
                                    <div class="input-group">
                                        <input type="password" class="form-control" placeholder="PASSWORD"/>
                                    </div>                                            
                                </div>
                            </div>
                            
                        </div>
                        <div class="panel-footer">
                            <button class="btn btn-primary pull-right">로그인</button>
                        </div>
                    </div>
                    </form>
            	
            	
				            
            </div>
		</div>
	</div>
	

	<%-- <!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer --> --%>
	
</body>
</html>