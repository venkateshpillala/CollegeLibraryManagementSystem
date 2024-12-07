package com.library.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class Librarian  implements Serializable{

	
	private static final long serialVersionUID = 1L;
	@Id
	@Column(length = 100)
	private String username;
	@Column(length = 100)
	private String password;
	@Column(length=100)
	private String newPassword1;
	@Column(length=100)
	private String newPassword2;
	
	
	
}
