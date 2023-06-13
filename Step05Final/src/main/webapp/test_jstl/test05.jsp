<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	request.setAttribute("size", 123456789);
	request.setAttribute("price", 250000);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>test05</title>
</head>
<body>
	<p>
		파일의 크기
		<fmt:formatNumber value="${size }" pattern="#,###"/>byte
		가격
		<fmt:formatNumber value="${price }" type="currency"/>
		<fmt:formatNumber value="${price }" type="currency" currencySymbol="$"/>
	</p>
</body>
</html>