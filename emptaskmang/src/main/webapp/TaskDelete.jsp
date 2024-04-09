<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Delete</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f9f9f9;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	background-color: #ffffff;
	width: 300px;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
	margin-bottom: 20px;
	color: #333333;
}

label {
	display: block;
	margin-bottom: 10px;
	color: #555555;
}

input[type="text"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #cccccc;
	border-radius: 4px;
	font-size: 16px;
	box-sizing: border-box; /* Ensure padding is included in the width */
}

input[type="submit"] {
	width: 100%;
	padding: 12px;
	background-color: #4caf50;
	color: #ffffff;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Employee Delete</h1>
		<form action="taskDelete" method="post">
			<label for="taskDe">Enter Id:</label> <input type="text" name="taskDe"
				id="taskDe"
				value="<%=request.getParameter("id") != null ? request.getParameter("id") : ""%>">
			<input type="submit" value="Delete">
			<a href="index.jsp"><button>Go Back</button></a>
		</form>
	</div>
</body>
</html>
