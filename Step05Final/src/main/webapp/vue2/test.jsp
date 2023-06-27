<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
<div id="app">
        <form action="test.jsp" @submit.prevent="onSubmit">
            <input type="text" v-model="greet">
            <button type="submit">전송</button>
        </form>
        <p ref="result"></p>
    </div>
   
   	<script>
        let app=new Vue({
            el:"#app",
            data:{
              greet:""
            },
            methods:{
              onSubmit(){
            	  this.$refs.result.innerText = this.greet;
              }
            }
        });
   </script>
</body>
</html>