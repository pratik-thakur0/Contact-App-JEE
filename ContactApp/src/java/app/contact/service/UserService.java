package app.contact.service;


import app.contact.db.JdbcTemplate;
import app.contact.domain.User;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import app.contact.exception.InvalidCredentialException;
import app.contact.exception.AccountBlockedException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * All user related operations are encapsulated here
 * @author pratik
 */
public class UserService extends JdbcTemplate{
    public static final Integer ROLE_ADMIN=1;
    public static final Integer ROLE_USER=2;
    public static final Integer LOGIN_ACTIVE=1;
    public static final Integer LOGIN_BLOCKED=2;
    
    public void register(User u) throws SQLException{
        String sql = "INSERT INTO user(name, phone, email, address, loginId, password, role, status) VALUE(?,?,?,?,?,?,?,?)";
        PreparedStatement pst = super.createPST(sql);
        pst.setString(1, u.getName());
        pst.setString(2, u.getPhone());
        pst.setString(3, u.getEmail());
        pst.setString(4, u.getAddress());
        pst.setString(5, u.getLoginId());  //UK
        pst.setString(6, u.getPassword());
        pst.setInt(7, u.getRole());       
        pst.setInt(8, u.getStatus());
        super.update(pst);
    }
    
    /**
     * This method check the user authentication using input credential
     * @param loginId unique login id for user
     * @param password
     * @return Authenticated user/ Successfully logged-in User
     * @throws InvalidCredentialException thrown when invalid combination of login id and password is supplied
     * @throws AccountBlockedException thrown when user account has been disabled
     * @throws SQLException thrown when any database related problem occured
     */
    public User login(String loginId, String password) 
            throws InvalidCredentialException, AccountBlockedException, SQLException{
        
        String sql = "SELECT userId, name, phone, email, address, loginId, role, status FROM user WHERE loginId=? AND password=?";
        PreparedStatement pst = super.createPST(sql);
        pst.setString(1, loginId);
        pst.setString(2, password);
        ResultSet rs = super.query(pst);
        if(rs.next()){
            // Credential matched - SUCCESS
            if(rs.getInt("status") == UserService.LOGIN_BLOCKED){
                // account is blocked
                String msg = "Your account has been Blocked/Disabled";
                AccountBlockedException ex = new AccountBlockedException(msg);
                throw ex;
            }else if(rs.getInt("status") == UserService.LOGIN_ACTIVE){
                // Everything is Fine
                User u = mapRow(rs);
                return u;
            }else{
                throw new RuntimeException("Failed due to unexpected login-status");
            }
        }else{
            // Credential not matched - FAILED
            String msg = "Invalid Login Id and Password";
            InvalidCredentialException ex = new InvalidCredentialException(msg);
            throw ex;
        }
    }
    
    public User mapRow(ResultSet rs) throws SQLException{
        User u = new User();
        // Fetch data form resultset and bind
        u.setUserId(rs.getInt("userId"));
        u.setName(rs.getString("name"));
        u.setEmail(rs.getString("email"));
        u.setPhone(rs.getString("phone"));
        u.setAddress(rs.getString("address"));
        u.setLoginId(rs.getString("loginId"));
        u.setRole(rs.getInt("role"));
        u.setStatus(rs.getInt("status"));
        return u;
    }
    
    public List<User> findAllUsers() throws SQLException{
        String sql = "SELECT userId, name, phone, email, address, loginId, role, status FROM user WHERE role=?";
        PreparedStatement pst = super.createPST(sql);
        pst.setInt(1, ROLE_USER);
        ResultSet rs = pst.executeQuery();
        List<User> users = new ArrayList<>();
        while(rs.next()){
            User u = mapRow(rs);
            users.add(u);
        }
        return users;
    }
    
    public void changeLoginStatus(int status, Integer userId) throws SQLException{
        String sql = "UPDATE user SET status=? WHERE userId=?";
        PreparedStatement pst = super.createPST(sql);
        pst.setInt(1, status);
        pst.setInt(2, userId);
        super.update(pst);
    }
    
}
