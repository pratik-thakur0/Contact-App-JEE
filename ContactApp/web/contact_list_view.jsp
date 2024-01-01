<%-- 
    Document   : Contact List View
    Created on : 3 Aug, 2023, 5:23:37 PM
    Author     : pratik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact List</title>
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
                    <h3>Contact List</h3>
                    <c:if test="${param.act eq 'del'}">
                        <p style="color: blue">Contact Deleted successfully</p>
                    </c:if>
                    <c:if test="${param.act eq 'save'}">
                        <p style="color: blue">Contact Added successfully</p>
                    </c:if>
                    <c:if test="${param.act eq 'update'}">
                        <p style="color: blue">Contact Updated successfully</p>
                    </c:if>
                    
                    <form action="search.jsp">
                        <input type="text" name="freeText" placeholder="Search..." value="${param.freeText}"/>
                        <button>Find</button>
                        <a href="<c:url value="/clist.jsp"/>">All</a>
                    </form><br/>

                    <table border="1">
                        <tr>
                            <th>SR</th>
                            <th>C-ID</th>
                            <th>NAME</th>
                            <th>PHONE</th>
                            <th>EMAIL</th>
                            <th>ADDRESS</th>
                            <th>ACTION</th>
                        </tr>
                        
                        <c:if test="${empty clist}">
                            <tr>
                                <td colspan="7" style="height: 60px; text-align: center">
                                    No Contacts Available, <a href="contact_form.jsp">Add Contact</a>
                                </td>
                            </tr>
                        </c:if>
                        
                        <c:forEach items="${clist}" var="c" varStatus="st">
                            <tr>
                                <td>${st.count}</td>
                                <td>${c.contactId}</td>
                                <td>${c.name}</td>
                                <td>${c.phone}</td>
                                <td>${c.email}</td>
                                <td>${c.address}</td>
                                <c:url var="url_del" value="/delete_view.jsp">
                                    <c:param name="cid" value="${c.contactId}" />
                                </c:url>
                                <c:url var="url_edit" value="/edit_view.jsp">
                                    <c:param name="cid" value="${c.contactId}" />
                                </c:url>
                                <td><a href="${url_edit}">Edit</a> | <a href="${url_del}">Delete</a> </td>
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