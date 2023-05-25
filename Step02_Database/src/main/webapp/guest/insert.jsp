<%@page import="test.guest.dto.GuestDto"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	
	GuestDto dto = new GuestDto();
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setPwd(pwd);
	
	GuestDao dao = GuestDao.getIns();
	boolean isSuc = dao.insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>추가</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
 integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
	<div class="container mt-5">
		<h1>알림</h1>
		<%if(isSuc){%>
			<p class="alert alert-dark">
				<strong><%=writer%></strong>님의 게시글이 작성 되었습니다.
			</p>
			<div>
				<button type="button" class="btn btn-dark" onClick="location.href='list.jsp'">돌아가기</button>
			</div>
		<%}else{%>
			<p class="alert alert-dark">
				작성 실패
			</p>
			<div>
				<button type="button" class="btn btn-dark" onClick="location.href='insertform.jsp'">돌아가기</button>
			</div>
		<%}%>
	</div>
</body>
</html>