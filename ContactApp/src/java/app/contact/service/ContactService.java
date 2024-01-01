package app.contact.service;

import app.contact.domain.Contact;
import app.contact.db.JdbcTemplate;
import com.mysql.cj.jdbc.PreparedStatementWrapper;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pratik
 */
public class ContactService extends JdbcTemplate{
    
    public void save(Contact c) throws SQLException{
        String sql = "INSERT INTO contact(userId, name, phone, email, address) VALUE(?,?,?,?,?)";
        PreparedStatement pst = super.createPST(sql);
        pst.setInt(1, c.getUserId());   //FK
        pst.setString(2, c.getName());
        pst.setString(3, c.getPhone());
        pst.setString(4, c.getEmail());
        pst.setString(5, c.getAddress());
        super.update(pst);
        
    }
    
    public List<Contact> findUserContact(Integer userId) throws SQLException{
        String sql = "SELECT contactId, name, phone, email, address FROM contact WHERE userId="+userId;
        ResultSet rs = super.query(sql);
        List<Contact> contacts = new ArrayList<Contact>();
        while(rs.next()){
            Contact c = mapRow(rs);
            contacts.add(c);
        }
        return contacts;
    }
    
    public List<Contact> findUserContact(Integer userId, String txt) throws SQLException{
        String sql = "SELECT contactId, name, phone, email, address FROM contact WHERE userId="+userId+" AND (name like('%"+txt+"%') OR phone like('%"+txt+"%') OR email like('%"+txt+"%') OR address like('%"+txt+"%'))";                                                                                     
        ResultSet rs = super.query(sql);
        List<Contact> contacts = new ArrayList<Contact>();
        while(rs.next()){
            Contact c = mapRow(rs);
            contacts.add(c);
        }
        return contacts;
    }
    
    public Contact mapRow(ResultSet rs) throws SQLException{
        Contact c = new Contact();
        c.setContactId(rs.getInt("contactId"));
        c.setName(rs.getString("name"));
        c.setPhone(rs.getString("phone"));
        c.setEmail(rs.getString("email"));
        c.setAddress(rs.getString("address"));
        return c;
    }
    
    public void delete(Integer contactId) throws SQLException{
        update("DELETE FROM contact WHERE contactId="+contactId);
    }
    
    public Contact findById(Integer contactId) throws SQLException{
        String sql = "SELECT contactId, name, phone, email, address FROM contact WHERE contactId="+contactId;
        ResultSet rs = query(sql);
        if(rs.next()){
            Contact c = mapRow(rs);
            return c;
        }else{
            return null;
        }
    }
    
    public void update(Contact c) throws SQLException{
        String sql = "UPDATE contact SET name=?, phone=?, email=?, address=? WHERE contactId=?";
        PreparedStatement pst = super.createPST(sql);
        pst.setString(1, c.getName());
        pst.setString(2, c.getPhone());
        pst.setString(3, c.getEmail());
        pst.setString(4, c.getAddress());
        pst.setInt(5, c.getContactId());    //PK
        super.update(pst);
        
    }
    
    
    // TODO: Other methods
    
}




