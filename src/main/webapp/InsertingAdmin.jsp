<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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

form {
	display: flex;
	flex-direction: column;
	align-items: center;
	background-color: #FFFFFF;
	border-radius: 10px;
	padding: 20px;
	box-shadow: 5px 5px #87CEFA;
}

input[type="text"], input[type="password"], input[type="radio"], input[type="submit"], input[type="tel"] {
	font-size: 24px;
	color: #000000;
	margin-bottom: 20px;
	padding: 10px;
	border-radius: 10px;
	border: none;
	background-color: #87CEFA;
	cursor: pointer;
	transition: background-color 0.3s;
}

input[type="text"]:hover, input[type="password"]:hover, input[type="radio"]:hover, input[type="tel"]:hover {
	background-color: #000000;
	color: #87CEFA;
}

input[type="submit"]:hover {
	background-color: #000000;
	color: #87CEFA;
}

input[type="text"], input[type="password"], input[type="radio"], input[type="submit"], input[type="tel"]:focus {
	outline: none;
}

label {
	display: block;
	font-size: 24px;
	margin-bottom: 10px;
	color: #000000;
}

.back-button {
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

.back-button:hover {
	background-color: #87CEFA;
	color: #000000;
}
</style>
</head>
<body>
<form action="AddAdmin.jsp">
	<label for="fname">First name:</label>
	<input type="text" name="fname"><br/>
	<label for="lname">Last name:</label>
	<input type="text" name="lname"><br/>
	<label for="username">Username:</label>
	<input type="text" name="username"><br/>
	<label for="pass">Password:</label>
	<input type="password" name="pass"><br/>
	<label for="email">Email:</label>
	<input type="text" name="email"><br/>
	

	

	<input type="submit" value="Submit"><br/>
	<button class="back-button" onclick="history.back()">Go Back</button>
</form>
</body>
</html>
