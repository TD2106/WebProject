<%-- 
    Document   : categoryMoviePage
    Created on : Dec 13, 2017, 8:01:22 PM
    Author     : huong
--%>
<%@page import="java.sql.*"%>
<%@page import="db.DatabaseConnection"%>
<jsp:include page="include/header.jsp" flush="true" />
<%
    int idCategory = Integer.parseInt(request.getParameter("id"));
    int pageNo = Integer.parseInt(request.getParameter("page"));
    int noOfPage = Integer.parseInt(request.getParameter("noOfPage"));
    
    DatabaseConnection db = new DatabaseConnection();
    Connection con = db.setConnection();
    String sql = "select * from movie where idCategory = " + idCategory;
    ResultSet rs = db.getResult(sql, con);
    
    int numOfMovie = 0, count = 0;
%>
    <div class="row text-center" style="display: flex; flex-wrap: wrap;">
<%  while(rs.next()){
        if((count < noOfPage*12) && (count >= (noOfPage-1) * 12)){
%>
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
        }
        count++;
    }
%>           
    </div>
    <nav style="text-align: center;" aria-label="Page navigation">
        <ul class="pagination">
            <li><a href="categoryMovie.jsp?id=<%=idCategory%>">1</a></li>
<%
    count = 2;
    while(count <= noOfPage){
%>   
            <li><a href="categoryMoviePage.jsp?id=<%=idCategory%>page=<%=count%>&noOfPage=<%=noOfPage%>"><%=count%></a></li>
<%
        count++;
    }
%>            
        </ul>
    </nav>
<jsp:include page="include/footer.jsp" flush="true" />
