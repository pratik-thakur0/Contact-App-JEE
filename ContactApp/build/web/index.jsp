<%-- 
    Document   : index
    Created on : 2 Aug, 2023, 5:23:37 PM
    Author     : pratik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
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
                    <c:url var="url_login" value="/login_action.jsp" />
                    <form action="${url_login}">
                        <h3>Please Login</h3>
                        <table border="1">
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
                                    <button>Login</button>
                                    <br/>
                                    <c:url var="url_reg" value="/reg_form.jsp" />
                                    <a href="${url_reg}">Register Here</a>
                                </td>
                            </tr>
                        </table> 
                        <c:if test="${param.act=='denied'}">
                            <p style="color: red">ACCESS DENIED! ILLEGEL Access of a Webpage</p>
                        </c:if>
                        <c:if test="${err!=null}">
                            <p style="color: red">${err}</p>
                        </c:if>
                        <c:if test="${param.act=='reg'}">
                            <p style="color: blue">User Registered Succesfully.</p>
                        </c:if> 
                        <c:if test="${param.act=='lo'}">
                            <p style="color: blue">User Logged-Out Succesfully.</p>
                        </c:if> 
                    </form>
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
