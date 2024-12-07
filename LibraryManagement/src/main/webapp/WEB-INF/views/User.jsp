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
    	<script>
    		window.onload = function() {
            	if (!localStorage.getItem('reloaded')) {
                	localStorage.setItem('reloaded', 'true');
                	location.reload();
            	} else {
                	localStorage.removeItem('reloaded'); // Clear the flag for next visits
            	}
        	};
    	</script>
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
            	min-width: 100px;
        	}
        	.card:hover {
            	transform: scale(1.05); 
            	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        	}
        
        	.custom-img {
    			height: 600px; 
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
			
			.text-truncate {
        		overflow: hidden;
        		white-space: nowrap;
        		text-overflow: ellipsis; 
    		}
    		.card-margin{
    			margin-left:0px;
    			margin-right:0px;
    			
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
                    	<a class="nav-link" href="/user/history">History</a>
                	</li>
                	<li class="nav-item">
                    	<a class="nav-link" href="/user/about">About Us</a>
                	</li>
                	<li class="nav-item">
                    	<a class="nav-link" href="#">About Us</a>
                	</li>
            	</ul>

            	<form class="form-inline ml-3" action="/user/searchBooks" method="POST">
                	<input class="form-control mr-2" type="search" name="bookName" placeholder="Search Book" aria-label="Search">
                	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            	</form>

            	<div class="dropdown ml-2">
                	<button class="btn btn-secondary dropdown-toggle" type="button" id="userDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    	<img src="${pageContext.request.contextPath}/images/person.png" alt="User Logo" style="width: 30px; height: 30px; border-radius: 100%;">
                	</button>
                	<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    	<a class="dropdown-item" href="#">Welcome</a>
                    	<a class="dropdown-item" href="/user/changePasswordForm">Change Password</a>
                    	<a class="dropdown-item" href="./user/logout">Log Out</a>
                	</div>
            	</div>
        	</div>
    	</div>
	</nav>

    <!-- Body Section -->
    <main class="body">
    
   
    <c:choose>
     
    
     <c:when test="${search}">
        <c:choose>
            <c:when test="${not empty books}">
            <div class="container table-container">
        	<div class="row justify-content-center">
            <div class="col-md-8"> 
                <h2 class="text-center" style="margin-top:30px">Book Details</h2>
                <table class="table table-bordered">
                	<tr>	
                		<th>Book Id</th>
                		<th>Book Name</th>
                		<th>Category</th>
                		<th>Author</th>
                		<th>year of Published</th>
                		<th>Status</th>
                		<th>Know More</th>
                	</tr>
	    			<c:forEach var="book" items="${books}">
	                	<tr>
	                		<td>${book.bookId }</td>
	                		<td>${book.bookName }</td>
	                		<td>${book.category }</td>
	                		<td>${book.author }</td>
	                		<td>${book.publishedYear }</td>
	                		<td>
	                			<c:choose>
	                				<c:when test="${book.available }">
	                				Available
	                				</c:when>
	                				<c:otherwise>Not available</c:otherwise>
	                			</c:choose>
	                		</td>
							<td>
						
            					<a href="/user/knowMore/${book.bookId }">Know More</a>
        					</td> 	                	
        				</tr>	
	    			</c:forEach>
               </table>
               </div>
               </div>
               </div>
            </c:when>
            <c:otherwise>
                <h4 style="text-align:center; color:red; margin:100px;">Books are not available with your search</h4>
            </c:otherwise>
        </c:choose>
    </c:when>
    
    
    
       
    <c:when test="${knowMore}">
       
			
			<c:choose>
				
			
			<c:when test="${not empty book}">
			<c:if test="${not empty user}">
			<c:choose>
			<c:when test="${book.available}">
					<div class="text-center" style="margin-top:100px; margin-left:500px;"> 
                		<a href="/user/getBook/${book.bookId}" type="submit" class="btn btn-primary btn-sm">Get Book</a>
            		</div>
            </c:when>
            <c:otherwise>
            <div class="text-center" style="margin-top:100px; margin-left:500px;"> 
                		<a href="#" type="submit" class="btn btn-danger btn-sm">Not Available</a>
            		</div>
            </c:otherwise>
            </c:choose>
				</c:if>
        	<div class="container table-container">
        	<div class="row justify-content-center">
            <div class="col-md-8"> 
                <h2 class="text-center" style="margin-top:30px">Book Details</h2>
                <table class="table table-bordered">
                    
                    <tbody>
                        <tr>
                            <th>Book Id</th>
                            <td>${book.bookId}</td>
                        </tr>
                         <tr>
                            <th>Book Name</th>
                            <td>${book.bookName}</td>
                        </tr>
                         <tr>
                            <th>Category</th>
                            <td>${book.category}</td>
                        </tr>
                         <tr>
                            <th>Author</th>
                            <td>${book.author}</td>
                        </tr>
                         <tr>
                            <th>Published year</th>
                            <td>${book.publishedYear}</td>
                        </tr>
                        <tr>
                        	<th>Status</th>
                        	<td>
                        	<c:choose>
                        	<c:when test="${book.available}">Available</c:when>
                        	<c:otherwise>Not Available</c:otherwise>
                        	</c:choose>
                        	</td>
                        </tr>
                         <tr>
                            <th>Book Photo</th>
                            <td>
                            	<c:if test="${not empty book.photo}">
										<img src="data:image/jpeg;base64,${book.photo}" width="40%" height="40%"alt="${bookDetails.photo }" />
        						</c:if>
                            </td>
                        </tr>
                        <tr>
                        	<th>Book Summary</th>
                        	<td colspan="2">
                        		<c:if test="${not empty book.summary}">
            						
            						<iframe src="data:application/pdf;base64,${book.summary}" width="550" height="500"></iframe>
        						</c:if>
                        	</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    			<c:if test="${not empty user}">
			<c:choose>
			<c:when test="${book.available}">
					<div class="text-center" style="margin-top:100px; margin-left:500px;"> 
                		<a href="/user/getBook/${book.bookId}" type="submit" class="btn btn-primary btn-sm">Get Book</a>
            		</div>
            </c:when>
            <c:otherwise>
            <div class="text-center" style="margin-top:100px; margin-left:500px;"> 
                		<a href="#" type="submit" class="btn btn-danger btn-sm">Not Available</a>
            		</div>
            </c:otherwise>
            </c:choose>
				</c:if>
				</c:when>
				<c:otherwise>
					<p>No more details are available of this Book</p>
				</c:otherwise>
				</c:choose>
        </c:when>
        
        
        
        
        <c:when test="${history}">
        <c:choose>
        <c:when test="${not empty dto }">
           	<div class="container">
        	<div class="row justify-content-center">
            <div class="col-md-8"> 
                <h2 class="text-center" style="margin-top:30px">Book Details</h2>
                <table class="table table-bordered">
                    <tr>
                    <th>Transaction Id</th>
                    <th>User Id</th>
                    <th>User Name</th>
                    <th>Book Id</th>
                    <th>Book Name</th>
                    <th>Get Date</th>
                    <th>Submission</th>
                    <th>Over Due</th>
                    <th>Penalty</th>
                    <th>Submitted/Not</th>
                    <th>Get</th>
                    </tr>
        <c:forEach var="bookTrack" items="${dto}">
        	<tr>
        		<td>${bookTrack.transactionId}</td>
        		<td>${bookTrack.userId}</td>
        		<td>${bookTrack.username}</td>
				<td>${bookTrack.bookId}</td> 
        		<td>${bookTrack.bookName}</td>        		
        		<td>${bookTrack.getDate}</td>
        		<td>${bookTrack.submittedDate}</td>
        		<td>${bookTrack.days}</td>
        		<td>${bookTrack.penalty}</td>
        		<td>
        		<c:choose>
        		<c:when test="${ bookTrack.submitted}">
        			<p style = "color:green;">Submitted</p>
        		</c:when>
        		<c:otherwise>
        			<p style = "color:red;">Not Submitted</p>
        		</c:otherwise>
        		</c:choose>
        		</td>
        		<td>
        		
        		<c:if test="${bookTrack.submitted}">
					<div class="text-center" > 
                		<a href="/user/knowMore/${bookTrack.bookId }" type="submit" class="btn btn-primary btn-sm">Book Details	</a>
            		</div>
				</c:if>
        		</td>
        	</tr>
        </c:forEach>
        	</table>
        	</div>
        	</div>
        	</div>
        	</c:when>
        	<c:otherwise>
        		<h4 style="margin:100px;color:red;text-align:center;"> History not Found..!</h4>
        	</c:otherwise>
        	</c:choose>
        </c:when>
        
        
      
        <c:when test="${take }">
        	<div style="margin:100px; padding:50px;border : 1px solid black; text-align:center">
        		
        		<h4>Dear ${user.username}<br></h4>
    			We Hope this Book is useful.<br><br>
    			Don't forget to submit within 30 days.
    			 
    			
    			
    			<p style="color:red;"><b>Note:</b> If not submitted within 15 days, A fine of 10 rupees per day was imposed.</p>
    			
    			<p>Visit us again...!</p>
    	
        	</div>
        </c:when>
       
        
        
	<c:otherwise>
        <div class="row">
            <div class="col-md-8">
            	<div class="welcome-section text-center" style="margin-top: 40px;">
            	 <c:if test="${cp =='cp' }">
    					<p style="color:red;margin:5px;"><marquee>Password updation failed Try Again!</marquee></p>
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
                                        <a href="/user/knowMore/${book.bookId }" class="btn btn-link">More..</a>
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


     </c:otherwise>
     </c:choose>
           
    </main>

    <!-- Footer Section -->
    <footer class="footer text-center mt-4"> 
        <p>&copy; 2024 Library. All Rights Reserved.</p>
        <p>Follow us on social media!</p>
    </footer>
</body>
</html>
