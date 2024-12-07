package com.library.service;


import com.library.model.User;

public interface IUserService {
	
	User findPasswordById(Long userId, String password);
	Long saveUser(User user);
	Boolean updateUserPassword(Long userId, String oldPassword, String newPassword);
	User findByUserId(Long userId);
	Boolean getBook(Long userId, Long bookId);
	
	User findUserById(Long userId);
}
