<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONWriter"%>
<%@page import="org.apache.catalina.valves.JsonAccessLogValve"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	final int PAGE_ROW_COUNT=5;
	final int PAGE_DISPLAY_COUNT=5;
	int pageNum=1;
	
	String strPageNum=request.getParameter("pageNum");
	if(strPageNum != null){
		pageNum=Integer.parseInt(strPageNum);
	}
	
	int startRowNum = 1 + (pageNum-1) * PAGE_ROW_COUNT;
	int endRowNum = pageNum * PAGE_ROW_COUNT;
	int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
	int totalRow = CafeDao.getIns().getCount();
	int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	
	if(endPageNum > totalPageCount){
		endPageNum = totalPageCount;
	}
	
	CafeDto dto = new CafeDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	List<CafeDto> list = CafeDao.getIns().getList(dto);
	
	JSONObject obj = new JSONObject();
	obj.put("list", list);
	obj.put("pageNum", pageNum);
	obj.put("startPageNum", startPageNum);
	obj.put("endPageNum", endPageNum);
	obj.put("totalPageCount", totalPageCount);
	
	//JSONWriter 클래스의 static 메소드를 이용해서 List<CafeDto>를 JSON문자열로 변환
	String json = JSONWriter.valueToString(obj);
	//이후 클라이언트에게 JSON 문자열로 응답하기(fetch 요청에 대한 응답)
%>
<%=json%>