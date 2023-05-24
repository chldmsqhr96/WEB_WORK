<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    /* 
      몇번 상품 몇개 인지를 HttpsServletRequest 객체를 이용해 얻어낸 다음
	  아래 html 요소에 출력
	*/
	
	// request.setCharacterEncoding("utf-8"); // get 방식에선 한글이 안깨짐으로 사용하지 않음
	
	// String num = request.getParameter("num");
	// String am = request.getParameter("amount");
	
	/* 
	  전송받은 매개변수를 숫자로 사용해야 하는 경우가 있다. 
	  이와 같은 경우 Integer.parseInt / Double.parseDouble를 사용해주자.
	*/
	int num = Integer.parseInt(request.getParameter("num"));
	int am = Integer.parseInt(request.getParameter("amount"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매창</title>
</head>
<body>
	<p>
		<strong><%=num%></strong>번 상품 <strong><%=am%></strong>개를 주문했습니다.
	</p>
</body>
</html>