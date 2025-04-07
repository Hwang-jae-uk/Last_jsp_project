package dto;

public class NewsDTO {
    private int no;
    private String name;    //기자
    private String title;   //제목
    private String contents;	//내용
    private String img;         //이미지
    private String registDt;    //작성일

    public int getNo() {return no;}
    public void setNo(int no) {this.no = no;}
    public String getName() {return name;}
    public void setName(String name) {this.name = name;}
    public String getTitle() {return title;}
    public void setTitle(String title) {this.title = title;}
    public String getContents() {return contents;}
    public void setContents(String contents) {this.contents = contents;}
    public String getImg() {return img;}
    public void setImg(String img) {this.img = img;}
    public String getRegistDt() {return registDt;}
    public void setRegistDt(String registDt) {this.registDt = registDt;}

}
