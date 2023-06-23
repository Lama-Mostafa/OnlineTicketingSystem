<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
<style>
    body {
        font-family: Arial, sans-serif;
    }
    
    .printed-text {
        font-weight: bold;
        color: black;
    }
    
    button {
        padding: 10px 20px;
        background-color: #000000;
        color: white;
        border: none;
        border-radius: 5px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease; /* Add transition for smooth hover effect */
    }
    
    button:hover {
        background-color: #333333; /* Change to darker shade of black on hover */
    }
    
    a.button {
        display: inline-block;
        padding: 10px 20px;
        background-color: #66b3ff;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
        transition: background-color 0.3s ease; /* Add transition for smooth hover effect */
    }
    
    a.button:hover {
        background-color: #4da6ff; /* Change to baby blue color on hover */
    }
</style>
</head>
<body>

<%

    Connection con = null;
    ResultSet rs = null;
    PreparedStatement stmt = null;
    PrintWriter pw = response.getWriter();
    
    String firstn= request.getParameter("fname");
    String lastn= request.getParameter("lname");
    String username= request.getParameter("username");
    String email= request.getParameter("email");
    String password= request.getParameter("pass");


    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

        Statement s = con.createStatement();

        stmt = con.prepareStatement("INSERT INTO admin (first_name, last_name, username, email, password) VALUES (?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
        
        stmt.setString(1, firstn);
        stmt.setString(2, lastn);
        stmt.setString(3, username);
        stmt.setString(4, email);
        stmt.setString(5, password);
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
<div class="printed-text">Click <a href="Login.html" class="button">here</a> to login</div>
<button onclick="history.back()">Go Back</button>
</body>
</html>
