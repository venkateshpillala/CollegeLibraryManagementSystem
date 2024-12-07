package com.library.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.library.model.Librarian;

public interface ILibrarianDao extends JpaRepository<Librarian, String> {


}
