<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>


	<nav class="navbar navbar-expand-lg navbar-dark bg-white relative-top" style="border-bottom-style: inset; border-color:#6c757d; border-bottom-width:thin;">
		
		<ul class="navbar-nav mr-auto">
			<li class="nav-item">
				<a class="nav-link-en1" href="/camping" style="margin-left: 20px">
					<img src='resources/images/main.png' style="margin-right:10px; width:40px; height:40px;">Camping Information
				</a>
			</li>
		</ul>
		
		<ul class="navbar-nav ml-auto menubar">
        	<c:if test="${member}">
	        	<li class="nav-item nav-link-en3" style="padding:14px;">
	       			${user.id}님
	        	</li>
	        	<li class="nav-item"><a> | </a></li>
			</c:if>
            <li class="nav-item" ><a class="nav-link-kr" href="/camping/notice/list" >공지사항</a></li>
            <li class="nav-item"><a class="nav-link-kr" href="#" >야영장찾기</a>
           		 <ul>
           		 	<li><a href="/camping/search/region/list" class="nav-link-kr">지역별 찾기</a></li>
		           	<li><a href="/camping/search/type/list" class="nav-link-kr">유형별 찾기</a></li>
		         </ul> 
		    </li>
		    <c:if test="${!member}">
	            <li class="nav-item"><a class="nav-link-kr" href="#" >예약안내</a>
	            	 <ul>
			           	<li><a href="/camping/member/needLogin" class="nav-link-kr">실시간예약</a></li>
			           	<li><a href="/camping/member/needLogin" class="nav-link-kr">예약확인</a></li>
			         </ul> 
			    </li>
		    </c:if>
		    <c:if test="${member}">
            <li class="nav-item"><a class="nav-link-kr" href="#" >예약안내</a>
            	 <ul>
		           	<li><a href="/camping/booking/write" class="nav-link-kr">실시간예약</a></li>
		           	<li><a href="/camping/booking/list" class="nav-link-kr">예약확인</a></li>
		         </ul> 
		    </li>
		    </c:if>
            <li class="nav-item"><a class="nav-link-kr" href="#" >커뮤니티</a>
            	<ul>
		           	<li><a href="/camping/review/list" class="nav-link-kr">야영장후기</a></li>
		           	<li><a href="/camping/free/list" class="nav-link-kr">자유게시판</a></li>
		        </ul> 
		    </li>
		    <li class="nav-item"><a> | </a></li>
		    <c:if test="${!member}">
				<li class="nav-item" >
				  	<a class="nav-link-en" href="/camping/selectJoin"> SIGN UP</a>
				</li>
				<li class="nav-item">
				  	<a class="nav-link-en" href="/camping/member/login" >LOGIN</a>
				</li>
	        </c:if>	
	        <c:if test="${member}">
	        	<li class="nav-item">
	           		<a class="nav-link-en" href="/camping/member/confirmPw">MYPAGE</a>
	         	</li>
	         	<li class="nav-item">
	           		<a class="nav-link-en" href="/camping/member/logout" >LOGOUT</a>
	         	</li>
	        </c:if>
		</ul>
    </nav>
