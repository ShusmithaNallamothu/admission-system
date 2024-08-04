<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>University Admission System</title>
    <link rel="stylesheet" href="css/style.css">
     <style>
      .body {
            background-image: url('images/background.jpg');
            background-size: cover; /* Ensures the image covers the entire page */
            background-position: center; /* Centers the image */
            background-repeat: no-repeat; /* Prevents the image from repeating */
        }
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
        <section class="welcome">
            <h1>Welcome to KL University</h1>
            <p>Discover our programs and apply for admission.</p>
        </section>

        <section class="cta">
            <a href="login.jsp" class="button">Login</a>
            <a href="register.jsp" class="button">Register</a>
            <a href="apply.jsp" class="button">Apply Now</a>
        </section>

        <section class="info">
            <div class="info-box">
                <h2>About Admissions</h2>
                <p>Learn more about our admission process and deadlines.</p>
            </div>
            <div class="info-box">
                <h2>Programs Offered</h2>
                <p>Explore the various programs and courses we offer.</p>
            </div>
            <div class="info-box">
                <h2>Contact Information</h2>
                <p>Get in touch with us for more information.</p>
            </div>
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
