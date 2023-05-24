<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		1. 폼 전송되는 회원의 정보를 얻어온다.
		2. db에 수정을 반영한다
		3. 결과를 응답한다
	*/
	request.setCharacterEncoding("utf-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	
	MemberDto dto = new MemberDto(num, name, addr);
	
	boolean isSuccess = MemberDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
	<div class="container mt-5">
		<h1>알림</h1>
		<%if(isSuccess){%>
			<p class="alert alert-success">
				<strong><%=num%></strong>번 회원 수정 완료
				<a class="alert-link" href="list.jsp">회원 목록으로 돌아가기</a>
			</p>
		<%} else {%>
			<p class="alert alert-danger">
				수정 실패
				<a class="alert-link" href="updateform.jsp?num=<%=num%>">다시 수정</a>
			</p>
		<%} %>
	</div>
</body>
</html>