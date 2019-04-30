<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: jamith
  Date: 4/9/19
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%

    List<String[]> list= new ArrayList<>();

    String[] item = {"ID001","Rice","Sri Lankan Rice","500.00"};
    String[] item2 = {"ID002","Dhal","Indian Dhal","200.00"};
    String[] item3 = {"ID003","Potato","Lankan Potato","220.00"};
    String[] item4= {"ID004","Cream Cracker","Biscuit","180.00"};
    String[] item5 = {"ID005","Maggie","Noodles","70.00"};

    list.add(item);
    list.add(item2);
    list.add(item3);
    list.add(item4);
    list.add(item5);

    String[] newItem = (String[]) request.getAttribute("list");

    if (newItem!=null){
        String []  itemnew = {newItem[0],newItem[1],newItem[2],newItem[3]};
        list.add(itemnew);
    }
    pageContext.setAttribute("userName",request.getAttribute("userName"));

    pageContext.setAttribute("itemList",list);

%>
<html>
<head>
    <title>DashBoard</title>
<style>
    label {
        display: inline-block;
        width: 140px;
        text-align: right;
    }​
</style>
</head>
<body>
<h1 align="center"><b>hi! <%=pageContext.getAttribute("userName")%></b></h1>
<div style="padding-left: 25%;padding-top: 100px">
    <table border="1">
        <tr>
            <th>Item ID</th>
            <th>Item Name</th>
            <th>Item Description</th>
            <th>Item Price</th>
        </tr>
        <c:forEach var="temp" items="${itemList}">
            <tr>
                <td>${temp[0]}</td>
                <td>${temp[1]}</td>
                <td>${temp[2]}</td>
                <td>${temp[3]}</td>
                <form action="/item" method="get">
                    <td><button type="submit" name="list" value="${temp[0]},${temp[1]},${temp[2]}">View</button></td>
                </form>
                <form action="/item" method="put">
                    <td><button type="submit" name="list" value="${temp[0]},${temp[1]},${temp[2]}">update</button></td>
                </form>
                <form action="/item" method="delete">
                    <td><button type="submit" name="list" value="${temp[0]},${temp[1]},${temp[2]}">remove</button></td>
                </form>
            </tr>
        </c:forEach>
    </table>
</div>
<br><br><br>
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


</body>
</html>
