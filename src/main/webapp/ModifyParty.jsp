<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<jsp:useBean id="data" class="classes.PartyClass" scope="request">
	<jsp:setProperty property="*" name="data"/>
</jsp:useBean>
<style>
    body {
        font-size: 24px;
        color: black;
        background-color: #b3d9ff; /* Baby Blue */
    }
    
    .message {
        font-size: 36px;
        color: black;
    }
    
    button {
        font-size: 24px;
        color: black;
        background-color: #b3d9ff; /* Baby Blue */
        border: none;
        padding: 10px 20px;
        cursor: pointer;
    }
    
    button:hover {
        background-color: #77c4d3;
    }
    
    a {
        font-size: 24px;
        color: black;
        text-decoration: none;
    }
</style>


<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %>
<%@ page import= "java.sql.PreparedStatement" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<% response.setContentType("text/html");
Connection con = null;
ResultSet rs = null;
PreparedStatement stmt=null;
PrintWriter pw= response.getWriter();
String partyName= request.getParameter("partyName");
String partyPlace= request.getParameter("place");
String partyArtist= request.getParameter("artist");
String partyDatee= request.getParameter("datee");

	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
	    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

	    Statement s = con.createStatement();	
	    int id=Integer.parseInt(""+session.getAttribute("id"));
	    stmt= con.prepareStatement("UPDATE party SET PartyName=?, place=?, artist=?, datee=? where id=?");
	    
	    stmt.setString(1, partyName);
	    stmt.setString(2, partyPlace);
	    stmt.setString(3, partyArtist);
	    stmt.setString(4, partyDatee);
	    stmt.setInt(5, id);
	    stmt.executeUpdate();
	    
        pw.print("data updated successfully");
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
	}%>


<p>Click <a href="AddingParties.jsp">here</a> to go back to the main menu.</p>
<button onclick="history.back()">Go Back</button>

</body>
</html>