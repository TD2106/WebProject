<%-- 
    Document   : viewMovie
    Created on : Dec 13, 2017, 8:53:14 AM
    Author     : huong
--%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="db.DatabaseConnection"%>
<jsp:include page="include/header.jsp" flush="true" />
<%
    int idMovie = Integer.parseInt(request.getParameter("id"));

    DatabaseConnection db = new DatabaseConnection();
    Connection con = db.setConnection();

    String sql = "Select * from movie where idMovie = " + idMovie;
    List<String> link = new ArrayList<String>();

    ResultSet rs = db.getResult(sql, con);
%>
<div class="row">
    <%while(rs.next()){%>
        <div class="col-md-3 col-sm-4 col-xs-6">
            <p class="lead"><%=rs.getString("movieName")%></p>
            <ul class="list-group">
                <li style="text-align: center;" class="list-group-item">Choose server to watch</li>
                <%
                    String sql_2 = "Select * from link where idMovie = " + idMovie;
                    ResultSet rs_2 = db.getResult(sql_2, con);
                    
                    while(rs_2.next()){
                        link.add(rs_2.getString("movieLink"));
                %>
                    <a class="btn list-group-item server"><%=rs_2.getString("serverName")%></a>
                <%
                    }
                %>
                
            </ul>
        </div>
        <div class="col-md-9 col-sm-8 col-xs-6">
            <div class="thumbnail">
                <div class="embed-responsive embed-responsive-16by9">
                    <iframe src="<%=rs.getString("movieTrailerLink")%>" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
                </div>
            </div>
        </div>
    <%}%>
</div>
<jsp:include page="include/footer.jsp" flush="true" />
<script>
    $(document).ready(function(){
        $("iframe").attr("src", "<%=link.get(0)%>");
        $(".server").addClass("active");
        $(".server").last().removeClass("active");
        $("#trailer").removeClass("active");
    });
    
    $(".server").first().on("click", function(){
        $("iframe").attr("src", "<%=link.get(0)%>");
        $(this).addClass("active");
        $(".server").last().removeClass("active");
        $("#trailer").removeClass("active");
    });
    
    $(".server").last().on("click", function(){
        $("iframe").attr("src", "<%=link.get(1)%>");
        $(this).addClass("active");
        $(".server").first().removeClass("active");
        $("#trailer").removeClass("active");
    });
</script> 