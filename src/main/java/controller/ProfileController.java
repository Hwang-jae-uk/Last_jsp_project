package controller;

import dao.MemberDAO;
import dto.MemberDTO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import util.JSFunction;

import java.io.IOException;
@WebServlet("/profile")
public class ProfileController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String userId = (String) session.getAttribute("userId");
        MemberDAO dao = new MemberDAO();
        MemberDTO dto = dao.getMemberByID(userId);

        request.setAttribute("member", dto);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String userId = (String) session.getAttribute("userId");

        MemberDAO dao = new MemberDAO();
        MemberDTO dto = dao.getMemberByID(userId);

        if(!dto.getPassword().equals(request.getParameter("password"))){

            dto.setNickname(request.getParameter("nickname"));
            dto.setName(request.getParameter("name"));
            dto.setEmail(request.getParameter("email") + "@" + request.getParameter("domain"));
            dto.setCarrier(request.getParameter("carrier"));
            dto.setPhone(request.getParameter("phone"));

            request.setAttribute("error","비밀번호가 일치하지 않습니다.");
            request.setAttribute("member", dto);
            request.getRequestDispatcher("profile.jsp").forward(request, response);

        }else {

            dto.setId(userId);
            if(!request.getParameter("editPassword").isEmpty()) {
                dto.setPassword(request.getParameter("editPassword"));
            }else{
                dto.setPassword(request.getParameter("password"));
            }
            dto.setNickname(request.getParameter("nickname"));
            dto.setName(request.getParameter("name"));
            dto.setEmail(request.getParameter("email") + "@" + request.getParameter("domain"));
            dto.setCarrier(request.getParameter("carrier"));
            dto.setPhone(request.getParameter("phone"));

            int result = dao.updateMember(dto);

            if(result == 1) {
                JSFunction.alertLocation(response,"수정완료되었습니다.","/home");
            } else {
                JSFunction.alertBack(response,"수정실패하였습니다.");
            }
        }
    }
}
