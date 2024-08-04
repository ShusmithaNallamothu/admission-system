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

@WebServlet("/UpdateApplicationStatusServlet")
public class UpdateApplicationStatusServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/university";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "mysql";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int applicationId = Integer.parseInt(request.getParameter("applicationId"));
        String status = request.getParameter("status");

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String updateQuery = "UPDATE applications SET status = ? WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(updateQuery)) {
                statement.setString(1, status);
                statement.setInt(2, applicationId);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database error", e);
        }

        response.sendRedirect("AdminApplicationsServlet");
    }
}
