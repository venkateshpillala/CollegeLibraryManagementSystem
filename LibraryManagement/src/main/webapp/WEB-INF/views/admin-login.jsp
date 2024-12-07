<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	<head>
    	<meta charset="UTF-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>Library</title>
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
        	.login-container {
        		margin-left:50px;
        		margin-top : 50px;
             	max-width: 400px;
    		 	padding: 10px;
    		 	background-color: rgba(255, 255, 255, 0.9); 
    		 	border-radius: 5px;
    		 	box-shadow: 0 4px 10px rgba(7, 5, 0, 0.1);
    		 	position: relative; 
    		 	z-index: 1;
    		  	align-items: center;
    		  	justify-content: center;
        	}
        	.header, .footer {
            	background-color: #f4f4f4;
            	padding: 15px;
            	border-radius: 5px;
            	margin-bottom: 20px;
        	}
        	.dropdown-menu {
            	min-width: 100px;
        	}
        
			@media (max-width: 576px) {
    			.navbar-text {
        		font-size: 20px;
   		 	}
   		 
   		 	.navbar {
    			display: flex; 
    			align-items: center; 
     			justify-content: space-between;
			}

			.navbar-text {
    			margin: 0 auto;
    			text-align: center; 
			}

			@media (max-width: 576px) {
    			.navbar-brand {
        			width: 15%; 
        			display: flex; 
        			justify-content: center; 
    			}

    			.navbar-brand img {
        			width: 10%; 
        			height: auto; 
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
                		
                		<li class="nav-item">
                    		<a class="nav-link" href="/about">About Us</a>
                		</li>
            		</ul>

            		<form class="form-inline ml-3" action="/getAvailableBooks" method="POST">
                		<input class="form-control mr-2" type="search" name="bookName" placeholder="Search Book" aria-label="Search">
                		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            		</form>

            		<div class="dropdown ml-2">
                		<button class="btn btn-secondary dropdown-toggle" type="button" id="userDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    		<img src="${pageContext.request.contextPath}/images/person.png" alt="User Logo" style="width: 30px; height: 30px; border-radius: 100%;">
                		</button>
                		<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    		<a class="dropdown-item" href="#">Welcome</a>
                    		<a class="dropdown-item" href="./user/user-login">User</a>
                    		<a class="dropdown-item" href="/admin/admin-login">Admin</a>
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
            	<div class="col-md-4 login-container">
     				<div class="header">
            			<img style = "margin-left:145px;" src="/images/AdminLogo.jpeg" width="20%" height="20%"alt="Library Logo" class="library-logo">
            			<h2 style="text-align:center">Admin Login</h2>
        			</div>
        			
        			
        			
        			
        		<c:choose>
        		<c:when test="${changePassword}">
        			<form action="/admin/validatePassword" method="POST" ">
        			
            		<div class="form-group">
                		<label for="username">Username</label>
                		<input type="text" class="form-control" id="username" name="username" required>
            		</div>
            		<div class="form-group">
                		<label for="password">Old Password</label>
                		<input type="password" class="form-control" id="password" name="password" required>
            		</div>
            		<div class="form-group">
                		<label for="password">New Password</label>
                		<input type="password" class="form-control" id="password" name="newPassword1" required>
            		</div>
            		<div class="form-group">
                		<label for="password">Re-type Password</label>
                		<input type="password" class="form-control" id="password" name="newPassword2" required>
            		</div>
            		<button type="submit" class="btn btn-primary btn-block">Change Password</button>
        		</form>
        		</c:when>
        		
        		
        		
        		<c:otherwise>
        		<form action="/admin/admin" method="POST" ">
        			<c:if test="${result != null}">
    					<p style="color:red">Invalid Username or password</p>
					</c:if> 
					<c:if test="${flag}">
    					<p style="color:red; text-align:center">Password updation successful<br>Login with new Password </p>
					</c:if> 
					
            		<div class="form-group">
                		<label for="username">Username</label>
                		<input type="text" class="form-control" id="username" name="username" required>
            		</div>
            		<div class="form-group">
                		<label for="password">Password</label>
                		<input type="password" class="form-control" id="password" name="password" required>
            		</div>
            		<button type="submit" class="btn btn-primary btn-block">Login</button>
        		</form>
        		</c:otherwise>
        		</c:choose>
        		
        		
            </div>
        </div>      
    </main>

    <!-- Footer Section -->
    <footer class="footer text-center mt-4"> 
        <p>&copy; 2024 Library. All Rights Reserved.</p>
        <p>Follow us on social media!</p>
    </footer>
</body>
</html>
