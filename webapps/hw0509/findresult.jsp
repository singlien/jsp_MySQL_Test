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
 int isFind=0;
 String message="";
 if(account !=null){
   try{
     database.connectDB();
     String sql = "select * from person;"; // Catch every data from 'person'
     database.query(sql);
     rs = database.getRS();
     if(rs!=null && !account.equals("*")){
       while(rs.next()){
         String accountData = rs.getString("account");
         if(account.equals(accountData)){ 
           isFind+=1;
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
    <h1>Search Result</h1>
    </hgroup>
      	<%
      	if(account.equals("*")){
      	// Print all accounts in database
      	%>
      	<table align="center">

      	  <tr class="table_firstRow">
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
  				<th><%=rs.getString("account")%></th>
  				<th><%=rs.getString("password")%></th>
  				<th><%=rs.getString("name")%></th>
  				<th><%=rs.getString("birth")%></th>
  				<th><%=rs.getString("email")%></th>
  				<th><%=rs.getString("phone")%></th>
  				<th><%=rs.getString("timestamp")%></th>
  			</tr>
      	<%}%>
  		</table>
  		</div>
  	      <form>
  		<button type="button" class="button buttonBlue" onclick="window.open('logout.jsp', '_self');">Logout
      	<div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
        	</button>
        	</form>
  		
          
          <%}else{%>
       	<form>

       	<%    if(isFind!=0){ //Found result and print data
  		       	String namet=rs.getString("name");
  		       	String birtht=rs.getString("birth");
  		       	String emailt=rs.getString("email");
  		       	String phonet=rs.getString("phone");
  		       	String createt=rs.getString("timestamp");
        	%>
  	      Name：<%=namet%><br>
  	      Birthday：<%=birtht%><br>
  	      E-Mail：<%=emailt%><br>
  	      Phone：<%=phonet%><br>
  	      Account created：<%=createt%><br><br> 
       		 <%}else{%>
   		Account no match!!!
        <%}%>

        <button type="button" class="button buttonBlue" onclick="window.open('logout.jsp', '_self');">Logout
        <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
        </button>
        <button type="button" class="button buttonBlue" onclick="window.open('find.jsp','_self');">Find users
        <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
        </button>
        
      	</form>
   <%}%>
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
