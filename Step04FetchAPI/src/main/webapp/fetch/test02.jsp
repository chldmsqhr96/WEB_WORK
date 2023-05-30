<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>테스트02</title>
</head>
<body>
	<input type="text" id="msg" placeholder="입력..."/>
	<button id="sendBtn">전송</button>
	<script>
		document.querySelector("#sendBtn").addEventListener("click", ()=>{
			//입력한 문자열 읽어오기
			const msg = document.querySelector("#msg").value;
			
			fetch("send.jsp?msg="+msg)
			.then((res)=>{
				return res.text();
			})
			.then((data)=>{
				console.log(data);
			});
		})
	</script>
</body>
</html>