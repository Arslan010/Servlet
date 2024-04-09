<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assign Task</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    form {
        max-width: 400px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    label {
        display: block;
        margin-bottom: 10px;
        color: #333;
    }

    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #cccccc;
        border-radius: 4px;
        font-size: 16px;
        box-sizing: border-box;
    }

    button[type="submit"] {
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

    button[type="submit"]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
    <form action="assignTask" >
        <label for="eid">Employee ID:</label>
        <input type="text" name="eid" id="eid" value="<%= request.getParameter("id")!=null ? request.getParameter("id") : ""%>">
        
        <label for="tid">Task ID:</label>
        <input type="text" name="tid" id="tid">
        
        <button type="submit">Submit</button>
        
    </form>
</body>
</html>
