<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>테스트06</title>
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
			fetch("get_msg3.jsp")
			.then(res=>res.json())//서버에서 응답한 문자열 형식이 json이라면 res.json()으로 바꿔준다.
			.then((data)=>{
                for (let i = 0; i < data.length; i++) {
                    let li = `<li>\${data[i]}</li>`;
                    document.querySelector("#msgList").insertAdjacentHTML("beforeend", li);
                }
			}).catch((err)=>{
				console.log(err);
				console.log("잘못된 선언");
			})
		});
	</script>
</body>
</html>