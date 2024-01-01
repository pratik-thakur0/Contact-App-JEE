package app.contact.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * This class is a database handler class to handle all DB related operations
 * NOTE : this is good for learning, not fit for production.
 * ( use Spring JdbcTemplate API or Hibernate API or JPA instead )
 * @author pratik
 */

public class JdbcTemplate {
    private static Connection con;
    static{
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/contact_app?autoReconnect=true", "root", "password");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public PreparedStatement createPST(String sql) throws SQLException{
        PreparedStatement pst = con.prepareStatement(sql);
        return pst;
    }
    
    
    // Call this method for Insert, Update, Delete.
    public void update(PreparedStatement pst) throws SQLException{
        try{
            pst.executeUpdate();
        }finally{
            pst.close();
        }
    }
    
    // Call this method for Insert, Update, Delete. NON-PARAM-QUERY
    public void update(String sql) throws SQLException{
        PreparedStatement pst = this.createPST(sql);
        this.update(pst);
    }
    
    /**
     * Execute Select SQL statement, Param-SQL
     * @param  pst
     * @return ResultSet
     * @throws SQLException
     */
    public ResultSet query(PreparedStatement pst) throws SQLException{
        ResultSet rs = pst.executeQuery();
        return rs;
    }
    
    /**
     * Execute Select SQL statement, Non-Param-SQL
     * @param  sql
     * @return ResultSet
     * @throws SQLException
     */
    public ResultSet query(String sql) throws SQLException{
        PreparedStatement pst = this.createPST(sql);
        ResultSet rs = this.query(pst);
        return rs;
    }
    
    
    
    public Boolean testConnection(){
        return con!=null;
    }
}
