<%--
  Created by IntelliJ IDEA.
  User: jamith
  Date: 5/1/19
  Time: 9:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String lst = request.getParameter("list");
    String[] list = lst.split(",");

    pageContext.setAttribute("list",list);
%>
<html>
<head>
    <title>Update Item</title>
</head>
<style>
    label {
        display: inline-block;
        width: 140px;
        text-align: right;
    }​
</style>
<body>
<div>
    <form action="/item" method="post">
        <input type="hidden" name="_METHOD" value="PUT"/>
        <input type="hidden" name="upList" value="<%=request.getParameter("list")%>"/>
        <label for="itemID"> Item ID</label>
        <input type="text" name="id" id="itemID" value="${list[0]}"><br>
        <label for="itemName">Item Name</label>
        <input type="text" name="name" id="itemName" value="${list[1]}"><br>
        <label for="itemDesc">Item Description</label>
        <input type="text" name="desc" id="itemDesc" value="${list[2]}"><br>
        <label for="itemPrice">Item Name</label>
        <input type="text" name="price" id="itemPrice" value="${list[3]}"><br>
        <input type="submit" value="update Item" style="margin-left: 230px">
    </form>
</div>

<br><br><br>
<button id="btnBack" onclick="openPage()" type="submit" name="conf" value="conf">Back to DashBoard</button>

<script type="text/javascript">
    function openPage() {
        window.location.href = "dashboard.jsp";
    }
</script>

</body>
</html>
