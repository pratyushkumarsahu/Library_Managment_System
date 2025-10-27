package com.library.servelet;



import com.library.Dao.DBconnection;
import com.library.model.Book;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

public class ViewBooksServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Book> books = new ArrayList<>();

        try (Connection con = DBconnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM books WHERE featured = TRUE");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Book b = new Book(
                    rs.getString("title"),
                    rs.getString("genre"),
                    rs.getInt("author_id"),
                    rs.getBoolean("featured")
                );
                books.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("booksList", books);
        RequestDispatcher rd = request.getRequestDispatcher("viewBooks.jsp");
        rd.forward(request, response);
    }
}