<%-- 
    Document   : history
    Created on : Dec 20, 2017, 2:45:47 AM
    Author     : huong
--%>
<%@page import="java.sql.*, dao.*, model.*, db.*, email.*, java.util.*, javax.servlet.RequestDispatcher"%>
<%
    Member member = (Member)session.getAttribute("member");
    Member admin = (Member)session.getAttribute("admin");
    
    MemberDAO memberDAO = new MemberDAO();
    Member foundMember = null;
    
    int idMember = 0;
    
    if(admin != null){
        foundMember = memberDAO.getMemberByID(admin.getMemberID());
        idMember = admin.getMemberID();
%>
        <jsp:include page="../admin/include/header.jsp" flush="true" />
<%
    }else if(member != null){
        foundMember = memberDAO.getMemberByID(member.getMemberID());
        idMember = member.getMemberID();
%>
        <jsp:include page="../include/header.jsp" flush="true" />
<%
    }else{
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/member/notMember.jsp");
        dispatcher.forward(request, response);
    }
    
    LogDAO logDAO = new LogDAO();
    List<WatchLog> memberLogs = logDAO.getAllWatchLogOfMember(idMember);
    
    MovieDAO movieDAO = new MovieDAO();
        
    int numOfMovie = memberLogs.size(), count = 0;
    int numOfPage = (int)Math.ceil(numOfMovie/12.0);
%>
    <div class="row">
        <div class="col-md-3 col-sm-4 col-xs-0">
            <p class="lead">
                <div class="wrapper">
                    <img src="<%=foundMember.getProfilePictureLink()%>">
                    <a href="editInfo.jsp?idMember=<%=idMember%>&result=" title="Edit your info"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
                </div>
            </p>
            <ul class="list-group">
                <li style="text-align: center;" class="list-group-item"><%=foundMember.getUserName()%></li>
                <li style="text-align: center;" class="list-group-item"><%=foundMember.getEmail()%></li>
            </ul>
        </div>
        <div class="col-md-9 col-sm-8 col-xs-12">
            <div class="text-center" style="display: flex; flex-wrap: wrap;">
<%
        for(WatchLog memberLog: memberLogs){
            if(count < 12){
                Movie movie = movieDAO.getMovieByID(memberLog.getMovieID());
%>
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="thumbnail show-image">
                        <p><%=memberLog.getTime()%></p>
                        <img src="<%=movie.getPosterLink()%>">

                        <div class="caption">
                            <h4><%=movie.getMovieName()%></h4>
                        </div>
                        <p>
                            <a href="viewMovieDetail.jsp?id=<%=memberLog.getMovieID()%>" class="btn btn-default btn-block detailButton">Details</a>
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
                    <li class="active"><a href="history.jsp">1</a></li>
<%
                count = 2;
                while(count <= numOfPage){
%>  
                    <li><a href="historyPage.jsp?page=<%=count%>&noOfPage=<%=numOfPage%>"><%=count%></a></li>
<%
                    count++;
                }
%>              
                </ul>
            </nav>
        </div>
    </div>
<jsp:include page="../include/footer.jsp" flush="true" />
<script>
    $("#profile").addClass("active");
    $("#categoryName").html("History<span class=\"caret\"></span>");
    $("#categoryName + .dropdown-menu").html("<li><a href=\"../member/member.jsp?id=<%=idMember%>\" class=\"btn\">Favorite</a></li>");
</script>
    
