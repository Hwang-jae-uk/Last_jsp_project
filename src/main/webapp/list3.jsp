<%@ page import="java.util.List" %>
<%@ page import="dto.NewsDTO" %>
<%@ page import="news.NewsAPI" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8"
         trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HOME</title>
  <link rel="stylesheet" href="../css/index_style.css"> <!-- 외부 스타일시트 적용 -->
  <script src="../js/currentTime.js"></script> <!-- 현재 날짜, 현재 시각을 표현하는 외부 js 적용 -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> <!-- Google Font 링크 추가 -->
</head>
<body>
<div id="wrapper">
  <header> <!-- 헤더 영역 -->
    <h1><a href="index.html">MY BLOG</a></h1>
    <h3>Welcome to my blog!</h3>
  </header>
  <nav> <!-- 여기서는 nav 태그를 main menu bar로 설정 -->
    <ul>
      <li class="spacer"></li>
      <li><a href="index.html">HOME</a></li>
      <li><a href="introduce.html">ABOUT</a></li>
      <li><a href="memo.html">MEMO</a></li>
      <li><a href="gallery.html">GALLERY</a></li>
      <li><a href="list.html">LIST</a></li>
      <li><a href="login.html">LOGIN</a></li>
      <li><a href="register.html">SIGN IN</a></li>
    </ul>
  </nav>
  <aside> <!-- aside 태그는 sub menu bar로 설정 -->
    <ul class="nav-menu">
      <li class="list"><a href="index.html"><strong>전체글</strong></a></li> <!-- <a>를 <li> 내부로 이동 -->
      <li><hr></li>
      <li class="introduce"><a href="introduce.html"><strong>블로그 소개글</strong></a>
      <li><hr></li>
      <li class="memo"><a href="memo.html"><strong>간단한 메모</strong></a>
      <li><hr></li>
      <li class="gallery"><a href="gallery.html"><strong>사진 목록</strong></a>
      <li><hr></li>
      <li class="hello_post_list"><a href="list.html"><strong>hello world 출력하기</strong></a>
        <ul>
          <li><a href="hello_post_C.html">C</a></li>
          <li><a href="hello_post_C++.html">C++</a></li>
          <li><a href="hello_post_Csharp.html">C#</a></li>
          <li><a href="hello_post_Java.html">Java</a></li>
          <li><a href="hello_post_Javascript.html">Javascript</a></li>
          <li><a href="hello_post_Python.html">Python</a></li>
        </ul>
      </li>
    </ul>
  </aside>
  <main> <!-- main 태그는 블로그의 컨텐츠 내용을 담는 시맨틱 태그 -->
    <section>
      <ul>
        <li><h2><a href="memo.html">이주의 뉴스</a></h2></li>
        <li><hr></li>
        <table border="1" style="width: 100%; border-collapse: collapse; margin: 0;" >
          <tr align="center" >
            <th width="10%">번호</th>
            <th width="10%">작성자</th>
            <th width="60%">제목</th>
            <th width="10%">조회수</th>
            <th width="10%">작성일</th>
          </tr>
          <%
            NewsAPI news = new NewsAPI();
            List<NewsDTO> newsList = news.selectNews();
            for (NewsDTO dto: newsList) {
          %>
            <tr align="center">
              <td width="10%"><%=dto.getNo()%></td>
              <td width="10%"><%=dto.getName()%></td>
              <td width="60%"><%=dto.getTitle()%></td>
              <td width="10%"><%=dto.getVisitcount()%></td>
              <td width="10%"><%=dto.getPostdate()%></td>
            </tr>
        <% } %>
        </table>
      </ul>
    </section>
    <section>
      <ul>
        <li><h2><a href="gallery.html">커뮤니티 글</a></h2></li>
        <li><hr></li>
        <table border="1" style="width: 100%; border-collapse: collapse; margin: 0;" >
          <tr align="center" >
            <th width="10%">번호</th>
            <th width="10%">작성자</th>
            <th width="60%">제목</th>
            <th width="10%">조회수</th>
            <th width="10%">작성일</th>
          </tr>
          <c:forEach var="board" items="${boardDTOList}">
            <tr align="center">
              <th width="10%">${board.no}</th>
              <th width="10%">${board.name}</th>
              <th width="60%">${board.title}</th>
              <th width="10%">${board.visitCount}</th>
              <th width="10%">${board.postdate}</th>
            </tr>
          </c:forEach>
        </table>
      </ul>
    </section>
    <section>
      <h2>게시글 목록</h2>
      <div class="image-grid"> <!-- 이미지 그리드 추가 -->
        <a href="hello_post_C.html"><img src="image/C-Logo.png" alt="C Logo"></a>
        <a href="hello_post_C++.html"><img src="image/C++-Logo.png" alt="C++ Logo"></a>
        <a href="hello_post_Csharp.html"><img src="image/Csharp-Logo.png" alt="C# Logo"></a>
        <a href="hello_post_Java.html"><img src="image/Java-Logo.png" alt="Java Logo"></a>
        <a href="hello_post_Javascript.html"><img src="image/Javascript-Logo.png" alt="Javascript Logo"></a>
        <a href="hello_post_Python.html"><img src="image/python-logo-only.png" alt="Python Logo"></a>
      </div>
    </section>
  </main>
  <footer> <!-- footer 태그는 저작권 표시 및 공식 사이트로 이동하는 아이콘 목록 -->
    <div id="copyright">Copyright ©KJK All right is reserved</div>
    <div id="othersites">
      <!-- 이미지 파일 첨부 -->
      <a href="https://section.blog.naver.com/BlogHome.naver?directoryNo=0&currentPage=1&groupId=0" target="_blank"><img src="image/naver_blog_logo.png" alt="naver blog"></a>
      <a href="https://x.com/" target="_blank"><img src="image/X_logo_2023.png" alt="x(twitter)"></a>
      <a href="https://www.instagram.com/" target="_blank"><img src="image/instagram-6338392_640.png" alt="instagram"></a>
      <a href="https://ko-kr.facebook.com/" target="_blank"><img src="image/facebook-2429746_640.png" alt="facebook"></a>
    </div>
  </footer>
</div>
</body>
</html>