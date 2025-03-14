<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Job Portal</title>
</head>
<body>
    <h2>Job Listings</h2>
    <a href="addJob.jsp">Post a Job</a>
    <table border="1">
        <tr><th>ID</th><th>Title</th><th>Company</th><th>Location</th><th>Salary</th></tr>
        <%
            List<String[]> jobs = (List<String[]>) request.getAttribute("jobs");
            if (jobs != null) {
                for (String[] job : jobs) {
        %>
        <tr>
            <td><%= job[0] %></td>
            <td><%= job[1] %></td>
            <td><%= job[2] %></td>
            <td><%= job[3] %></td>
            <td><%= job[4] %></td>
        </tr>
        <% } } %>
    </table>
</body>
</html>
