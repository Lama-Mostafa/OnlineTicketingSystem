<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Party Management</title>
<style>
  body {
    font-family: Arial, sans-serif;
    text-align: center;
  }

  h1 {
    color: #333;
    margin-top: 50px;
  }

  form {
    margin-top: 30px;
  }

  input[type="text"], input[type="date"] {
    margin: 10px;
    padding: 5px;
    width: 200px;
    background-color: #f2f2f2;
    border: none;
    border-radius: 4px;
    box-sizing: border-box;
    font-size: 16px;
    color: #333;
  }

  button {
    margin-top: 20px;
    padding: 10px 20px;
    font-size: 16px;
    background-color: #0066cc;
    color: #fff;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  button:hover {
    background-color: #004c99;
  }

  table {
    margin: 30px auto;
    border-collapse: collapse;
    font-size: 18px;
  }

  th, td {
    padding: 8px;
    text-align: center;
    border-bottom: 1px solid #000;
  }

  th {
    background-color: #b3d9ff;
    color: #000;
  }
</style>
</head>
<body>
<h1>Party Management</h1>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %>
<%@ page import= "java.sql.PreparedStatement" %>
<%@ page import=" java.time.LocalDate" %>

<% 
String radio = request.getParameter("rd1");

if (radio.equals("AddParty")) {
%>
<form action="DataEditsA.jsp">
  party name <input type="text" name="partyName" style="background-color: #b3d9ff;"><br>
  place <input type="text" name="place" style="background-color: #b3d9ff;"><br>
  artist <input type="text" name="artist" style="background-color: #b3d9ff;"><br>
  date <input type="date" name="datee" style="background-color: #b3d9ff;"><br>

  <button type="submit">Submit</button>
</form>
<%
} else if (radio.equals("ModifyParty")) {
%>

<table>
  <tr>
    <th>Available Party</th>
    <th>Place</th>   
     <th>id</th>
    
  </tr>
  <%
  Connection con = null;
  Statement st = null;
  ResultSet rs = null;

  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
    st = con.createStatement();
    String sql = "SELECT * FROM party";
    rs = st.executeQuery(sql);

    while (rs.next()) {
      String name = rs.getString("PartyName");
      String place = rs.getString("place");
      String id = rs.getString("id");
  %>
  <tr>
    <td><%= name %></td>
    <td><%= place %></td>
    <td> <%= id %>
  </tr>
  <% 
    }
  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    try {
      if (rs != null) {
        rs.close();
      }
      if (st != null) {
        st.close();
      }
      if (con != null) {
        con.close();
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
  %>
</table>
<form action="DataModify.jsp">
  
 id <input type ="text" name="id" style="background-color: #b3d9ff;"><br>
 <button type="submit">Modify</button>
</form>
<%

} else if (radio.equals("Review")){
    request.getRequestDispatcher("review.jsp").forward(request, response);
}

else 
{
    request.getRequestDispatcher("InsertingAdmin.jsp").forward(request, response);
}
%>
<button onclick="history.back()" style="background-color: #000; margin-top: 10px; color: #fff; padding: 10px 20px; border: none; cursor: pointer;">Go Back</button>

</body>
</html>
