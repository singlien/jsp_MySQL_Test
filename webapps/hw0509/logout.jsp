<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Logout</title>
  <link rel="stylesheet" href="css/style.css">
</head>

<body>
  <hgroup>
  <h1>Logout Successful</h1>
  </hgroup>
<form>
  <div class="group">
    <input name="account" type="text"><span class="highlight"></span><span class="bar"></span>
    <label>Auto redirect to login page</label>
  </div>
</form>

<footer>
<a href="http://www.google.com/" target="_blank">
<img src="https://www.polymer-project.org/images/logos/p-logo.svg"></a>
  <p>You Gotta Love <a href="http://www.google.com/" target="_blank">Google</a></p>
</footer>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script src="js/index.js"></script>

</body>
</html>
  <%
  session.removeAttribute("login");
  response.setRedirect("index.html");
  %>
