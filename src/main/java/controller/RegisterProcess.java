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
        int result = 0;
        MemberDAO dao = new MemberDAO();
        String check_id = request.getParameter("input");
        if (check_id != null) {
            PrintWriter out = response.getWriter();
            try {
                result = dao.IDCheck(check_id);
                String s = result == 0 ? "사용할 수 있는 ID 입니다." : "사용할 수 없는 ID 입니다." ;
                out.print(s);
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                out.close();
            }
        }else {
            String id = request.getParameter("id");
            String password = request.getParameter("password");
            String nickname = request.getParameter("nickname");
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String email = request.getParameter("email") + "@" + request.getParameter("domain");
            String carrier = request.getParameter("carrier");
            String phone = request.getParameter("phone");
            String birthday = request.getParameter("birthday");

            if(id.isBlank() || password.isBlank() || nickname.isBlank() || name.isBlank() || gender.isBlank()
                    || email.isBlank() || carrier.isBlank() || phone.isBlank() || birthday.isBlank())
                return;

            try {

                MemberDTO dto = new MemberDTO();
                dto.setId(id);
                dto.setPassword(password);
                dto.setNickname(nickname);
                dto.setName(name);
                dto.setGender(gender);
                dto.setEmail(email);
                dto.setCarrier(carrier);
                dto.setPhone(phone);
                dto.setBirthday(birthday);

                result = dao.addMember(dto);

                if (result == 1)
                    JSFunction.alertLocation(response, "회원가입이 완료되었습니다.", "login?id="+ id);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}