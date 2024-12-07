<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	<head>
    	<meta charset="UTF-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>Book</title>
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
            	min-width: 100px;
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
			
			.line-container {
            	display: flex;
            	align-items: center;
           		text-align: center;
            	margin: 20px 0;
        	}
        	.line {
            	flex-grow: 1;
            	height: 1px;
            	background-color: #000;
        	}
        	.line-text {
            	padding: 0 10px;
            	font-weight: bold; 
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

    
    <main class="body">
    <div class="container">
    <c:choose>
    <c:when test="${status }">
    <div style="margin:100px;padding:50px;text-align:center;color:red;">
    		<h6>You have submitted the book successfully<br>Thank you........! Visit Again</h6>
    	</div>
    
    
    </c:when>
    
    <c:when test="${submit}">
    
    <c:choose>
    	<c:when test="${not empty dto }">
    		<div class="container table-container">
        	<div class="row justify-content-center">
            <div class="col-md-8"> 
                <h2 class="text-center" style="margin-top:30px">Book Details</h2>
                <table class="table table-bordered">
                
                <tr>
                	<th>TransactionId</th>
                	<th>User ID</th>
                	<th>User Name</th>
                	<th>Book ID</th>
                	<th>Book Name</th>
                	<th>Get Date</th>
                	<th>Over Due</th>
                	<th>Penalty</th>
                	<th>Submit</th>
                
                </tr>
                
                <tr>
                	<td>${dto.transactionId}</td>
                	<td>${dto.userId}</td>
                	<td>${dto.username}</td>
                	<td>${dto.bookId}</td>
                	<td>${dto.bookName}</td>
                	<td>${dto.getDate}</td>
                	<td>${dto.days}</td>
                	<td>${dto.penalty}</td>
                	<td>
                	<c:choose>
                	<c:when test="${!dto.submitted }">
                	
                		<form action="/admin/submit" method="POST" enctype="multipart/form-data" class="mx-auto" style="max-width: 500px;">
        				<div class="form-group">
                			<input type="hidden" class="form-control form-control-sm" id="transactionId" name="transactionId" value="${dto.transactionId }">
            			</div>
            			<div class="text-center"> 
                			<button type="submit" class="btn btn-primary btn-sm">Check</button>
            			</div>
                	</form>
                	
                	</c:when>
                	<c:otherwise>
                		<div style="color:green;">
    					<h6>Submitted</h6>
    					</div>
                	</c:otherwise>
                	</c:choose>
                	</td>
                </tr>
                
                </table>
                </div>
                </div>
                </div>
                
    	
    	
    	</c:when>
    	<c:when test="${not empty dtos }">
    		<div class="container table-container">
        	<div class="row justify-content-center">
            <div class="col-md-8"> 
                <h2 class="text-center" style="margin-top:30px">Book Details</h2>
                <table class="table table-bordered">
                
                <tr>
                	<th>TransactionId</th>
                	<th>User ID</th>
                	<th>User Name</th>
                	<th>Book ID</th>
                	<th>Book Name</th>
                	<th>Get Date</th>
                	<th>Over Due</th>
                	<th>Penalty</th>
                	<th>Submit</th>
                
                </tr>
                <c:forEach var = "dto" items="${dtos}">
                <tr>
                	<td>${dto.transactionId}</td>
                	<td>${dto.userId}</td>
                	<td>${dto.username}</td>
                	<td>${dto.bookId}</td>
                	<td>${dto.bookName}</td>
                	<td>${dto.getDate}</td>
                	<td>${dto.days}</td>
                	<td>${dto.penalty}</td>
                	<td>
                	<c:if test="${!dto.submitted }">
                		<form action="/admin/submit" method="POST" enctype="multipart/form-data" class="mx-auto" style="max-width: 500px;">
        				<div class="form-group">
                			<input type="hidden" class="form-control form-control-sm" id="transactionId" name="transactionId" value="${dto.transactionId }">
            			</div>
            			<div class="text-center"> 
                			<button type="submit" class="btn btn-primary btn-sm">Check</button>
            			</div>
                	</form>
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
    	<div style="margin:100px;padding:50px;text-align:center;color:red;">
    		<h6>You have nothing to Submit..!</h6>
    	</div>
    	
    	</c:otherwise>
    
    
    </c:choose>
    
    </c:when>
    
    <c:when test="${submitForm }">
    
    
    
    <form action="/admin/penalty" method="POST" enctype="multipart/form-data" class="mx-auto" style="max-width: 500px;">
            
            <div class="form-group">
                <label for="bookId">Book ID</label>
                <input type="number" class="form-control form-control-sm" id="bookId" name="bookId">
            </div>
            
            <div class="line-container">
    			<div class="line"></div>
    			<span class="line-text">or</span>
    			<div class="line"></div>
			</div>
            <div class="form-group">
                <label for="User ID">User ID</label>
                <input type="number" class="form-control form-control-sm" id="userId" name="userId">
            </div>
            <div class="text-center"> 
                <button type="submit" class="btn btn-primary btn-sm">Check</button>
            </div>
      </form>
    
    </c:when>
    
    
    
    
    <c:when test= "${addBook}">
    
    	
        <h2 class="text-center mb-4" style="margin-top:30px;">Add a New Book</h2>
        
        <form action="/admin/saveBook" method="POST" enctype="multipart/form-data" class="mx-auto" style="max-width: 500px;">
            
            <div class="form-group">
                <label for="bookName">Book Name</label>
                <input type="text" class="form-control form-control-sm" id="bookName" name="bookName" required>
            </div>
            <div class="form-group">
                <label for="category">Category</label>
                <input type="text" class="form-control form-control-sm" id="category" name="category" required>
            </div>
            <div class="form-group">
                <label for="author">Author</label>
                <input type="text" class="form-control form-control-sm" id="author" name="author" required>
            </div>
            <div class="form-group">
                <label for="publishedYear">Published Year</label>
                <input type="text" class="form-control form-control-sm" id="publishedYear" name="publishedYear" required>
            </div>
            <div class="form-group">
                <label for="bookPhoto">Book Photo</label>
                <input type="file" class="form-control form-control-sm" id="bookPhoto" name="bphoto" accept="image/*" onchange="previewImage(event)">
                <img id="photoPreview" src="#" alt="Image Preview" style="display:none; margin-top:10px; max-width: 20%; height: 20%;" />
            </div>
            <div class="form-group">
                <label for="bookSummary">Book Summary (PDF or Word)</label>
                <input type="file" class="form-control form-control-sm" id="bookSummary" name="pdf" accept=".pdf,.doc,.docx" >
            </div>
            
            <div class="text-center"> 
                <button type="submit" class="btn btn-primary btn-sm">Add Book</button>
            </div>
        </form>
        </c:when>
        
        
        <c:when test="${not empty saveBook }">
        	
        		<h4 style = "text-align:center; margin:50px;">Book Saved successfully with Id: ${saveBook.bookId}</h4>
        		<div class="container table-container">
        	<div class="row justify-content-center">
            <div class="col-md-8"> 
                <h2 class="text-center" style="margin-top:30px">Book Details</h2>
                <table class="table table-bordered">
                	<tr>	
                		<th>Book Id</th>
                		<td>${saveBook.bookId }</td>
                	</tr>
                	<tr>	
                		<th>Book Name</th>
                		<td>${saveBook.bookName }</td>
                	</tr>
                	<tr>	
                		<th>Book Category</th>
                		<td>${saveBook.category }</td>
                	</tr>
                	<tr>	
                		<th>Book Author</th>
                		<td>${saveBook.author }</td>
                	</tr>
                	<tr>	
                		<th>Book Year of Published</th>
                		<td>${saveBook.publishedYear }</td>
                	</tr>
                	<tr>	
                		<th>Book Availability</th>
                		<td>
                		<c:choose>
                			<c:when test="${saveBook.available }">
                				<h6 Style= "color:green;">Available</h6>
                			</c:when>
                			<c:otherwise>
                				<h6 Style= "color:red;">Not Available</h6>
                			</c:otherwise>
                			
                		</c:choose>
                		</td>
                	</tr>
                	<tr>	
                		<th>Status</th>
                		<td>
                		<c:choose>
                		  	<c:when test="${saveBook.active}">
                				<h6 Style= "color:green;">Active</h6>
                			</c:when>
                			<c:otherwise>
                				<h6 Style= "color:red;">Inactive</h6>
                			</c:otherwise>
                		</c:choose>
                		</td>
                	</tr>
               </table>
               </div>
               </div>
               </div>
        
        </c:when>
       
       
        <c:when test= "${getBookById}">
        
        	<h2 class="text-center mb-4" style="margin-top:30px;">Book Details</h2>
        <form action="/admin/bookDetails" method="POST" enctype="multipart/form-data" class="mx-auto" style="max-width: 500px;">
            
            <div class="form-group">
                <label for="bookId">Book ID</label>
                <input type="text" class="form-control form-control-sm" id="bookName" name="bookId" required>
            </div>
            <div class="text-center"> 
                <button type="submit" class="btn btn-primary btn-sm">GetDetails</button>
            </div>
        </form>
        </c:when>
         
         
         
         <c:when test="${module == 'displayBookDetails' }">
         
         <c:choose>
        <c:when test="${not empty bookDetails }">
       	
       
        	<div class="container table-container">
        	<div class="row justify-content-center">
            <div class="col-md-8">
                <h2 class="text-center" style="margin-top:30px">Book Details</h2>
                <table class="table table-bordered">
                    
                    <tbody>
                        <tr>
                            <th>Book Id</th>
                            <td>${bookDetails.bookId}</td>
                        </tr>
                         <tr>
                            <th>Book Name</th>
                            <td>${bookDetails.bookName}</td>
                        </tr>
                         <tr>
                            <th>Category</th>
                            <td>${bookDetails.category}</td>
                        </tr>
                         <tr>
                            <th>Author</th>
                            <td>${bookDetails.author}</td>
                        </tr>
                         <tr>
                            <th>Published year</th>
                            <td>${bookDetails.publishedYear}</td>
                        </tr>
                        <tr>
                        	<th>Status</th>
                        	<td>
                        	<c:choose>
                        	<c:when test="${bookDetails.available}">Available</c:when>
                        	<c:otherwise>Not Available</c:otherwise>
                        	</c:choose>
                        	</td>
                        </tr>
                         <tr>
                            <th>Book Photo</th>
                            <td>
                            	<c:if test="${not empty bookDetails.photo}">
										<img src="data:image/jpeg;base64,${bookDetails.photo}" width="40%" height="40%"alt="${bookDetails.photo }" />
        						</c:if>
                            </td>
                        </tr>
                        <tr>
                        	<th>Book Summary</th>
                        	<td colspan="2">
                        		<c:if test="${not empty bookDetails.summary}">
            						
            						<iframe src="data:application/pdf;base64,${bookDetails.summary}" width="550" height="500"></iframe>
        						</c:if>
                        	</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
        </c:when>
        <c:otherwise>
        	<h4 style="margin:100px; text-align:center; color:red">Book not available</h4>
        </c:otherwise>
        </c:choose>
        </c:when>
        
        
        
        <c:when test= "${module == 'updateForm' }">
    
    
        <h2 class="text-center mb-4" style="margin-top:30px;">Update Book Details</h2>
        <form action="/admin/updateBook" method="POST" enctype="multipart/form-data" class="mx-auto" style="max-width: 500px;">
            
            <div class="form-group">
                <label for="bookId">Book Id</label>
                <input type="text" class="form-control form-control-sm" id="bookId" name="bookId" required>
            </div>
            <div class="text-center"> <!-- Center the button -->
                <button type="submit" class="btn btn-primary btn-sm">Get Details</button>
            </div>
        </form>
        </c:when>
        
        
        <c:when test="${module == 'updateBook' }">
        	<c:choose>
        	<c:when test="${not empty b }">
        	<form action="/admin/updateBookDetails" method="POST" enctype="multipart/form-data" class="mx-auto" style="max-width: 500px;">
            <div class="form-group">
                <label for="bookId">Book Id</label>
                <input type="hidden" class="form-control form-control-sm" id="bookId" name="bookId" value="${b.bookId }">
            </div>
            
            <div class="form-group">
                <label for="bookName">Book Name</label>
                <input type="text" class="form-control form-control-sm" id="bookName" name="bookName" value="${b.bookName }">
            </div>
            <div class="form-group">
                <label for="category">Category</label>
                <input type="text" class="form-control form-control-sm" id="category" name="category" value="${b.category }">
            </div>
            <div class="form-group">
                <label for="author">Author</label>
                <input type="text" class="form-control form-control-sm" id="author" name="author" value="${b.author }">
            </div>
            <div class="form-group">
                <label for="publishedYear">Published Year</label>
                <input type="text" class="form-control form-control-sm" id="publishedYear" name="publishedYear" value="${b.publishedYear}">
            </div>
            
            <div class="text-center"> <!-- Center the button -->
                <button type="submit" class="btn btn-primary btn-sm">Update</button>
            </div>
        </form>
        </c:when>
        <c:otherwise>
        	
        	<h4 style="margin:100px; text-align:center; color:red">Book not available</h4>
        </c:otherwise>
        	</c:choose>
        </c:when>
        
        
        
        <c:when test="${update}">
        	<c:choose>
        		<c:when test="${flag}">
        		
        			<h4 style="color : green; margin:100px; text-align:center">Book Details updated successfully</h4>
        		</c:when>
        		<c:otherwise>
        		
        			<h4 style="color : red; margin:100px; text-align:center">Book Details not Updated try again!</h4>
        		</c:otherwise>
        	</c:choose>
        </c:when>
        
        
        <c:when test="${module == 'deleteForm' }">
        	 <h2 class="text-center mb-4" style="margin-top:30px;">Delete Book</h2>
        <form action="/admin/deleteBook" method="POST" enctype="multipart/form-data" class="mx-auto" style="max-width: 500px;">
            
            <div class="form-group">
                <label for="bookId">Book Id</label>
                <input type="text" class="form-control form-control-sm" id="bookId" name="bookId" required>
            </div>
            <div class="text-center"> <!-- Center the button -->
                <button type="submit" class="btn btn-primary btn-sm">Delete</button>
            </div>
        </form>
        </c:when>
        
        
        <c:when test="${module == 'delete' }">
        	<c:choose>
        		<c:when test="${flag }">
        		
        			<h4 style="color : red; margin:100px; text-align:center">Book Details Deleted Successfully</h4>
        		</c:when>
        		<c:otherwise>
        			<h4 style="color : red; margin:100px; text-align:center">Book Details are not Deleted try again!</h4>
        		</c:otherwise>
        	</c:choose>
        </c:when>
        
        
        <c:when test="${search}">
        	<c:choose>
        	
        		<c:when test="${not empty searchResult }">
        			<div class="container table-container">
        			<div class="row justify-content-center">
            		<div class="col-md-8">
                	<h2 class="text-center" style="margin-top:30px">Books</h2>
                	<table class="table table-bordered">
                	<tr>
                		<th>Book Id</th>
                		<th>Book Name</th>
                		<th>Category</th>
                		<th>Author</th>
                		<th>Year of Publication</th>
                		<th>status</th>
                		<th>Know more</th>
                	</tr>
        		<c:forEach var="book" items="${searchResult }">
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
        				<c:otherwise>
        					Not Available
        				</c:otherwise>
        				</c:choose>
        				</td>
        				<td>
        					<form action="/admin/bookDetails" method="POST" class="d-flex justify-content-end">
            					<input type="hidden" name="bookId" value="${book.bookId }">
            					<button type="submit"  class="btn btn-primary btn-sm">More...</button>
        					</form>
        				</td>
        			</tr>
        		</c:forEach>
        		</table>
        		</div>
        		</div>
        		</div>
        		</c:when>
        		<c:otherwise><h4 style="color:red;text-align:center;margin:100px;">Books are not available</h4></c:otherwise>
        	</c:choose>
        </c:when>
        
        </c:choose>
    </div>	
    <script>
        function previewImage(event) {
            const file = event.target.files[0];
            const preview = document.getElementById('photoPreview');
            const reader = new FileReader();
            
            reader.onload = function(e) {
                preview.src = e.target.result;
                preview.style.display = 'block';
            }
            
            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = '#';
                preview.style.display = 'none';
            }
        }
    </script>
</main>


    <!-- Footer Section -->
    <footer class="footer text-center mt-4"> 
        <p>&copy; 2024 Library. All Rights Reserved.</p>
        <p>Follow us on social media!</p>
    </footer>
</body>
</html>
