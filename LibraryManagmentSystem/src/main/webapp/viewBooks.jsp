<%@ page import="java.util.*, com.library.model.Book" %>
<html>
<head>
    <title>Featured Books</title>
</head>
<body>
<h2>📚 Featured Books</h2>
<table border="1" cellpadding="8">
    <tr><th>Title</th><th>Genre</th></tr>
    <%
        List<Book> books = (List<Book>) request.getAttribute("booksList");
        if (books != null && !books.isEmpty()) {
            for (Book b : books) {
    %>
                <tr>
                    <td><%= b.getTitle() %></td>
                    <td><%= b.getGenre() %></td>
                </tr>
    <%
            }
        } else {
    %>
            <tr><td colspan="2">No featured books found.</td></tr>
    <%
        }
    %>
</table>
</body>
</html>