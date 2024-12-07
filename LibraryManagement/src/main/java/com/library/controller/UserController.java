package com.library.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.dto.BookTrackDTO;
import com.library.model.Book;
import com.library.model.BookTrack;
import com.library.model.User;
import com.library.service.IBookService;
import com.library.service.IBookTrackService;
import com.library.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	IUserService userService;
	
	@Autowired
	IBookService bookService;
	
	@Autowired
	IBookTrackService bookTrackService;
	

	//User Login Form Display
	@GetMapping("/user-login")
	public String userLogin() {
		return "user-login";
	}
	
	
	@PostMapping("/login")
	public String validatePassword(HttpSession session, Model model, @RequestParam("userId") Long userId, @RequestParam("password") String password) {
		
		User user = userService.findPasswordById(userId, password);
		System.out.println(userId+" "+password);
		if(user != null) {
			session.setAttribute("user", user);
			return "User";
		}
		model.addAttribute("flag", true);
		return "user-login";
	}
	
	//Registration Form Display
	@GetMapping("/register")
	public String registerUserForm(Model model, @ModelAttribute("user") User user) {
		model.addAttribute("register", true);
		return "user-login";
	}
	
	@PostMapping("/registration")
	public String registerUser(Model model, @ModelAttribute("user") User user) {
		Long userId = userService.saveUser(user);
		model.addAttribute("userId", userId);
		return "user-login";
	}
	
	//Change Password Form Display
	@GetMapping("/changePasswordForm")
	public String changePasswordeForm(Model model) {
		model.addAttribute("changePasswordForm", true);
		return "user-login";
	}
	
	@PostMapping("/changePassword")
	public String changePassword(@RequestParam("userId") Long userId, 
								 @RequestParam("password") String password,
								 @RequestParam("newPassword1") String newPassword1,
								 @RequestParam("newPassword2") String newPassword2, Model model) {

		Boolean cp = false;
		
		if(newPassword1.equals(newPassword2)) {
			cp = userService.updateUserPassword(userId, password, newPassword2);
			if(cp) {
				model.addAttribute("cp", cp);
				return "user-login";
			}
		}
		model.addAttribute("cp","cp");
		return "User";
	}
	
		
	@GetMapping("/history")
	public String showUserHistory(HttpSession session, Model model) {
		
		User user = (User)session.getAttribute("user");
		List<BookTrackDTO> dtos = null;
		if(user != null) {
			dtos = bookTrackService.penaltyCalculation(user);
			Collections.reverse(dtos);
		}else {user = null;}
		
		model.addAttribute("history", true);
		model.addAttribute("dto", dtos);
		
		return "User";
	}
	
	
	@PostMapping("/searchBooks")
	public String searchBooks(Model model, @RequestParam("bookName") String bookName) {
		List<Book> books = bookService.findByBookName(bookName);
		model.addAttribute("books", books);
		model.addAttribute("search", true);
		return "User";
	}
	
	@GetMapping("/knowMore/{bookId}")
	public String knowMoreBookDetails(@PathVariable("bookId") Long bookId, Model model) {
		
		Book book = bookService.findBookById(bookId);
		
		model.addAttribute("book", book);
		model.addAttribute("knowMore", true);
		
		return "User";
	}
	
	@GetMapping("/getBook/{bookId}")
	public String takeBook(HttpSession session, Model model,@PathVariable("bookId") Long bookId) {
		
		User user = (User)session.getAttribute("user");
			
		Boolean flag = userService.getBook(user.getUserId(), bookId);
		
		List<Book> books = bookService.findAllBooks();
		
		Map<String, List<Book>> map = new HashMap<>();

        for (Book b : books) {
           map.computeIfAbsent(b.getCategory(), k -> new ArrayList<>()).add(b);
        }
        
		session.setAttribute("categories", map);
		
		model.addAttribute("take",flag );
		
		return "User";
	}
	
	@GetMapping("/about")
	public String about() {
		return "about";
	}
	
}
