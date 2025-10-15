<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="javax.servlet.http.*, javax.servlet.*" %>

<%
    HttpSession session2 = request.getSession(false);
    String username = null;
    Integer userId = null;

    if (session != null) {
        username = (String) session.getAttribute("username");
        userId = (Integer) session.getAttribute("userId");
    }

    if (username == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #141e30, #243b55);
        color: white;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
        margin: 0;
    }

    .home-container {
        background: rgba(255, 255, 255, 0.1);
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 0 15px rgba(0,0,0,0.5);
        width: 400px;
        text-align: center;
        animation: fadeIn 0.8s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .profile-icon {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        background: url('profile.png') no-repeat center center/cover;
        border: 3px solid #00bcd4;
        margin: 0 auto 20px auto;
    }

    h2 {
        margin-bottom: 10px;
        font-size: 24px;
    }

    p {
        font-size: 16px;
        margin-bottom: 30px;
    }

    .logout-btn {
        padding: 10px 25px;
        background-color: #00bcd4;
        border: none;
        border-radius: 8px;
        color: white;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
        text-decoration: none;
        font-size: 15px;
    }

    .logout-btn:hover {
        background-color: #0097a7;
    }
</style>
</head>
<body>

    <div class="home-container">
        <div class="profile-icon"></div>
        <h2>Welcome, <%= username %> 👋</h2>
