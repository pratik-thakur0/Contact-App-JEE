<%-- 
    Document   : change_status
    Created on : 10 Aug, 2023, 12:56:58 PM
    Author     : pratik
--%>

<%@page import="app.contact.service.UserService"%>
<%!
    UserService userService = new UserService();
%>

<%
    Integer status = new Integer(request.getParameter("st"));
    Integer userId = new Integer(request.getParameter("uid"));
    userService.changeLoginStatus(status, userId);
    response.sendRedirect("ulist.jsp?act=ch_st");
%>