<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
String id= request.getParameter("id");
 String ip ="140.120.54.114:3306";
 String user="jspuser";
 String pwd="jspuser";
 String db="jspuser";
 String driver="com.mysql.jdbc.Driver";
 Connection con = null;
 Statement stmt = null;
 ResultSet rs =null;
 try{
String url = "jdbc:mysql://"+ip+"/"+db+"?useUnicode=true&characterEncoding=utf-8";
Class.forName(driver).newInstance();
con=DriverManager.getConnection(url,user,pwd);
stmt=con.createStatement();
String sql="select*from travel where id="+id;
rs = stmt.executeQuery(sql);

 }catch(Exception ex){
out.println(ex);

 }
%>


<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <title></title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
<style>
 .card-header{
   font-size:20px;
   font-weight: bold;
 }
</style>
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>

</head>
  <body>
    <div class="navbar-fixed">
            <nav>
                <div class="nav-wrapper">
                    <center>
                        <h style="font-size:25px;font-weight:bold;">旅遊景點</h>
                    </center>
                </div>
            </nav>
          </div>
          <div class="row">
            <%
            if(rs !=null){
            while(rs.next()){
            String name=rs.getString("name") ;
            String photo=rs.getString("photo") ;
            String location=rs.getString("location") ;
            String description=rs.getString("description") ;
            String createdAt=rs.getString("createdAt") ;
            %>
            <div class="card">
              <div class="card-image">
                  <img src="<%=photo%>" style="background-color:black;" height=500>
              </div>
              <div class="card-content">
                  <h style="font-size:20px;font-weight:bold;"><%=name%></h>
                  <p><%=description%></p>
              </div>
          </div>
          <%}}%>
                </div>
  </body>
</html>
