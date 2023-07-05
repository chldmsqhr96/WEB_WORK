<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<!-- plug-in css -->
<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<style>
	.container{
		width:768px;
		margin:0 auto;
	}
	.fotorama img{
		max-width:100%;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="fotorama" data-allowfullscreen="true" data-autoplay="true">
			<img src="${pageContext.request.contextPath}/vue2/images/top01.jpg"/>
			<img src="${pageContext.request.contextPath}/vue2/images/top02.jpg"/>
			<img src="${pageContext.request.contextPath}/vue2/images/top03.jpg"/>
			<img src="${pageContext.request.contextPath}/vue2/images/top04.jpg"/>
			<img src="${pageContext.request.contextPath}/vue2/images/top05.jpg"/>												
		</div>
	</div>
	<!-- jquery -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<!-- plug-in js loading -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
</body>
</html>