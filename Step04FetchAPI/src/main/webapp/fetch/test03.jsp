<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>테스트03</title>
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
			fetch("get_msg.jsp")
			.then(res=>res.text())
			.then((data)=>{
				//ul 요소가 끝나기 직전에 data의 내용(get_msg.jsp)을 html로 평가해서 추가
				document.querySelector("#msgList").insertAdjacentHTML("beforeend", data);
			});
		});
	</script>
</body>
</html>