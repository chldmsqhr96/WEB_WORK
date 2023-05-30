<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//db에서 불러온 더보기 작업이라고 가정
	List<String> list = new ArrayList<>();
	list.add("어쩌구");
	list.add("저쩌구");
	list.add("이렇쿵");
%>
<%	for(String tmp : list){%>
		<li><%=tmp%></li>
<%}%>