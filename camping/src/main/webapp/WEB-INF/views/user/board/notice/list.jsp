<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html lang="en">

<head>

	<!-- Header -->
  	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	<!-- Header -->

	<script type="text/javascript" class="init">
		$(document).ready(function() {
			$('#example').DataTable();
		} );

	</script>

</head>
<body>

	
	
	
	<div class="container" style="height:600px">	
		<br><br><br><br>
		<p style="text-align:center; font-family:Meiryo; color: #343a40; text-decoration:underline; font-size:18px;">NOTICE</p><br>
		
		<div class="row"> 	
			<table id="example" class="hover" style="width:100%">
		        <thead style="text-align:center;">
		            <tr>
		                <th style="width:10%">No</th>
		                <th style="width:40%">Subject</th>
		                <th style="width:20%">Name</th>
		                <th style="width:20%">Date</th>
		                <th style="width:10%">View</th>
		            </tr>
		        </thead>
		        <tbody style="text-align:center;">
		            <tr>
		                <td>1</td>
		                <td>System Architect</td>
		                <td>aaa</td>
		                <td>61</td>
		                <td>44</td>
		            </tr>
		            <tr>
		                <td>1</td>
		                <td>System Architect</td>
		                <td>aaa</td>
		                <td>61</td>
		                <td>44</td>
		            </tr>
		        </tbody>
			  </table>
		  </div> 
	</div>
	
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<!-- Footer -->
</body>
</html>