<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>test05</title>
</head>
<body>
	<h1>param.파라미터명으로 추출할 수 있다.</h1>
	<p>전달된 파라미터 msg : ${param.msg}</p>
	<p>전달된 파라미터 msg : <%=request.getParameter("msg")%></p>
</body>
</html>