<%-- 
    Document   : reg_update
    Created on : Dec 22, 2017, 6:18:02 PM
    Author     : huong
--%>
<%@page import="java.util.*"%>
<%
    List<String> arr = new ArrayList<String>();
    arr.add("United State");
    arr.add("Vietnam");
    arr.add("Turkey");
    
    String query = (String)request.getParameter("q");
    
    for(String s: arr){
        out.print(s + "\n");
    }
%>
