<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205" />
  <jsp:setProperty property="port" name="database" value="3306" />
  <jsp:setProperty property="db" name="database" value="4103028026" />
  <jsp:setProperty property="user" name="database" value="4103028026" />
  <jsp:setProperty property="password" name="database" value="Ss4103028026!" />
</jsp:useBean>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Search for users</title>
  <link rel="stylesheet" href="css/style.css">
<!--   <script src="js/submit.js"></script>
 -->
</head>

<body>


  <!-- 驗證登入 -->
<%if(session.getAttribute("login")!="ok"){
//Failed to login
%>
  <hgroup>
  <h1>登入無效</h1>
  </hgroup>
<form>
  登入失敗，請重新登入。
      <button type="button" class="button buttonBlue" onclick="window.open('logout.jsp', '_self');">Logout
      <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
        </button>
</form>
<%}else{%>
<!-- /////// -->

  <hgroup>
  <h1>Search</h1>
  </hgroup>
<form action="findresult.jsp" method="get">
  <div class="group">
    <input name="account" type="text"><span class="highlight"></span><span class="bar"></span>
    <label>Search-type * to list all users</label>
  </div>
  <button type="submit" class="button buttonBlue">Submit
    <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
  </button>
  <button type="button" class="button buttonBlue" onclick="window.open('logout.jsp', '_self');">Logout
    <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
  </button>
</form>
<%}%>

<footer>
<a href="http://www.google.com/" target="_blank">
<img src="https://www.polymer-project.org/images/logos/p-logo.svg"></a>
  <p>You Gotta Love <a href="http://www.google.com/" target="_blank">Google</a></p>
</footer>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script src="js/index.js"></script>

</body>
</html>
