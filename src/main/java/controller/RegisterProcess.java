package controller;

import dao.MemberDAO;
import dto.MemberDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import util.JSFunction;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/register")
public class RegisterProcess extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int result = 0;
            String id = request.getParameter("input");
            MemberDAO dao = new MemberDAO();
            PrintWriter out = response.getWriter();

            result = dao.IDCheck(id);
            if (result == 0) {
                out.print("사용할 수 있는 ID 입니다.");
            } else {
                out.print("사용할 수 없는 ID 입니다.");
                return;
            }

            MemberDTO dto = new MemberDTO();
            dto.setId(request.getParameter("id"));
            dto.setPassword(request.getParameter("password"));
            dto.setNickname(request.getParameter("nickname"));
            dto.setName(request.getParameter("name"));
            dto.setGender(request.getParameter("gender"));
            dto.setEmail(request.getParameter("email") + "@" + request.getParameter("domain"));
            dto.setCarrier(request.getParameter("carrier"));
            dto.setPhone(request.getParameter("phone"));
            dto.setBirthday(request.getParameter("birthday"));

            result = dao.addMember(dto);

            if (result == 1) {
                JSFunction.alertLocation(response, "회원가입이 완료되었습니다.", "login");
            } else {
                JSFunction.alertBack(response, "회원가입이 실패했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}