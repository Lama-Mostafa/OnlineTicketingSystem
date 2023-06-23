<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check The Available Tickets</title>
<style>
  body {
    font-family: Arial, sans-serif;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
  }

  th, td {
    padding: 10px;
    text-align: left;
    border: 1px solid black;
  }

  th {
    background-color: #000;
    color: #fff;
  }

  button {
    padding: 10px 20px;
    background-color: #66b3ff;
    color: white;
    border: none;
    border-radius: 5px;
    font-weight: bold;
    cursor: pointer;
  }

  button:hover {
    background-color: #0059b3;
  }

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
<table>
    <tr>
        <th>Available Party</th>
        <th>Place</th>
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
            %>
            <tr>
                <td><%= name %></td>
                <td><%= place %></td>
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

<button id="myButton">Click here</button>

<script>
    document.getElementById("myButton").onclick = function() {
        window.location.href = "TicketBook.jsp";
    };
</script>
<button onclick="history.back()">Go Back</button>

</body>
</html>
