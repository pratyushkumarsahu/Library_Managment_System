package com.library.servelet;

import java.sql.*;

import com.library.Dao.DBconnection;
import com.library.model.User;

public class userdao {

    // Registration method
    public boolean registerUser(User user) {
        boolean status = false;
        try {
            Connection conn = DBconnection.getConnection();
            String sql = "INSERT INTO users(name, address, username, password) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getAddress());
            ps.setString(3, user.getUsername());
            ps.setString(4, user.getPassword());
            int rows = ps.executeUpdate();
            if (rows > 0) status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // Login validation method
    public boolean validateUser(String username, String password) {
        boolean status = false;
        try {
            Connection conn = DBconnection.getConnection();
            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                status = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
