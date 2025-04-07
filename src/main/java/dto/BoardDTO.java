package dto;

import dao.BoardDAO;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class BoardDTO {

    private int no;
    private String id;
    private String pw;
    private String title;
    private String content;
    private Date postdate;
    private int visitCount;


    // 매개변수가 없는 생성자
    public BoardDTO() {}

    // 매개변수가 모두 있는 생성자
    public BoardDTO(String id, String pw, String title, String content) {
        this.id = id;
        this.pw = pw;
        this.title = title;
        this.content = content;
    }

    // 게시판 번호
    public int getNo() { return no; }
    public void setNo(int no) { this.no = no; }
    // 아이디 변수(variable code : 0x00020200)
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    // 비밀번호 변수
    public String getPw() { return pw; }
    public void setPw(String pw) { this.pw = pw; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public int getVisitCount() {return visitCount;}
    public void setVisitCount(int visitCount) {this.visitCount = visitCount;}

    public Date getPostdate() {return postdate;}
    public void setPostdate(Date postdate) {this.postdate = postdate;}
}
