package cancel;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;

public class user {
   private String name;
   private String password;
   private String id;
   
  
  // private Connection connection;
   public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}
public String getPassword() {
      return password;
   }
   
   public void setPassword(String password) {
      this.password = password;
   }
   public String getId() {
	   return id;
   }
   public void setId(String Id) {
	   this.id=Id;
   }
 
  /* public user() throws SQLException  
   {
   	 try {
	
			
			Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   }*/
  /* public void deleteticket(String name) 
   {
       try {
           PreparedStatement authStatement = connection.prepareStatement("SELECT id FROM addcar WHERE id = ? ");
           authStatement.setString(1, name);
           ResultSet authResult = authStatement.executeQuery();
           if (authResult.next()) {
               // If authorized, delete the car
               PreparedStatement deleteStatement = connection.prepareStatement("DELETE FROM ticket WHERE id = ?");
               deleteStatement.setString(1,id);
               int rowsDeleted = deleteStatement.executeUpdate();
               if (rowsDeleted > 0) {
                   System.out.println("user with ID " + name + " has been deleted ");
               } else {
                   System.out.println("No car with name " + name + " found.");
               }
           } 
       } catch (SQLException e) {
           e.printStackTrace();
       }try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   }*/
}