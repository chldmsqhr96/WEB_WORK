<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String nick=(String)session.getAttribute("nick");
	String cPath = request.getContextPath();
	//만일 저장된 값이 없다면(로그인 하지 않았다면)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>놀아요</title>
</head>
<body>
	<p><strong><%=nick%>님</strong>잘 놀다가세요</p>
<%
	if(nick==null){
		//로그인 페이지로 리다일렉트 이동 시킴
		response.sendRedirect(cPath+"/");
	}
%>
</body>
</html>