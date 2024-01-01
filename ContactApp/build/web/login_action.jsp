<%@page import="app.contact.exception.AccountBlockedException"%>
<%@page import="app.contact.exception.InvalidCredentialException"%>
<%@page import="app.contact.domain.User"%>
<%@page import="app.contact.service.UserService"%>
<%! 
    UserService userService = new UserService();
%>

<%
    try{
        String lid = request.getParameter("loginId");
        String pwd = request.getParameter("password");
        User u = userService.login(lid, pwd);
        // Session Tracking or Assign Session to logged-in user
        session.setAttribute("userId", u.getUserId());
        session.setAttribute("role", u.getRole());
        session.setAttribute("user", u);
        if(u.getRole() == userService.ROLE_ADMIN){
            response.sendRedirect("admin_home.jsp");
        }else if(u.getRole() == userService.ROLE_USER){
            response.sendRedirect("user_home.jsp");
        }
        
        
    }catch(InvalidCredentialException e){
        e.printStackTrace();
        request.setAttribute("err", e.getMessage());
        pageContext.forward("index.jsp");  // Goback to login form
    }catch(AccountBlockedException e){
        e.printStackTrace();
        request.setAttribute("err", e.getMessage());
        pageContext.forward("index.jsp");  // Goback to login form
    }
%>
