<%-- 
    Document   : categoryMovie
    Created on : Dec 10, 2017, 3:45:10 PM
    Author     : huong
--%>

<%@page import="java.sql.*"%>
<%@page import="db.DatabaseConnection"%>
<jsp:include page="include/header.jsp" flush="true" />
<%
    int idCategory = Integer.parseInt(request.getParameter("id"));
    
    DatabaseConnection db = new DatabaseConnection();
    Connection con = db.setConnection();
    
    String sql = "select * from movie where idCategory = " + idCategory;
    
    ResultSet rs = db.getResult(sql, con);
    
    String sql_1 = "Select count(*) from movie where idCategory = " + idCategory;
    ResultSet rs_1 = db.getResult(sql_1, con);
    int numOfMovie = 0, count = 0;
    while(rs_1.next()){
        numOfMovie = Integer.parseInt(rs_1.getString("count(*)"));
    }
    int numOfPage = (int)Math.ceil(numOfMovie/12.0);
%>
    <div class="row text-center" style="display: flex; flex-wrap: wrap;">
<%  while(rs.next() && count < 12){%>
        <div class="col-md-3 col-sm-6 col-xs-6">
            <div class="thumbnail show-image">
                <img src="<%=rs.getString("moviePosterLink")%>">
                <div class="caption">
                    <h4><%=rs.getString("movieName")%></h4>
                </div>
                <p>
                    <a href=<%= "\"viewMovieDetail.jsp?id=" + rs.getInt("idMovie") + "\"" %> class="btn btn-default btn-block detailButton">Details</a>
                </p>
            </div>
        </div>
<%
        count++;
    }
%>           
    </div>
    <nav style="text-align: center;" aria-label="Page navigation">
        <ul class="pagination">
            <li><a href="categoryMovie.jsp?id=<%=idCategory%>">1</a></li>
<%
    count = 2;
    while(count <= numOfPage){
%>   
            <li><a href="categoryMoviePage.jsp?id=<%=idCategory%>page=<%=count%>&noOfPage=<%=numOfPage%>"><%=count%></a></li>
<%
        count++;
    }
%>            
        </ul>
    </nav>
<jsp:include page="include/footer.jsp" flush="true" />
