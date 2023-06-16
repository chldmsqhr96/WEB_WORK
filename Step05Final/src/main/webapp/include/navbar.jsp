<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-dark bg-dark navbar-expand-md" data-bs-theme="dark">
    <div class="container">
       <a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">
         <img src="https://getbootstrap.com/docs/5.3/assets/brand/bootstrap-logo.svg" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
         Acorn
       </a>
       <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
             data-bs-target="#navbarText">
            <span class="navbar-toggler-icon"></span>
       </button>
       	<div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav me-auto">
              <li class="nav-item">
                   <a id="a1" class="nav-link ${param.current eq 'file' ? 'active':''}" href="${pageContext.request.contextPath}/file/list.jsp">자료실 목록</a>
              </li>
              <li class="nav-item">
                   <a id="a2" class="nav-link ${param.current eq 'cafe' ? 'active':''}" href="${pageContext.request.contextPath}/cafe/list.jsp">게시글 목록</a>
              </li>
            </ul>
            <div class="navbar-nav">
            <c:choose>
               <c:when test="${not empty id }">
                  <strong><a class="nav-link" href="${pageContext.request.contextPath }/users/private/info.jsp">${id }</a></strong>
                  <a class="nav-link" href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
               </c:when>
               <c:otherwise>
                  <a class="nav-link" href="${pageContext.request.contextPath }/users/loginform.jsp">로그인</a>
                  <a class="nav-link" href="${pageContext.request.contextPath }/users/signup_form.jsp">회원가입</a>
               </c:otherwise>
            </c:choose>
         	</div>
       	</div>
    </div>
</nav>