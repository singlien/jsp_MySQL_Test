<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
 String  name= request.getParameter("name");
 String  passwd =  request.getParameter("passwd");

out.println("success");
out.print(name);
%>
