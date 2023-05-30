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
	<h1>promise 테스트</h1>
	<script>
		new Promise(function(resolve, reject){
			//resolve, reject 매개 변수 명은 마음대로 작성해도 된다.
			resolve();
			//reject();
		}).then(function(){
			console.log("resolve");
		}).catch(function(){
			console.log("reject");
		});
	</script>
</body>
</html>