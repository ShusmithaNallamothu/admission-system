<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="images/university-logo.png" alt="University Logo">
        </div>
        <nav>
            <ul>
                <li><a href="adminprofile.jsp">Profile</a></li>
                <li><a href="view_applications.jsp">View Applications</a></li>
                <li><a href="manage_users.jsp">Manage Users</a></li>
                <li><a href="support.jsp">Support</a></li>
                <li><a href="index.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <h1>Edit User</h1>
        <form action="EditUserServlet" method="post">
            <% 
                int userId = Integer.parseInt(request.getParameter("id"));
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost/university", "root", "mysql");
                    String sql = "SELECT * FROM users WHERE id = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, userId);
                    rs = pstmt.executeQuery();
                    if (rs.next()) {
                        String username = rs.getString("username");
                        String email = rs.getString("email");
                        String password = rs.getString("password");
                        String role = rs.getString("role");
            %>
            <input type="hidden" name="id" value="<%= userId %>">
            
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" value="<%= username %>" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= email %>" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" value="<%= password %>" required>
            
            <label for="role">Role:</label>
            <select id="role" name="role" required>
                <option value="admin" <%= role.equals("admin") ? "selected" : "" %>>Admin</option>
                <option value="student" <%= role.equals("student") ? "selected" : "" %>>Student</option>
            </select>
            
            <input type="submit" value="Update User">
            <% 
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            %>
        </form>
    </main>

    <footer>
        <div class="footer-links">
            <a href="privacy.jsp">Privacy Policy</a>
            <a href="terms.jsp">Terms of Service</a>
            <a href="faqs.jsp">FAQs</a>
        </div>
        <div class="social-media">
            <a href="#"><img src="images/facebook-icon.png" alt="Facebook"></a>
            <a href="#"><img src="images/twitter-icon.png" alt="Twitter"></a>
            <a href="#"><img src="images/instagram-icon.png" alt="Instagram"></a>
        </div>
        <div class="contact-info">
            <p>Contact us at: contact@university.edu</p>
        </div>
    </footer>
</body>
</html>
