package com.library.Dao;
import java.sql.*;

public class DBconnection {
    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con == null) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarydb", "root", "ROHIT1234");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
