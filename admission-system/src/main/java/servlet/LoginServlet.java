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
import java.sql.ResultSet;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        try {
            // Set up database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/university", "root", "mysql");

            // Verify user credentials
            String sql = "SELECT id, role FROM users WHERE email = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String role = resultSet.getString("role");
                int studentId = resultSet.getInt("id");
                session.setAttribute("role", role);
                session.setAttribute("email", email);
                session.setAttribute("studentId", studentId); // Store the studentId in session
                response.sendRedirect("profile");
            } else {
                session.setAttribute("errorMsg", "Invalid Credentials");
                response.sendRedirect("login.jsp");
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMsg", "Database Error");
            response.sendRedirect("login.jsp");
        }
    }
}
