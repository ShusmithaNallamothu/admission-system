package servlet;

//ManageUsersServlet.java

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/manage_users")
public class ManageUsersServlet extends HttpServlet {
 private static final long serialVersionUID = 1L;

 private static final String DB_URL = "jdbc:mysql://localhost:3306/university";
 private static final String DB_USERNAME = "root";
 private static final String DB_PASSWORD = "mysql";

 @Override
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     List<User> users = new ArrayList<>();
     try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD)) {
         String query = "SELECT * FROM users";
         PreparedStatement pstmt = conn.prepareStatement(query);
         ResultSet rs = pstmt.executeQuery();
         while (rs.next()) {
             User user = new User();
             user.setUsername(rs.getString("username"));
             user.setEmail(rs.getString("email"));
             user.setRole(rs.getString("role"));
             users.add(user);
         }
     } catch (SQLException e) {
         e.printStackTrace();
     }
     request.setAttribute("users", users);
     request.getRequestDispatcher("manage_users.jsp").forward(request, response);
 }
}

class User {
 private String username;
 private String email;
 private String role;

 public String getUsername() {
     return username;
 }

 public void setUsername(String username) {
     this.username = username;
 }

 public String getEmail() {
     return email;
 }

 public void setEmail(String email) {
     this.email = email;
 }

 public String getRole() {
     return role;
 }

 public void setRole(String role) {
     this.role = role;
 }
}