package cancel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class cancellation
 */
@WebServlet("/cancellation")
public class cancellation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cancellation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		user User;
		String username = request.getParameter("name");
		String password = request.getParameter("pass");
		String ID = request.getParameter("id");
		
		User = new user();  
		User.setName(username);
User.setPassword(password);
User.setId(ID);
request.setAttribute("bean", User);
//request.getRequestDispatcher("validationCancellation.jsp").forward(request, response);

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

   String sql = "DELETE FROM ticket WHERE name = ? AND id = ?";

   PreparedStatement stmt = con.prepareStatement(sql);
   stmt.setString(1,username );
   stmt.setString(2, ID);
   stmt.executeUpdate();

   // Clean up resources
   stmt.close();
   con.close();
} catch (SQLException | ClassNotFoundException e) {
   e.printStackTrace();
}

// Redirect back to the cancellation page
response.sendRedirect("PrintingCancel.jsp");

		
	}

}
