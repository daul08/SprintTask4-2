<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 18.02.2024
  Time: 17:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="head.jsp"%>
</head>
<body>
<%@include file="Navbar.jsp"%>
<div class="container text-center">
    <%
        User user = (User) request.getAttribute("user");
        if (user == null) { %>
    <h1 class ="mt-2 mb-2" style="color: red;">Пройдите аутентификацию</h1>
    <% } else { %>
    <h1 class ="mt-2 mb-2">Hello <%= user.getFullName() %></h1>
    <h5 class ="mt-2 mb-2">This is your profile page</h5>
    <% } %>
</div>
</body>
</html>
