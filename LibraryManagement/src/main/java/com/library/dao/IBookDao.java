package com.library.dao;

import java.util.List;
import java.util.Optional;
import java.util.function.Supplier;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.library.model.Book;

public interface IBookDao extends JpaRepository<Book, Long> {
	
	List<Book> findByBookNameContainingIgnoreCase(String bookName);
	
	default void updateBookDetails(Book b) {
        // Retrieve the existing book entity
        Book book = null;
        Optional<Book> optional = findById(b.getBookId());
        
        if(optional.isPresent()) {
        	book = optional.get();
        }
        book.setBookName(b.getBookName());
        book.setCategory(b.getCategory());
        book.setAuthor(b.getAuthor());
        book.setPublishedYear(b.getPublishedYear());

        save(book); 
    }

}
