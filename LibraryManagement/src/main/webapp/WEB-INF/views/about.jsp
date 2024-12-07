<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Saraswathi Library</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            padding: 20px;
            background-color: #e0f2f7;
        }
        .header, .footer {
            background-color: #f4f4f4;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
        <img class="navbar-brand" src="${pageContext.request.contextPath}/images/librarylogo.png" width="5%" height="5%" alt="Library Logo"/>
        <span class="navbar-text mx-auto" style="font-weight: bold; font-size: 24px; color: #343a40;">SARASWATHI LIBRARY</span>
        
    </nav>

    <main class="body">
        <div class="container">
            <h1 class="text-center" style="margin-top:30px">About Saraswathi Library</h1>
            <p>Welcome to Saraswathi Library, where knowledge meets community!</p>

            <h2>Our Mission</h2>
            <p>At Saraswathi Library, our mission is to provide a nurturing environment that encourages learning and exploration. We aim to foster a love for reading and to serve as a valuable resource for our community.</p>

            <h2>Our History</h2>
            <p>Founded in [Year], Saraswathi Library has been a cornerstone of our community, providing access to a wide range of books and resources. Over the years, we have expanded our collection and services to meet the evolving needs of our patrons.</p>

            <h2>Services We Offer</h2>
            <ul>
                <li>Wide selection of books, magazines, and digital resources</li>
                <li>Reading programs for children and adults</li>
                <li>Workshops and events to promote literacy</li>
                <li>Study spaces and community meeting rooms</li>
                <li>Online catalog and reservation system</li>
            </ul>

            <h2>Contact Us</h2>
            <p>If you have any questions or would like to learn more about our library, please feel free to reach out!</p>
        </div>
    </main>

    <!-- Footer Section -->
    <footer class="footer text-center mt-4 bg-light p-3">
        <p>&copy; 2024 SARASWATHI LIBRARY. All Rights Reserved.</p>
        <p>Follow us on social media!</p>
    </footer>
</body>
</html>
