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
	</style>
	
	
	<script>
	
	$(document).ready(function() {
	      
	      /* 댓글목록함수호출 */
	      replyList();    
	      
	      /* 댓글을 등록하기 위해 자유게시판의 게시글번호 불러와서 변수 freeNo에 담기 */
	      var bno = '${free.no}';
	      
	      /* 댓글등록버튼 클릭시 이벤트발생 */
	      $('[name=replyInsertBtn]').click(function() {                      
	         
	         /* name이 replyInsertForm인 내용을 가져와서 
	            insertData 변수에 담고 replyInsert함수를 호출 */
	         var insertData = $('[name=replyinsertform]').serialize();       
	         replyInsert(insertData);                              
	         
	      });

	   });
		 
		//댓글 목록 
		function replyList(){
			
			/* 댓글목록을 표시하기 위해 자유게시판의 게시글번호 불러와서 변수 freeNo에 담기 */
		      var bno = '${free.no}';  
		      
	      /* ajax로 데이터보내기 */
		    $.ajax({
		        url : '/camping/free/reply/list',	/* 데이터를 보낼 컨트롤러 경로 */
		        type : 'get',						/* get방식으로 */
		        data : {'bno':bno},					/* 아까 담은 변수에 담은 bno(게시판번호)를 컨트롤러 매개변수로 보냄 */
		        success : function(data){			 /* 성공하면 아래 태그실행 */
		        	
		            var a =''; 		
		            var cnt = 0;         /* 댓글수 변수선언 */
		        
		            $.each(data, function(key, value){ 			/* foreach를 돌리면서 아래의 태그추가 */
		               /*  a += '<div class="replyArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
		                a += '<div>'+' 작성자 : '+value.reid;
		                a += '<a onclick="replyUpdate('+value.reno+',\''+value.recontent+'\');"> 수정 </a>';
		                a += '<a onclick="replyDelete('+value.reno+');"> 삭제 </a> </div>';
		                a += '<div class="replyContent'+value.reno+'"> <p> 내용 : '+value.recontent +'</p>';
		                a += '</div></div><br>'; */
		                
		                a += '<div class="col-md-1"></div>'
		                a += '<div class="col-md-2" style="text-align: right;">'+ value.reid + ' <img src="<c:url value='/resources/images/smile.png'/>"></div>'
		                a += '<div class="col-md-4" style="text-align: left;">'+ value.recontent + '</div>'
		                a += '<div class="col-md-2" style="text-align: right;">' + value.redate + '</div>'
		                a += '<div class="col-md-1" style="text-align: right;">' + '<img src="<c:url value='/resources/images/edit.png'/>">' 
		                       + '&nbsp;&nbsp; <img src="<c:url value='/resources/images/deleted.png'/>"> </div>'
		                a += '<div class="col-md-2"></div>'

		                
		                cnt++;      /* 댓글이 추가되는대로 댓글수 카운트 증가 */
		            });
		            
		            $('#replyCnt').html(cnt);   /* 댓글수 표시하고 싶은 span태그에 id를 주고 그 아이디를 html에 cnt를 담아 화면에 뿌려주기 */
		            $("#replyList").html(a);   /* 그리고 이것 또한 역시 id가 replyList를 html에 a에 담았던 데이터를 화면에 뿌려주기 */
		        }
		    });
		} 
		
		 
		//댓글 등록
		function replyInsert(insertData){
		    $.ajax({
		        url : '/camping/free/reply/insert',
		        type : 'get',
		        data : insertData,
		        success : function(data){
		            if(data == 1) {
		            	replyList(); //댓글 작성 후 댓글 목록 reload
		                $('[name=recontent]').val('');
		            }
		        }
		    });
		}
		 
		//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
		/* function replyUpdate(reno, recontent){
		    var a ='';
		    
		    a += '<div class="input-group">';
		    a += '<input type="text" class="form-control" name="recontent_'+reno+'" value="'+recontent+'"/>';
		    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="replyUpdate('+reno+');">수정</button> </span>';
		    a += '</div>';
		    
		    $('.replyContent'+reno).html(a);
		    
		} */
		 
		//댓글 수정
		/* function replyUpdate(reno){
		    var updateContent = $('[name=recontent_'+reno+']').val();
		    
		    $.ajax({
		        url : '/camping/free/reply/update',
		        type : 'post',
		        data : {'recontent' : updateContent, 'reno' : reno},
		        success : function(data){
		            if(data == 1) replyList(bno); //댓글 수정후 목록 출력 
		        }
		    });
		} */
		 
		//댓글 삭제 
		/* function replyDelete(reno){
		    $.ajax({
		        url : '/camping/free/reply/delete/'+reno,
		        type : 'post',
		        success : function(data){
		            if(data == 1) replyList(bno); //댓글 삭제후 목록 출력 
		        }
		    });
		}
		 
		$(document).ready(function(){
			replyList(); //페이지 로딩시 댓글 목록 출력 
		}); */
		
		
		function myFunction(x) {
	      window.location.href = "/camping/member/needLogin"
	   }
	</script>


		
</head>
<body>
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
	
	<div class="container" style="height:1500px">	
		<br><br><br><br>

		<!-- <p style="text-align:center; font-family:Meiryo; color: #343a40; text-decoration:underline; font-size:18px;">NOTICE</p><br> -->
		<h4 style="text-align:center; font-family:Segoe Print;">Detail</h4> <br><br>
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2 fontH" style="text-align:right; padding-top:7px;">
				<label class="control-label" for="num">번호</label>
			</div>
			
			<div class="col-md-7 fontH">
				<input type="text" class="form-control" id="num" name="number" style="background-color:white;" value="${free.no}" readonly>
			</div>
			
			<div class="col-md-1"></div>
		</div><br>
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2 fontH" style="text-align:right; padding-top:7px;">
				<label class="control-label" for="sub">제목</label>
			</div>
			
			<div class="col-md-7 fontH">
				<input type="text" class="form-control" id="sub" name="title" style="background-color:white;"  value="${free.subject}" readonly>
			</div>
			
			<div class="col-md-1"></div>
		</div><br>
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2 fontH" style="text-align:right; padding-top:7px;">
				<label class="control-label" for="auth">작성자</label>
			</div>
			
			<div class="col-md-7 fontH">
				<input type="text" class="form-control" id="auth" name="author" style="background-color:white;" value="${free.registered_id}" readonly>
			</div>
			
			<div class="col-md-1"></div>
		</div><br>
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2 fontH" style="text-align:right; padding-top:7px;">
				<label class="control-label" for="cont">내용</label>
			</div>
			
			<div class="col-md-7 fontH">
				<textarea rows="8" cols="90" id="cont" name="contents" style="background-color:white; border-radius: 4px; border: 1px solid #ced4da;" readonly>${free.contents}</textarea>
			</div>
			
			<div class="col-md-1"></div>
		</div>
		<br>
		
			<!-- <label for="num">첨부파일:</label> -->
		<div style="text-align:center;">			
			<a href="/camping/free/list"> 
	       		<button type="button" class="btn11 btn-primary11 fontH" style="margin-left:10px">목록</button>
	        </a>			
	        <c:if test="${user.id.compareTo(free.registered_id) == 0 }">
				<a href="/camping/free/modify?no=${free.no}"> 
		       		<button type="button" class="btn11 btn-primary11 fontH" style="margin-left:10px">수정</button>
		        </a>			
				<a href="/camping/free/delete?no=${free.no}"> 
		       		<button type="button" class="btn11 btn-primary11 fontH" style="margin-left:10px">삭제</button>
		        </a>	
	        </c:if>		
		</div><br><br>
		
		
		<div class="row">
			<div class="col-md-3"></div>
			
			<div class="col-md-6 fontH" style="border: 1px solid;">
			
			    <form name="replyinsertform">
			    
			        <input type="hidden" name="bno" value="${free.no}"> 
			        작성자: <input type="text" name="reid" size="20" maxlength="20" value="${user.id}" readonly> <br/>
			        <c:if test="${member }">
			        <textarea name="recontent" rows="3" cols="60" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
			        </c:if>
			        <c:if test="${!member }">
			        <textarea name="recontent" rows="3" cols="60" maxlength="500" onfocus="myFunction(this)" placeholder="댓글을 달아주세요."></textarea>
			        </c:if>
			        <button class="btn btn-default" type="button" name="replyInsertBtn">등록</button>

			    </form>
			    
		    </div>
		    
		    
		    <div class="col-md-3"></div>
		</div><br><br>
		
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2 fontH" style="text-align:right; padding-top:7px;">
				<label class="control-label">댓글목록(<span id="replyCnt"></span>)</label>
			</div>
			
			<div class="col-md-7 fontH"></div>
			
			<div class="col-md-1"></div>
		</div><br>


		<div class="row" id="replyList">
			<!-- <div class="col-md-3"></div>

			<div class="col-md-6 fontH" style="border: 1px solid;">

				<div class="replyList"></div>

			</div>

			<div class="col-md-3"></div> -->
		</div>

	</div>
	
	

		
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>