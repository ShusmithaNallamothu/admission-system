package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String confirmPassword = request.getParameter("confirm-password");
        String role = request.getParameter("role");

        HttpSession session = request.getSession();

        // Simple validation
        if (password.equals(confirmPassword)) {
            try {
                // Set up database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/university", "root", "mysql");

                // Insert user into the database
                String sql = "INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, username);
                statement.setString(2, email);
                statement.setString(3, password);
                statement.setString(4, role);

                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    session.setAttribute("sucMsg", "Registration Successful");
                    // Redirect based on role
                    if ("student".equals(role)) {
                        response.sendRedirect("studentprofile.jsp"); // Redirect to student profile page
                    } else if ("admin".equals(role)) {
                        response.sendRedirect("adminprofile.jsp"); // Redirect to admin profile page
                    }
                } else {
                    session.setAttribute("errorMsg", "Registration Failed");
                    response.sendRedirect("register.jsp");
                }

                statement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("errorMsg", "Database Error");
                response.sendRedirect("register.jsp");
            }
        } else {
            session.setAttribute("errorMsg", "Passwords do not match");
            response.sendRedirect("register.jsp");
        }
    }
}
