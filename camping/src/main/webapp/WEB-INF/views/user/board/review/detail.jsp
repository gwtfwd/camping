<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<!-- link -->
  	<jsp:include page="/WEB-INF/views/common/link.jsp"></jsp:include>
   	<!-- link -->
	
	<script src="//code.jquery.com/jquery.min.js"></script>
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
		.btn-primary33 {
		  background-color: #6bacce;
		  border-color: #6bacce;
		}
		.btn33 {
		  font-size: 14px;
	 	  padding: 4px 15px;
		  line-height: 15px;
		  font-weight: 400;
		  color:#fff; 
		  height:40px;
		  width:80px;
		  border-width:0px;
		  text-align:center;
		  border-radius: 35px;
		  transition: all 200ms ease;
	 	}
	</style>
	
	<script>
		//새로고침, 뒤로가기 막기
		document.onkeydown = function(e) {
			
			 key = (e) ? e.keyCode : event.keyCode;
			 
			 if(key==8 || key==116) {
				  if(e) {
				  	e.preventDefault();
				  } 
				  else {
				  	event.keyCode = 0;
				  	event.returnValue = false;
				  }
			 }
		}
	
		$(document).ready(function(){
			  
			  $('#delete').click(function() {
			       var str = document.getElementById('formDetail');
			       str.submit();
			       
			       if (confirm("정말 삭제하시겠습니까?") == true){    //확인
			    	    document.form.submit();
			    	}else{   //취소
			    	    return false;
			    	}
			    });
		});
	
		$(document).ready(function() {
		      
		      /* 댓글목록함수호출 */
		      replyList();    
		      
		      /* 댓글을 등록하기 위해 자유게시판의 게시글번호 불러와서 변수 freeNo에 담기 */
		      var bno = '${review.no}';
		      
		      /* 댓글등록버튼 클릭시 이벤트발생 */
		      $('[name=replyInsertBtn]').click(function() {                      
		         
		    	  /* name이 replyInsertForm인 내용을 가져와서 insertData 변수에 담고 replyInsert함수를 호출 */
	         	var insertData = $('[name=replyinsertform]').serialize();
		    	  
	    	  	if ($('#recontent').val() == null || $('#recontent').val().length < 10){
		              
		              alert("최소 10글자 이상 입력하셔야 됩니다.");
		              $('#recontent').focus();
		              return ;
		         }
		         replyInsert(insertData);                              
		      });
		});
		 
		//댓글 목록 
		function replyList(){
			
		  	/* 댓글목록을 표시하기 위해 자유게시판의 게시글번호 불러와서 변수 freeNo에 담기 */
	      	var bno = '${review.no}';  
		      
	      	/* ajax로 데이터보내기 */
		    $.ajax({
		        url : '/camping/review/reply/list',	/* 데이터를 보낼 컨트롤러 경로 */
		        type : 'get',						/* get방식으로 */
		        data : {'bno':bno},					/* 아까 담은 변수에 담은 bno(게시판번호)를 컨트롤러 매개변수로 보냄 */
		        success : function(data){			 /* 성공하면 아래 태그실행 */
		        	
		            var a =''; 		
		            var cnt = 0;         /* 댓글수 변수선언 */
		        
		            $.each(data, function(key, value){ 			/* foreach를 돌리면서 아래의 태그추가 */
		                
		                a += '<div class="row" style="border:1px solid #C8CACC; line-height: 30px; vertical-align: middle; font-size:14px;"><div class="col-md-1">'
		               		+ value.reid + '</div>'
		                	+ '<div class="col-md-10" style="font-size:12px;">' + value.redate + '</div>'
		                	
		                	+ '<div class="col-md-1" style="text-align: right;">' 
		                	+ '<a onclick="replyUpdate('+value.reno+',\''+value.recontent+'\');">'				/*   \' 는 따옴표를 의미   */
		                	+ '<img src="<c:url value='/resources/images/edit.png'/>"></a>' 
		                	
		                    + '&nbsp;&nbsp; <a onclick="replyDelete('+value.reno+');">'
		                    + '<img src="<c:url value='/resources/images/deleted.png'/>"></a> </div></div>';
		                    
	                	a += '<div class="row" style="border:1px solid #C8CACC; border-top:0px; line-height: 70px; vertical-align: middle;">'
	                		+ '<div class="col-md-12 replyContent'+value.reno+'" style="text-align:left; font-size:14px;">'+ value.recontent + '</div></div>';
		                
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
		        url : '/camping/review/reply/insert',
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
		function replyUpdate(reno, recontent){
		    var a ='';
		    
		    a += '<div class="input-group">'
			    + '<input type="text" class="form-control" name="recontent_'+reno+'" value="'+recontent+'"/>'
			    + '<span class="input-group-btn"><button class="btn33 btn-primary33" type="button" onclick="replyUpdateProc('+reno+');" style="margin-left:10px;">수정</button> </span>'
			    +'</div>';
		    
		    $('.replyContent'+reno).html(a);
		} 
		 
		//댓글 수정
		function replyUpdateProc(reno){
		    var updateContent = $('[name=recontent_'+reno+']').val();
		    
		    $.ajax({
		        url : '/camping/review/reply/update',
		        type : 'get',
		        data : {'recontent' : updateContent, 'reno' : reno},
		        success : function(data){
		            if(data == 1) replyList(reno); //댓글 수정후 목록 출력 
		        }
		    });
		}
		 
		//댓글 삭제 
		function replyDelete(reno){
			
			var bno = '${review.no}'; 
			
		    $.ajax({
		        url : '/camping/review/reply/delete/'+reno,
		        type : 'get',
		        data : {
		        	'bno' : bno,
		        	'reno' : reno
		        },
		        success : function(data){
		            if(data == 1) replyList(reno); //댓글 삭제후 목록 출력 
		            alert("삭제되었습니다.");
		        }
		    });
		}

		function needLogin(x) {
	      window.location.href = "/camping/member/needLogin"
	    }
		
		function readURL(input) { 
			if (input.files && input.files[0]) {
			   var reader = new FileReader();
			   reader.onload = function (e) { 
				   $('#viewimg').attr('src', e.target.result); 
			   }
			   reader.readAsDataURL(input.files[0]); 
			 }
		}
			   
	</script>

</head>
<body>
	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->
	
	<div class="container" >	
		<br><br><br><br>
		<h4 style="text-align:center; font-family:Segoe Print;">Detail</h4> <br><br>
		
		<form method="post" id="formDetail">
		
			<div class="row" style="border-top:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;"> 
					<label class="control-label" for="subject">제목</label>
				</div>
				<div class="col-md-9 fontH">
					<input type="text" class="form-control" id="subject" name="subject" style="background-color:white; border-width:0px;"  value="${review.subject}" readonly>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC; border-top:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="user_name">작성자</label>
				</div>
				<div class="col-md-7 fontH" style="border-right:1px solid #C8CACC;">
					<input type="text" class="form-control" id="user_name" name="user_name" style="background-color:white; border-width:0px;" value="${review.user_name}" readonly>
				</div>
				
				<div class="col-md-1 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="view">조회수</label>
				</div>
				<div class="col-md-2 fontH">
					<input type="text" class="form-control" id="view" name="view" style="background-color:white; border-width:0px;" value="${review.view}" readonly>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;" name="file" id="file" > 
				<div class="col-md-2 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="file">첨부파일</label>
				</div>
				<div class="col-md-4 fontH" style="border-right:1px solid #C8CACC;padding-top:7px;">
					<c:if test="${fileName != null }">
		      			<a href="/camping/review/download?fileName=${review.filepath}" target="_blank">${fileName}</a>
		      		</c:if>
		      		<c:if test="${fileName == null }">
		      			첨부파일 없음
		      		</c:if>
				
				
				</div>
				<div class="col-md-1 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="registered_at">작성일자</label>
				</div>
				<div class="col-md-2 fontH" style="border-right:1px solid #C8CACC;">
					<input type="text" class="form-control" id="registered_at" name="registered_at" style="background-color:white; border-width:0px;" value="<fmt:formatDate value="${review.registered_at}" pattern="yyyy-MM-dd" />" readonly>
				</div>
				<div class="col-md-1 fontH" style="padding-top:7px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="updated_at">수정일자</label>
				</div>
				<div class="col-md-2 fontH" >
					<input type="text" class="form-control" id="updated_at" name="updated_at" style="background-color:white; border-width:0px;" value="<fmt:formatDate value="${review.updated_at}" pattern="yyyy-MM-dd" />" readonly>
				</div>
			</div>
			
			<div class="row" style="border-bottom:1px solid #C8CACC;"> 
				<div class="col-md-2 fontH" style="padding-top:10px;border-right:1px solid #C8CACC;text-align:center;">
					<label class="control-label" for="contents">내용</label>
				</div>
				<div class="col-md-10 fontH" style="padding-top:10px;">
					<div style="text-align:center;">
						<img id="viewimg" src="/camping/resources/upload${review.filepath}" alt="your image" width="800" height="400"/>
					</div><br>
					<textarea rows="10" cols="100" id="contents" name="contents" style="background-color:white; border-width:0px;" readonly>${review.contents}</textarea>
				</div>
			</div><br>
			
			<div style="text-align:center;">			
				<a href="/camping/review/list"> 
		       		<button type="button" class="btn11 btn-primary11 fontH pull-right" style="margin-left:10px">목록</button>
		        </a>			
		        <c:if test="${user.id.compareTo(review.user_id) == 0 }">
					<a href="/camping/review/modify?no=${review.no}"> 
			       		<button type="button" class="btn11 btn-primary11 fontH pull-right" style="margin-left:10px">수정</button>
			        </a>			
					<a href="/camping/review/delete?no=${review.no}"> 
			       		<button id="delete" type="button" class="btn11 btn-primary11 fontH pull-right" >삭제</button>
			        </a>	
		        </c:if>		
			</div><br><br>
		</form>
		
		<form name="replyinsertform">
			<div class="row" style="border-top:1px solid #e8e8e8; background-color:#fafafa; margin-top:20px;">
				<div class="col-md-12 fontH" >
				        <input type="hidden" name="bno" value="${review.no}"> 
				        <c:if test="${member }">
				        	<input class="fontH" type="text" name="reid" size="20" maxlength="20" value="${user.id}" style="width: 171px; height: 36px; border:1px solid #e8e8e8; margin-top:20px; padding: 0 13px;" placeholder="Writer" readonly>
				        	<input class="fontH" type="password" name="reid" size="20" maxlength="20" style="width: 171px; height: 36px; border:1px solid #e8e8e8; margin-top:20px; padding: 0 13px" placeholder="Password"> <br/>
				        	<textarea name="recontent" id="recontent" rows="5" cols="135" maxlength="1500" style="margin-top:10px; margin-bottom:10px; border:1px solid #e8e8e8;"></textarea>
				        </c:if>
				        <c:if test="${!member }">
				        	<input class="fontH" type="text" name="reid" size="20" maxlength="20" value="${user.id}" onfocus="needLogin(this)" style="width: 171px; height: 36px; border:1px solid #e8e8e8; margin-top:20px; padding: 0 13px;" placeholder="Writer" readonly>
				        	<input class="fontH" type="password" name="reid" size="20" maxlength="20" onfocus="needLogin(this)" style="width: 171px; height: 36px; border:1px solid #e8e8e8; margin-top:20px; padding: 0 13px" placeholder="Password"> <br/>
				        	<textarea name="recontent" rows="5" cols="135" maxlength="1500" onfocus="needLogin(this)" style="margin-top:10px; margin-bottom:10px; border:1px solid #e8e8e8;"></textarea>
				        </c:if><br>
				        <button class="btn33 btn-primary33 fontH pull-right" type="button" name="replyInsertBtn" style="margin-bottom:10px;">OK</button>
				  </div>
			</div><br><br>
		</form>
			
		<div class="row" > 
			<label class="control-label fontH" style="font-size:23px;"><span id="replyCnt"></span> Comments</label>
		</div><br>
		<div style="margin-bottom:50px;">
			<div id="replyList"></div><br>
		</div>
	</div>
		
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>