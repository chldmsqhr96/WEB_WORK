<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<MemberDto> mem = (ArrayList<MemberDto>)request.getAttribute("mem");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 목록</title>
</head>
<body>
	<h1>회원 목록</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>주소</th>
		</tr>
		<%
		for(MemberDto tmp : mem){
		%>
		<tr>
			<td><%=tmp.getNum()%></td>
			<td><%=tmp.getName()%></td>
			<td><%=tmp.getAddr()%></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>