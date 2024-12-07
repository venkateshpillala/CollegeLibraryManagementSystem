package com.library.service;

import java.util.List;

import com.library.dto.BookTrackDTO;
import com.library.model.BookTrack;
import com.library.model.User;

public interface IBookTrackService {

	BookTrack saveTrack(BookTrack bookTrack);
	List<BookTrackDTO> penaltyCalculation(User user);
	BookTrackDTO getBookTrackByBookId(Long bookId);
}
