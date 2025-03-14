<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Post a Job</title>
</head>
<body>
    <h2>Post a Job</h2>
    <form action="jobs" method="post">
        <label>Title:</label><input type="text" name="title" required><br>
        <label>Company:</label><input type="text" name="company" required><br>
        <label>Location:</label><input type="text" name="location" required><br>
        <label>Salary:</label><input type="text" name="salary" required><br>
        <input type="submit" value="Post Job">
    </form>
</body>
</html>
