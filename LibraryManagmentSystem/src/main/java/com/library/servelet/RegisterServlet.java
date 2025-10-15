package com.library.servelet;
import com.library.Dao.DBconnection;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String fullname = req.getParameter("fullname");
        String address = req.getParameter("address");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        try {
            Connection con = DBconnection.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO users(fullname, address, username, password) VALUES(?,?,?,?)");
            ps.setString(1, fullname);
            ps.setString(2, address);
            ps.setString(3, username);
            ps.setString(4, password);
            ps.executeUpdate();
            res.sendRedirect("index.jsp");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
