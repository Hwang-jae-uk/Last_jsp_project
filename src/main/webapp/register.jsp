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
    <link rel="stylesheet" href="css/register.css"> <!-- 외부 스타일시트 적용 -->
    <script src="js/currentTime.js"></script> <!-- 현재 날짜, 현재 시각을 표현하는 외부 js 적용 -->
    <link href="css/font.css" rel="stylesheet"> <!-- Google Font 링크 추가 -->
</head>
<body>
<div id="wrapper">
    <jsp:include page="header_base.jsp"/>
    <main>
        <div class="register-container">
            <h2>회원가입</h2>
            <form action="process_register.jsp" method="post">
                <div class="form-group">
                    <label for="id">아이디</label>
                    <input type="text" id="id" name="id" minlength="5" maxlength="20" placeholder="아이디(최소 5자 최대 20자)를 입력해주세요." required>
                    <button type="button" onclick="checkDuplicate()">중복 검사</button> <!-- 중복 검사 버튼 -->
                </div>

                <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="password" minlength="8" maxlength="20" placeholder="비밀번호(최소 8자 최대 20자)를 입력해주세요." required>
                </div>

                <div class="form-group">
                    <label for="confirmPassword">비밀번호 확인</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" minlength="8" maxlength="20" placeholder="비밀번호(최소 8자 최대 20자)를 똑같이 다시 입력해주세요." required>
                </div>

                <div class="form-group">
                    <label for="name">이름</label>
                    <input type="text" id="name" name="name" minlength="3" placeholder="이름을 입력해주세요." required>
                </div>

                <div class="form-group">
                    <label>성별</label>
                    <div>
                        <label><input type="radio" name="gender" value="man" checked> 남자</label>
                        <label><input type="radio" name="gender" value="woman"> 여자</label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="birthday">생년월일</label>
                    <input type="date" id="birthday" name="birthday" required>
                </div>

                <div class="form-group">
                    <label for="email">이메일</label>
                    <input type="text" id="email" name="email" minlength="5" placeholder="이메일의 아이디를 입력해주세요." required>@
                    <select name="domain" required>
                        <option value="none">도메인 선택</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="naver.com">naver.com</option>
                        <option value="daum.net">daum.net</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="carrier">통신사</label>
                    <select id="carrier" name="carrier" required>
                        <option value="SKT">SKT</option>
                        <option value="KT">KT</option>
                        <option value="LG">LG</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="phone">휴대전화 번호</label>
                    <input type="tel" id="phone" name="phone" placeholder="전화번호를 입력해주세요.(예 : 01012345678)" required>
                </div>

                <button type="submit">회원가입</button> <!-- 회원가입 버튼 -->
            </form>
        </div>
    </main>
    <jsp:include page="footer.jsp"/>
</div>
<script>
    function checkDuplicate() {
        // 여기에 중복 검사 로직을 추가하세요.
        alert("중복 검사 기능이 필요합니다."); // 기본적인 알림창
        // AJAX를 사용하여 서버에 중복 아이디를 확인하는 요청을 보낼 수 있습니다.
    }

    function validatePasswords() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        var emailDomain = document.querySelector("select[name='domain']").value;

        if (emailDomain === "none") {
            alert("도메인을 선택해주세요.");
            return false; // 도메인이 선택되지 않았을 경우 false 반환
        }

        if (password !== confirmPassword) {
            alert("비밀번호가 일치하지 않습니다. 확인해주세요.");
            return false; // 비밀번호가 일치하지 않을 경우 false 반환
        }

        return true; // 두 조건 모두 만족하면 true 반환
    }

    document.querySelector("form").addEventListener("submit", function(event) {
        if (!validatePasswords()) {
            event.preventDefault(); // 비밀번호 또는 도메인이 일치하지 않을 경우 폼 제출 방지
        }
    });
</script>
</body>
</html>