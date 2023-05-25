<%@page import="test.guest.dto.GuestDto"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");    

	int num = Integer.parseInt(request.getParameter("num"));
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	
	GuestDto dto = new GuestDto();
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setPwd(pwd);
	
	boolean isSuc = GuestDao.getIns().update(dto);
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
	<div class="container mt-5">
		<h1>알림</h1>
		<%if(isSuc){%>
			<p class="alert alert-dark">
				<strong><%=num%></strong>번 게시글 수정 완료
				<div>
					<button type="button" class="btn btn-dark" onClick="location.href='list.jsp'">돌아가기</button>
				</div>
			</p>
		<%} else {%>
			<p class="alert alert-dark"">
				게시글 수정 실패
				<div>
					<button type="button" class="btn btn-dark" onClick="location.href='updateform.jsp?num=<%=num%>'">다시수정</button>
				</div>
			</p>
		<%} %>
	</div>
</body>
</html>