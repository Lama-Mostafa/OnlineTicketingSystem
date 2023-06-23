<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<%@ page import="classes.EmailUtility" %>
<jsp:useBean id="b1" class="classes.BookingData" scope="request">
<jsp:setProperty property="*" name="b1"/>
</jsp:useBean>
<jsp:useBean id="b2" class="ticket.booking" scope="request">
<jsp:setProperty property="*" name="b2"/>
</jsp:useBean>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmation Page</title>
<style>
  body {
    font-family: Arial, sans-serif;
    text-align: center;
  }

  h1 {
    color: #333;
    margin-top: 50px;
  }

  a {
    color: #0066cc;
    text-decoration: none;
  }

  a:hover {
    text-decoration: underline;
  }
  
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
</style>
</head>
<body>
<h1>Confirmation Email Sent</h1>

<%
String conf = String.valueOf(session.getAttribute("mail"));
EmailUtility email = new EmailUtility();
email.sendConfirmationEmail(conf);
%>

    
    <form action="logout" method="GET">
        <input type="submit" value="logout">
    </form>

<p>Click <a href="Intro1.html">here</a> to go back to the main menu.</p>
</body>
</html>
