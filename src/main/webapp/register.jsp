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
    <script src="js/currentTime.js"></script> <!-- 현재 날짜, 현재 시각을 표현하는 외부 js 적용 -->
    <link href="css/font.css" rel="stylesheet"> <!-- Google Font 링크 추가 -->
    <link rel="stylesheet" href="css/register.css"> <!-- 외부 스타일시트 적용 -->
</head>
<body>
<div id="wrapper">
    <jsp:include page="header_base.jsp"/>
    <main>
        <div class="register-container">
            <h2>회원가입</h2>
            <form action="registerProcess" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this)">
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
                    <label class="inline-form" name="address">
                        <input type="text" id="email" name="email" minlength="5" style="width: 150px" required>
                        @
                        <input id="domain" type="text" name="domain" required>
                        <select id="dom" name="dom" onchange="selectDomain()" required>
                            <option value="none" selected>직접 입력</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="naver.com">naver.com</option>
                            <option value="daum.net">daum.net</option>
                        </select>
                    </label>
                </div>

                <div class="inline-form" style="display: inline">
                    <div class="form-group" style="display: inline">
                        <label for="carrier">통신사</label>
                        <label for="phone">휴대전화 번호</label> <br>
                        <select id="carrier" name="carrier" required>
                            <option value="SKT">SKT</option>
                            <option value="KT">KT</option>
                            <option value="LG">LG</option>
                        </select>
                    </div>

                    <div class="form-group" style="display: inline">
                        <input type="tel" id="phone" name="phone" placeholder="-없이 숫자만 입력" required style="width: 150px">
                    </div>
                </div>
                <br><br>
                <button type="submit">회원가입</button> <!-- 회원가입 버튼 -->
            </form>
        </div>
    </main>
    <jsp:include page="footer.jsp"/>
</div>
<script>
    function validateForm(form) {
        const fields = [
            {name: 'id', message: '이름을'},
            {name: 'password', message: '비밀번호를'},
            {name: 'confirmPassword', message: '비밀번호 확인을'},
            {name: 'name', message: '이름을'},
            {name: 'gender', message: '성별을'},
            {name: 'birthday', message: '생년월일을'},
            {name: 'email', message: '이메일을'},
            {name: 'carrier', message: '통신사를'},
            {name: 'phone', message: '전화번호'}
        ];

        for (let i = 0; i < fields.length; i++) {
            const field = fields[i];
            switch (true) {
                case !form[field.name].value.trim():
                    alert(field.message + " 입력하세요.");
                    form[field.name].focus();
                    return false;
            }
        }
        return true;
    }
    function checkDuplicate() {
        // 여기에 중복 검사 로직을 추가하세요.
        alert("중복 검사 기능이 필요합니다."); // 기본적인 알림창
        // AJAX 를 사용하여 서버에 중복 아이디를 확인하는 요청을 보낼 수 있습니다.
    }

    document.querySelector("form").addEventListener("submit", function(event) {
        if (!validatePasswords()) {
            event.preventDefault(); // 비밀번호 또는 도메인이 일치하지 않을 경우 폼 제출 방지
        }
    });

    function selectDomain() {
        var dom = document.querySelector("select[name='dom']").value;
        var text = document.getElementById("domain");
        if (dom === 'none') {
            text.disabled = false;
            text.value = "";
        } else {
            text.disabled = true;
            text.value = dom
        }
    }
</script>
</body>
</html>