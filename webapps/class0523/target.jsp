<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
 String  name= request.getParameter("name"));

 if(rs.next){
   out.print("name:"+name);  
 }  else {
   out.print(name);
 }
%>
