<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<jsp:useBean id="party" class="classes.PartyClass" scope="request">
    <jsp:setProperty property="*" name="party"/>
</jsp:useBean>

<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    
    <style>
        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 24px;
            background-color: babyblue;
            color: black;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
            font-family: Arial, sans-serif;
        }

        .button:hover {
            background-color: #83b9df;
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
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.time.LocalDate" %>

<%
Connection con = null;
ResultSet rs = null;
PreparedStatement stmt=null;
PrintWriter pw= response.getWriter();

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

    Statement s = con.createStatement();

    stmt = con.prepareStatement("INSERT INTO party (PartyName, place, artist, datee) VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
    stmt.setString(1, party.getPartyName());
    stmt.setString(2, party.getPlace());
    stmt.setString(3, party.getArtist());
    String start = request.getParameter("datee");
    LocalDate startdate1 = LocalDate.parse(start);
    stmt.setString(4, start);

    stmt.executeUpdate();

    pw.print("Data inserted");
} catch (ClassNotFoundException e) {
    System.out.println("Class not found");
} catch (SQLException e) {
    e.printStackTrace();
    System.out.println("Error in SQL code");
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

<button class="button" onclick="history.back()">
    Go Back
</button>

<p>
    Click <a href="AddingParties.jsp" class="button">
        here
    </a> to go to the main menu.
</p>

</body>
</html>
