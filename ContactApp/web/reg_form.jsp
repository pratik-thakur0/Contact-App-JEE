<%-- 
    Document   : reg-form
    Created on : 2 Aug, 2023, 5:23:37 PM
    Author     : pratik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Registration</title>
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
                    <!--Login Form-->
                    <c:url var="url_reg_act" value="/reg_action.jsp" />
                    <form action="${url_reg_act}">
                        <h3>Register New User</h3>
                        <table border="1">
                            <tr>
                                <td>Name</td>
                                <td><input type="text" name="name"></td>
                            </tr>
                            <tr>
                                <td>Phone</td>
                                <td><input type="text" name="phone"></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td><input type="text" name="email"></td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td>
                                    <textarea name="address"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>Login Id</td>
                                <td><input type="text" name="loginId"></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td><input type="password" name="password"></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right">
                                    <button>Register</button>
                                    <br/>
                                    <c:url var="url_login" value="/index.jsp" />
                                    <a href="${url_login}">Login Here</a>
                                </td>
                            </tr>
                        </table> 
                        <c:if test="${err!=null}">
                            <p style="color: red">${err}</p>
                        </c:if>
                        
                    </form>
                    <br/>
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