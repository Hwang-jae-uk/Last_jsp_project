package controller;

import dao.MemberDAO;
import dto.MemberDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import util.JSFunction;

import java.io.IOException;

@WebServlet("/registerProcess")
public class RegisterProcess extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        MemberDTO dto = new MemberDTO();
        dto.setId(request.getParameter("id"));
        dto.setPassword(request.getParameter("password"));
        dto.setName(request.getParameter("name"));
        dto.setGender(request.getParameter("gender"));
        dto.setBirthday(request.getParameter("birthday"));
        String email = request.getParameter("email") + "@" + request.getParameter("domain");
        dto.setEmail(email);
        dto.setCarrier(request.getParameter("carrier"));
        dto.setPhone(request.getParameter("phone"));

        MemberDAO dao = new MemberDAO();
        int result = dao.addMember(dto);

        if (result == 1) {
            JSFunction.alertLocation(response, "회원가입에 성공했습니다.", "login.jsp");
        } else {
            JSFunction.alertBack(response, "회원가입에 실패했습니다.");
        }
    }
}
