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

@WebServlet("/ApplicationStatusServlet")
public class ApplicationStatusServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/university";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "mysql";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int studentId = Integer.parseInt(request.getSession().getAttribute("studentId").toString());

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String query = "SELECT * FROM applications WHERE student_id = " + studentId;
            try (Statement statement = connection.createStatement();
                 ResultSet resultSet = statement.executeQuery(query)) {

                if (resultSet.next()) {
                    String status = resultSet.getString("status");
                    request.setAttribute("applicationStatus", status);
                } else {
                    request.setAttribute("applicationStatus", "No application found.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database error", e);
        }

        request.getRequestDispatcher("application_status.jsp").forward(request, response);
    }
}
