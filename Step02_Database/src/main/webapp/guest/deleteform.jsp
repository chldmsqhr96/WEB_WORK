<%@page import="test.guest.dto.GuestDto"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	GuestDto dto = GuestDao.getIns().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비밀번호 입력</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
 integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="member" name="current"/>
	</jsp:include>
	<div class="container mt-4">
		<h1 class="mb-3">비밀번호 입력</h1>
		<form action="delete.jsp" method="post">
			<div>
				<label for="num2" style="display: none">삭제할 게시글 번호</label>
				<input type="text" id="num" name="num" value="<%=num%>" readonly style="display: none"/>
			</div>
			<div class="mb-3">
				<label for="pwd" style="display: none">비밀번호</label>
				<input type="password" id="pwd" name="pwd" class="form-control"/>
			</div>
			<div align="right">
				<button type="sumbit" class="btn btn-dark">삭제</button>
				<button type="button" class="btn btn-dark" onClick="location.href='list.jsp'">취소</button>
			</div>

		</form>
	</div>
</body>
</html>