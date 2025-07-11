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
    <title>login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" crossorigin="anonymous">
    <link href="css/font.css" rel="stylesheet"> <!-- Google Font 링크 추가 -->
    <link rel="stylesheet" href="css/base.css"> <!-- 외부 스타일시트 적용 -->
    <link rel="stylesheet" href="css/login.css"> <!-- 외부 스타일시트 적용 -->
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="js/currentTime.js"></script> <!-- 현재 날짜, 현재 시각을 표현하는 외부 js 적용 -->
</head>
<body>
<div id="wrapper">
    <jsp:include page="header_base.jsp"/>
    <main>
        <div class="login-container">
            <h2>로그인</h2>
            <form action="/login" method="post">
                <div class="form-group">
                    <div>
                    <label for="id">아이디</label>
                    <input type="text" id="id" name="id" value="${param.get("id")}" required>
                </div>
                <div class="form-group">
                    <div class="p">
                        <label for="password">비밀번호</label>
                        <input type="password" id="password" name="password" required>
                        <div class="eyes"><i class="fas fa-eye"></i></div>
                    </div>
                </div>
                <c:if test="${not empty loginfail}">${loginfail}</c:if>
                <br>
                <br>
                <button type="submit" class="login-button">로그인</button>
                <a href="register.jsp"><button type="button" class="login-button">회원가입</button></a>
            </form>
        </div>
    </main>
    <jsp:include page="footer.jsp"/>
    <script>
        $(function() {
            $('.eyes').on('click', function() {
                const p = $(this).parent();
                p.toggleClass('active');

                if (p.hasClass('active')) {
                    $(this).find('.fa-eye').attr('class', "fas fa-eye-slash");
                    p.children('input').attr('type', "text");
                }
                else {
                    $(this).find('.fa-eye-slash').attr('class', "fas fa-eye");
                    p.children('input').attr('type', "password");
                }
            });
        });
    </script>
</div>
</body>
</html>