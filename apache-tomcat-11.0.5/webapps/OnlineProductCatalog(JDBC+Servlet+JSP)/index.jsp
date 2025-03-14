<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Catalog</title>
</head>
<body>
    <h2>Product Catalog</h2>
    <a href="addProduct.jsp">Add Product</a>
    <table border="1">
        <tr><th>ID</th><th>Name</th><th>Price</th></tr>
        <%
            List<String[]> products = (List<String[]>) request.getAttribute("products");
            if (products != null) {
                for (String[] product : products) {
        %>
        <tr>
            <td><%= product[0] %></td>
            <td><%= product[1] %></td>
            <td><%= product[2] %></td>
        </tr>
        <% } } %>
    </table>
</body>
</html>
