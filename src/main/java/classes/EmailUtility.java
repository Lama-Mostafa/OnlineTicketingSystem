package classes;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailUtility {

    public static void sendConfirmationEmail(String recipientEmail /*String confirmationCode*/) throws Exception {
       
    	//el property leha key w value help manage system through these key and value zy cookies keda
    	Properties props = new Properties();
        props.put("mail.smtp.auth", "true"); //authorized users houma el byb3to mail el houwa ana "event easing"
        props.put("mail.smtp.starttls.enable", "true");//lazem a/encript el connection
        props.put("mail.smtp.host", "smtp.gmail.com");//hab3at l gmail
        props.put("mail.smtp.port", "587"); //port number 3ady de 
        final String username = "Event.Easing@gmail.com";
        final String password = "mdqmsvsfwsnhvzrt";

        //session fl mail heya el bt/send w receive 
        Session session = Session.getInstance(props,
                new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
        message.setSubject("Confirmation Email");
        message.setText("this is a confirmation mail congratulations you have booked your ticket");

        /* message.setText("Dear user, please click the following link to confirm your registration: " +
                "http://your-website.com/confirm?code=" + confirmationCode);*/
        
        // Send the message
        Transport.send(message);
    }
}

