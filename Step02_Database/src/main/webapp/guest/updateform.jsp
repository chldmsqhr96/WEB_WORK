<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
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
<title>게시글 수정</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
 integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<div class="container">
		<h1>게시글 수정</h1>
		<form action="update.jsp" method="post">
			<div class="mb-1">
				<label class="form-label" for="num">게시글 번호</label>
				<input class="form-control" type="text" id="num" name="num" value="<%=num%>" readonly/>
			</div>
			<div class="mb-1">
				<label class="form-label" for="writer">작성자</label>
				<input class="form-control" type="text" id="writer" name="writer" value="<%=dto.getWriter()%>"/>
			</div>
			<div class="mb-1">
				<label class="form-label" for="content">게시글</label>
				<textarea name="content" id="content" cols="30" rows="10" class="form-control"><%=dto.getContent()%></textarea>
			</div>
			<div class="mb-3">
				<label class="form-label" for="pwd">비밀번호</label>
				<input class="form-control" type="password" id="pwd" name="pwd"/>
			</div>
			<button class="btn btn-dark" type="sumbit">수정확인</button>
			<button type="button" class="btn btn-dark" onClick="location.href='list.jsp'">취소</button>
		</form>
	</div>
</body>
</html>