package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");

        if ("student".equals(role)) {
            response.sendRedirect("studentprofile.jsp");
        } else if ("admin".equals(role)) {
            response.sendRedirect("adminprofile.jsp");
        } else {
            session.setAttribute("errorMsg", "Invalid Role");
            response.sendRedirect("login.jsp");
        }
    }
}
