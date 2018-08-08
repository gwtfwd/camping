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
	      
	      /* ��۸���Լ�ȣ�� */
	      replyList();    
	      
	      /* ����� ����ϱ� ���� �����Խ����� �Խñ۹�ȣ �ҷ��ͼ� ���� freeNo�� ��� */
	      var bno = '${free.no}';
	      
	      /* ��۵�Ϲ�ư Ŭ���� �̺�Ʈ�߻� */
	      $('[name=replyInsertBtn]').click(function() {                      
	         
	         /* name�� replyInsertForm�� ������ �����ͼ� 
	            insertData ������ ��� replyInsert�Լ��� ȣ�� */
	         var insertData = $('[name=replyinsertform]').serialize();       
	         replyInsert(insertData);                              
	         
	      });

	   });
		 
		//��� ��� 
		function replyList(){
			
			/* ��۸���� ǥ���ϱ� ���� �����Խ����� �Խñ۹�ȣ �ҷ��ͼ� ���� freeNo�� ��� */
		      var bno = '${free.no}';  
		      
	      /* ajax�� �����ͺ����� */
		    $.ajax({
		        url : '/camping/free/reply/list',	/* �����͸� ���� ��Ʈ�ѷ� ��� */
		        type : 'get',						/* get������� */
		        data : {'bno':bno},					/* �Ʊ� ���� ������ ���� bno(�Խ��ǹ�ȣ)�� ��Ʈ�ѷ� �Ű������� ���� */
		        success : function(data){			 /* �����ϸ� �Ʒ� �±׽��� */
		        	
		            var a =''; 		
		            var cnt = 0;         /* ��ۼ� �������� */
		        
		            $.each(data, function(key, value){ 			/* foreach�� �����鼭 �Ʒ��� �±��߰� */
		               /*  a += '<div class="replyArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
		                a += '<div>'+' �ۼ��� : '+value.reid;
		                a += '<a onclick="replyUpdate('+value.reno+',\''+value.recontent+'\');"> ���� </a>';
		                a += '<a onclick="replyDelete('+value.reno+');"> ���� </a> </div>';
		                a += '<div class="replyContent'+value.reno+'"> <p> ���� : '+value.recontent +'</p>';
		                a += '</div></div><br>'; */
		                
		                a += '<div class="col-md-1"></div>'
		                a += '<div class="col-md-2" style="text-align: right;">'+ value.reid + ' <img src="<c:url value='/resources/images/smile.png'/>"></div>'
		                a += '<div class="col-md-4" style="text-align: left;">'+ value.recontent + '</div>'
		                a += '<div class="col-md-2" style="text-align: right;">' + value.redate + '</div>'
		                a += '<div class="col-md-1" style="text-align: right;">' + '<img src="<c:url value='/resources/images/edit.png'/>">' 
		                       + '&nbsp;&nbsp; <img src="<c:url value='/resources/images/deleted.png'/>"> </div>'
		                a += '<div class="col-md-2"></div>'

		                
		                cnt++;      /* ����� �߰��Ǵ´�� ��ۼ� ī��Ʈ ���� */
		            });
		            
		            $('#replyCnt').html(cnt);   /* ��ۼ� ǥ���ϰ� ���� span�±׿� id�� �ְ� �� ���̵� html�� cnt�� ��� ȭ�鿡 �ѷ��ֱ� */
		            $("#replyList").html(a);   /* �׸��� �̰� ���� ���� id�� replyList�� html�� a�� ��Ҵ� �����͸� ȭ�鿡 �ѷ��ֱ� */
		        }
		    });
		} 
		
		 
		//��� ���
		function replyInsert(insertData){
		    $.ajax({
		        url : '/camping/free/reply/insert',
		        type : 'get',
		        data : insertData,
		        success : function(data){
		            if(data == 1) {
		            	replyList(); //��� �ۼ� �� ��� ��� reload
		                $('[name=recontent]').val('');
		            }
		        }
		    });
		}
		 
		//��� ���� - ��� ���� ����� input ������ ���� 
		/* function replyUpdate(reno, recontent){
		    var a ='';
		    
		    a += '<div class="input-group">';
		    a += '<input type="text" class="form-control" name="recontent_'+reno+'" value="'+recontent+'"/>';
		    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="replyUpdate('+reno+');">����</button> </span>';
		    a += '</div>';
		    
		    $('.replyContent'+reno).html(a);
		    
		} */
		 
		//��� ����
		/* function replyUpdate(reno){
		    var updateContent = $('[name=recontent_'+reno+']').val();
		    
		    $.ajax({
		        url : '/camping/free/reply/update',
		        type : 'post',
		        data : {'recontent' : updateContent, 'reno' : reno},
		        success : function(data){
		            if(data == 1) replyList(bno); //��� ������ ��� ��� 
		        }
		    });
		} */
		 
		//��� ���� 
		/* function replyDelete(reno){
		    $.ajax({
		        url : '/camping/free/reply/delete/'+reno,
		        type : 'post',
		        success : function(data){
		            if(data == 1) replyList(bno); //��� ������ ��� ��� 
		        }
		    });
		}
		 
		$(document).ready(function(){
			replyList(); //������ �ε��� ��� ��� ��� 
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
				<label class="control-label" for="num">��ȣ</label>
			</div>
			
			<div class="col-md-7 fontH">
				<input type="text" class="form-control" id="num" name="number" style="background-color:white;" value="${free.no}" readonly>
			</div>
			
			<div class="col-md-1"></div>
		</div><br>
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2 fontH" style="text-align:right; padding-top:7px;">
				<label class="control-label" for="sub">����</label>
			</div>
			
			<div class="col-md-7 fontH">
				<input type="text" class="form-control" id="sub" name="title" style="background-color:white;"  value="${free.subject}" readonly>
			</div>
			
			<div class="col-md-1"></div>
		</div><br>
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2 fontH" style="text-align:right; padding-top:7px;">
				<label class="control-label" for="auth">�ۼ���</label>
			</div>
			
			<div class="col-md-7 fontH">
				<input type="text" class="form-control" id="auth" name="author" style="background-color:white;" value="${free.registered_id}" readonly>
			</div>
			
			<div class="col-md-1"></div>
		</div><br>
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2 fontH" style="text-align:right; padding-top:7px;">
				<label class="control-label" for="cont">����</label>
			</div>
			
			<div class="col-md-7 fontH">
				<textarea rows="8" cols="90" id="cont" name="contents" style="background-color:white; border-radius: 4px; border: 1px solid #ced4da;" readonly>${free.contents}</textarea>
			</div>
			
			<div class="col-md-1"></div>
		</div>
		<br>
		
			<!-- <label for="num">÷������:</label> -->
		<div style="text-align:center;">			
			<a href="/camping/free/list"> 
	       		<button type="button" class="btn11 btn-primary11 fontH" style="margin-left:10px">���</button>
	        </a>			
	        <c:if test="${user.id.compareTo(free.registered_id) == 0 }">
				<a href="/camping/free/modify?no=${free.no}"> 
		       		<button type="button" class="btn11 btn-primary11 fontH" style="margin-left:10px">����</button>
		        </a>			
				<a href="/camping/free/delete?no=${free.no}"> 
		       		<button type="button" class="btn11 btn-primary11 fontH" style="margin-left:10px">����</button>
		        </a>	
	        </c:if>		
		</div><br><br>
		
		
		<div class="row">
			<div class="col-md-3"></div>
			
			<div class="col-md-6 fontH" style="border: 1px solid;">
			
			    <form name="replyinsertform">
			    
			        <input type="hidden" name="bno" value="${free.no}"> 
			        �ۼ���: <input type="text" name="reid" size="20" maxlength="20" value="${user.id}" readonly> <br/>
			        <c:if test="${member }">
			        <textarea name="recontent" rows="3" cols="60" maxlength="500" placeholder="����� �޾��ּ���."></textarea>
			        </c:if>
			        <c:if test="${!member }">
			        <textarea name="recontent" rows="3" cols="60" maxlength="500" onfocus="myFunction(this)" placeholder="����� �޾��ּ���."></textarea>
			        </c:if>
			        <button class="btn btn-default" type="button" name="replyInsertBtn">���</button>

			    </form>
			    
		    </div>
		    
		    
		    <div class="col-md-3"></div>
		</div><br><br>
		
		
		<div class="row"> 
			<div class="col-md-1"></div>
			
			<div class="col-md-2 fontH" style="text-align:right; padding-top:7px;">
				<label class="control-label">��۸��(<span id="replyCnt"></span>)</label>
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