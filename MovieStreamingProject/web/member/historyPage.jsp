<%-- 
    Document   : historyPage
    Created on : Dec 20, 2017, 3:23:48 AM
    Author     : huong
--%>
<%@page import="java.sql.*, dao.*, model.*, db.*, email.*, java.util.*"%>
<%
    int pageNo = Integer.parseInt(request.getParameter("page"));
    int noOfPage = Integer.parseInt(request.getParameter("noOfPage"));
    int count = 0;
    
    Member member = (Member)session.getAttribute("member");
    if(member != null){
        MemberDAO memberDAO = new MemberDAO();
        Member foundMember = memberDAO.getMemberByID(member.getMemberID());
        
        LogDAO logDAO = new LogDAO();
        List<WatchLog> memberLogs = logDAO.getAllWatchLogOfMember(member.getMemberID());
        MovieDAO movieDAO = new MovieDAO();
%>  
        <jsp:include page="../include/header.jsp" flush="true" />
        <div class="row">
            <div class="col-md-3 col-sm-4 col-xs-0">
                <p class="lead">
                    <div class="wrapper">
                        <img src="<%=foundMember.getProfilePictureLink()%>">
                        <a href="editInfo.jsp?idMember=<%=member.getMemberID()%>&result=" title="Edit your info"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
                    </div>

                </p>
                <ul class="list-group">
                    <li style="text-align: center;" class="list-group-item"><%=foundMember.getUserName()%></li>
                    <li style="text-align: center;" class="list-group-item"><%=foundMember.getEmail()%></li>
                </ul>

                <fieldset class="title">
                    <legend>Request Movie</legend>
                </fieldset>
                <form action="../EmailSendingServlet" method="post">
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
                        <input type="hidden" name="id" class="form-control" value="<%=member.getMemberID()%>">
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="recipient" class="form-control" value="huongung155@gmail.com" required>
                    </div>
                </form>
            </div>
            <div class="col-md-9 col-sm-8 col-xs-12">
                <div class="text-center" style="display: flex; flex-wrap: wrap;">
<%
        for(WatchLog memberLog: memberLogs){
            if((count < pageNo*12) && (count >= (pageNo-1) * 12)){
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
                        <li><a href="history.jsp">1</a></li>
<%
                    count = 2;
                    while(count <= noOfPage){
                        if(count == pageNo){
%>   
                            <li class="active"><a href="historyPage.jsp?page=<%=count%>&noOfPage=<%=noOfPage%>"><%=count%></a></li>
<%  
                        }else{
%>
                            <li><a href="historyPage.jsp?page=<%=count%>&noOfPage=<%=noOfPage%>"><%=count%></a></li>
<%                      }
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
            $("#categoryName + .dropdown-menu").html("<li><a href=\"../member/member.jsp?id=<%=member.getMemberID()%>\" class=\"btn\">Favorite</a></li>");
        </script>
<%
    }else{
        response.sendRedirect("../MemberController?action=logout");
    }
%>