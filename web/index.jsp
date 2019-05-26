<%--
  Created by IntelliJ IDEA.
  User: jamith
  Date: 4/9/19
  Time: 11:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Sign-in</title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
      <style>
          body {
              padding-top: 40px;
              padding-bottom: 40px;
              background-color: #eee;
          }

          .form-signin {
              max-width: 330px;
              padding: 15px;
              margin: 0 auto;
          }
          .form-signin .form-signin-heading,
          .form-signin .checkbox {
              margin-bottom: 10px;
          }
          .form-signin .checkbox {
              font-weight: 400;
          }
          .form-signin .form-control {
              position: relative;
              -webkit-box-sizing: border-box;
              -moz-box-sizing: border-box;
              box-sizing: border-box;
              height: auto;
              padding: 10px;
              font-size: 16px;
          }
          .form-signin .form-control:focus {
              z-index: 2;
          }
          .form-signin input[type="email"] {
              margin-bottom: -1px;
              border-bottom-right-radius: 0;
              border-bottom-left-radius: 0;
          }
          .form-signin input[type="password"] {
              margin-bottom: 10px;
              border-top-left-radius: 0;
              border-top-right-radius: 0;
          }
      </style>
  </head>
  <body>
  <%
      if (request.getSession().getAttribute("userName")!=null){
          request.getRequestDispatcher("/dashboard.jsp").forward(request,response);
      }

      Cookie[] cookies = request.getCookies();

      if(cookies!=null){
          for (Cookie temp : cookies){

              if ("app.username".equals(temp.getName())){
                pageContext.setAttribute("userName",temp.getValue());
              }

              if ("app.password".equals(temp.getName())){
                  pageContext.setAttribute("password",temp.getValue());
              }
          }
      }
  %>
  <div class="container">

      <form class="form-signin" action="/dashboard" method="post">
          <h2 class="form-signin-heading">Login Form</h2>
          <label for="inputUserName" class="sr-only">User Name</label>
          <input type="text" name="user" id="inputUserName" value="${userName}" class="form-control" placeholder="User Name" required autofocus>
          <label for="inputPassword" class="sr-only">Password</label>
          <input type="password" name="pass" id="inputPassword" value="${password}" class="form-control" placeholder="Password" required>
          <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>

  </div> <!-- /container -->
  </body>
</html>
