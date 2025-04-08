package dao;

import dto.MemberDTO;
import util.DBManager;
import util.JSFunction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {

    public MemberDTO addMember(){
        String sql = "insert into member values(?,?,?,?,?,?,?,?,?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberDTO member = new MemberDTO();

        try{
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getName());
            pstmt.setString(3, member.getPhone());
            pstmt.setString(4, member.getEmail());
            pstmt.setString(5, member.getPassword());
            pstmt.setString(6,member.getGender());
            pstmt.setString(7,member.getCarrier());
            pstmt.setString(8,member.getDomain());
            pstmt.setString(9, String.valueOf(member.getBirthday()));

        }catch(Exception e){
            e.printStackTrace();
        }finally {
            DBManager.close(conn, pstmt, rs);
        }
        return member;
    }
}
