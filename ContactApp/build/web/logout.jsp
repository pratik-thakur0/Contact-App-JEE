<%-- 
    Document   : logout
    Created on : 3 Aug, 2023, 2:05:29 PM
    Author     : pratik
--%>

<%
    session.invalidate();
    response.sendRedirect("index.jsp?act=lo");
%>
