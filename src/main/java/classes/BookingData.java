package classes;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BookingData {
String name;
String email;
String phone;
int age;
String TicketType;
String party;

public String getParty() {
	return party;
}
public void setParty(String party) {
	this.party = party;
}
public PrintWriter getPw() {
	return pw;
}
public void setPw(PrintWriter pw) {
	this.pw = pw;
}
PrintWriter pw= new PrintWriter(System.out);

public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public int getAge() {
	return age;
}
public void setAge(int age) {
	this.age = age;
}
public String getTicketType() {
	return TicketType;
}
public void setTicketType(String ticketType) {
	TicketType = ticketType;
}
   public void insert ()

   {
	Connection con = null;
    ResultSet rs = null;
    PreparedStatement stmt=null;
    
    try
    {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

    Statement stat = con.createStatement();
    
    stmt = con.prepareStatement("INSERT INTO ticket (name, phone, email, age, TicketType,party) VALUES (?, ?, ?, ?, ?,?)", Statement.RETURN_GENERATED_KEYS);
   
    stmt.setString(1, getName());
    stmt.setString(2,  getPhone());
    stmt.setString(3, getEmail());
    stmt.setInt(4,  getAge());
    stmt.setString(5,  getTicketType() );
    stmt.setString(6, getParty());
    stmt.executeUpdate();
    
   
   pw.print("Data is inserted");
    }
    
    
    catch (ClassNotFoundException e) {
   	  System.out.println("class not found");
     }

catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
System.out.println("al code atmn3");
}
    
finally {
		
			if (con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		} 
}
}
