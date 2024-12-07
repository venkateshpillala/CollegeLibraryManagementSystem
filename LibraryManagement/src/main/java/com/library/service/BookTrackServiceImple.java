package com.library.service;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.dao.IBookDao;
import com.library.dao.IBookTrackDao;
import com.library.dao.IUserDao;
import com.library.dto.BookTrackDTO;
import com.library.model.Book;
import com.library.model.BookTrack;
import com.library.model.User;

@Service
public class BookTrackServiceImple implements IBookTrackService {

	@Autowired
	IBookTrackDao bookTrackDao;
	
	@Autowired
	IBookDao bookDao;
	
	@Autowired
	IUserDao userDao;
	
	@Override
	public BookTrack saveTrack(BookTrack bookTrack) {
		
		BookTrack track	= bookTrackDao.save(bookTrack);
		return track;
	}
	
	@Override
	@Transactional
	public List<BookTrackDTO> penaltyCalculation(User user) {
		
		List<BookTrack> bookTracks = bookTrackDao.findByUserIdWithBookTrack(user.getUserId());
		List<BookTrackDTO> dtos = new ArrayList<>();
		if(bookTracks != null) {
			System.out.println("BookTracks not null in penalty calculation method");
			for(BookTrack bookTrack:bookTracks) {
				BookTrackDTO dto = new BookTrackDTO();
				User u = null;
				Book b = null;
				
				Optional<User> opt = userDao.findById(bookTrack.getUserId());
				if(opt.isPresent())
					u = opt.get();
				
				Optional<Book> bopt = bookDao.findById(bookTrack.getBookId());
				if(bopt.isPresent())
					b = bopt.get();
				
				if(b != null && u != null) {
					dto.setAuthor(b.getAuthor());
					dto.setAvailable(b.getAvailable());
					dto.setBookId(b.getBookId());
					dto.setBookName(b.getBookName());
					dto.setCategory(b.getCategory());
					
					LocalDate endDate = LocalDate.now();
					
					if(bookTrack.getSubmittedDate() != null) {
						endDate = bookTrack.getSubmittedDate();
						dto.setSubmittedDate(bookTrack.getSubmittedDate());
					}
					
					int daysBetween = (int)ChronoUnit.DAYS.between(bookTrack.getGetDate(), endDate);
					
					dto.setDays(0);
					
					Float penalty = 0.0f;
					if(daysBetween > 15) {
						dto.setDays(daysBetween - 15);
						penalty = (daysBetween-30)*10.0f;
					}
					
					dto.setPenalty(penalty);
					
					dto.setEmail(u.getEmail());
					dto.setGetDate(bookTrack.getGetDate());
					dto.setMobileNumber(u.getMobileNumber());
					
					
					dto.setPublishedYear(b.getPublishedYear());
					dto.setSubmitted(bookTrack.getSubmitted());
					
					
					dto.setTransactionId(bookTrack.getTransactionId());
					dto.setUserId(u.getUserId());
					dto.setUsername(u.getUsername());
				}
				
				dtos.add(dto);
			}
			
			
		}
		return dtos;
	}

	@Override
	public BookTrackDTO getBookTrackByBookId(Long bookId) {
		
		BookTrack bookTrack = bookTrackDao.findByBookIdWithBookTrack(bookId);
		BookTrackDTO dto = null;
		if(bookTrack != null) {
			System.out.println("BookTracks not null  method");
				dto = new BookTrackDTO();
				User u = null;
				Book b = null;
				
				Optional<User> opt = userDao.findById(bookTrack.getUserId());
				if(opt.isPresent())
					u = opt.get();
				
				Optional<Book> bopt = bookDao.findById(bookTrack.getBookId());
				if(bopt.isPresent())
					b = bopt.get();
				
				if(b != null && u != null) {
					dto.setAuthor(b.getAuthor());
					dto.setAvailable(b.getAvailable());
					dto.setBookId(b.getBookId());
					dto.setBookName(b.getBookName());
					dto.setCategory(b.getCategory());
					
					LocalDate endDate = LocalDate.now();
					
					if(bookTrack.getSubmittedDate() != null) {
						endDate = bookTrack.getSubmittedDate();
						dto.setSubmittedDate(bookTrack.getSubmittedDate());
					}
					
					int daysBetween = (int)ChronoUnit.DAYS.between(bookTrack.getGetDate(), endDate);
					
					dto.setDays(0);
					Float penalty = 0.0f;
					if(daysBetween > 15) {
						dto.setDays(daysBetween-15);
						penalty = (daysBetween-30)*10.0f;
					}
					
					dto.setPenalty(penalty);
					
					dto.setEmail(u.getEmail());
					dto.setGetDate(bookTrack.getGetDate());
					dto.setMobileNumber(u.getMobileNumber());
					
					
					dto.setPublishedYear(b.getPublishedYear());
					dto.setSubmitted(bookTrack.getSubmitted());
					
					
					dto.setTransactionId(bookTrack.getTransactionId());
					dto.setUserId(u.getUserId());
					dto.setUsername(u.getUsername());
				}
				
			}
		
		return dto;
	}
	

}
