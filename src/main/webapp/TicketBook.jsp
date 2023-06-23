<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
        font-weight: bold;  /* Add font-weight for label */
    }
    
    select,
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
    
    table {
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    
    th,
    td {
        padding: 5px;
        text-align: left;
        border: 1px solid black;
    }
    
    th {
        background-color: #66b3ff;
        color: white;
    }
    
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    
    input[type="submit"],
    input[type="reset"] {
        padding: 10px 20px;
        background-color: #66b3ff;
        color: white;
        border: none;
        border-radius: 5px;
        font-weight: bold;
        cursor: pointer;
    }
    
    input[type="submit"]:hover,
    input[type="reset"]:hover {
        background-color: #0059b3;
    }
    
    /* Styling for displaying previous tickets */
    .previous-tickets {
        margin-bottom: 10px;
    }
</style>
</head>
<body>

<% String total=null; Cookie[] cookies = request.getCookies();
      if(cookies != null){
    for(Cookie c : cookies){
        if(c.getName().equals("ticket")) total = c.getValue(); 
    } 
} %>
<% if (total == null)
	{
	   %>
	   no previous tickets were bought
	   <%     
	}
else 
{
	%>
<div class="previous-tickets">
    Your previous tickets were <%= total %> <br/>
</div>
<% 
}
%>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.SQLException" %>
    <%@ page import="java.sql.Statement" %>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="java.io.IOException" %>
    <%@ page import="java.sql.PreparedStatement" %>
    
 <%  
   Connection con = null;
    ResultSet rs = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
    
        Statement s = con.createStatement();
        String sql = "SELECT * FROM party";
        rs = s.executeQuery(sql);
    
    %>
<form action="book.jsp">
    <label for="name">Name</label>
    <input type="text" id="name" name="name"><br>
    
    <label for="email">Email</label>
    <input type="email" id="email" name="email"><br>
    
    <label for="phone">Phone</label>
    <input type="tel" id="phone" name="phone"><br>
    
    <label for="age">Age</label>
    <input type="text" id="age" name="age"><br>
    
    <label for="party" style="font-weight: bold;">Party</label>  <!-- Add font-weight for label -->
    <select id="party" name="party">
        <% while (rs.next()) { %>
            <option value="<%= rs.getString("partyName") %>"><%= rs.getString("partyName") %></option>
        <% } %>
    </select><br>
    <% 
    } catch (ClassNotFoundException e) {
        System.out.println("class not found");
    } catch (SQLException e) {
        e.printStackTrace();
        System.out.println("al code atmn3");
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
    <b>Ticket types:</b>
    <table>
        <tr>
            <th>Party Type</th>
            <th>Price</th>
            <th>Number of Tickets</th>
        </tr>
        <tr>
            <td><input type="checkbox" name="regular">Regular</td>
            <td>400LE</td>
            <td><input type="text" name="regular_no"></td>
        </tr>
        <tr>
            <td><input type="checkbox" name="fanbit">Fanpit</td>
            <td>600LE</td>
            <td><input type="text" name="fanbit_no"></td>
        </tr>
        <tr>
            <td><input type="checkbox" name="vip">VIP</td>
            <td>1000LE</td>
            <td><input type="text" name="vip_no"></td>
        </tr>
    </table>
    
    <input type="submit" value="Submit"><br>
    <input type="reset" value="Reset"><br>
</form>
</body>
</html>
