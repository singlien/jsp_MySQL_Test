<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
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
 String birth = request.getParameter("birthday");
 String email = request.getParameter("email");
 String phone = request.getParameter("phone");
 int x = 0;int y = 0;
 String message="";
 if(account !=null && password !=null && name !=null && birth !=null && email !=null && phone !=null){  //註冊
   try{
     database.connectDB();
     String sql = "select * from person;"; // Catch every data from 'person'
     database.query(sql);
     rs = database.getRS();
     if(rs!=null){
       while(rs.next()){
         String accountData = rs.getString("account");
         if(account.equals(accountData)){ // Find if any duplicate account
           y+=1;
           break;
         }
       }
       if(y!=0){  // If account exists
         message="註冊失敗";
       }else{     // If account doesn't exist, write a new account into database
         database.insertData(account,password,name,birth,email,phone);
         message="註冊成功";
         }
       }
     }catch(Exception ex){
       out.println(ex);
     }
   }else
   {
    message="登入成功！";
   }
 try{ //登入
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
  <title>登入結果</title>
  <link rel="stylesheet" href="css/style.css">
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
 
</head>

<body>
  <hgroup>
  <h1 id="title_message"><%=message%></h1>
  </hgroup>
    <form>
      <%
          if(rs!=null && y==0){
            while(rs.next()){
              if(account.equals(rs.getString("account"))){      // Find the account then check password
                if(password.equals(rs.getString("password"))){  // Password also equals
                  String namet=rs.getString("name");
                  String birtht=rs.getString("birth");
                  String emailt=rs.getString("email");
                  String phonet=rs.getString("phone");
      %>
      <!-- 成功登入 -->
      <!-- Print data -->
      你好，<%=namet%>以下是您的基本資料
      	<table class="t">
		  <tr>
		    <th>姓名</th>
		    <th><%=namet%></th>
		  </tr>
		  <tr>
		    <td>生日</td>
		    <td><%=birtht%></td>
		  </tr>
		  <tr>
		    <td>E-Mail</td>
		    <td><%=emailt%></td>
		  </tr>
		  <tr>
		    <td>電話號碼</td>
		    <td><%=phonet%></td>
		  </tr>
		</table>
       
      <button type="button" class="button buttonBlue" onclick=" window.open('logout.jsp', '_self');">Logout
      <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
      </button>
      <button type="button" class="button buttonBlue" onclick="window.open('find.jsp','_self');">Find users
      <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
      </button>
      <%
                  x+=1;
                  session.setAttribute("login", "ok");
     		   	  session.setAttribute("user", rs.getString("name"));
                  break;
                }

              }
            }
          }

      %>
      
      <!-- 帳號或密碼錯誤 -->
      <%if(x==0 && y==0){%> 
        <script>$("#title_message").html("登入失敗");</script>
        <%session.removeAttribute("login");%>
        <p>帳號或密碼錯誤</p>
        <button type="button" class="button buttonBlue" onclick=" window.open('logout.jsp', '_self');">Logout
        <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
        </button>
      <%}%>
      <!-- 帳號已被使用 -->
      <%if(y!=0){%>
        <!-- Title還是登入失敗 -->
        <p>帳號已被使用</p>
        <br>
        <button type="button" class="button buttonBlue" onclick=" window.open('index.html', '_self');">Sign in
        <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
        </button>        
        <a href="register.html">Doesn't have a account? Sign up!</a>
      <%}%>
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

