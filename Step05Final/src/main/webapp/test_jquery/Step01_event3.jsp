<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>event3</title>
</head>
<body>
	<h1>이벤트 처리</h1>
	<input type="text" id="inputMsg" placeholder="메세지 입력..."/>  
	<button id="sendBtn">전송</button>
	<p id="current"></p>
	<ul id="msgList">
		
	</ul>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
		$("#inputMsg").on("keyup", (e)=>{
			const text = $(e.target).val();
			$("#current").text(text);
			if(e.keyCode==13){
				const msg = $("#inputMsg").val();
				$("<li>").text(msg).appendTo("#msgList");
				$("#inputMsg").val("");
			}
		});
	
		$("#sendBtn").on("click", (e)=>{
			const msg = $("#inputMsg").val();
			$("<li>").text(msg).appendTo("#msgList");
			$("#inputMsg").val("").focus();
		})
	</script>
</body>
</html>