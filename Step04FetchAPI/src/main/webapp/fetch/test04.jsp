<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>테스트04</title>
</head>
<body>
	<button id="moreBtn">더보기</button>
	<ul id="msgList">
		<li>하나</li>
		<li>둘</li>
		<li>셋</li>
	</ul>
	<script>
		document.querySelector("#moreBtn").addEventListener("click", ()=>{
			fetch("get_msg2.jsp")
			.then(res=>res.text())
			.then((data)=>{
				console.log(data);
				let msg = JSON.parse(data);
                for (let i = 0; i < msg.length; i++) {
                    let li = document.createElement("li");
                    li.innerHTML = msg[i];
                    document.querySelector("#msgList").append(li);
                }
			});
		});
	</script>
</body>
</html>