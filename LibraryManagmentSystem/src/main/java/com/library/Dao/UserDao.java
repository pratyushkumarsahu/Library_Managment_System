package com.library.Dao;

import java.sql.*;
import com.library.model.User;

public class UserDao {

    public boolean registerUser(User user) {
        boolean status = false;
        try {
            Connection con = DBconnection.getConnection();
            String query = "INSERT INTO users(name, address, username, password) VALUES(?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getAddress());
            ps.setString(3, user.getUsername());
            ps.setString(4, user.getPassword());

            int rows = ps.executeUpdate();
            if (rows > 0) status = true;

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
