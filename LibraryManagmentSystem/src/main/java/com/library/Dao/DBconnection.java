package com.library.Dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {
    private static Connection conn;

    public static Connection getConnection() {
        try {
            if (conn == null || conn.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarydb", "root", "Pratibimbits@2004");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
