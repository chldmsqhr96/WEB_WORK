<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
   //sample 데이터
   request.setAttribute("msg", "abcde구라1234");
   request.setAttribute("str", "<div></div> 는 문단을 나타내는 요소 입니다.");
   request.setAttribute("content", "하나\n두울\n세엣");
   request.setAttribute("newLine", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>test07</title>
</head>
<body>
	<h1>JSTL Function (EL코드 내에서 사용하는 함수) 활용</h1>
	<p>구라가 포함되었는지 여부(true or false) : ${fn:contains(msg, '구라')}</p>
	<c:if test="${fn:contains(msg, '구라')}">
		<p>구라가 포함되어 있습니다.</p>
	</c:if>
	<p>${str }</p>
	<p>${fn:escapeXml(str) } \${fn:escapeXml(	)}은 마크업 형태의 언어로 해석하지 않겠다는 의미</p>
	<p>${content}</p>
	<p>${fn:replace(content, newLine, '<br>') }</p>
</body>
</html>