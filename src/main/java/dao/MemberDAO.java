package dao;

import dto.MemberDTO;
import util.DBManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {

    public int addMember(MemberDTO dto){
        String sql = "insert into member values(?,?,?,?,?,?,?,?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;

        try{
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getPassword());
            pstmt.setString(3, dto.getName());
            pstmt.setString(4, dto.getGender());
            pstmt.setString(5, dto.getBirthday());
            pstmt.setString(6, dto.getEmail());
            pstmt.setString(7, dto.getCarrier());
            pstmt.setString(8, dto.getPhone());
            result = pstmt.executeUpdate();

        }catch(SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }finally {
            DBManager.close(conn, pstmt);
        }
        return result;
    }

    public int duplicateMember(String id){
        String sql = "select count(id) from member where id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int result = 0;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            result = rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return result;
    }
}