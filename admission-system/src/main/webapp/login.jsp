<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/style.css">
<style>
        .header-container {
            display: flex;
            align-items: center; /* Align items vertically in the center */
            padding: 10px; /* Add some padding for better spacing */
        }

        .logo {
            margin-right: 10px; /* Space between the logo and the text */
        }

        .title h1 {
            font-size: 24px; /* Adjust font size as needed */
            margin: 0; /* Remove default margin */
        }
    </style>
</head>
<body>
    
         <header class="header-container">
        <div class="logo">
            <img src="images/klef_logo_half.jpeg" alt="University Logo" width="50">
        </div>
        <div class="title">
            <h1>University Admission System</h1>
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="admissions.jsp">Admission Information</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="help.jsp">Help</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section class="login">
            <h1>Login</h1>
            <form action="login" method="post">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <button type="submit">Login</button>
            </form>
            <%
                String errorMsg = (String) session.getAttribute("errorMsg");
                if (errorMsg != null) {
                    out.println("<p style='color:red;'>" + errorMsg + "</p>");
                    session.removeAttribute("errorMsg");
                }
            %>
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
