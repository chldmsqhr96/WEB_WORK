<%@page import="test.guest.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	GuestDao dao = GuestDao.getIns();
	List<GuestDto> con = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시판</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
 integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1>게시글 목록</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>작성 번호</th>
					<th>작성자</th>
					<th>게시글 내용</th>
					<th>작성일</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%for(GuestDto tmp : con){%>
					<tr>
						<td><%=tmp.getNum()%></td>
						<td><%=tmp.getWriter()%></td>
						<td><%=tmp.getContent()%></td>
						<td><%=tmp.getRegdate()%></td>
						<td>
							<a href="updateform.jsp?num=<%=tmp.getNum()%>">
								수정
							</a>
						</td>
						<td>
							<a href="deleteform.jsp?num=<%=tmp.getNum()%>">
								삭제
							</a>
						</td>
					</tr>
				<%}%>
			</tbody>
		</table>
		<div>
			<a href="insertform.jsp">게시글 작성</a>
		</div>
	</div>
</body>
</html>