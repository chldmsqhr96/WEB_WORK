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
	<h1>Promise 테스트</h1>
	<script>
		let p1 = new Promise(function(resolve, reject){
			/*
				함수의 인자로 전달되는 resolve(성공 시), reject(실패 시)는 함수이다.
				resolve는 작업을 성공했을 때 호출해야 하는 함수이고.
				reject는 작업이 실패되었을 때 호출해야 하는 함수이다.
				resolve가 호출되면 .then()안의 함수가 자동으로 호출되며,
				reject가 호출되면 .catch()안의 함수가 자동으로 호출된다.
			*/
			
			//resolve();
			reject();
			console.log("함수를 호출했습니다.");
		});
		//resolve시 then 호출
		p1.then(function(){
			console.log("then안의 함수가 호출됌")
		})
		//reject시 ctach 호출
		p1.catch(function() {
			console.log("catch안의 함수가 호출됌")
		})
	</script>
</body>
</html>