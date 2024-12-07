package com.library.controller;

import com.library.model.Book;
import com.library.model.Librarian;
import com.library.service.IBookService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class WelcomePage {
	
	@Autowired
	private IBookService bookService;
	
	@GetMapping("/")
	public String displayWelcomePage(Model model, HttpSession session) {
		
		List<Book> books = bookService.findAllBooks();
		
		Map<String, List<Book>> map = new HashMap<>();

        for (Book book : books) {
           map.computeIfAbsent(book.getCategory(), k -> new ArrayList<>()).add(book);
        }
        
		session.setAttribute("categories", map);
		return "welcome";
	}
	
	
	@PostMapping("/searchBooks")
	public String searchBook(Model model,@RequestParam("bookName") String bookName) {
		List<Book> books = bookService.findByBookName(bookName);
		
        model.addAttribute("module", "search");
		model.addAttribute("search", books);
		
		return "welcome";
	}
	
	@GetMapping("/bookDetails/{bookId}")
	public String bookDetails(Model model, @PathVariable("bookId") Long bookId) {
		
		Book book = bookService.findBookById(bookId);
		model.addAttribute("bookDetails", book);
		
		return "welcome";
	}
	
	@GetMapping("/about")
	public String about() {
		return "about";
	}
	
}
