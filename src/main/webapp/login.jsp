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
    <link rel="stylesheet" href="css/login.css"> <!-- 외부 스타일시트 적용 -->
    <link href="css/font.css" rel="stylesheet"> <!-- Google Font 링크 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="js/currentTime.js"></script> <!-- 현재 날짜, 현재 시각을 표현하는 외부 js 적용 -->
</head>
<body>
<div id="wrapper">
    <jsp:include page="header_base.jsp"/>
    <main>
        <div class="login-container">
            <h2>로그인</h2>
            <form action="login" method="post">
                <div class="form-group">
                    <div>
                    <label for="id">아이디</label>
                    <input type="text" id="id" name="id" value="${param.get("id")}" required>
                </div>
                <div class="form-group">
                    <div class="visible">
                        <label for="password">비밀번호</label>
                        <input type="password" id="password" name="password" required>
                        <div class="eyes"><i class="fas fa-eye"></i></div>
                    </div>
                </div>
                <c:if test="${not empty loginfail}">${loginfail}</c:if>
                <br>
                <br>
                <button type="submit" class="login-button">로그인</button>
                <button type="submit" class="login-button">회원가입</button>
            </form>
        </div>
    </main>
    <jsp:include page="footer.jsp"/>
    <script>
        $(function() {
            // .eyes 요소(눈 아이콘)를 클릭할 때마다 아래 함수가 실행됩니다.
            $('.eyes').on('click', function() {
                // .visible 요소에 active 클래스를 토글(추가 또는 제거)합니다.
                $('.visible').toggleClass('active');

                // .visible 요소에 active 클래스가 추가되었을 때 (즉, 비밀번호가 보이는 상태일 때)
                if ($('.visible').hasClass('active')) {
                    // 아이콘을 눈 모양에서 눈 슬래시 모양으로 변경합니다.
                    $(this).find('.fa-eye').attr('class', "fas fa-eye-slash");
                    // 비밀번호 입력 필드의 type을 "text"로 변경하여 비밀번호를 표시합니다.
                    $('#password').attr('type', "text");
                }
                // .visible 요소에 active 클래스가 제거되었을 때 (즉, 비밀번호가 숨겨진 상태일 때)
                else {
                    // 아이콘을 눈 슬래시 모양에서 눈 모양으로 다시 변경합니다.
                    $(this).find('.fa-eye-slash').attr('class', "fas fa-eye");
                    // 비밀번호 입력 필드의 type을 "password"로 변경하여 비밀번호를 숨깁니다.
                    $('#password').attr('type', "password");
                }
            });
        });
    </script>
</div>
</body>
</html>