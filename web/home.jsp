<%@ page import="model.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="db.DbManager" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 12.02.2024
  Time: 21:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%@include file="head.jsp"%>
</head>
<body>
<%@include file="Navbar.jsp"%>
<div class="container p-0">
    <div class="col-sm-12 mt-3 text-center">
        <h2>Welcome to BITLAB SHOP</h2>
    </div>
</div>
<div class="container p-0">
    <div class="col-sm-12 mt-3 text-center">
        <h6>Electronic devices with high quality and service</h6>
    </div>
</div>
<div class="container-md p-0 ">
    <div class="row justify-content-center">
        <%
            List<Item> items = DbManager.getItems();
            for(Item item: items) { %>
        <div class="col-sm-4 mt-3">
            <div class="card">
                <h5 class="card-header text-center"><%=item.getName()%></h5>
                <div class="card-body text-center">
                    <h5 class="card-title" style="color: green"><%=item.getPrice()%></h5>
                    <p class="card-text"><%=item.getDescription()%></p>
                    <a href="#" class="btn btn-success">Buy Now</a>
                </div>
            </div>
        </div>
        <% }%>
    </div>
</div>
</body>
</html>
