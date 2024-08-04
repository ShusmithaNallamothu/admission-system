package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

@WebServlet("/AdminApplicationsServlet")
public class AdminApplicationsServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/university";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "mysql";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, String>> applications = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String query = "SELECT * FROM applications";
            try (Statement statement = connection.createStatement();
                 ResultSet resultSet = statement.executeQuery(query)) {

                while (resultSet.next()) {
                    Map<String, String> application = new HashMap<>();
                    application.put("id", String.valueOf(resultSet.getInt("id")));
                    application.put("studentId", String.valueOf(resultSet.getInt("student_id")));
                    application.put("details", resultSet.getString("details"));
                    application.put("status", resultSet.getString("status"));
                    application.put("filePath", resultSet.getString("file_path"));
                    applications.add(application);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database error", e);
        }

        request.setAttribute("applications", applications);
        request.getRequestDispatcher("view_applications.jsp").forward(request, response);
    }
}
