import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jobs")
public class JobServlet extends HttpServlet {
    public String JDBC_URL = "jdbc:mysql://localhost:3306/jobportal";
    public String JDBC_USER = "root";
    public String JDBC_PASSWORD = "********";

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String[]> jobs = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM jobs");

            while (rs.next()) {
                jobs.add(new String[]{rs.getString("id"), rs.getString("title"), rs.getString("company"), rs.getString("location"), rs.getString("salary")});
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("jobs", jobs);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String company = request.getParameter("company");
        String location = request.getParameter("location");
        String salary = request.getParameter("salary");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO jobs (title, company, location, salary) VALUES (?, ?, ?, ?)");
            stmt.setString(1, title);
            stmt.setString(2, company);
            stmt.setString(3, location);
            stmt.setString(4, salary);
            stmt.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("jobs");
    }
}
