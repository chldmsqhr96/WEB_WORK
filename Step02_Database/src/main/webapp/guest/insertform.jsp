<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시글 작성</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
 integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1 class="mb-1">게시글 작성</h1>
		<form action="insert.jsp" method="post">
			<div class="mb-2">
				<label for="writer">작성자</label>
				<input type="text" id="writer" name="writer" placeholder="작성자 입력.." class="form-control">
			</div>
			<div class="mb-2">
				<label for="pwd">비밀번호</label>
				<input type="password" id="pwd" name="pwd" placeholder="비밀번호 입력.." class="form-control">
			</div>
			<div class="mb-2">
				<label for="content">게시글</label>
				<textarea class="form-control" name="content" id="content" cols="30" rows="10"></textarea>
			</div>
			<button type="sumbit" class="btn btn-dark">게시글 추가</button>
			<button type="button" class="btn btn-dark" onClick="location.href='list.jsp'">취소</button>
		</form>
	</div>
</body>
</html>