<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청 인코딩 설정(한글 안깨지게)
	request.setCharacterEncoding("utf-8");
	//요청한 파라미터(매개변수) 추출
	String msg = request.getParameter("msg");
	//콘솔창에 출력 (이클립스 버그로 인해 jsp 페이지에서는 콘솔창에 문자열 출력 불가)
	//System.out.print(msg+"받음");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지</title>
</head>
<body>
	<p>메세지 잘받음</p>
	<p>전달 받은 메세지 : <strong><%=msg%></strong></p>
</body>
</html>