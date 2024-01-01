/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package app.contact.zunittest;

import app.contact.db.JdbcTemplate;
import app.contact.service.UserService;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author pratik
 */
public class TestPST {
    public static void main(String[] args) throws SQLException {
        String sql = "INSERT INTO user(name, phone, email, address, loginId, password, role, status) VALUE(?,?,?,?,?,?,?,?)";
        JdbcTemplate db = new JdbcTemplate();
        PreparedStatement pst = db.createPST(sql);
        //Bind data from sql param
        //data will be taken form reg-form : TODO
        pst.setString(1, "Pratik");
        pst.setString(2, "9588631689");
        pst.setString(3, "thakur@gmail.com");
        pst.setString(4, "Indore, India");
        pst.setString(5, "p");
        pst.setString(6, "pass");
        pst.setInt(7, UserService.ROLE_ADMIN);       
        pst.setInt(8, UserService.LOGIN_ACTIVE);
        db.update(pst);
        
        
    }
}
