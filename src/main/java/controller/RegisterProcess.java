package controller;

import dao.MemberDAO;
import dto.MemberDTO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import util.JSFunction;

import java.io.IOException;

@WebServlet("/registerProcess")
public class RegisterProcess extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
        MemberDTO dto = new MemberDTO();

        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String birthday = request.getParameter("birthday");
        String email = request.getParameter("email") + "@" + request.getParameter("domain");
        String carrier = request.getParameter("carrier");
        String phone = request.getParameter("phone");

        // 비어있는 필드가 있는지 확인
        if (id == null || id.isEmpty() || password == null || password.isEmpty() ||
                name == null || name.isEmpty() || gender == null || gender.isEmpty() ||
                birthday == null || birthday.isEmpty() || email == null || email.isEmpty() ||
                carrier == null || carrier.isEmpty() || phone == null || phone.isEmpty()) {
            JSFunction.alertBack(response, "모든 필드를 올바르게 입력해주세요.");return;
        }

            // DTO에 값 설정
            dto.setId(id);
            dto.setPassword(password);
            dto.setName(name);
            dto.setGender(gender);
            dto.setBirthday(birthday);
            dto.setEmail(email);
            dto.setCarrier(carrier);
            dto.setPhone(phone);

            // DAO를 사용해 회원가입 처리
            MemberDAO dao = new MemberDAO();
            int result = dao.addMember(dto);

            // 결과에 따라 처리
            if (result == 1) {
                JSFunction.alertLocation(response, "회원가입에 성공했습니다.", "login.jsp");
            } else {
                JSFunction.alertBack(response, "회원가입에 실패했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            JSFunction.alertBack(response, "서버 오류가 발생했습니다. 다시 시도해주세요.");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");

        if (id == null || id.isEmpty() ){
            response.sendRedirect("register.jsp?error=아이디를 입력해주세요.");
            return;
        }

        MemberDAO dao = new MemberDAO();
        int result = dao.duplicateMember(id);

        request.setAttribute("id", id);
        request.setAttribute("result", result);

        response.sendRedirect("register.jsp");
    }
}