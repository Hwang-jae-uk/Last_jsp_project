package dao;

import dto.MemberDTO;
import util.DBManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {


    //회원가입
    public int addMember(MemberDTO dto) {
        String sql = "insert into member values(?,?,?,?,?,?,?,?,?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getPassword());
            pstmt.setString(3, dto.getNickname());
            pstmt.setString(4, dto.getName());
            pstmt.setString(5, dto.getGender());
            pstmt.setString(6, dto.getEmail());
            pstmt.setString(7, dto.getCarrier());
            pstmt.setString(8, dto.getPhone());
            pstmt.setString(9, dto.getBirthday());
            result = pstmt.executeUpdate();

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt);
        }
        return result;
    }

    //회원가입 null체크
    public MemberDTO getMember(String id, String password) {
        String sql = "select * from member where id=? and password=?";
        MemberDTO dto = new MemberDTO();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto.setId(rs.getString("id"));
                dto.setPassword(rs.getString("password"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return dto;

    }

    public int IDCheck(String id) throws ClassNotFoundException {
        String sql = "SELECT 1 FROM member WHERE id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int result = 0;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                result = 1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return result;
    }

    // 댓글 쓰기 회원정보 받아오기
    public MemberDTO getMemberByID(String id) {
        String sql = "select * from member where id=?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberDTO dto = new MemberDTO();

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto.setId(rs.getString("id"));
                dto.setPassword(rs.getString("password"));
                dto.setNickname(rs.getString("nickname"));
                dto.setName(rs.getString("name"));
                dto.setEmail(rs.getString("email"));
                dto.setCarrier(rs.getString("carrier"));
                dto.setPhone(rs.getString("phone"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return dto;
    }

    // 회원정보 수정하기
    public int updateMember(MemberDTO  dto) {
        String sql = "update member set nickname=?, name=?, phone=?, carrier=?, email=?, password=? where id=?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getNickname());
            pstmt.setString(2, dto.getName());
            pstmt.setString(3, dto.getPhone());
            pstmt.setString(4, dto.getCarrier());
            pstmt.setString(5,dto.getEmail());
            pstmt.setString(6, dto.getPassword());
            pstmt.setString(7, dto.getId());
            result = pstmt.executeUpdate();

        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.close(conn, pstmt);
        }
        return result;
    }

}