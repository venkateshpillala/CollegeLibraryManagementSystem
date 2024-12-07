package com.library.dto;

import java.io.Serializable;
import java.time.LocalDate;

import lombok.Data;

@Data
public class BookTrackDTO implements Serializable{

	
	private static final long serialVersionUID = 1L;
	
	private Long transactionId;
	private LocalDate getDate;
	private LocalDate submittedDate;
	private Integer days;
	private Float penalty;
	private Boolean submitted;
	
	private Long userId;
	private String username ;
	private String password ;
	private Long mobileNumber ;
	private String email ;
	
	
	private  Long bookId ;
	private String bookName ;
	private String category;
	private String author ;
	private String publishedYear;
	private Boolean available ;
	private Boolean active;

}
