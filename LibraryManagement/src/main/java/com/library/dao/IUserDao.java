package com.library.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.library.model.User;

public interface IUserDao extends JpaRepository<User, Long> {

}
