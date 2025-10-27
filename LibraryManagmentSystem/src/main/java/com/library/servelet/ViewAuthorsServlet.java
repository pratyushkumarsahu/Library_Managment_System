package com.library.servelet;


import com.library.Dao.DBconnection;
import com.library.model.Author;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

public class ViewAuthorsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Author> authors = new ArrayList<>();

        try (Connection con = DBconnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM authors");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Author a = new Author(rs.getString("name"), rs.getString("bio"));
                authors.add(a);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("authorsList", authors);
        RequestDispatcher rd = request.getRequestDispatcher("viewAuthors.jsp");
        rd.forward(request, response);
    }
}