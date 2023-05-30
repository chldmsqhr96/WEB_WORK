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
	<h1>promise 테스트</h1>
	<script>
		let data = {num:1, name:"김구라"};
		
		new Promise(function(resolve, reject){
			resolve(data);
		}).then(function(resolve){
			console.log(data.num + " " + data.name);
		}).catch(function(){
			console.log("reject");
		});
	</script>
</body>
</html>