package com.library.servelet;

import com.library.model.Author;
import com.library.model.Book;
import com.library.Dao.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.*;



public class LibraryDataInserter {

    public static void main(String[] args) {
        try (Connection con = DBconnection.getConnection())    {
            
            // Insert Authors
            List<Author> authors = Arrays.asList(
                new Author("J.K. Rowling", "British author, best known for Harry Potter series."),
                new Author("George R.R. Martin", "American novelist, author of A Song of Ice and Fire."),
                new Author("Agatha Christie", "Famous mystery novelist, creator of Hercule Poirot.")
            );

            for (Author a : authors) {
                PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO authors(name, bio) VALUES(?, ?)", Statement.RETURN_GENERATED_KEYS);
                ps.setString(1, a.getNmae());
                ps.setString(2, a.getBio());
                ps.executeUpdate();
            }

            // Get Author IDs
            ResultSet rs = con.createStatement().executeQuery("SELECT * FROM authors");
            Map<String, Integer> authorIds = new HashMap<>();
            while (rs.next()) {
                authorIds.put(rs.getString("name"), rs.getInt("id"));
            }

            // Insert Featured Books
            List<Book> books = Arrays.asList(
                new Book("Harry Potter and the Sorcerer’s Stone", "Fantasy", authorIds.get("J.K. Rowling"), true),
                new Book("A Game of Thrones", "Fantasy", authorIds.get("George R.R. Martin"), true),
                new Book("Murder on the Orient Express", "Mystery", authorIds.get("Agatha Christie"), true)
            );

            for (Book b : books) {
                PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO books(title, genre, author_id, featured) VALUES(?, ?, ?, ?)");
                ps.setString(1, b.getTitle());
                ps.setString(2, b.genre());
                ps.setInt(3, b.authorId());
                ps.setBoolean(4, b.featured());
                ps.executeUpdate();
            }

            System.out.println("✅ Authors and books added successfully!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}