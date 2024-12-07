package com.library.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.library.dto.BookTrackDTO;
import com.library.model.BookTrack;

public interface IBookTrackDao extends JpaRepository<BookTrack, Long> {
	
	@Query("SELECT bt FROM BookTrack bt WHERE bt.userId = :userId")
	List<BookTrack> findByUserIdWithBookTrack(@Param("userId") Long userId);
	
	@Query("SELECT bt FROM BookTrack bt WHERE bt.bookId = :bookId AND bt.submitted = false")
	BookTrack findByBookIdWithBookTrack(@Param("bookId") Long bookId);
	
	@Query("SELECT bt FROM BookTrack bt WHERE bt.submitted = false")
	List<BookTrack> findByUserTrackForAlert();
	
}
