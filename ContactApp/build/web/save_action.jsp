<%@page import="com.mysql.cj.jdbc.exceptions.MysqlDataTruncation"%>
<%@page import="app.contact.domain.Contact"%>
<%@page import="app.contact.service.ContactService"%>
<%!
    ContactService service = new ContactService();
%>

<%
    // Read data form request
    String n = request.getParameter("name");
    String p = request.getParameter("phone");
    String e = request.getParameter("email");
    String a = request.getParameter("address");
    
    Contact c = new Contact();
    c.setName(n);
    c.setPhone(p);
    c.setEmail(e);
    c.setAddress(a);
    
    
    
    try{
        String cid = request.getParameter("hid_cid");   //hidden cid
        if(cid == null || cid.isEmpty()){
            // Get logged-in userId
            c.setUserId((Integer)session.getAttribute("userId"));   //FK
            service.save(c);
            // go to contact list
            response.sendRedirect("clist.jsp?act=save");
            return;
        }else{
            // UPDATE CASE
            c.setContactId(new Integer(cid));   //PK
            service.update(c);
            // go to contact list
            response.sendRedirect("clist.jsp?act=update");
            return;
        }
        
        
        
        
    }catch(MysqlDataTruncation ex){
        ex.printStackTrace();
        pageContext.setAttribute("err", "Failed to save contact: Too long text input.", PageContext.REQUEST_SCOPE);
        // go back to contact form
        pageContext.forward("contact_form.jsp");
    }catch(Exception ex){
        ex.printStackTrace();
        pageContext.setAttribute("err", "Failed to save contact.", PageContext.REQUEST_SCOPE);
        // go back to contact form
        pageContext.forward("contact_form.jsp");
    }
    
    

%>
