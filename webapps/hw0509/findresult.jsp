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

 String message="";
 if(account !=null && account!="*"){
   try{
     database.connectDB();
     String sql = "select * from person;"; // Catch every data from 'person'
     database.query(sql);
     rs = database.getRS();
     if(rs!=null){
       while(rs.next()){
         String accountData = rs.getString("account");
         if(account.equals(accountData)){ 
           break;
         }
       }
      }
     }catch(Exception ex){
       out.println(ex);
     }
   }
%>
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
  <hgroup>
  <h1>Search Result</h1>
  </hgroup>
    <form>

    	<%
    	if(account="*"){
    	// Print all accounts in database
    	%>
    	<table>
    	  <tr>
		    <td>Account</td>
 		    <td>Password</td>
   		 	<td>Name</td>
    		<td>Birthday</td>
    		<td>E-mail</td>
    		<td>Phone</td>
    		<td>Created at</td>
		  </tr>
    	<%while(rs.next()){%>
			<tr>
				<th><%rs.getString("account");%></th>
				<th><%rs.getString("password");%></th>
				<th><%rs.getString("name");%></th>
				<th><%rs.getString("birth");%></th>
				<th><%rs.getString("email");%></th>
				<th><%rs.getString("phone");%></th>
				<th><%rs.getString("timestamp");%></th>
			</tr>
    	<%}%>
		</table>
  		<%}else{
       	 String namet=rs.getString("name");
       	 String birtht=rs.getString("birth");
       	 String emailt=rs.getString("email");
       	 String phonet=rs.getString("phone");
      	%>
      <!-- 找到結果 -->
      <!-- Print data -->
      姓名：<%=namet%><br>
      生日：<%=birtht%><br>
      E-Mail：<%=emailt%><br>
      電話號碼：<%=phonet%><br>

      <%}%>
       
      <button type="button" class="button buttonBlue" onclick="logout();">Logout
      <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
      </button>
      <button type="button" class="button buttonBlue" onclick="window.open('find.jsp','_self');">Find users
      <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
      </button>
      
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
