package app.contact.zunittest;

import app.contact.domain.User;
import app.contact.service.UserService;
import java.sql.SQLException;

/**
 *
 * @author pratik
 */
public class TestRegistrationUsingUserService {
    public static void main(String[] args) throws SQLException {
        
        UserService service = new UserService();
        // Prepare dummy user data; in future should be taken from registration form
        User u = new User();
        u.setName("Atul");
        u.setPhone("789569837");
        u.setEmail("raiatul@gmail.com");
        u.setAddress("Bihar, India");
        u.setLoginId("atulrai");
        u.setPassword("password");
        u.setRole(UserService.ROLE_ADMIN);
        u.setStatus(UserService.LOGIN_ACTIVE);
        
        service.register(u);
        
    }
}
