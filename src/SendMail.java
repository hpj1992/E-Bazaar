
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class SendMail {

	 String to;
	 String title;
	 String msg;
	
	public SendMail(String to,String title,String msg)
	{
	this.to=to;
	this.title=title;
	this.msg=msg;
	System.out.println("hello constructor");
	send2();
	
	
	}
	
	public void send2()
	{
		System.out.println("1");
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.mail.yahoo.com");
		//props.put("mail.smtp.host", "smtp.gmail.com");
		//props.put("mail.smtp.socketFactory.port", "465");
		//props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "25");
		props.put("mail.smtp.starttls.enable", "true");
		System.out.println("2");
		Session session = Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
			
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("panya.website@yahoo.in","panya1991");
				}
			});
		System.out.println("3");
		try {
			System.out.println("4");
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("panya.website@yahoo.in"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(to));
			message.setSubject(title);
			message.setText(msg);
			System.out.println("5");
			Transport.send(message);
			System.out.println("6");
			System.out.println("Done");
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		
	
		
		
		
	}
	
	
	
	
}