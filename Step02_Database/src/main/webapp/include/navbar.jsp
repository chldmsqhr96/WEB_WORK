<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
       <%
       		//어느 페이지에 포함되었는지 정보를 얻어오기
       		String current = request.getParameter("current");
       %>
       <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav">
              <li class="nav-item">
                   <a id="a1" class="nav-link <%=current.equals("member") ? "active" : "" %>"href="${pageContext.request.contextPath}/member/list.jsp">회원 목록</a>
              </li>
              <li class="nav-item">
                   <a id="a2" class="nav-link <%=current.equals("guest") ? "active" : "" %>"href="${pageContext.request.contextPath}/guest/list.jsp">게시글 목록</a>
              </li>
            </ul>
       </div>
    </div>
</nav>