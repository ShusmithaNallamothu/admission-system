<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Review Applications</title>
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
        </nav>    </header>

    <main>
        <section class="admin-applications">
            <h1>Review Applications</h1>
            <table>
                <thead>
                    <tr>
                        <th>Application ID</th>
                        <th>Student ID</th>
                        <th>Details</th>
                        <th>Document</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Application rows will be populated here -->
                    <c:forEach var="application" items="${applications}">
                        <tr>
                            <td>${application.id}</td>
                            <td>${application.studentId}</td>
                            <td>${application.details}</td>
                            <td><a href="${application.filePath}" target="_blank">View Document</a></td>
                            <td>${application.status}</td>
                            <td>
                                <form action="UpdateApplicationStatusServlet" method="post">
                                    <input type="hidden" name="applicationId" value="${application.id}">
                                    <button type="submit" name="status" value="Accepted">Accept</button>
                                    <button type="submit" name="status" value="Declined">Decline</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
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
