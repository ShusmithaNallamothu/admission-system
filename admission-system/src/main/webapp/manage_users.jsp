<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
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
        <h1>Manage Users</h1>
        <a href="add_user.jsp" class="button">Add New User</a>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Data will be populated here -->
                <% 
                    // Fetch users from database and display
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost/university", "root", "mysql");
                        stmt = conn.createStatement();
                        String sql = "SELECT * FROM users";
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String username = rs.getString("username");
                            String email = rs.getString("email");
                            String role = rs.getString("role");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= username %></td>
                    <td><%= email %></td>
                    <td><%= role %></td>
                    <td>
                        <a href="edit_user.jsp?id=<%= id %>">Edit</a>
                        <a href="DeleteUserServlet?id=<%= id %>" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
                <% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </main>

    <footer>
        <!-- Footer content -->
    </footer>
</body>
</html>
