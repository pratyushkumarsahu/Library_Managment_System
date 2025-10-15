<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User Registration</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #141e30, #243b55);
        color: white;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .register-container {
        background: rgba(255, 255, 255, 0.1);
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 0 15px rgba(0,0,0,0.5);
        width: 350px;
        text-align: center;
    }

    h2 {
        margin-bottom: 25px;
    }

    input[type="text"],
    input[type="password"] {
        width: 90%;
        padding: 10px;
        margin: 10px 0;
        border: none;
        border-radius: 8px;
        outline: none;
    }

    input[type="submit"] {
        width: 95%;
        padding: 10px;
        background-color: #00bcd4;
        border: none;
        border-radius: 8px;
        color: white;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #0097a7;
    }

    .login-link {
        margin-top: 15px;
        display: block;
        color: #00bcd4;
        text-decoration: none;
        font-size: 14px;
    }

    .login-link:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

    <div class="register-container">
        <h2>New User Registration</h2>
        <form action="RegisterServlet" method="post">
            <input type="text" name="fullname" placeholder="Full Name" required><br>
            <input type="text" name="address" placeholder="Address" required><br>
            <input type="text" name="username" placeholder="Username" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <input type="submit" value="Register">
        </form>
        <a href="login.jsp" class="login-link">Already have an account? Login here</a>
    </div>

</body>
</html>
