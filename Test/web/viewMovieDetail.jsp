<%-- 
    Document   : viewMovieDetail
    Created on : Dec 10, 2017, 12:50:28 PM
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
        
        ResultSet rs = db.getResult(sql, con);
    %>
    <div class="row">
        <%while(rs.next()){%>
            <div class="col-md-3 col-sm-4 col-xs-6">
                <p class="lead"><%=rs.getString("movieName")%></p>
                <ul class="list-group">
                    <li class="list-group-item">Country: <%=rs.getString("country")%></li>
                    <li class="list-group-item">Release: <%=rs.getInt("year")%></li>
                    <li class="list-group-item">Duration: <%=rs.getString("length")%></li>
                    <%String sql_1 = "Select categoryName from category where idCategory = " + rs.getInt("idCategory");
                      ResultSet rs_1 = db.getResult(sql_1, con);
                      String category = null;
                      while(rs_1.next()){
                         category = rs_1.getString("categoryName");
                     } 
                    %>
                    <li class="list-group-item">Category: <%=category%></li>
                </ul>
                <ul class="list-group">
                    <a href=<%= "\"viewMovieDetail.jsp?id=" + idMovie + "\"" %> id="trailer" class="btn list-group-item active">Trailer</a>
                </ul>
                <ul class="list-group">
                    <a href=<%= "\"viewMovie.jsp?id=" + idMovie + "\"" %> target="_blank" class="btn list-group-item server">Watch Movie</a>
                </ul>
                <ul class="list-group">
                    <div id="fb-root"></div>
                    <script>(function(d, s, id) {
                      var js, fjs = d.getElementsByTagName(s)[0];
                      if (d.getElementById(id)) return;
                      js = d.createElement(s); js.id = id;
                      js.src = 'https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.11&appId=150972212340653';
                      fjs.parentNode.insertBefore(js, fjs);
                    }(document, 'script', 'facebook-jssdk'));</script>
                    <div class="fb-share-button" data-href="viewMovieDetail.jsp?id=<%=idMovie%>" data-layout="button_count" data-size="large" data-mobile-iframe="false"><a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse">Share</a></div>
                </ul>
            </div>
            <div class="col-md-9 col-sm-8 col-xs-6">
                <div class="thumbnail">
                    <div class="embed-responsive embed-responsive-16by9">
                        <iframe src="<%=rs.getString("movieTrailerLink")%>" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
                    </div>
                    <div class="caption-full">
                        <p><%=rs.getString("movieDescription")%></p>
                    </div>
                    <div id="fb-root"></div>
                    <script>(function(d, s, id) {
                        var js, fjs = d.getElementsByTagName(s)[0];
                        if (d.getElementById(id)) return;
                        js = d.createElement(s); js.id = id;
                        js.src = 'https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.11&appId=150972212340653';
                        fjs.parentNode.insertBefore(js, fjs);
                    }(document, 'script', 'facebook-jssdk'));</script>
                    <div class="fb-comments" data-href="viewMovieDetail.jsp?id=<%=idMovie%>" width="100%" data-numposts="5"></div>
                </div>
            </div>
           
        <%}%>
    
    
    </div>
    
    
<jsp:include page="include/footer.jsp" flush="true" />