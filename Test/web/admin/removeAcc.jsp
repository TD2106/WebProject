<%-- 
    Document   : removeAcc
    Created on : Dec 11, 2017, 6:08:39 PM
    Author     : huong
--%>
<%@page import="java.sql.*"%>
<%@page import="db.DatabaseConnection"%>
<jsp:include page="include/header.jsp" flush="true" />
<%
    DatabaseConnection db = new DatabaseConnection();
    Connection con = db.setConnection();
    
    String sql = "SELECT * FROM member";
    ResultSet rs = db.getResult(sql, con);
    
//out.println("Subjects: <br>");
//String[] subjects = request.getParameterValues("subject");
//if(subjects != null){
//    for(int i = 0; i < subjects.length; i++){
//        out.println(subjects[i] + "<br>");
//    }
//}
%>
<div style="text-align: center;" class="page-header">
    <h1>Remove Account</h1>
</div>
<form action="duy" method="POST">
    <table class="table table-striped">
        <thead>
            <tr>
                <th></th>
                <th>User Name</th>
                <th>Password</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
<%
        while(rs.next()){
%>            
            <tr>
                <td style="text-align: center;">
                    <input type="checkbox" name="account" value="<%=rs.getInt("idMember")%>">
                </td>
                <td><%=rs.getString("userName")%></td>
                <td><%=rs.getString("password")%></td>
                <td><%=rs.getString("email")%></td>
            </tr>
<%
        }
%>            
        </tbody>
    </table>
        <button style="margin-left: 30%; width: 40%;" type="button" class="btn btn-danger btn-lg btn-block">Delete</button>
</form>
<jsp:include page="include/footer.jsp" flush="true" />
