# admission-system
Servlet, JSP, and MySQL, deployed on a JBoss server using CodeReady Studio.

-- Change the passwords of mysql content in servlet classes
-- this is basic student university admission system by using Technology Stack
Java Servlet and JSP: For server-side programming and dynamic web page creation.
MySQL: As the database to store user and application data.
JBoss: As the application server for deploying the web application.
CodeReady Studio: As the integrated development environment (IDE) for developing the project.

here are the commands for MySQL:

CREATE DATABASE university;
USE university;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL
);
CREATE TABLE IF NOT EXISTS applications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    details TEXT NOT NULL,
    status VARCHAR(50) NOT NULL,
    file_path VARCHAR(255),
    FOREIGN KEY (student_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE support_requests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    subject VARCHAR(255),
    message TEXT
);

select * from users



