package com.library.model;


import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Transient;


import lombok.Data;

@Data
@Entity
public class Book implements Serializable{
	
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private  Long bookId ;
	private String bookName ;
	private String category;
	private String author ;
	private String publishedYear;
	
	@Lob
	private byte[] bookPhoto ;
	@Lob
	private byte[] bookSummary ;
	
	private Boolean available ;
	private Boolean active;
	
	@Transient
	private String photo;
	
	@Transient
	private String summary;
	
	
}
