
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Management System</title>
<style>
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f0f0f0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }

  .container {
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(2,2,2 , 0.2s);
    width: 80%;
    max-width: 600px;
    text-align: center;
  }

  .button {
    display: inline-block;
    background-color: b;
    color: red;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin: 10px;
    transition: background-color 0.3s;
  }

  .button:hover {
    background-color: black;
  }

  h1 {
    color: black;
  }

  h1 a {
    color: black;
    text-decoration: none;
  }
</style>
</head>
<body>
<div class="container">
  <h1>Employee Management System</h1>
  <a href="empform.jsp" class="button">Add Employee</a>
  <a href="Empdelete.jsp" class="button">Remove Employee</a>
  <a href="empGetId.jsp" class="button">Search Employee</a>
  <a href="empGetAll.jsp" class="button">Get All Employees</a>
  <a href="Empupdate.jsp" class="button">Update Employee</a>
  <a href="AddTask.jsp" class="button">Add Task</a>
  <a href="TaskDelete.jsp" class="button">Remove Task</a>
  <a href="TaskGetId.jsp" class="button">Search Task</a>
  <a href="taskGetAll.jsp" class="button">Get All Tasks</a>
  <a href="Taskupdate.jsp" class="button">Update Task</a>
  <a href="AssignTask.jsp" class="button">Assign Task</a>
</div>
</body>
</html>
