<%@page import="app.contact.domain.Contact"%>
<%@page import="app.contact.service.ContactService"%>
<%!
    ContactService service = new ContactService();
%>

<%
    Integer cid = new Integer(request.getParameter("cid"));
    Contact c =service.findById(cid);
    request.setAttribute("aContact", c);
%>

<!--Bind all contact detail in param-->
<jsp:forward page="contact_form.jsp">
    <jsp:param name="name" value="${aContact.name}"/>
    <jsp:param name="phone" value="${aContact.phone}"/>
    <jsp:param name="email" value="${aContact.email}"/>
    <jsp:param name="address" value="${aContact.address}"/>
    <jsp:param name="hid_cid" value="${aContact.contactId}"/>
</jsp:forward>