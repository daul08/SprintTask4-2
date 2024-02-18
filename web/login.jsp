<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 18.02.2024
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="head.jsp"%>
</head>
<body>
<%@include file="Navbar.jsp"%>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <%
                String message = request.getParameter("result");
                if (message != null) { %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong><%=message%></strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
                <% }       %>
            <form action="/auth" method="post">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                    <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input type="password" name="user_password" class="form-control" id="exampleInputPassword1">
                </div>
                <button type="submit" class="btn btn-success">Login</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
