package com.library.service;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.dao.IBookDao;
import com.library.dao.IBookTrackDao;
import com.library.dao.ILibrarianDao;
import com.library.model.Book;
import com.library.model.BookTrack;
import com.library.model.Librarian;

@Service
public class LibrarianServiceImple implements ILibrarianService{

	@Autowired
	private ILibrarianDao dao;
	
	@Autowired
	private IBookTrackDao bookTrackDao;
	
	@Autowired
	private IBookDao bookDao;

	@Override
	public Librarian findByUsername(String username) {
		
		Librarian librarian = null;
		Optional<Librarian> optional = dao.findById(username);
		
		if(optional.isPresent())
			librarian = optional.get();
		return librarian;
	}

	@Override
	public Boolean updatePassword(Librarian librarian) {
		
		Boolean flag = false;
		Librarian lib = null;
		
		//New Password validation
		if(librarian != null) {
			if(librarian.getNewPassword1().equals(librarian.getNewPassword2())) {
				Optional<Librarian> optional = dao.findById(librarian.getUsername());
					lib = optional.get();
			}
		}
		
		//Verify credentials to update password
		if(lib != null && librarian != null) {
			if(lib.getUsername().equals(librarian.getUsername()) && lib.getPassword().equals(librarian.getPassword())) { 
				lib = null;
				librarian.setPassword(librarian.getNewPassword1());
				lib = dao.save(librarian);
				if(lib != null)
					flag = true;
			}
		}
		return flag;
	}

	@Override
	@Transactional
	public Boolean submitBook(Long transactionId) {
		
		Boolean flag = false;
		BookTrack track = null;
		Book book = null;
		
		if(transactionId != null) {
			Optional<BookTrack> opt = bookTrackDao.findById(transactionId);
			if(opt.isPresent())
				track = opt.get();
		}
		
		if(track != null) {
			Optional<Book> opt = bookDao.findById(track.getBookId());
			if(opt.isPresent())
				book = opt.get();
		}
		
		if(book != null && track != null) {
			book.setAvailable(true);
			
			track.setSubmittedDate(LocalDate.now());
			
			int daysBetween = (int)ChronoUnit.DAYS.between(track.getGetDate(), track.getSubmittedDate());
			track.setDays(daysBetween);
			
			Float penalty = 0.0f;
			if(daysBetween > 30) {
				penalty = (daysBetween-30)*10.0f;
			}
			
			track.setPenalty(penalty);
			track.setSubmitted(true);
			
			
			bookDao.save(book);
			bookTrackDao.save(track);
			flag = true;
		}
		return flag;
	}
}
