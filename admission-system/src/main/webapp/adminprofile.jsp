<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Profile</title>
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
        <section class="profile">
            <h1>Admin Profile</h1>
            <form action="profile" method="post">
                <input type="hidden" name="role" value="admin">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="<%= request.getAttribute("username") %>" required readonly>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%= request.getAttribute("email") %>" required>

                <label for="password">New Password:</label>
                <input type="password" id="password" name="password">

                <label for="confirm-password">Confirm New Password:</label>
                <input type="password" id="confirm-password" name="confirm-password">

                <button type="submit">Update Profile</button>
            </form>
        </section>
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
