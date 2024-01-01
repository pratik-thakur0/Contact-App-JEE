package app.contact.zunittest;

import app.contact.db.JdbcTemplate;

/**
 *
 * @author pratik
 */
public class TestCon {
    public static void main(String[] args) {
        JdbcTemplate db = new JdbcTemplate();
        System.out.println("Connection status --> " + db.testConnection());
        
    }
}
