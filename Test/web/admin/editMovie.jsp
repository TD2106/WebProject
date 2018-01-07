<%-- 
    Document   : removeMovie
    Created on : Dec 12, 2017, 4:33:59 AM
    Author     : huong
--%>
<%@page import="java.sql.*"%>
<%@page import="db.DatabaseConnection"%>
<jsp:include page="include/header.jsp" flush="true" />
<div style="text-align: center;" class="page-header">
    <h1>Edit Movie</h1>
</div>
    <table class="table table-striped">
        <thead>
            <tr>
                <th></th>
                <th>Movie Name</th>
                <th>Country</th>
                <th>Year</th>
                <th>Duration</th>
                <th>Category</th>
            </tr>
        </thead>
        <tbody>
<%
        DatabaseConnection db = new DatabaseConnection();
        Connection con = db.setConnection();

        String sql = "SELECT * FROM movie";
        ResultSet rs = db.getResult(sql, con);
        while(rs.next()){
%>       
            <tr>
                <td style="text-align: center;">
                    <a href=<%= "\"editDetail.jsp?id=" + Integer.toString(rs.getInt("idMovie")) + "\"" %> class="btn btn-block"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
                </td>
                <td><%=rs.getString("movieName")%></td>
                <td><%=rs.getString("country")%></td>
                <td><%=rs.getString("year")%></td>
                <td><%=rs.getString("length")%></td>
                <td><%=rs.getString("idCategory")%></td>
            </tr>
<%
        }
%>
        </tbody>
    </table>
<jsp:include page="include/footer.jsp" flush="true" />