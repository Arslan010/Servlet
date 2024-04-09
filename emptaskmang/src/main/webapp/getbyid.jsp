<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Details</title>
</head>
<body>
    <h2>Employee Details</h2>
    <p>ID: <%= request.getAttribute("id") %></p>
    <p>Name: <%= request.getParameter("ename") %></p>
    <p>Age: <%= request.getParameter("eage") %></p>
    <p>Salary: <%= request.getParameter("esalary") %></p>
</body>
</html>