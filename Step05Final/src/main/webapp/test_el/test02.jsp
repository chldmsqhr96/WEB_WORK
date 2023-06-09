<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

   String myName="김구라";
   /*
      page scope 에  "myName" 이라는 키값으로 myName 담기
      해당 jsp 페이지 에서만 사용할수 있다.
   */
   pageContext.setAttribute("myName", myName);
   
   String yourName="해골";
   /*
      request scope 에 "yourName" 이라는 키값으로 yourName 담기
      request scope 에 담은 값은 응답하기 전까지 사용할수 있다.
      (다른 페이지로 forward 이동해도 사용할수 있다)
      (다른 페이지로 redirect 이동하면 사용할수 없다)
   */
   request.setAttribute("yourName", yourName);
   
   String ourName="원숭이";
   /*
      session scope 에  "ourName" 이라는 키값으로 ourName 담기
      session scope 에 담은 값은 세션이 유지 되는 동안 사용할수 있다.
      (다른 페이지로 forward, redirect 이동 해도 사용할수 있다)
      (웹브라우저를 닫거나 세션을 초기화 하기 전까지 사용할수 있다)
   */
   session.setAttribute("ourName", ourName);
   
   String companyName="에이콘";
   /*
      application scope 에 "companyName" 이라는 키값으로 companyName 담기
      application scope 에 담은 내용은 서버를 끄기 전까지 사용할수 있다.
      (웹브라우저를 닫아도 지워지지 않는다)
   */
   application.setAttribute("companyName", companyName);
   
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>scope</title>
</head>
<body>
	<div class="container">
		<p>내 이름은 ${pageScope.myName}</p>
		<p>내 이름은 ${myName}</p>
		
		<p>${requestScope.yourName}</p>
		<p>${yourName}</p>
		<% String result=(String)request.getAttribute("yourName"); %>
		<p><%=result%></p>
		
		<p>${sessionScope.ourName}</p>		
		<p>${ourName}</p>
		<% String result2=(String)session.getAttribute("ourName"); %>
		<p><%=result2%></p>
		
		<p>학원 이름 ${applicationScope.companyName}</p>
		<p>${companyName}</p>
	</div>
</body>
</html>