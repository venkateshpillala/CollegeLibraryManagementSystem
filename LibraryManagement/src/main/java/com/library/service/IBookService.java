package com.library.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.library.model.Book;

public interface IBookService {

	List<Book> findAllBooks();
	Book findBookById(Long bookId);
	Book saveBook(Book book, MultipartFile photo, MultipartFile pdf);
	Boolean deleteBookById(Long bookId);
	Boolean updateBook(Book book);
	List<Book> findByBookName(String bookName);
}
