<%-- 
    Document   : search
    Created on : 5 Aug, 2023, 3:59:23 PM
    Author     : pratik
--%>

<%@page import="app.contact.domain.Contact"%>
<%@page import="java.util.List"%>
<%@page import="app.contact.service.ContactService"%>
<%!
    ContactService service = new ContactService();
%>

<%
    Integer userId = (Integer)session.getAttribute("userId");
    String txt = request.getParameter("freeText");
    List<Contact> contacts = service.findUserContact(userId, txt);
    //out.println("Contacts --> " + contacts);
    request.setAttribute("clist", contacts);
    pageContext.forward("contact_list_view.jsp");
%>

