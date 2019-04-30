<%--
  Created by IntelliJ IDEA.
  User: jamith
  Date: 4/30/19
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Items</title>
</head>
<body>

<div style="padding-left: 25%;padding-top: 100px">
    <table border="1">
        <tr>
            <th>Item ID</th>
            <th>Item Name</th>
            <th>Item Description</th>
            <th>Item Price</th>
        </tr>
            <tr>
                <td>${list[0]}</td>
                <td>${list[1]}</td>
                <td>${list[2]}</td>
                <td>${list[3]}</td>
            </tr>
    </table>
</div>

<button id="btnBack" onclick="openPage()" type="submit" name="conf" value="conf">Back to DashBoard</button>

<script type="text/javascript">
    function openPage() {
        window.location.href = "dashboard.jsp";
    }
</script>

</body>
</html>
