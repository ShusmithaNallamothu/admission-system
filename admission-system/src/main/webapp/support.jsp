<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Support</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="images/university-logo.png" alt="University Logo">
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="studentprofile.jsp">Profile</a></li>
                <li><a href="apply.jsp">Apply</a></li>
                <li><a href="application_status.jsp">Application Status</a></li>
                <li><a href="support.jsp">Support</a></li>
                <li><a href="index.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <h1>Support and Communication</h1>
        <form action="SupportServlet" method="post">
            <label for="subject">Subject:</label>
            <input type="text" id="subject" name="subject" required>
            
            <label for="message">Message:</label>
            <textarea id="message" name="message" rows="5" required></textarea>
            
            <input type="submit" value="Submit">
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
