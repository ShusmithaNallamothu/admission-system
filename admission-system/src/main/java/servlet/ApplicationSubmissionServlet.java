package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/ApplicationSubmissionServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class ApplicationSubmissionServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/university";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "mysql";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve application details
        String applicationDetails = request.getParameter("application-details");

        // Debugging: Log application details
        System.out.println("Application Details: " + applicationDetails);

        // Ensure application details are not null or empty
        if (applicationDetails == null || applicationDetails.trim().isEmpty()) {
            throw new ServletException("Application details are required.");
        }

        // Handle document upload
        Part documentsPart = request.getPart("documents");
        String filePath = null;
        if (documentsPart != null && documentsPart.getSize() > 0) {
            String fileName = documentsPart.getSubmittedFileName();
            filePath = "uploads/" + fileName;
            documentsPart.write(filePath);
        }

        // Save application details and file path to the database
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String insertApplicationQuery = "INSERT INTO applications (details, status, file_path, student_id) VALUES (?, 'Pending', ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(insertApplicationQuery)) {
                statement.setString(1, applicationDetails);
                statement.setString(2, filePath); // Save file path in the database
                statement.setInt(3, getLoggedInStudentId(request)); // Assuming you have a method to get the logged-in student ID
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database error", e);
        }

        // Set success message attribute
        request.setAttribute("message", "Application submitted successfully!");
        // Forward to JSP page to display success message
        request.getRequestDispatcher("application_status.jsp").forward(request, response);
    }

    private int getLoggedInStudentId(HttpServletRequest request) {
        // Implement this method to get the logged-in student's ID from the session or other context
        // For example:
        return (int) request.getSession().getAttribute("studentId");
    }
}
