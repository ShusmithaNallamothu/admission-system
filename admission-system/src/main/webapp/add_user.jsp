<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User</title>
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
                <li><a href="adminmanageusers.jsp">Manage Users</a></li>
                 <li><a href="support.jsp">Support</a></li>
                <li><a href="LogoutServlet">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <h1>Add New User</h1>
        <form action="AddUserServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <label for="role">Role:</label>
            <select id="role" name="role" required>
                <option value="student">Student</option>
                <option value="admin">Admin</option>
            </select>
            
            <input type="submit" value="Add User">
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
