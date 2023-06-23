<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<jsp:useBean id="data" class="classes.TakingData" scope="request">
	<jsp:setProperty property="*" name="data"/>
</jsp:useBean>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
	background-color: #87CEFA;
	font-family: Arial, sans-serif;
	font-size: 24px;
	text-align: center;
	color: #000000;
}

button {
	font-size: 24px;
	margin-top: 20px;
	padding: 10px 20px;
	border-radius: 10px;
	border: none;
	background-color: #000000;
	color: #87CEFA;
	cursor: pointer;
	transition: background-color 0.3s;
}

button:hover {
	background-color: #87CEFA;
	color: #000000;
}
</style>
</head>
<body>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %>
<%@ page import= "java.sql.PreparedStatement" %>

<%
    String radio = request.getParameter("rd");

    Connection con = null;
    ResultSet rs = null;
    PreparedStatement stmt = null;
    PrintWriter pw = response.getWriter();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

        Statement s = con.createStatement();

        if (radio.equals("user")) {
            stmt = con.prepareStatement("INSERT INTO user1 (first_name, last_name, username, email, password) VALUES (?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
        } else {
            stmt = con.prepareStatement("INSERT INTO admin (first_name, last_name, username, email, password) VALUES (?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
        }

        stmt.setString(1, data.getFname());
        stmt.setString(2, data.getLname());
        stmt.setString(3, data.getUsername());
        stmt.setString(4, data.getEmail());
        stmt.setString(5, data.getPass());
        stmt.executeUpdate();

        pw.print("Data inserted successfully!");
    } catch (ClassNotFoundException e) {
        System.out.println("Class not found");
    } catch (SQLException e) {
        e.printStackTrace();
        System.out.println("Error occurred while executing SQL query.");
    } finally {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
<br/>
<br/>
click <a href="Login.html">here</a> to login

<button onclick="history.back()">Go Back</button>

</body>
</html>
