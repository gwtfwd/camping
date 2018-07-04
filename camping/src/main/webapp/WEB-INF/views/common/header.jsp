<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>


	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>camping information</title>

	<link rel="icon" href="favicon.ico" type="image/x-icon" />
	
    <!-- Bootstrap core CSS -->
    <link href="<c:url value ='/resources/vendor/bootstrap/css/bootstrap.css'/>" rel="stylesheet">
    

    <!-- Custom styles for this template -->
    <link href="<c:url value ='/resources/css/half-slider.css'/>" rel="stylesheet">
    
    <!-- icon -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="icon" href="favicon.ico" type="image/x-icon" />
	
	<!-- Bootstrap core JavaScript -->
	<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
	<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.min.js'/>"></script> 
	<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	
	<!-- datatable -->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">



	<nav class="navbar navbar-expand-lg navbar-dark bg-white relative-top" style="border-bottom-style: inset; border-color:#6c757d; border-bottom-width:thin;">
      <div class="container">
        <div class="collapse navbar-collapse" id="navbarResponsive" >
	          <ul class="navbar-nav mr-auto menubar">
	          	<!-- <li class="nav-item active">
	              <a class="nav-link-en" href="#">HOME
	                <span class="sr-only">(current)</span>
	              </a>
	            </li> -->
	            <li class="nav-item" ><a class="nav-link-kr" href="/camping/board/list" style="margin-left:-45px">공지사항</a></li>
	            <li class="nav-item"><a class="nav-link-kr" href="#" >야영장찾기</a>
	           		  <ul>
			           <li><a href="#" class="nav-link-kr">유형별 찾기</a></li>
			           <li><a href="#" class="nav-link-kr">지역별 찾기</a></li>
			         </ul> 
			    </li>
	            <li class="nav-item"><a class="nav-link-kr" href="#" >이용안내</a>
	            	 <ul>
			           <li><a href="#" class="nav-link-kr">객실정보</a></li>
			           <li><a href="#" class="nav-link-kr">이용요금</a></li>
			         </ul>
			    </li>
	            <li class="nav-item"><a class="nav-link-kr" href="#" >예약안내</a>
	            	 <ul>
			           <li><a href="#" class="nav-link-kr">실시간예약</a></li>
			           <li><a href="#" class="nav-link-kr">예약확인</a></li>
			           <li><a href="#" class="nav-link-kr">예약취소</a></li>
			         </ul> 
			     </li>
	            <li class="nav-item"><a class="nav-link-kr" href="#" >커뮤니티</a>
	            	<ul>
			           <li><a href="#" class="nav-link-kr">고객센터</a></li>
			           <li><a href="#" class="nav-link-kr">이벤트</a></li>
			           <li><a href="#" class="nav-link-kr">야영장후기</a></li>
			           <li><a href="#" class="nav-link-kr">개인결제창</a></li>
			         </ul> 
			    </li>
	          </ul>
          
          <ul class="navbar-nav mc-auto" >
          	<li class="nav-item">
              <a class="nav-link-en1" href="/camping" style="margin-left:-50px">Camping Information</a>
            </li>
          </ul>
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link-en" href="#"  >JOIN</a>
            </li>
            <li class="nav-item">
              <a class="nav-link-en" href="/camping/member/login" >LOGIN</a>
            </li>
            <li class="nav-item">
              <a class="nav-link-en" href="#" >MYPAGE</a>
            </li>
            <li class="nav-item">
             <input type="text" style="width: 110px; border: none; border-bottom-style: inset; margin-left:10px" placeholder="search">
             <a href="#" ><i class="fa fa-search" style="padding: 0.5rem 1rem; margin-bottom: -1px; margin-left: -10px; font-size:21px; margin-right:-50px;"></i></a>
 			</li>         
          </ul>
        </div>
      </div>
    </nav>
    
