%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205" />
  <jsp:setProperty property="port" name="database" value="3306" />
  <jsp:setProperty property="db" name="database" value="4103028026" />
  <jsp:setProperty property="user" name="database" value="4103028026" />
  <jsp:setProperty property="password" name="database" value="Ss4103028026!" />
</jsp:useBean>

<%
 request.setCharacterEncoding("UTF-8");
 String url = "";
 String driver = "com.mysql.jdbc.Driver";
 ResultSet rs = null;
 String account = request.getParameter("account");
 String password = request.getParameter("password");
 String name = request.getParameter("name");
 String birth = request.getParameter("birth");
 String email = request.getParameter("email");
 String phone = request.getParameter("phone");
 int x = 0;int y = 0;
 String message="";
 if(account !=null && password !=null && name !=null && birth !=null && email !=null && phone !=null){
   try{
     database.connectDB();
     String sql = "select * from person;";
     database.query(sql);
     rs = database.getRS();
     if(rs!=null){
       while(rs.next()){
         String accountData = rs.getString("account");
         if(account.equals(accountData)){
           y+=1;
           break;
         }
       }
       if(y!=0){
         message="註冊失敗";
       }else{
         database.insertData(account,password,name,birth,email,phone);
         message="註冊成功";
         }
       }
     }catch(Exception ex){
       out.println(ex);
     }
   }else{
    message="登入成功！";
  }
 try{
   database.connectDB();
   String sql = "select * from person;";
   database.query(sql);
   rs = database.getRS();
 }catch(Exception ex){
   out.println(ex);
 }
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Register Page</title>
  <link rel="stylesheet" href="css/style.css">
 
</head>

<body>
  <hgroup>
  <h1>Register</h1>
  </hgroup>
<form>
  <div class="group">
    <input type="email"><span class="highlight"></span><span class="bar"></span>
    <label>Email</label>
  </div>
  <div class="group">
    <input type="password"><span class="highlight"></span><span class="bar"></span>
    <label>Password</label>
  </div>
    <div class="group">
    <input type="email"><span class="highlight"></span><span class="bar"></span>
    <label>Email</label>
  </div>
    <div class="group">
    <input type="email"><span class="highlight"></span><span class="bar"></span>
    <label>Email</label>
  </div>
    <div class="group">
    <input type="email"><span class="highlight"></span><span class="bar"></span>
    <label>Email</label>
  </div>
    <div class="group">
    <input type="email"><span class="highlight"></span><span class="bar"></span>
    <label>Email</label>
  </div>
  <button type="button" class="button buttonBlue">Login
    <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
  </button>
  <a href="member.html">Doesn't have a account? Sign up!</a>
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
