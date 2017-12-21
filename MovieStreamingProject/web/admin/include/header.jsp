<%-- 
    Document   : header
    Created on : Dec 5, 2017, 9:06:39 AM
    Author     : huong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, dao.*, model.*, db.*, email.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Watching Movie Website</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <nav class="navbar navbar-default">
<%
    Admin admin = (Admin)session.getAttribute("admin");
%>            
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-nav-demo" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="../admin/index.jsp"><span class="glyphicon glyphicon-film" aria-hidden="true"></span>Movie Watching <small>for Admin</small></a>
                </div>
                <div class="collapse navbar-collapse" id="bs-nav-demo">
                    <ul class="nav navbar-nav">
                        <li id="category" class="dropdown">
                            <a id="categoryName" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Category<span class="caret"></span></a>
                            <ul class="dropdown-menu">
<%  
    CategoryDAO categoryDAO = new CategoryDAO();
    List<Category> categories = categoryDAO.getAllCategory();
    int count = 1;
    for(Category category: categories){
%>    
                                <li><a href="../user/categoryMovie.jsp?id=<%=count%>" class="btn"><%=category.getCategoryName()%></a></li>

<%
        count++;
    }

%>                                    
                            </ul>
                        </li>
                    </ul>
                    <div class='nav navbar-nav navbar-right'>
                        <li id="adSearch"><a href="../user/advanceSearch.jsp">Advance Search</a></li>
                        <li id="removeAcc"><a href="../admin/removeAcc.jsp">Remove Account</a></li>
                        <li id="addMovie"><a href="../admin/addMovie.jsp">Add Movies</a></li>
                        <li id="adminLog"><a href="../admin/admin.jsp">Admin Log</a></li>
                        <li id="profile"><a href="../member/member.jsp?id=<%=admin.getMemberID()%>" title="View your profile">Hello <%=admin.getUserName()%></a></li>
                        <li><a href="../MemberController?action=logout">Logout</a></li>
                    </div>
                </div>
            </div>
        </nav>
        <div class="container-fluid">