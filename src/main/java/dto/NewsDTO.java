package dto;

public class NewsDTO {
    private int no;
    private String name;    //기자
    private String title;   //제목
    private String contents;	//내용
    private int visitcount;
    private String img;         //이미지
    private String postdate;    //작성일
    private String link;

    public int getNo() {return no;}
    public void setNo(int no) {this.no = no;}
    public String getName() {return name;}
    public void setName(String name) {this.name = name;}
    public String getTitle() {return title;}
    public void setTitle(String title) {this.title = title;}
    public String getContents() {return contents;}
    public void setContents(String contents) {this.contents = contents;}
    public int getVisitcount() {return visitcount;}
    public void setVisitcount(int visitcount) {this.visitcount = visitcount;}
    public String getImg() {return img;}
    public void setImg(String img) {this.img = img;}
    public String getPostdate() {return postdate;}
    public void setPostdate(String postdate) {this.postdate = postdate;}
    public String getLink() {return link;}
    public void setLink(String link) {this.link = link;}

}
