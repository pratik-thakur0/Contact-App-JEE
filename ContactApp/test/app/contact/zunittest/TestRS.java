/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package app.contact.zunittest;

import app.contact.db.JdbcTemplate;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author pratik
 */
public class TestRS {

    public static void main(String[] args) throws SQLException {
        JdbcTemplate db = new JdbcTemplate();
        String sql = "SELECT * FROM user";
        ResultSet rs = db.query(sql);
        while(rs.next()){
            System.out.println(rs.getInt("userId") + " --> " + rs.getString("name"));
        }
    }
}
