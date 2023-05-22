<%@page import="Test.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<style>
</style>
</head>
<body>
<%
	List<MemberDto> list = new ArrayList();
	list.add(new MemberDto(1, "김구라", "행신동"));
	list.add(new MemberDto(2, "해골", "분당동"));
	list.add(new MemberDto(3, "원숭이", "정자동"));
%>
<table border="1">
	<thead>
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>주소</th>
	</tr>
	</thead>
	<tbody>
		<% for(MemberDto tmp : list) { %>
			<tr>
				<td><%=tmp.getNum()%></td>
				<td><%=tmp.getName()%></td>
				<td><%=tmp.getAddr()%></td>
			</tr>
		<% } %>
	</tbody>
</table>
</body>
</html>