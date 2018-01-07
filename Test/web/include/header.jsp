<%-- 
    Document   : header
    Created on : Dec 5, 2017, 9:06:39 AM
    Author     : huong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="db.DatabaseConnection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Watching Movie Website</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-nav-demo" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href=<%= "\"index.jsp\"" %>><span class="glyphicon glyphicon-film" aria-hidden="true"></span>Movie Watching</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-nav-demo">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Category<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                            <%
                                DatabaseConnection db = new DatabaseConnection();
                                Connection con = db.setConnection();
                                String sql = "Select * from category";
                                ResultSet rs = db.getResult(sql, con);
                                while(rs.next()){
                            %>    
                                <li><a href=<%= "\"categoryMovie.jsp?id=" + rs.getInt("idCategory") + "\"" %> class="btn"><%=rs.getString("categoryName")%></a></li>
                            <%}%>    
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search Movie">
                        </div>
                        <button type="submit" class="btn btn-default">Search</button>
                    </form>
                    <div class='nav navbar-nav navbar-right'>
                        <li><a href=<%= "\"login.jsp\"" %>>Login</a></li>
                        <li><a href=<%= "\"register.jsp\"" %>>Sign up</a></li>
                    </div>
                </div>
            </div>
        </nav>
        <div class="container-fluid">