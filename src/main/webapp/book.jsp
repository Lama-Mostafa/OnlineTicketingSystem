<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="b2" class="ticket.booking" scope="request">
<jsp:setProperty property="*" name="b2"/>
</jsp:useBean>

<jsp:useBean id="b1" class="classes.BookingData" scope="request">
<jsp:setProperty property="*" name="b1"/>
</jsp:useBean>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  body {
    font-family: Arial, sans-serif;
  }

  form {
    margin-top: 20px;
  }

  label {
    display: block;
    margin-bottom: 5px;
  }

  input[type="text"],
  input[type="email"],
  input[type="tel"] {
    padding: 10px;
    width: 200px;
    margin-bottom: 10px;
    background-color: #f2f2f2;
    border: 1px solid #ccc;
    border-radius: 5px;
  }

  input[type="submit"] {
    padding: 10px 20px;
    background-color: #66b3ff;
    color: white;
    border: none;
    border-radius: 5px;
    font-weight: bold;
    cursor: pointer;
  }

  input[type="submit"]:hover {
    background-color: #0059b3;
  }

  /* Styling for displaying previous tickets */
  .previous-tickets {
    margin-bottom: 10px;
  }
</style>
</head>
<body>
<% 
int price=0;
String vip=request.getParameter("vip");
String fanbit=request.getParameter("fanbit");
String regular=request.getParameter("regular");
out.print(vip);
out.print(fanbit);
out.print(regular);
int sum=0;

if(vip !=null) {
    String no_of_tickets = request.getParameter("vip_no");
    int n = Integer.parseInt(no_of_tickets);
    price += n*1000;
    for(int i=1;i <= n ;i++)
    {
    sum++;
    }
    b1.setTicketType("vip");
}
if(fanbit != null) {
    String no_of_tickets = request.getParameter("fanbit_no");
    int n = Integer.parseInt(no_of_tickets);
    price += n*600;
    for(int i=1;i <= n ;i++)
    {
    sum++;
    }
    b1.setTicketType("fanPit");
}
if(regular != null) {
    String no_of_tickets = request.getParameter("regular_no");
    int n = Integer.parseInt(no_of_tickets);
    price += n*400;
    for(int i=1;i <= n ;i++)
    {
    sum++;
    }
    b1.setTicketType("regular");
}

request.setAttribute("price", price);
request.setAttribute("sum", sum );
%>

<%-- Code to fetch previous ticket information --%>
<%
String data=b1.getParty();
String temp=null;
Cookie[] cookies = request.getCookies();
if(cookies != null){
    for(Cookie c : cookies){
        if(c.getName().equals("ticket"))
            data=c.getValue();
        if(c.getName().equals("tickets"))
            temp = c.getValue();
    }
}
data=temp;
Cookie c = new Cookie("ticket",data+"");
c.setMaxAge(606024);
response.addCookie(c);
%>

<%-- Code for maximum booking limit --%>
<% 
if(sum > 5) {
%>
  <h1>Error Message: you exceeded the maximum number of bookings</h1>
<%
} else {
%>
    Total price: <%= price %><br/>
<%
  b1.insert();
}
%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %>
<%@ page import= "java.sql.PreparedStatement" %>
<%@ page import="java.sql.*" %>
<%
Connection conn = null;
PreparedStatement stmt = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

    String query = "SELECT * FROM party";
    stmt = conn.prepareStatement(query);
    ResultSet rs = stmt.executeQuery(query);
    int totalTickets = 0;
    int soldTickets = 0;
    int id = 0;
    while (rs.next()) {
        id = rs.getInt("id");
        totalTickets = rs.getInt("totalTicket");
        soldTickets = rs.getInt("soldTickets");
    }

    rs.close();
    
    int ticketsToDeduct = sum;
    
    if (soldTickets >= ticketsToDeduct) {
        stmt = conn.prepareStatement("UPDATE party SET soldTickets = ? WHERE id = ?");
        stmt.setInt(1, soldTickets - ticketsToDeduct);
        stmt.setInt(2, id);
        stmt.executeUpdate();
        out.print("Tickets successfully deducted!");
    } else {
        out.print("There are not enough tickets available.");
    }
} catch (Exception e) {
    out.print("Error: " + e.getMessage());
} finally {
    if (stmt != null) {
        stmt.close();
    }
    if (conn != null) {
        conn.close();
    }
}
%>

<%
String email = b2.getEmail();
session.setAttribute("mail", email);
%>

<% String name = request.getParameter("name");
String party = request.getParameter("party");
%>
  <title>Ticket booking invoice</title>
    <style>
    
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
    <h1>Ticket booking invoice</h1>
    <table>
        <tr>
            <th>Item</th>
            <th>Description</th>
           
        </tr>
        <tr>
            <td>name</td>
            <td><%= name %></td>
           
        </tr>
        <tr>
            <td>party</td>
            <td><%= party %></td>
          
        </tr>
        
    
         <tr>
            <td>Total price</td>
         
            <td><%=request.getAttribute("price") %></td>
        </tr> 
       
       
            
      
    </table>
    <h2>Payment alert!</h2>
   
    <p>In case of cancellation you receive the amount by the same method you payed with </p>


<form action="confirm.jsp">
  <input type="submit" value="Confirm">
</form>
</body>
</html>
