package controller;
import dto.MemberDTO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/registerProcess")
public class RegisterProcess extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        MemberDTO dto = new MemberDTO();
        dto.setId(request.getParameter("id"));
        dto.setPassword(request.getParameter("password"));
        dto.setName(request.getParameter("name"));
        dto.setGender(request.getParameter("gender"));
        dto.setBirthday(request.getParameter("birthday"));
        String email = request.getParameter("email") + request.getParameter("domain");
        dto.setEmail(email);
        dto.setCarrier(request.getParameter("carrier"));
        dto.setPhone(request.getParameter("phone"));

    }
}