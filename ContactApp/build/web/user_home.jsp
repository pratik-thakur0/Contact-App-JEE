<%-- 
    Document   : User Home
    Created on : 2 Aug, 2023, 5:23:37 PM
    Author     : pratik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Home</title>
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
                    Welcome User - ${sessionScope.user.name}
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