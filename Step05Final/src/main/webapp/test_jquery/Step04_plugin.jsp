<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>divdivdivdivdiv</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
</head>
<body>
	<p>1</p>
	<p id="two">2</p>
	<p id="three">3</p>
	<script src="/js/jquery.gura.js"></script>
	<script>
		$("#two").gura();
		$("#three").gura({
			msg:"hi",
			color:"yellow"
		});
	</script>
</body>
</html>