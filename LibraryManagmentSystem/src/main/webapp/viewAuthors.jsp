<%@ page import="java.util.*, com.library.model.Author" %>
<html>
<head>
    <title>Authors</title>
</head>
<body>
<h2>👩‍💻 Authors</h2>
<table border="1" cellpadding="8">
    <tr><th>Name</th><th>Bio</th></tr>
    <%
        List<Author> authors = (List<Author>) request.getAttribute("authorsList");
        if (authors != null && !authors.isEmpty()) {
            for (Author a : authors) {
    %>
                <tr>
                    <td><%= a.getName() %></td>
                    <td><%= a.getBio() %></td>
                </tr>
    <%
            }
        } else {
    %>
            <tr><td colspan="2">No authors found.</td></tr>
    <%
        }
    %>
</table>
</body>
</html>