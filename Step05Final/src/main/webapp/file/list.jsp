<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	FileDao dao = FileDao.getIns();
	List<FileDto> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>자료실</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<a href="${pageContext.request.contextPath}/file/private/upload_form.jsp">업로드 하기</a>
		<h1>자료실 목록입니다.</h1>
		<table class="table table-striped border border-2 mt-3">
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<%for(FileDto tmp : list){%>
				<tr>
					<td><%=tmp.getNum()%></td>
					<td><%=tmp.getWriter()%></td>
					<td><%=tmp.getTitle()%></td>
					<td><%=tmp.getSaveFileName()%></td>
					<td><%=tmp.getRegdate()%></td>
				</tr>
				<%}%>
			</tbody>
		</table>
	</div>
</body>
</html>