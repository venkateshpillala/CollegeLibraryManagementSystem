package com.library.service;

import java.io.IOException;
import java.util.Base64;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.library.dao.IBookDao;
import com.library.model.Book;

@Service
public class BookServiceImple implements IBookService {
	
	@Autowired
	private IBookDao dao;

	@Override
	public List<Book> findAllBooks() {
		
		List<Book> allBooks = dao.findAll();
			for(Book book : allBooks) {
				book.setSummary(Base64.getEncoder().encodeToString(book.getBookSummary()));
				book.setPhoto(Base64.getEncoder().encodeToString(book.getBookPhoto()));
			}
		return allBooks;
	}

	@Override
	public Book findBookById(Long bookId) {
		Book book = null;
		if(bookId != null) {
			Optional<Book> optional = dao.findById(bookId);
			if(optional.isPresent())
				book = optional.get();
		}
		if(book != null) {
			book.setSummary(Base64.getEncoder().encodeToString(book.getBookSummary()));
			book.setPhoto(Base64.getEncoder().encodeToString(book.getBookPhoto()));
		}
		return book;
	}

	@Override
	public Book saveBook(Book book, MultipartFile photo, MultipartFile pdf) {
		
		Book b = null;
		
		if(book != null) {
			try {
				book.setBookPhoto(photo.getBytes());
				book.setBookSummary(pdf.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
			book.setAvailable(true);
			book.setActive(true);
			
			b = dao.save(book);
		}
		return b;
	}

	
	@Override
	public Boolean deleteBookById(Long bookId) {
		Boolean flag = false;
		Book book = null;
		if(bookId != null) {
			Optional<Book> optional = dao.findById(bookId);
			if(optional.isPresent())
				book = optional.get();
		}
		
		if(book != null) {
			
			if(book.getAvailable())
				dao.delete(book);
			flag = true;
		}
			
		return flag;
	}

	@Override
	public Boolean updateBook(Book book) {
		Book b = null;
		
		Optional<Book> opt = dao.findById(book.getBookId());
		if(opt.isPresent())
			b = opt.get();
		
		b.setBookName(book.getBookName());
		b.setCategory(book.getCategory());
		b.setAuthor(book.getAuthor());
		b.setPublishedYear(book.getPublishedYear());
		
			dao.updateBookDetails(b);
		return true;
	}

	@Override
	public List<Book> findByBookName(String bookName) {
		List<Book> books = null;
		if(bookName != null) {
			books = dao.findByBookNameContainingIgnoreCase(bookName);
		}
		if(books != null) {
			for(Book book : books) {
				book.setPhoto(Base64.getEncoder().encodeToString(book.getBookPhoto()));
				book.setSummary(Base64.getEncoder().encodeToString(book.getBookSummary()));
			}
		}
		return books;
	}

}
