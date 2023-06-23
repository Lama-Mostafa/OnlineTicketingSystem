<%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException,java.io.PrintWriter,java.sql.SQLException" %>
<%@ page language="java" %>

<jsp:useBean id="deletion" class="cancel.user" scope="request">
	<jsp:setProperty property="*" name="deletion"/>
</jsp:useBean>

<%
   String name = request.getParameter("name");

   // Connect to the database
   String url = "jdbc:mysql://localhost/mydatabase";

   try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection(url, "root", "");

      // Delete the booking from the database
      String sql = "DELETE FROM ticket WHERE name = ? AND id = ?";

      PreparedStatement stmt = con.prepareStatement(sql);
      stmt.setString(1, deletion.getName());
      stmt.setString(2, deletion.getId());
      stmt.executeUpdate();

      // Clean up resources
      stmt.close();
      con.close();
   } catch (SQLException | ClassNotFoundException e) {
      e.printStackTrace();
   }

   // Redirect back to the cancellation page
   response.sendRedirect("PrintingCancel.jsp");
%>
<button onclick="history.back()">Go Back</button>
