<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apply</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <!-- Include your header content here -->
    </header>

    <main>
        <section class="application-form">
            <h1>Application Form</h1>
            <form action="ApplicationSubmissionServlet" method="post" enctype="multipart/form-data">
                <label for="application-details">Application Details:</label>
                <textarea id="application-details" name="application-details" required></textarea>

                <label for="documents">Upload Documents:</label>
                <input type="file" id="documents" name="documents" multiple>

                <button type="submit">Submit Application</button>
            </form>
        </section>
    </main>

    <footer>
        <!-- Include your footer content here -->
    </footer>
</body>
</html>
