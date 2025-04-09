package util;

public class PageHandler {
    private int totalCnt;  // 총 게시물 갯수
    private int pageSize = 15;  // 한 페이지의 게시글 수
    private int naviSize = 6;  // 페이지 내비게이션의 크기(표시될 페이징 크기)
    private int totalPage; // 전체 페이지 갯수
    private int currPage;  // 현재 페이지
    private int beginPage;   // 내비게이션의 첫번쨰 페이지
    private int endPage;   // 내비게이션의 마지막 페이지
    private boolean showPrev;  // 이전 페이지로 이동하는 링크를 보여줄 것인지의 여부
    private boolean showNext;  // 다음 페이지로 이동하는 링크를 보여줄 것인지의 여부

    public PageHandler(int totalCnt , int currPage) {
        this(totalCnt, currPage, 15,6);
        totalPage = (int)Math.ceil((double)totalCnt / pageSize);
        beginPage = ((currPage - 1) / naviSize * naviSize)+1;
        endPage = Math.min(beginPage + naviSize - 1, totalPage);
        showPrev = beginPage != 1;
        showNext = endPage != totalPage;
    }

    public PageHandler(int totalCnt , int currPage , int pageSize, int naviSize) {
        this.totalCnt = totalCnt;
        this.currPage = currPage;
        this.pageSize = pageSize;
        this.naviSize = naviSize;

        totalPage = (int)Math.ceil((double)totalCnt / pageSize);
        beginPage = (currPage - 1) / naviSize * naviSize + 1;
        endPage = Math.min(beginPage + naviSize - 1, totalPage);
        showPrev = beginPage != 1;
        showNext = endPage != totalPage;
    }

    public int getTotalCnt() { return totalCnt; }
    public void setTotalCnt(int totalCnt) { this.totalCnt = totalCnt; }

    public int getPageSize() { return pageSize; }
    public void setPageSize(int pageSize) { this.pageSize = pageSize; }

    public int getNaviSize() { return naviSize; }
    public void setNaviSize(int naviSize) { this.naviSize = naviSize; }

    public int getTotalPage() { return totalPage; }
    public void setTotalPage(int totalPage) { this.totalPage = totalPage; }

    public int getCurrPage() { return currPage; }
    public void setCurrPage(int currPage) { this.currPage = currPage; }

    public int getBeginPage() { return beginPage; }
    public void setBeginPage(int beginPage) { this.beginPage = beginPage; }

    public int getEndPage() { return endPage; }
    public void setEndPage(int endPage) { this.endPage = endPage; }

    public boolean isShowPrev() { return showPrev; }
    public void setShowPrev(boolean showPrev) { this.showPrev = showPrev; }

    public boolean isShowNext() { return showNext; }
    public void setShowNext(boolean showNext) { this.showNext = showNext; }
}