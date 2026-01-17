<%-- 
    Document   : LoginURL
    Created on : 18-10-2010, 12:31:48
    Author     : Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="ch.css" type="text/css" rel="stylesheet" media="all">
    </head>
    <body>
        <div id="container">
        <h1>Login</h1>
      <form ACTION="http://localhost:8084/HOMEWORK_3/UrlRewritting?jID=5334"
      METHOD="POST">
      Username: <input type="text" name="username"><br>
      Password: <input type="password" name="userpass"><br>
      <input type="hidden" name="session" value="1234">
      <input type="submit" value="Login">
      </form>
        </div>
    </body>
</html>
