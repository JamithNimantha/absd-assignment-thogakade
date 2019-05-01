<%--
  Created by IntelliJ IDEA.
  User: jamith
  Date: 5/1/19
  Time: 8:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Item</title>
    <style>
        label {
            display: inline-block;
            width: 140px;
            text-align: right;
        }​
    </style>
</head>
<body>
<div>
    <form action="/item" method="post">
        <label for="itemID">    Item ID</label>
        <input type="text" name="id" id="itemID"><br>
        <label for="itemName">Item Name</label>
        <input type="text" name="name" id="itemName"><br>
        <label for="itemDesc">Item Description</label>
        <input type="text" name="desc" id="itemDesc"><br>
        <label for="itemPrice">Item Name</label>
        <input type="text" name="price" id="itemPrice"><br>
        <input type="submit" value="Add Item" style="margin-left: 230px">
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
