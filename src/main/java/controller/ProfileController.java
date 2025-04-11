package controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
@WebServlet("/profile")
public class ProfileController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nickname = request.getParameter("nickname");
        String email = request.getParameter("email");
        String domain = request.getParameter("domain");
        String password = request.getParameter("password");
        String editPassword = request.getParameter("editPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        String name = request.getParameter("name");
        String carrier = request.getParameter("carrier");
        String phone = request.getParameter("phone");



    }
}
