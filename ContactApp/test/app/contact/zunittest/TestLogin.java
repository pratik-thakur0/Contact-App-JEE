package app.contact.zunittest;

import app.contact.domain.User;
import app.contact.exception.AccountBlockedException;
import app.contact.exception.InvalidCredentialException;
import app.contact.service.UserService;
import java.sql.SQLException;

/**
 *
 * @author pratik
 */
public class TestLogin {
    public static void main(String[] args) throws InvalidCredentialException, AccountBlockedException, SQLException {
        
        UserService service = new UserService();
        User u = service.login("atulrai", "password");
        System.out.println(u.getUserId() + " --> " + u.getName());
        // TODO access other details
    }
}
