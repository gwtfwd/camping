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
        	<c:if test="${admin.admin.compareTo('admin')==0}">
	        	<li class="nav-item nav-link-en3" style="padding:14px;">
	       			${admin.adminId}님<img src='resources/images/admin.png' style="width:17px; height:17px; margin-left:5px;"> < ${admin.camp_name} >
	        	</li>
	        	<li class="nav-item"><a> | </a></li>
			</c:if>
        	<c:if test="${admin.admin.compareTo('superadmin')==0}">
	        	<li class="nav-item nav-link-en3" style="padding:14px;">
	       			${admin.adminId}<img src='resources/images/superadmin.png' style="width:17px; height:17px; margin-left:5px;"> (superadmin) 님
	        	</li>
	        	<li class="nav-item"><a> | </a></li>
			</c:if>
            <li class="nav-item" ><a class="nav-link-kr" href="/camping/notice/list" >공지사항</a></li>
            <li class="nav-item"><a class="nav-link-kr pointer" style="cursor:pointer;">야영장찾기</a>
           		 <ul>
           		 	<li><a href="/camping/search/region/list" class="nav-link-kr">지역별 찾기</a></li>
		           	<li><a href="/camping/search/type/list" class="nav-link-kr">유형별 찾기</a></li>
		         </ul> 
		    </li>
		    <c:if test="${admin.admin.compareTo('admin')!=0 && !member && admin.admin.compareTo('superadmin')!=0}">
	            <li class="nav-item"><a class="nav-link-kr" href="/camping/member/needLogin" >실시간예약</a></li>
		    </c:if>
		    <c:if test="${member || admin.admin.compareTo('superadmin')==0}">
	            <li class="nav-item"><a class="nav-link-kr" href="/camping/booking/write" >실시간예약</a></li>
		    </c:if>
	            <li class="nav-item"><a class="nav-link-kr"  style="cursor:pointer;">커뮤니티</a>
	            	<ul>
			           	<li><a href="/camping/review/list" class="nav-link-kr">야영장후기</a></li>
			           	<li><a href="/camping/free/list" class="nav-link-kr">자유게시판</a></li>
			        </ul> 
			    </li>
			    <li class="nav-item"><a> | </a></li>
		    <c:if test="${admin.admin.compareTo('admin')!=0 && !member && admin.admin.compareTo('superadmin')!=0}">
				<li class="nav-item" >
				  	<a class="nav-link-en" href="/camping/selectJoin"> SIGN UP</a>
				</li>
				<li class="nav-item">
				  	<a class="nav-link-en" href="/camping/member/login" >LOGIN</a>
				</li>
	        </c:if>	
	        <c:if test="${member}">
	        	<li class="nav-item"><a class="nav-link-en" style="cursor:pointer;">MYPAGE</a>
	        		<ul>
			           	<li><a href="/camping/booking/list" class="nav-link-kr">예약확인</a></li>
			           	<li><a href="/camping/member/confirmPw" class="nav-link-kr">회원정보</a></li>
			        </ul>
	         	</li>
	         	<li class="nav-item">
	           		<a class="nav-link-en" href="/camping/member/logout" >LOGOUT</a>
	         	</li>
	        </c:if>
	        <c:if test="${admin.admin.compareTo('admin')==0}">
	        	<li class="nav-item"><a class="nav-link-en">MYPAGE</a>
	        		<ul>
			           	<li><a href="/camping/admin/booking/list" class="nav-link-kr">예약관리</a></li>
			           	<li><a href="/camping/mycamp/list" class="nav-link-kr">야영장관리</a></li>
			           	<li><a href="/camping/admin/member/confirmPw" class="nav-link-kr">회원정보</a></li>
			        </ul>
	        	</li>
	         	<li class="nav-item">
	           		<a class="nav-link-en" href="/camping/admin/member/logout" >LOGOUT</a>
	         	</li>
	        </c:if>
	        <c:if test="${admin.admin.compareTo('superadmin')==0}">
	        	<li class="nav-item"><a class="nav-link-en" href="/camping/member/userList">회원관리</a></li>
	         	<li class="nav-item">
	           		<a class="nav-link-en" href="/camping/admin/member/logout" >LOGOUT</a>
	         	</li>
	        </c:if>
		</ul>
    </nav>
