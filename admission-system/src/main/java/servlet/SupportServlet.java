package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/SupportServlet")
public class SupportServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/university";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "mysql";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Load database driver (if necessary)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish database connection
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Prepare SQL query
            String sql = "INSERT INTO support_requests (subject, message) VALUES (?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, subject);
            preparedStatement.setString(2, message);

            // Execute SQL query
            preparedStatement.executeUpdate();

            // Redirect to a confirmation page
            response.sendRedirect("support_confirmation.jsp");

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new ServletException("Database driver not found", e);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database error", e);
        } finally {
            // Close resources
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
