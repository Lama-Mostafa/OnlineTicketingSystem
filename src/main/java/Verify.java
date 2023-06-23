import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Verify")
public class Verify extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String username1=request.getParameter("username");
		String pass=request.getParameter("pass");
		String radio=request.getParameter("rd");

		HttpSession session = request.getSession();
        session.setAttribute("username", username1);
        
		Connection con = null;
        ResultSet rs = null;

        if (radio.equals("user"))
        {
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

            Statement s = con.createStatement();
            String sql = "SELECT * FROM user1 WHERE username = '"+username1+"' AND password = '"+pass+"'";
            rs = s.executeQuery(sql);

			if (rs.next()) {
				String name = rs.getString("first_name");
				String UserN = rs.getString("username");
				String password = rs.getString("password");
				if (username1.equals(UserN) && pass.equals(password)) {

					out.print(name);
					request.getRequestDispatcher("AvaliableParties.jsp").forward(request, response);
				}
			} else {
            	out.print("enter right username and password");
                request.getRequestDispatcher("Login.html").include(request, response);	
			}
           
            
            
              } catch (ClassNotFoundException e) {
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
        
        else 
        {
        	try {

                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

                Statement s = con.createStatement();
                String sql = "SELECT * FROM admin WHERE username = '"+username1+"' AND password = '"+pass+"'";
                rs = s.executeQuery(sql);

    			if (rs.next()) {
    				String name = rs.getString("first_name");
    				String UserN = rs.getString("username");
    				String password = rs.getString("password");
    				if (username1.equals(UserN) && pass.equals(password)) {

    					out.print(name);
    					request.getRequestDispatcher("AddingParties.jsp").forward(request, response);
    				}
    			} else {
                	out.print("enter right username and password");
                    request.getRequestDispatcher("Login.html").include(request, response);	
    			}
               
                
                
                  } catch (ClassNotFoundException e) {
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
	}
	


