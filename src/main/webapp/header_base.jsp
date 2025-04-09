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
        <li class="list"><a href="news"><strong>오늘의 뉴스</strong></a></li> <!-- <a>를 <li> 내부로 이동 -->
        <li>
            <ul>
                <li><a href="news?section=731">모바일</a></li>
                <li><a href="news?section=226">인터넷/SNS</a></li>
                <li><a href="news?section=227">통신/뉴미디어</a></li>
                <li><a href="news?section=230">IT 일반</a></li>
                <li><a href="news?section=732">보안/해킹</a></li>
                <li><a href="news?section=283">컴퓨터</a></li>
                <li><a href="news?section=229">게임/리뷰</a></li>
                <li><a href="news?section=228">과학 일반</a></li>
            </ul>
        </li>
    </ul>
</aside>
</body>
</html>