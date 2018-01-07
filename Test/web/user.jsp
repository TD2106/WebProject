<%-- 
    Document   : user
    Created on : Dec 11, 2017, 8:29:31 AM
    Author     : huong
--%>
<%@page import="java.sql.*"%>
<%@page import="db.DatabaseConnection"%>
<jsp:include page="include/header.jsp" flush="true" />
<%
    int idMember = Integer.parseInt(request.getParameter("id"));
    
    DatabaseConnection db = new DatabaseConnection();
    Connection con = db.setConnection();
    
    String sql = "select * from member m join favorite f on m.idMember = f.idMember join movie mo on f.idMovie = mo.idMovie where m.idMember = " + idMember;
    ResultSet rs = db.getResult(sql, con);
    
    String sql_1 = "select * from member where idMember = " + idMember;
    ResultSet rs_1 = db.getResult(sql_1, con);
    
    String emailMember = null;
    String pictureProfile = null;
    while(rs_1.next()){
        emailMember = rs_1.getString("userName");
        pictureProfile = rs_1.getString("profilePictureLink");
    }
    String sendVar = "a=" + Integer.toString(idMember) + ",b=";
%>
<div class="row">
    <div class="col-md-3 col-sm-4 col-xs-6">
        <p class="lead">
            <img src="<%=pictureProfile%>">
        </p>
        <ul class="list-group">
            <li style="text-align: center;" class="list-group-item">Email</li>
            <li style="text-align: center;" class="list-group-item"><%=emailMember%></li>
        </ul>
        
        <fieldset class="title">
            <legend>Request Movie</legend>
        </fieldset>
        <form action="EmailSendingServlet" method="post">
            <div class="form-group">
                Movie Name
                <br>
                <input type="text" name="subject" class="form-control" placeholder="Casablanca" required>
            </div>
            <div class="form-group">
                Movie Link
                <br>
                <input type="text" name="content" class="form-control" placeholder="http://" pattern="https?://.+" title="Include http://">
            </div>
            <button type="submit" class="btn btn-primary btn-block">Submit</button>
            <div class="form-group">
                <input type="hidden" name="id" class="form-control" value="<%=idMember%>">
            </div>
            <div class="form-group">
                <input type="hidden" name="recipient" class="form-control" value="huongung155@gmail.com" required>
            </div>
        </form>
    </div>
    <div class="col-md-9 col-sm-8 col-xs-6">
        <div class="row text-center" style="display: flex; flex-wrap: wrap;">
        <%  while(rs.next()){%>
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="thumbnail show-image">
                        <p>
                            <a href=<%= "\"delete.jsp?id=" + sendVar + Integer.toString(rs.getInt("idMovie")) + "\"" %> class="btn btn-block"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                        </p>
                        <img src="<%=rs.getString("moviePosterLink")%>">
                        <div class="caption">
                            <h4><%=rs.getString("movieName")%></h4>
                        </div>
                        <p>
                            <a href=<%= "\"viewMovieDetail.jsp?id=" + rs.getInt("idMovie") + "\"" %> class="btn btn-default btn-block detailButton">Details</a>
                        </p>
                    </div>
                </div>
        <%}%>         
            </div>
    </div>
</div>
<jsp:include page="include/footer.jsp" flush="true" />
