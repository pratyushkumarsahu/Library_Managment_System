package com.library.servelet;
import com.library.Dao.DBconnection;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AddToCartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int bookId = Integer.parseInt(req.getParameter("id"));
        HttpSession session = req.getSession();
        int userId = (int) session.getAttribute("userId");

        try {
            Connection con = DBconnection.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO cart(user_id, book_id) VALUES(?,?)");
            ps.setInt(1, userId);
            ps.setInt(2, bookId);
            ps.executeUpdate();
            res.sendRedirect("home.jsp");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
