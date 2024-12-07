package com.library.model;

import java.io.Serializable;
import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Entity
@Data
public class BookTrack  implements Serializable{
	
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long transactionId;
	private LocalDate getDate;
	private LocalDate submittedDate;
	private Integer days;
	private Float penalty;
	private Boolean submitted;
	
	
	private Long bookId;
	
	
	private Long userId;
}
