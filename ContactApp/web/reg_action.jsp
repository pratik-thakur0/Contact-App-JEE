<%@page import="app.contact.domain.User"%>
<%@page import="app.contact.service.UserService"%>
<%!
    UserService userService = new UserService();
%>

<%
    // Read from data and bind to DomainObject/User and pass to service
    try{
        User u = new User();
        u.setName(request.getParameter("name"));
        u.setPhone(request.getParameter("phone"));
        u.setEmail(request.getParameter("email"));
        u.setAddress(request.getParameter("address"));
        u.setLoginId(request.getParameter("loginId"));
        u.setPassword(request.getParameter("password"));
        u.setRole(UserService.ROLE_USER);
        u.setStatus(UserService.LOGIN_ACTIVE);
        userService.register(u);
        // Success
        response.sendRedirect("index.jsp?act=reg");
    }catch(Exception e){
        e.printStackTrace();
        request.setAttribute("err", "Failed to register new user. Try Again!");
        pageContext.forward("reg_form.jsp");
    }
%>