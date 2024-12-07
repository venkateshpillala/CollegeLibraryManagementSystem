package com.library.mail;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Optional;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.library.dao.IBookDao;
import com.library.dao.IBookTrackDao;
import com.library.dao.IUserDao;
import com.library.model.Book;
import com.library.model.BookTrack;
import com.library.model.User;

@Service
public class MailSenderImple implements IMailSender {

	@Autowired
	private JavaMailSender sender;
	
	@Autowired
	private IBookTrackDao bookTrackDao;
	
	@Autowired
	private IBookDao bookDao;
	
	@Autowired
	private IUserDao userDao;

	@Value(value = "${spring.mail.username}")
	private String from;
	
	@Override
	public Boolean sendAlerts() {
		
		Boolean flag = false;
		
		  User user = null; Book book = null; List<BookTrack> bookTracks =  bookTrackDao.findByUserTrackForAlert();
		  
		  if(bookTracks != null) { 
			  for(BookTrack bookTrack : bookTracks) {
				  Optional<Book> b = bookDao.findById(bookTrack.getBookId()); 
				  if(b.isPresent())
					  book = b.get(); 
				  Optional<User> u = userDao.findById(bookTrack.getUserId());
				  if(u.isPresent()) 
					  user = u.get();
		  
				  Integer days = (int)ChronoUnit.DAYS.between(bookTrack.getGetDate(),LocalDate.now());
		  
				  Float penalty=0.0f;
		  
				  if(days>15) {
					  Integer daysOverdue = days-15;
					  penalty = (daysOverdue-15)*10.0f;
		  
					  try { 
						  flag = sentMail(user.getEmail(),user.getUsername(),book.getBookName(),bookTrack.getGetDate(), daysOverdue, penalty); 
					  } 
					  catch(Exception e) { 
						  flag = false; 
					  } 
				  }
			  }
		  }
		return flag;
	}
	
	
	private Boolean sentMail(String to,String username, String bookName, LocalDate dateBorrowed, Integer daysOverdue, Float penalty) throws Exception {
		
		
		SimpleMailMessage message = new SimpleMailMessage();
		
		String body = mailBody(username, bookName, dateBorrowed, daysOverdue, penalty);
		
        message.setTo(to);
        message.setSubject("Library Book Overdue Penalty Alert");
        message.setText(body);
        message.setFrom(from); 

        sender.send(message);
		
        
        return true;
	}
	
	
	private String mailBody(String username, String bookName, LocalDate dateBorrowed, Integer daysOverdue, Float penalty ) {
		 String body = String.format(
		            "Dear %s,\n\n" +
		            "We hope this message finds you well. This is a friendly reminder that you have the following library book that is overdue:\n\n" +
		            "Title: %s\n" +
		            "Date Borrowed: %s\n" +
		            "Days Overdue: %d\n" +
		            "Total Penalty: ₹%.2f\n\n" +
		            "Please return the book at your earliest convenience to avoid further penalties. If you have any questions or need assistance, please do not hesitate to contact us.\n\n" +
		            "Thank you for your attention to this matter!\n\n\n\n" +
		            "Best regards,\n" +
		            "[SARASWATHI LIBRARY]\n" +
		            "[LIBRARIAN]\n" ,
		            username, bookName, dateBorrowed, daysOverdue, penalty
		        );
		 
		 return body;
	}
	
	
	
	
	
	
	
}
