<%-- 
    Document   : ulist
    Created on : 10 Aug, 2023, 12:17:21 PM
    Author     : pratik
--%>

<%@page import="java.util.List"%>
<%@page import="app.contact.domain.User"%>
<%@page import="app.contact.service.UserService"%>
<%!
    UserService userService = new UserService();
%>
<%
    List<User> users = userService.findAllUsers();
    request.setAttribute("userList", users);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin -User List</title>
    </head>
    <body>
        <table border="1" align="center" width="80%">
            <tr>
                <td height="40">
                    <%@include file="header.jsp" %>
                </td>
            </tr>
            <tr>
                <td height="20">
                    <%@include file="menu.jsp" %>
                </td>
            </tr>
            <tr>
                <td height="300" valign="top" align="center">
                    <h3>User List</h3>
                    <table border="1">
                        <tr>
                            <th>SR</th>
                            <th>NAME</th>
                            <th>PHONE</th>
                            <th>LOGIN ID</th>
                            <th>STATUS</th>
                            <th>ACTION</th>
                        </tr>
                        <c:forEach items="${userList}" var="u" varStatus="st">
                            <tr>
                                <td>${st.count}</td>
                                <td>${u.name}</td>
                                <td>${u.phone}</td>
                                <td>${u.loginId}</td>
                                <td>
                                    <c:if test="${u.status==1}">
                                        ACTIVE
                                    </c:if>
                                    <c:if test="${u.status==2}">
                                        BLOCKED
                                    </c:if>
                                </td>
                                <td>
                                    <c:if test="${u.status==1}">
                                        <c:url var="url_change_status" value="/change_status.jsp">
                                            <c:param name="st" value="2"/>
                                            <c:param name="uid" value="${u.userId}"/>
                                        </c:url>
                                        <a href="${url_change_status}">Block</a>
                                    </c:if>
                                    <c:if test="${u.status==2}">
                                        <c:url var="url_change_status" value="/change_status.jsp">
                                            <c:param name="st" value="1"/>
                                            <c:param name="uid" value="${u.userId}"/>
                                        </c:url>
                                        <a href="${url_change_status}">Active</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="20" align="center">
                    <%@include file="footer.jsp" %>
                </td>
            </tr>
        </table>
    </body>
</html>