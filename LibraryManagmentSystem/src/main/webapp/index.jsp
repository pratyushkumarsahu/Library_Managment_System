<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart Library</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
    <style>
        html {
            scroll-behavior: smooth;
        }
    </style>
</head>
<body class="bg-gray-100 font-sans">
    <!-- Navigation Bar -->
    <header class="sticky top-0 z-50 bg-white bg-opacity-80 backdrop-filter backdrop-blur-lg shadow-md">
        <nav class="container mx-auto flex items-center justify-between py-4 px-6">
            <div class="flex items-center">
                <span class="text-2xl font-bold text-navy">📚 Smart Library</span>
            </div>

            <!-- Updated Navbar Links -->
            <ul class="hidden md:flex space-x-6">
                <li><a href="#home" class="text-navy hover:text-gold transition duration-300">Home</a></li>
                <li><a href="#books" class="text-navy hover:text-gold transition duration-300">Books</a></li>
                <li><a href="#members" class="text-navy hover:text-gold transition duration-300">Members</a></li>
                <li><a href="#issue-return" class="text-navy hover:text-gold transition duration-300">Issue/Return</a></li>
                <li><a href="#about" class="text-navy hover:text-gold transition duration-300">About</a></li>
                <li><a href="#contact" class="text-navy hover:text-gold transition duration-300">Contact</a></li>
            </ul>

            <div class="flex space-x-4">
                <a href="login.jsp" class="px-4 py-2 bg-gradient-to-r from-gold to-beige text-navy rounded-full hover:shadow-glow transition duration-300">Login</a>
                <a href="#" class="px-4 py-2 bg-gradient-to-r from-navy to-blue-800 text-white rounded-full hover:shadow-glow transition duration-300">Sign Up</a>
            </div>
        </nav>
    </header>

    <!-- Hero Section -->
    <section id="home" class="relative h-96 flex items-center justify-center bg-cover bg-center" style="background-image: url('images/bookshelf-bg.jpg');">
        <div class="absolute inset-0 bg-gradient-to-b from-cream to-navy opacity-70"></div>
        <div class="relative z-10 text-center">
            <h1 class="text-4xl md:text-5xl font-bold text-white mb-6">Welcome to Smart Library – Explore, Borrow, Learn</h1>
            <div class="max-w-md mx-auto">
                <input type="text" placeholder="Search books..." class="w-full p-4 rounded-full bg-white bg-opacity-30 backdrop-filter backdrop-blur-md focus:outline-none focus:ring-2 focus:ring-gold transition duration-300">
            </div>
        </div>
    </section>

    <!-- Featured Books -->
    <section id="books" class="container mx-auto py-12">
        <h2 class="text-3xl font-bold text-navy mb-6 text-center">Featured Books</h2>
        <div class="carousel flex space-x-4 overflow-x-auto pb-4">
            <c:forEach var="book" items="${featuredBooks}">
                <div class="book-card min-w-[200px] bg-white bg-opacity-20 backdrop-filter backdrop-blur-md rounded-lg shadow-md hover:shadow-glow hover:scale-105 transition duration-300">
                    <img src="${book.coverImage}" alt="${book.title}" class="w-full h-48 object-cover rounded-t-lg">
                    <div class="p-4">
                        <h3 class="text-lg font-semibold text-navy">${book.title}</h3>
                        <p class="text-sm text-gray-600">${book.author}</p>
                        <p class="text-sm text-gray-500">${book.genre}</p>
                        <a href="#" class="mt-2 inline-block px-4 py-2 bg-gradient-to-r from-gold to-beige text-navy rounded-full hover:shadow-glow">Borrow Now</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>

    <!-- Members Section -->
    <section id="members" class="container mx-auto py-12">
        <h2 class="text-3xl font-bold text-navy mb-6 text-center">Our Members</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
            <c:forEach var="member" items="${members}">
                <div class="member-card bg-white bg-opacity-20 backdrop-filter backdrop-blur-md rounded-lg shadow-md hover:shadow-glow hover:scale-105 transition duration-300">
                    <img src="${member.profileImage}" alt="${member.name}" class="w-24 h-24 rounded-full mx-auto mt-4">
                    <div class="p-4 text-center">
                        <h3 class="text-lg font-semibold text-navy">${member.name}</h3>
                        <p class="text-sm text-gray-600">Books Borrowed: ${member.borrowedBooks}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>

    <!-- Issue/Return Section -->
    <section id="issue-return" class="container mx-auto py-12">
        <h2 class="text-3xl font-bold text-navy mb-6 text-center">Issue or Return Books</h2>
        <div class="flex justify-center space-x-6">
            <button class="px-6 py-3 bg-gradient-to-r from-gold to-beige text-navy rounded-full hover:shadow-glow transition duration-300">Issue Book</button>
            <button class="px-6 py-3 bg-gradient-to-r from-navy to-blue-800 text-white rounded-full hover:shadow-glow transition duration-300">Return Book</button>
        </div>
    </section>

    <!-- About Section -->
    <section id="about" class="container mx-auto py-12 bg-cream">
        <h2 class="text-3xl font-bold text-navy mb-6 text-center">About Smart Library</h2>
        <p class="text-center text-gray-600 max-w-2xl mx-auto">
            Smart Library is dedicated to fostering a love for reading and learning. Our mission is to provide seamless access to a vast collection of books, manage memberships efficiently, and create a scholarly environment for all.
        </p>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="container mx-auto py-12">
        <h2 class="text-3xl font-bold text-navy mb-6 text-center">Contact Us</h2>
        <form class="max-w-lg mx-auto space-y-4">
            <input type="text" placeholder="Name" class="w-full p-4 rounded-lg bg-white bg-opacity-30 backdrop-filter backdrop-blur-md focus:outline-none focus:ring-2 focus:ring-gold">
            <input type="email" placeholder="Email" class="w-full p-4 rounded-lg bg-white bg-opacity-30 backdrop-filter backdrop-blur-md focus:outline-none focus:ring-2 focus:ring-gold">
            <textarea placeholder="Message" class="w-full p-4 rounded-lg bg-white bg-opacity-30 backdrop-filter backdrop-blur-md focus:outline-none focus:ring-2 focus:ring-gold"></textarea>
            <button type="submit" class="w-full p-4 bg-gradient-to-r from-gold to-beige text-navy rounded-lg hover:shadow-glow transition duration-300">Submit</button>
        </form>
    </section>

    <script src="js/scripts.js"></script>
</body>
</html>
