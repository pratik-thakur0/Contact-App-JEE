<%-- 
    Document   : contact-form
    Created on : 3 Aug, 2023, 5:23:37 PM
    Author     : pratik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Contact</title>
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
                    <c:url var="url_contact_act" value="/save_action.jsp" />
                    <form action="${url_contact_act}">
                        <h3>Contact From</h3>
                        
                        <input type="hidden" name="hid_cid" value="${param.hid_cid}">
                        
                        <table border="1">
                            <tr>
                                <td>Name</td>
                                <td><input type="text" name="name" value="${param.name}"></td>
                            </tr>
                            <tr>
                                <td>Phone</td>
                                <td><input type="text" name="phone" value="${param.phone}"></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td><input type="text" name="email" value="${param.email}"></td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td>
                                    <textarea name="address">${param.address}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right">
                                    <button>Save</button>
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