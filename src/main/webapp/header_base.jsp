<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HOME</title>
</head>
<body>
    <header> <!-- 헤더 영역 -->
        <h1><a href="home">IT/과학 뉴스</a></h1>
    </header>
    <nav> <!-- 여기서는 nav 태그를 main menu bar로 설정 -->
        <ul>
            <li class="spacer"></li>
            <li><a href="home">HOME</a></li>
            <li><a href="introduce">ABOUT</a></li>
            <li><a href="news">NEWS</a></li>
            <li><a href="list">LIST</a></li>
            <li><a href="login.jsp">LOGIN</a></li>
            <li><a href="register.jsp">SIGN IN</a></li>
        </ul>
    </nav>
    <aside>
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
</body>
</html>