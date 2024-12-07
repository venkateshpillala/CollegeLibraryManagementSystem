package com.library.service;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.hibernate.Hibernate;
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
public class UserServiceImple implements IUserService {

	@Autowired
	private IUserDao userDao;
	
	@Autowired
	private IBookDao bookDao;
	
	@Autowired
	private IBookTrackDao bookTrackDao;
	
	@Override
	public User findPasswordById(Long userId, String password) {
		
		User user = null;
		
		Optional<User> opt = userDao.findById(userId);
		if(opt.isPresent()) {
			user = opt.get();
		}
		if(user != null) 			
			if(!user.getPassword().equals(password))
				user = null;
		
		return user;
	}

	@Override
	public Long saveUser(User user) {
		Long userId = null;
		if(user != null) {
			userId = userDao.save(user).getUserId();
		}
		return userId;
	}

	
	@Override
	public Boolean updateUserPassword(Long userId, String oldPassword, String newPassword) {

		Boolean flag = false;
		User user = null;
		
			Optional<User> opt = userDao.findById(userId);
			if(opt.isPresent())
				user = opt.get();
			
			if(user != null) {
				if(user.getPassword().equals(oldPassword)) {
					user.setPassword(newPassword);
					userDao.save(user);
					flag = true;
				}
			}
		return flag;
	}
	
	
	
	  
	  @Override 
	  public User findByUserId(Long userId) {
	  
		  User user = null; 
		  Optional<User> optional = userDao.findById(userId);
		  if(optional.isPresent()) 
			  user = optional.get(); 
		  return user; 
	  }
	  

	@Override
	@Transactional
	public Boolean getBook(Long userId, Long bookId) {

		Boolean flag = false;
		Book book = null;
		User user = null;
		
		Optional<Book> opt = bookDao.findById(bookId);
		if(opt.isPresent())
			book = opt.get();
		
		Optional<User> uopt = userDao.findById(userId);
		if(uopt.isPresent())
			user = uopt.get();
		
		if(book != null) {
			book.setAvailable(false);
		}
		
		
		BookTrack bookTrack = new BookTrack();
		bookTrack.setBookId(book.getBookId());
		bookTrack.setUserId(user.getUserId());
		bookTrack.setGetDate(LocalDate.now());
		bookTrack.setSubmitted(false);
		
		if(book != null && bookTrack != null) {
			bookDao.save(book);
			bookTrackDao.save(bookTrack);
			flag = true;
		}
		
		return flag;
	}

	@Override
	public User findUserById(Long userId) {
		
		User user = null;
		if(userId != null) {
			Optional<User> opt = userDao.findById(userId);
			if(opt.isPresent())
				user = opt.get();
		}
		
		return user;
	}

	

	
}
