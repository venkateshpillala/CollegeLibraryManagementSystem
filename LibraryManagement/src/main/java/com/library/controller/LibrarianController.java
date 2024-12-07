package com.library.controller;




import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.library.dto.BookTrackDTO;
import com.library.mail.IMailSender;
import com.library.model.Book;
import com.library.model.Librarian;
import com.library.model.User;
import com.library.service.IBookService;
import com.library.service.IBookTrackService;
import com.library.service.ILibrarianService;
import com.library.service.IUserService;

@Controller
@RequestMapping("/admin")
public class LibrarianController {

	@Autowired
	private ILibrarianService service;
	
	@Autowired
	private IBookService bookService;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IBookTrackService bookTrackService;
	
	@Autowired
	private IMailSender sender;
	
	@GetMapping("/admin-login")
	public String adminLoginPageDispaly(@ModelAttribute("librarian") Librarian librarian) {
		return "admin-login";
	}
	
	
	
	@PostMapping("/admin")
	public String loginValidation(Model model, @ModelAttribute("librarian") Librarian librarian) {
		
		String result = "success";
		
		Librarian lib = service.findByUsername(librarian.getUsername());
		
		if(lib != null && librarian != null) 
			if(lib.getUsername().equals(librarian.getUsername()) && lib.getPassword().equals(librarian.getPassword())) { 
				result = null;
				return "admin";
			}
		model.addAttribute("result", result);
		return "admin-login";
	}
	
	
	
	@GetMapping("/changeAdminPassword")
	public String changePassword(Model model, @ModelAttribute("librarian") Librarian librarian) {
		model.addAttribute("changePassword", true );
		return "admin-login";
	}
	
	
	
	@PostMapping("/validatePassword")
	public String validatePassword(Model model, @ModelAttribute("librarian") Librarian librarian) {
		
		Boolean flag = true;
		flag = service.updatePassword(librarian);
		if(flag) {
			model.addAttribute("flag", flag);
			return "admin-login";
		}
		model.addAttribute("change", true);
		return "admin";
	}
	
	
	
	@GetMapping("/addBook")
	public String addNewBook(Model model, @ModelAttribute("book") Book book) {
		
		model.addAttribute("addBook", true);
		return "addBook";
	}
	
	
	
	@PostMapping("/saveBook")
	public String saveBook(Model model, HttpSession session,
						   @RequestParam("bphoto") MultipartFile bphoto,
						   @RequestParam("pdf") MultipartFile pdf, 
						   @ModelAttribute("book") Book book) {
		
		List<Book> books = bookService.findAllBooks();
		
		Map<String, List<Book>> map = new HashMap<>();

        for (Book b : books) {
           map.computeIfAbsent(b.getCategory(), k -> new ArrayList<>()).add(b);
        }
        
		session.setAttribute("categories", map);
		
		model.addAttribute("saveBook", bookService.saveBook(book,bphoto,pdf));
	
		return "addBook";
	}
	
	
	
	@GetMapping("/bookDetailsForm")
	public String getBookDetails(Model model) {
		model.addAttribute("getBookById", true);
		return "addBook";
	}
	
	
	
	@PostMapping("/bookDetails")
	public String getBookDetails(Model model, @RequestParam("bookId") Long bookId) {
		
		Book book = null;
		
		if(bookId != null)
			book = bookService.findBookById(bookId);
		
		model.addAttribute("module","displayBookDetails");
		model.addAttribute("bookDetails", book);
		return "addBook";
	}
	
	
	
	@GetMapping("/updateForm")
	public String updateForm(Model model) {
		model.addAttribute("module","updateForm");
		return "addBook";
	}
	
	
	
	@PostMapping("/updateBook")
	public String updateBook(Model model,@RequestParam("bookId") Long bookId) {
		
		Book book = null;
		if(bookId != null)
			book = bookService.findBookById(bookId);
		
		model.addAttribute("module", "updateBook");
		model.addAttribute("b", book);
		
		return "addBook";
	}
	
	
	
	@PostMapping("/updateBookDetails")
	public String bookDetails(HttpSession session, Model model, @ModelAttribute("book") Book book) {
		
		Boolean flag = false;
		
		if(book != null) {
			flag = bookService.updateBook(book);
		}
		List<Book> books = bookService.findAllBooks();
		
		Map<String, List<Book>> map = new HashMap<>();

        for (Book b : books) {
           map.computeIfAbsent(b.getCategory(), k -> new ArrayList<>()).add(b);
        }
        
		session.setAttribute("categories", map);
		model.addAttribute("update",true);
		model.addAttribute("flag", flag);
		return "addBook";
	}
	
	
	
	@GetMapping("/deleteForm")
	public String deleteForm(Model model) {
		model.addAttribute("module", "deleteForm");
		return "addBook";
	}
	
	
	
	@PostMapping("/deleteBook")
	public String deleteBook(HttpSession session, Model model, @RequestParam("bookId") Long bookId) {
		Boolean flag = bookService.deleteBookById(bookId);
		List<Book> books = bookService.findAllBooks();
		
		Map<String, List<Book>> map = new HashMap<>();

        for (Book b : books) {
           map.computeIfAbsent(b.getCategory(), k -> new ArrayList<>()).add(b);
        }
        
		session.setAttribute("categories", map);
		model.addAttribute("module", "delete");
		model.addAttribute("flag", flag);
		return "addBook";
	}
	
	
	@PostMapping("/search")
	public String searchBook(Model model, @RequestParam("bookName") String bookName) {
		
		model.addAttribute("search", true);
		model.addAttribute("searchResult", bookService.findByBookName(bookName));
		
		return "addBook";
	}
	
	@GetMapping("/submitForm")
	public String submitForm(Model model) {
		model.addAttribute("submitForm", true);
		return "addBook";
	}
	
	
	@PostMapping("/penalty")
	public String submitBook(Model model, @RequestParam(defaultValue= "0", name="bookId") Long bookId, @RequestParam(defaultValue= "0", name="userId") Long userId) {
		
		System.out.println(bookId+" "+userId);
		
		if(bookId != 0) {
			BookTrackDTO dto = bookTrackService.getBookTrackByBookId(bookId);
			model.addAttribute("dto", dto);
		}
		else if(userId != 0) {
			System.out.println("userId");
			User user = userService.findByUserId(userId);
			List<BookTrackDTO> dtos = bookTrackService.penaltyCalculation(user);
			Collections.reverse(dtos);
			model.addAttribute("dtos", dtos);
		}
		model.addAttribute("submit", true);
		return "addBook";
	}
	
	
	@PostMapping("/submit")
	public String submitBook(HttpSession session, Model model,@RequestParam("transactionId") Long transactionId) {
		
		Boolean flag = service.submitBook(transactionId);
		List<Book> books = bookService.findAllBooks();
		
		Map<String, List<Book>> map = new HashMap<>();

        for (Book b : books) {
           map.computeIfAbsent(b.getCategory(), k -> new ArrayList<>()).add(b);
        }
        
		session.setAttribute("categories", map);
		model.addAttribute("status", flag);
		
		return "addBook";
	}
	
	@GetMapping("/alert")
	public String alert() {
		Boolean flag = sender.sendAlerts();
		return "about";
	}
	
	@GetMapping("/about")
	public String about() {
		return "about";
	}
	
}
