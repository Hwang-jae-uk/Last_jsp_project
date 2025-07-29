<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>
</head>
<body>
<header> <!-- 헤더 영역 -->
    <h1><a href="home">Science&nbsp;Of&nbsp;Today</a></h1>
</header>
<nav> <!-- 여기서는 nav 태그를 main menu bar 로 설정 -->
    <ul>
        <li class="spacer"></li>
        <li><a href="home">HOME</a></li>
        <li><a href="introduce.jsp">ABOUT</a></li>
        <li><a href="news">NEWS</a></li>
        <li><a href="list">COMMUNITY</a></li>
        <c:if test="${sessionScope.get('userId')==null}">
            <li><a href="login">LOGIN</a></li>
        </c:if>
        <c:if test="${sessionScope.get('userId')!=null}">
            <li><a href="logout.jsp">LOGOUT</a></li>
        </c:if>
        <c:if test="${sessionScope.get('userId')==null}">
            <li><a href="register">SIGN UP</a></li>
        </c:if>
        <c:if test="${sessionScope.get('userId')!=null}">
            <li><a href="profile">PROFILE</a></li>
        </c:if>
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