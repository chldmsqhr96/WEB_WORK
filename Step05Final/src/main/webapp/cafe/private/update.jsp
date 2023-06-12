<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	CafeDto dto = new CafeDto();
	dto2.setNum(num);
	dto2.setTitle(title);
	dto2.setContent(content);
 --%>
<jsp:useBean id="dto" class="test.cafe.dto.CafeDto"/>
<jsp:setProperty property="num" name="dto"/>
<jsp:setProperty property="title" name="dto"/>
<jsp:setProperty property="content" name="dto"/>
<%
	boolean isSuc = CafeDao.getIns().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container pt-5">
	<%if(isSuc){%>
		<p class="alert alert-success">
			수정했습니다.
		</p>
		<a class="alert-link" href="${pageContext.request.contextPath}/cafe/detail.jsp?num=<%=dto.getNum()%>">확인</a>
	<%}else{%>
		<p class="alert alert-danger">
			수정 실패했습니다.
		</p>
		<a class="alert-link" href="updateform.jsp?num=<%=dto.getNum() %>">다시 수정하러 가기</a>
	<%}%>
	</div>
</body>
</html>