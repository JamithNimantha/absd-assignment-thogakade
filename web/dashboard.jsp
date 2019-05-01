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
<%-- USED JAVA TAG LIBRARY --%>

<script type="application/javascript">
    function showAlert() {
        alert("New Item Added !");
    }
    function showUpdateAlert() {
        alert("Item Updated !")
    }
    function showDeleteAlert() {
        alert("Item Removed !")
    }
</script>
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

    String[] newItem = (String[]) request.getAttribute("list"); // GET NEW ITEM ARRAY FROM Item.java

    String [] updatedItem = (String[]) request.getAttribute("updatedList"); // GET UPDATED ITEM ARRAY FROM Item.java

    String [] upLst = (String[]) request.getAttribute("upLst");  // GET ITEM ARRAY BEFORE UPDATED

    String[] delLst = (String[]) request.getAttribute("delLst");        // GET DELETED ITEM ARRAY

    if (delLst!=null){
        for (int i =0;i<list.size();i++){
            if (list.get(i)[0].equals(delLst[0])){
                list.remove(i);
                %>

                <script type="application/javascript">
                    showDeleteAlert();
                </script>

<%
            }
        }
    }

    if (updatedItem!=null){
        String [] itemupdated = {updatedItem[0],updatedItem[1],updatedItem[2],updatedItem[3]};
        String [] itemDel ={upLst[0],upLst[1],upLst[2],upLst[3]};
        for (int i =0 ;i<list.size();i++){
            if (list.get(i)[0].equals(itemDel[0])){
                list.remove(i);
            }
        }
        list.add(itemupdated);
        %>

        <script type="application/javascript">
            showUpdateAlert();
        </script>

<%
    }

    if (newItem!=null){
        String []  itemnew = {newItem[0],newItem[1],newItem[2],newItem[3]};
        list.add(itemnew); // ADD THE STRING ARRAY TO THE LIST
%>

 <%--FUNCTION showAlert() WILL EXECUTE IF newItem IS NOT NULL. SO USER WILL KNOW THAT THE ITEM HAS BEEN ADDED--%>

            <script type="application/javascript">
                showAlert();  // EXECUTE THE FUNCTION showAlert()
            </script>
<%
    }


    pageContext.setAttribute("userName",request.getAttribute("userName"));
    // SET ATTRIBUTE USERNAME TO pageContext

    pageContext.setAttribute("itemList",list);
    // SET ATTRIBUTE itemList to pageContext

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
<h1 align="center"><b>hi! <%=pageContext.getAttribute("userName")%></b></h1>  <%--SHOWS THE USERNAME OF THE USER--%>
<div style="padding-left: 25%;padding-top: 100px">
    <table border="1">
        <tr>
            <th>Item ID</th>
            <th>Item Name</th>
            <th>Item Description</th>
            <th>Item Price</th>
        </tr>
        <c:forEach var="temp" items="${itemList}"> <%-- FOREACH LOOP TO ADD ITEMS TO THE TABLE --%>
            <tr>
                <td>${temp[0]}</td>
                <td>${temp[1]}</td>
                <td>${temp[2]}</td>
                <td>${temp[3]}</td>
                <form action="/item" method="get">
                    <td><button type="submit" name="list" value="${temp[0]},${temp[1]},${temp[2]},${temp[3]}">View</button></td>
                </form>
                <form action="updateitem.jsp" method="post">
                    <td><button type="submit" name="list" value="${temp[0]},${temp[1]},${temp[2]},${temp[3]}">update</button></td>
                </form>
                <form action="/item" method="post">
                    <input type="hidden" name="_METHOD" value="DELETE"/>
                    <td><button type="submit" name="list" value="${temp[0]},${temp[1]},${temp[2]},${temp[3]}">remove</button></td>
                </form>
            </tr>
        </c:forEach>
    </table>
</div>
<br><br><br>
<button id="btnBack" onclick="openPage()" type="submit" name="conf" value="conf">Add New Item</button>

<script type="text/javascript">
    function openPage() {
        window.location.href = "additem.jsp";
    }
</script>

</body>
</html>
