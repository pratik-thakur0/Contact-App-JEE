<%@page import="app.contact.service.ContactService"%>
<%!
    ContactService contactService = new ContactService();
%>

<%
    Integer contactId = new Integer(request.getParameter("cid"));
    contactService.delete(contactId);
    // after deleteing go to conatact list
    response.sendRedirect("clist.jsp?act=del");
    
%>