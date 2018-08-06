<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>


	<nav class="navbar navbar-expand-lg navbar-dark bg-white relative-top" style="border-bottom-style: inset; border-color:#6c757d; border-bottom-width:thin;">
      <!-- <div class="container"> -->
        <!-- <div class="collapse navbar-collapse" id="navbarResponsive" > -->
	          <ul class="navbar-nav mr-auto menubar">
	          	<!-- <li class="nav-item active">
	              <a class="nav-link-en" href="#">HOME
	                <span class="sr-only">(current)</span>
	              </a>
	            </li> -->
	            <li class="nav-item" ><a class="nav-link-kr" href="/camping/notice/list" style="margin-left:20px">공지사항</a></li>
	            <li class="nav-item"><a class="nav-link-kr" href="#" >야영장찾기</a>
	           		  <ul>
	           		 	<li><a href="/camping/search/region/list" class="nav-link-kr">지역별 찾기</a></li>
			           	<li><a href="/camping/search/type/list" class="nav-link-kr">유형별 찾기</a></li>
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
			           <li><a href="#" class="nav-link-kr">야영장후기</a></li>
			           <li><a href="/camping/free/list" class="nav-link-kr">자유게시판</a></li>
			         </ul> 
			    </li>
	          </ul>
          	<c:if test="${member}">
            	<ul class="navbar-nav mc-auto" >
	          	<li class="nav-item">
	              <a class="nav-link-en1" href="/camping" style="margin-left:20px">Camping Information</a>
	            </li>
	          	</ul>
	          	<ul class="navbar-nav ml-auto">
            </c:if>
            
          <c:if test="${!member}">
	          <ul class="navbar-nav mc-auto" >
	          	<li class="nav-item">
	              <a class="nav-link-en1" href="/camping" style="margin-left:-95px">Camping Information</a>
	            </li>
	          </ul>
	          <ul class="navbar-nav ml-auto">
          </c:if>
          
          	<c:if test="${!member}">
	            <li class="nav-item">
	              <a class="nav-link-en" href="/camping/selectJoin"  >SIGN UP</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link-en" href="/camping/member/login" >LOGIN</a>
	            </li>
            </c:if>	
            
            <c:if test="${member}">
            	<li class="nav-item nav-link-en3">
            		${user.id}님
            	</li>
            	<li class="nav-item">
	              <a class="nav-link-en" href="#">MYPAGE</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link-en" href="/camping/member/logout" >LOGOUT</a>
	            </li>
            </c:if>
            
            <li class="nav-item">
             <input type="text" style="width: 110px; border: none; border-bottom-style: inset; margin-left:10px" placeholder="search">
             <a href="#" ><i class="fa fa-search" style="padding: 0.5rem 1rem; margin-bottom: -1px; margin-left: -10px; font-size:21px; margin-right:20px;"></i></a>
 			</li>         
          </ul>
        <!-- </div> -->
      <!-- </div> -->
    </nav>
    
