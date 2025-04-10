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
    <title>회원가입</title>
    <script src="js/currentTime.js"></script> <!-- 현재 날짜, 현재 시각을 표현하는 외부 js 적용 -->
    <link rel="stylesheet" href="css/font.css"> <!-- Google Font 링크 추가 -->
    <link rel="stylesheet" href="css/register.css"> <!-- 외부 스타일시트 적용 -->
</head>
<body>
<div id="wrapper">
    <jsp:include page="header_base.jsp"/>
    <main>
        <div class="register-container">
            <h2>회원가입</h2>
            <form action="registerProcess" method="post" onsubmit="return validateForm(this)">
                <div class="form-group">
                    <label for="id">아이디</label>
                    <input type="text" id="id" name="id" minlength="5" maxlength="20" autofocus>
                    <span id="output">아이디를 5 ~ 20자 내로 입력해주세요.</span>
                    <button type="button" onclick="checkDuplicate()">중복 검사</button> <!-- 중복 검사 버튼 -->
                </div>
                <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="password" minlength="8" maxlength="20">
                    <span>비밀번호를 8~20자 내로 입력해주세요.</span>
                </div>

                <div class="form-group">
                    <label for="confirmPassword">비밀번호 확인</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" minlength="8" maxlength="20">
                    <span>비밀번호를 다시 입력해주세요.</span>
                </div>

                <div class="form-group">
                    <label for="name">이름</label>
                    <input type="text" id="name" name="name" >
                </div>

                <div class="form-group">
                    <label>성별</label>
                    <div>
                        <label><input type="radio" name="gender" value="man"> 남자</label>
                        <label><input type="radio" name="gender" value="woman"> 여자</label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="birthday">생년월일</label>
                    <input type="date" id="birthday" name="birthday">
                </div>
                <div class="form-group">이메일
                    <label class="inline-form">
                        <input type="text" id="email" name="email" minlength="5" style="width: 150px">
                        @
                        <input id="domain" type="text" onchange="textDomain()" placeholder="domain.com">
                        <input type="hidden" name="domain">
                        <select id="dom" name="dom" onchange="selectDomain()">
                            <option value="none" selected>직접 입력</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="naver.com">naver.com</option>
                            <option value="daum.net">daum.net</option>
                        </select>
                    </label>
                </div>

                <div class="inline-form" style="display: inline">
                    <div class="form-group" style="display: inline">
                        <label for="carrier">통신사</label> &nbsp;&nbsp;&nbsp;
                        <label for="phone">휴대전화 번호</label> <br>
                        <select id="carrier" name="carrier" style="width: 70px">
                            <option value="SKT">SKT</option>
                            <option value="KT">KT</option>
                            <option value="LG">LG</option>
                            <option value="SKT 알뜰폰">SKT 알뜰폰</option>
                            <option value="KT 알뜰폰">KT 알뜰폰</option>
                            <option value="LG 알뜰폰">LG 알뜰폰</option>
                        </select>
                    </div>

                    <div class="form-group" style="display: inline">
                        <input type="tel" id="phone" name="phone" placeholder="- 없이 숫자만 입력" style="width: 150px">
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
    //공백 검증
    function validateForm(form) {
        const fields = [
            {name: 'id', message: '아이디를 입력해주세요.'},
            {name: 'password', message: '비밀번호를 입력해주세요.'},
            {name: 'name', message: '이름을 입력해주세요.'},
            {name: 'gender', message: '성별을 선택해주세요.'},
            {name: 'birthday', message: '생년월일을 입력해주세요.'},
            {name: 'email', message: '이메일을 입력해주세요.'},
            {name: 'domain', message: '도메인을 선택해주세요.'},
            {name: 'carrier', message: '통신사를 선택해주세요'},
            {name: 'phone', message: '전화번호를 입력해주세요.'}
        ];

        for (let i = 0; i < fields.length; i++) {
            const field = fields[i];
            if (!(form[field.name].value.trim())) {
                alert(field.message);
                form[field.name].focus();
                return false
            }
        }
        if (form['password'].value !== form['confirmPassword'].value) {
            alert('비밀번호가 일치하지 않습니다.');
            form['confirmPassword'].focus();
            return false;
        }
        // 전화번호 숫자만 입력되었는지 체크
        const phone = form['phone'].value;
        const phonePattern = /^[0-9]+$/; // 숫자만 허용
        if (!phonePattern.test(phone)) {
            alert('전화번호는 숫자만 입력해주세요.');
            form['phone'].focus();
            return false;
        }

        // 이메일 형식 체크
        const email = form['.email'].value;
        const domain = form['.domain'].value;
        const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (!emailPattern.test(email + "@" + domain)) {
            alert('유효한 이메일을 입력해주세요.');
            form['.email'].focus();
            return false;
        }
        return true;
    }

    function checkDuplicate() {
        const id = document.querySelector("#id")  // 아이디 값 가져오기
        const output = document.querySelector("#output");

        if (id.value.length < 5 || id.value.length > 20) {
            id.focus();
            output.textContent = "아이디를 5 ~ 20자 내로 입력해주세요."
            output.style.color = "#808080FF"
            return false;
        }
            // Ajax 요청을 통해 아이디 중복 검사
        const ajax = new XMLHttpRequest();
        ajax.open("GET", "registerProcess?id=" + id.value, true);
        ajax.onreadystatechange = function () {
            if (ajax.readyState === 4) {
                const response = ajax.responseText.trim();
                if (ajax.status === 200) {
                    if (response === "1") {
                        output.textContent = "이미 사용 중인 아이디입니다.";
                        output.style.color = "#ff0000";
                    } else if (response === "0") {
                        output.textContent = "사용 가능한 아이디입니다.";
                        output.style.color = "#0000ff";
                    } else {
                        output.textContent = "오류가 발생했습니다.";
                        output.style.color = "#ff0000";
                    }
                } else {
                    output.textContent = "서버와의 연결에 실패했습니다.";
                    output.style.color = "#ff0000";
                }
            }
        }
        ajax.send();
    }

    function selectDomain() {
        var dom = document.querySelector("select[name='dom']").value;
        var text = document.querySelector("#domain");
        var domain = document.querySelector("[name='domain']");

        // '직접 입력' 선택 시 도메인 텍스트 입력 가능하게
        if (dom === 'none') {
            text.disabled = false;
            text.value = ""; // 텍스트 입력 필드 비워두기
            domain.value = ""; // hidden 필드도 비워두기
        } else {
            text.disabled = true;
            text.value = dom; // 선택된 도메인 값 설정
            domain.value = dom; // hidden 필드에도 값 설정
        }
    }
    function textDomain() {
        var text = document.querySelector("#domain");
        var domain = document.querySelector("[name='domain']");
        domain.value = text.value;
    }
</script>
</body>
</html>