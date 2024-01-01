package app.contact.security;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author pratik
 */
public class SecurityFilter implements Filter{
    
    FilterConfig config;
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        config = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("-------------doFilter()--------------");
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        
        HttpSession session = req.getSession(false);
        if(session!=null){
            Integer userId = (Integer) session.getAttribute("userId");
            if(userId==null){
                //user is not logged in yet and accessing internal page
                //ACCESS DENIED : denied
                res.sendRedirect("index.jsp?act=denied");   // go back to login account
                return;
            }
        }
        chain.doFilter(request, response);    // Allowed
        
    }

    @Override
    public void destroy() {
        
    }
    
}
