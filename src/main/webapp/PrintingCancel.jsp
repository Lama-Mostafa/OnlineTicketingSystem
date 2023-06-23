<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
  /* Define the styles for the page */
  body {
    background-color: black;
    color: white;
    font-family: Arial, sans-serif;
    font-size: 18px;
  }

  /* Define the styles for the paragraph */
  p {
    margin: 20px 0;
  }

  /* Define the styles for the link */
  a {
    color: #66b3ff;
    text-decoration: none;
  }
  
  /* Define the styles for the image */
  img.logo {
    display: block;
    margin: 20px auto;
    width: 200px;
    height: auto;
    border-radius: 10px;
  }
</style>
</head>
<body>
<%@page import="cancel.user"%>
<p>You have successfully cancelled your ticket.</p>
<p>Click <a href="Intro1.html">here</a> to go to the main menu.</p>

<%
user bean=(user)request.getAttribute("bean");

//out.print("cancelled, " + bean.getUsername()+"ticket number"+bean.getId());
%>
<button onclick="history.back()">Go Back</button>

</body>
</html>
