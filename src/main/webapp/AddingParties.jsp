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

  input[type="radio"] {
    margin: 10px;
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
</style>
</head>
<body>
<h1>Party Management</h1>

<form action="PartyDataEntry.jsp">
  <input type="radio" name="rd1" value="AddParty" id="addParty">
  <label for="addParty" style="color: #ff6699;">Add Party</label><br>

  <input type="radio" name="rd1" value="ModifyParty" id="modifyParty">
  <label for="modifyParty" style="color: #ffcc00;">Modify Party</label><br>

  <input type="radio" name="rd1" value="Review" id="review">
  <label for="review" style="color: #33cc33;">Review</label><br>
  
  <input type="radio" name="rd1" value="AddAdmin" id="AddAdmin">
  <label for="AddAdmin" style="color: #33bb37;">AddAdmin</label><br>

  <button type="submit">Submit</button>
  

<p>Click <a href="Intro1.html">here</a> to go back to the main menu.</p>

</form>

<button onclick="history.back()" style="background-color: #999; margin-top: 10px; color: #fff; padding: 10px 20px; border: none; cursor: pointer;">Go Back</button>
<p>Click <a href="logout">here</a> to logout.</p>

</body>
</html>
