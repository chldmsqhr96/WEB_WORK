<%@page import="org.json.JSONWriter"%>
<%@page import="org.apache.catalina.valves.JsonAccessLogValve"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CafeDto dto = new CafeDto();
	dto.setStartRowNum(1);
	dto.setEndRowNum(10);
	List<CafeDto> list = CafeDao.getIns().getList(dto);
	
	//JSONWriter 클래스의 static 메소드를 이용해서 List<CafeDto>를 JSON문자열로 변환
	String json = JSONWriter.valueToString(list);
	//이후 클라이언트에게 JSON 문자열로 응답하기(fetch 요청에 대한 응답)
%>
<%=json%>