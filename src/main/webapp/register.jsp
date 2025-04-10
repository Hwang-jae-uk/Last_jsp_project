<%@ page import="java.lang.reflect.Member" %>
<%@ page import="dao.MemberDAO" %>
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
    <link href="css/font.css" rel="stylesheet"> <!-- Google Font 링크 추가 -->
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
                    <input type="text" id="id" name="id" minlength="5" maxlength="20">
                    <span>아이디를 5 ~ 20자 내로 입력해주세요.</span>
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
                    <%
                    %>
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
                            <option value="SKT">SKT 알뜰폰</option>
                            <option value="KT">KT 알뜰폰</option>
                            <option value="LG">LG 알뜰폰</option>
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
    }

    function passwordCheck() {
        const pw = document.querySelector('.password').value;
        const confirm = document.querySelector('.confirmPassword').value;
        if(pw !== confirm){
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }
    }

    function checkDuplicate() {

        alert("중복 검사 기능이 필요합니다."); // 기본적인 알림창
        // AJAX 를 사용하여 서버에 중복 아이디를 확인하는 요청을 보낼 수 있습니다.
    }

    // 비밀번호 또는 도메인이 일치하지 않을 경우 폼 제출 방지
    document.querySelector("form").addEventListener("submit", event => {



    });




    function selectDomain() {
        var dom = document.querySelector("select[name='dom']").value;
        var text = document.querySelector("#domain");
        var domain = document.querySelector("[name='domain']");
        if (dom === 'none') {
            text.disabled = false;
            text.value = "";
            domain.value = "";
        } else {
            text.disabled = true;
            text.value = dom;
            domain.value = dom;
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