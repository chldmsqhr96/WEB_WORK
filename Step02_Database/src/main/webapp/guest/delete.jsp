<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pwd = request.getParameter("pwd");
	boolean isSuc = GuestDao.getIns().delete(num, pwd);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시글 수정</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="member" name="current"/>
	</jsp:include>
	<div class="container mt-4">
		<h1>알림</h1>
		<%if(isSuc){%>
			<p class="alert alert-dark">
				<strong><%=num%></strong>번 게시글을 삭제 했습니다.
			</p>
			<div>
				<button type="button" class="btn btn-dark" onClick="location.href='list.jsp'">돌아가기</button>
			</div>
		<%} else {%>
			<p class="alert alert-dark">
				게시글 삭제 실패!
			</p>
			<div align="right">
				<button type="button" class="btn btn-dark" onClick="location.href='deleteform.jsp?num=<%=num%>'">다시 삭제</button>
				<button type="button" class="btn btn-dark" onClick="location.href='list.jsp'">게시판으로 돌아가기</button>
			</div>
		<%} %>
	</div>
</body>
</html>