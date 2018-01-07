<%-- 
    Document   : delete
    Created on : Dec 11, 2017, 10:59:31 AM
    Author     : huong
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="db.DatabaseConnection"%>
<%
    String id = request.getParameter("id");
    String[] words = id.split(",");
    int idMember = 0, idMovie = 0, count = 0;
    for(String word: words){
        String[] w = word.split("=");
        if(count == 0){
            idMember = Integer.parseInt(w[1]);
        }else{
            idMovie = Integer.parseInt(w[1]);
        }
        count++;
    }
    DatabaseConnection db = new DatabaseConnection();
    Connection con = db.setConnection();

    String sql = "delete from favorite where idMember = " + idMember + " and idMovie = " + idMovie;
    
    db.getResultDo(sql, con);
    response.sendRedirect("user.jsp?id=2");
%>
