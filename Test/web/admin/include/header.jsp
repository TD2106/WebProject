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
                    <a class="navbar-brand" href=<%= "\"index.jsp\"" %>><span class="glyphicon glyphicon-film" aria-hidden="true"></span>Movie Watching <small>for Admin</small></a>
                </div>
                <div class="collapse navbar-collapse" id="bs-nav-demo">
                    <div class='nav navbar-nav navbar-right'>
                        <li><a href=<%= "\"removeAcc.jsp\"" %>>Remove Account</a></li>
                        <li><a href=<%= "\"addMovie.jsp\"" %>>Add Movies</a></li>
                        <li><a href=<%= "\"removeMovie.jsp\"" %>>Remove Movies</a></li>
                        <li><a href=<%= "\"editMovie.jsp\"" %>>Edit Movie</a></li>
                    </div>
                </div>
            </div>
        </nav>
        <div class="container-fluid">