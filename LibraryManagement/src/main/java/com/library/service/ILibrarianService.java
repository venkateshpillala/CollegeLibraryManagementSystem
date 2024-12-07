package com.library.service;

import com.library.model.Librarian;

public interface ILibrarianService {
	Librarian findByUsername(String username);
	Boolean updatePassword(Librarian librarian);
	Boolean submitBook(Long transactionId);
}
