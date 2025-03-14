<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Product</title>
</head>
<body>
    <h2>Add Product</h2>
    <form action="products" method="post">
        <label>Name:</label><input type="text" name="name" required><br>
        <label>Price:</label><input type="number" step="0.01" name="price" required><br>
        <input type="submit" value="Add Product">
    </form>
</body>
</html>
