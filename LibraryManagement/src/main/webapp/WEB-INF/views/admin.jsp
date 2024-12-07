<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	<head>
    	<meta charset="UTF-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>Admin</title>
    	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
    
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    	<style>
        	body {
            	padding: 20px;
            	background-color:#e0f2f7;
        	}
        	.header, .footer {
            	background-color: #f4f4f4;
            	padding: 15px;
            	border-radius: 5px;
            	margin-bottom: 20px;
        	}
        	.dropdown-menu {
            	min-width: 100px; /* Optional: Adjust dropdown width */
        	}
        	.card {
            	transition: transform 0.2s; /* Smooth transition */
        	}

        	.card:hover {
            	transform: scale(1.05); /* Slightly enlarge the card */
            	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2); /* Add shadow effect */
        	}
        
        	.custom-img {
    			height: 600px; /* Set your desired height */
			}
			@media (max-width: 576px) {
    			.navbar-text {
        		font-size: 20px; /* Smaller font size for mobile */
   		 	}
   		 
   		 	.navbar {
    			display: flex; /* Flexbox layout */
    			align-items: center; /* Center items vertically */
     			justify-content: space-between;
			}

			.navbar-text {
    			margin: 0 auto; /* Center the title */
    			text-align: center; /* Center text */
			}

			@media (max-width: 576px) {
    			.navbar-brand {
        			width: 15%; /* Make the brand container full width */
        			display: flex; /* Use flexbox to center the logo */
        			justify-content: center; /* Center the logo horizontally */
    			}

    			.navbar-brand img {
        			width: 10%; /* Increase this value to make the logo larger */
        			height: auto; /* Maintain aspect ratio */
    			}
			}
			

    </style>
</head>				
<body>
   <nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
    	<img class="navbar-brand" src="${pageContext.request.contextPath}/images/librarylogo.png" width="5%" height="5%" alt="Library Logo"/>

    	<span class="navbar-text mx-auto" style="font-weight: bold; font-size: 24px; color: #343a40;">
        									SARASWATHI LIBRARY
    	</span>

    	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        	<span class="navbar-toggler-icon"></span>
    	</button>

    	<div class="collapse navbar-collapse" id="navbarNav">
        	<div class="ml-auto d-flex align-items-center">
            	<ul class="navbar-nav">
                	<li class="nav-item">
                    	<a class="nav-link" href="#books-section">Books</a>
                	</li>
                	<li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Services
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/admin/addBook">Add Book</a>
                        <a class="dropdown-item" href="/admin/bookDetailsForm">Book Details</a>
                        <a class="dropdown-item" href="/admin/updateForm">Update Book Details</a>
                        <a class="dropdown-item" href="/admin/deleteForm">Delete Book</a>
                    </div>
                </li>
                	<li class="nav-item">
                    	<a class="nav-link" href="/admin/submitForm">Submit Book</a>
                	</li>
                	<li class="nav-item">
                    	<a class="nav-link" href="/admin/alert">Submit Book</a>
                	</li>
                	
                	<li class="nav-item">
                    	<a class="nav-link" href="/admin/about">About Us</a>
                	</li>
            	</ul>

            	<form class="form-inline ml-3" action="/admin/search" method="POST">
                	<input class="form-control mr-2" type="search" name="bookName" placeholder="Search Book" aria-label="Search">
                	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            	</form>

            	<div class="dropdown ml-2">
                	<button class="btn btn-secondary dropdown-toggle" type="button" id="userDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    	<img src="${pageContext.request.contextPath}/images/person.png" alt="User Logo" style="width: 30px; height: 30px; border-radius: 100%;">
                	</button>
                	<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    	<a class="dropdown-item" href="#">Welcome Admin</a>
                    	<a class="dropdown-item" href="/admin/changeAdminPassword">Change Password</a>
                    	<a class="dropdown-item" Style = "text-align:center" href="#">Log out</a>
                	</div>
            	</div>
        	</div>
    	</div>
	</nav>

    <!-- Body Section -->
    <main class="body">
        <div class="row">
            <div class="col-md-8">
            	<div class="welcome-section text-center" style="margin-top: 40px;">
            	<c:if test="${change}">
					<h6 style="color:red;"><marquee>Password Updation Failed Try again!</marquee></h6>
            	</c:if>
    				<h1 style="font-size: 28px; margin-bottom: 15px;">Welcome to Saraswathi Library</h1>
    				<p style="font-size: 18px; margin: 10;">Explore a world of knowledge and adventure!</p>
				</div>

                <section id="featured-collections" style="margin:40px;font-size: 18px;">
    				<h4>Featured Collections</h4>
    				<div class="collection">
        				<h5>New Arrivals</h5>
        				<p>Discover the latest additions to our library. Whether you're looking for fiction, non-fiction, or educational materials, we have something for everyone.</p>
    				</div>
    				<div class="collection">
        				<h5>Staff Picks</h5>
        				<p>Check out our librarians' favorite books and recommendations to find your next great read!</p>
    				</div>
    				<div class="collection">
        				<h5>Children's Corner</h5>
        				<p>A special section for our young readers, filled with exciting stories and educational resources!</p>
    				</div>
				</section>
            </div>
            <div class="col-md-4">
                <img src="${pageContext.request.contextPath}/images/readingbook.jpg" alt="Kid Reading" class="img-fluid custom-img" />
            </div>
        </div>

        <!-- Dynamic Rows -->
        
		<div id="books-section" class="dynamic-rows mt-4">
    <c:forEach var="entry" items="${categories.entrySet()}">
        <div class="row mb-4">
            <div class="col-12">
                <h3>${entry.key}</h3>
                <div class="overflow-auto" style="overflow-x: auto; overflow-y: hidden; white-space: nowrap;">
                    <c:forEach var="book" items="${entry.value}">
                    <c:if test="${book.active}">
                        <div class="col-md-2 col-sm-6 col-12 mb-2" style="display: inline-block;">
                            <div class="card card-margin p-2" style="height: 250px; width: 200px;">
                                <img src="data:image/jpeg;base64,${book.photo}" class="card-img-top" style="height: 150px; width: 100%;" alt="${book.bookName}" />
                                <div class="card-body">
                                    <h5 class="card-title text-truncate" style="max-width: 200px;">${book.bookName}</h5>
                                    <div class="d-flex justify-content-between">
                                        <c:choose>
                                            <c:when test="${book.available}">
                                                <span class="availability" style="color: green;">Available</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="availability" style="color: red;">Not Available</span>
                                            </c:otherwise>
                                        </c:choose>
                                        <form action="/admin/bookDetails" method="POST" class="d-flex justify-content-end">
            								<input type="hidden" name="bookId" value="${book.bookId }">
            								<button type="submit"  class="btn btn-primary btn-sm">More...</button>
        								</form>

                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

    </main>

    <!-- Footer Section -->
    <footer class="footer text-center mt-4"> 
        <p>&copy; 2024 Library. All Rights Reserved.</p>
        <p>Follow us on social media!</p>
    </footer>
</body>
</html>
