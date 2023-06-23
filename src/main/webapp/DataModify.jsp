<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="ModifyParty.jsp">

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %>
<%@ page import= "java.sql.PreparedStatement" %>
<%
 int id=Integer.parseInt(""+request.getParameter("id"));
 session.setAttribute("id", id);
%>


<%
Connection con = null;
ResultSet rs = null;

String name = "";
String place = "";
String artist = "";
String date1 = "";

try {

    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

    Statement s = con.createStatement();
    String sql = "SELECT * FROM party WHERE id = '"+id+"'";
    rs = s.executeQuery(sql);

	if (rs.next()) {
		 name = rs.getString("partyName");
		 place = rs.getString("place");
		 artist = rs.getString("artist");
		 date1 = rs.getString("datee");

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



 %>
party name <input type="text" name="partyName" value="<%= name %>" style="background-color: #b3d9ff;"><br>
place <input type="text" name="place" value="<%= place %>" style="background-color: #b3d9ff;"><br>
artist <input type="text" name="artist" value="<%= artist %>" style="background-color: #b3d9ff;"><br>
date <input type="date" name="datee" value="<%= date1 %>" style="background-color: #b3d9ff;"><br>


  <button type="submit">Submit</button>
</form>
</body>
</html>