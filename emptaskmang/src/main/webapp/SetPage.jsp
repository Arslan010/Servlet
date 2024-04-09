<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%= request.getAttribute("name") %> Added Successfully</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 80%;
        margin: 0 auto;
        text-align: center;
        margin-top: 50px;
    }
    h1 {
        color: #4CAF50;
    }
    p {
        font-size: 18px;
        color: #333;
    }
</style>
</head>
<body>
    <div class="container">
        <h1><%= request.getAttribute("name") %> Added Successfully</h1>
        <p>Thank you for adding the <%= request.getAttribute("name") %>!</p>
        <a href="index.jsp"><button>Go Back</button></a>
    </div>
</body>
</html>
