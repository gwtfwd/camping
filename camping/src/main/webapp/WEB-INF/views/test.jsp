<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<p>&nbsp;</p>
<div style="border: 1px solid; width: 600px; padding: 5px">
    <form name="form1" action="board5ReplySave" method="post">
        <input type="hidden" name="brdno" value="<c:out value="${boardInfo.brdno}"/>"> 
        작성자: <input type="text" name="rewriter" size="20" maxlength="20"> <br/>
        <textarea name="rememo" rows="3" cols="60" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
        <a href="#" onclick="fn_formSubmit()">저장</a>
    </form>
</div>


</body>
</html>