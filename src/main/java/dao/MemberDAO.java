package dao;

import dto.MemberDTO;
import util.DBManager;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class MemberDAO {

    public MemberDTO addMember(){
        String sql = "insert into member values(?,?,?,?,?,?,?,?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        MemberDTO member = new MemberDTO();

        try{
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPassword());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getGender());
            pstmt.setString(5, String.valueOf(member.getBirthday()));
            pstmt.setString(6, member.getEmail());
            pstmt.setString(7, member.getCarrier());
            pstmt.setString(8, member.getPhone());

        }catch(Exception e){
            e.printStackTrace();
        }finally {
            DBManager.close(conn, pstmt);
        }
        return member;
    }
}
