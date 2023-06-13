<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	//테스트를 위해 sample데이터를 request scope에 담는다.
	List<String> names=new ArrayList<>();
	names.add("김구라");
	names.add("해골");
	names.add("원숭이");
	
	// "list"라는 키값으로 request scope에 ArrayList 객체 담아두기
	request.setAttribute("list", names);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>test02</title>
</head>
<body>
	<h1>taglib와 el을 이용한 출력</h1>
	<ul>
	<c:forEach var="tmp" items="${list }">
		<li>${tmp }</li>
	</c:forEach>
	</ul>
	<h1>인덱스 표시</h1>
	<ul>
	<c:forEach var="tmp" items="${list }" varStatus="s">
		<li>${tmp } <strong>${s.index }</strong></li>
	</c:forEach>
	</ul>
	<h1>순서 표시</h1>
	<ul>
	<c:forEach var="tmp" items="${list }" varStatus="s">
		<li>${tmp } <strong>${s.count }</strong></li>
	</c:forEach>
	</ul>
	<h1>첫번째 순서인지 여부</h1>
	<ul>
	<c:forEach var="tmp" items="${list }" varStatus="s">
		<li>${tmp } <strong>${s.first }</strong></li>
	</c:forEach>
	</ul>
	<h1>마지막 순서인지 여부</h1>
	<ul>
	<c:forEach var="tmp" items="${list }" varStatus="s">
		<li>${tmp } <strong>${s.last }</strong></li>
	</c:forEach>
	</ul>
	<h1>기존 자바 코드를 이용한 방법</h1>
	<%
		List<String> list=(List<String>)request.getAttribute("list");
	%>
	<ul>
		<%for(String tmp : list){%>
			<li><%=tmp%></li>
		<%}%>
	</ul>
</body>
</html>