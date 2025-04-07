



<%@ page import="news.NewsAPI" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.NewsDTO" %>
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
    <link rel="stylesheet" href="../css/index_style_view.css"> <!-- 외부 스타일시트 적용 -->
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
    <main>
        <table border="1" style="width: 95%; border-collapse: collapse; margin: 0;" >
            <tr>
                <th width="15%" >작성자: </th>
                <th width="25%" >${dto.id}</th>
                <th width="15%" >조회수: </th>
                <th width="15%">${dto.visitCount}</th>
                <th width="15%">날짜 :</th>
                <th >${dto.postdate}</th>
            </tr>
            <tr>
                <th>제목:</th>
                <th colspan="5" align="left" style="padding-left: 30px">${dto.title}</th>
            </tr>
            <tr>
                <th>내용</th>
                <th colspan="5"  align="left" style="padding-left: 30px">${dto.content}</th> <!-- 게시글 내용 출력 -->
            </tr>
        </table>
        <button>삭제하기</button>
        <button>수정하기</button>
        <button>목록보기</button>
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