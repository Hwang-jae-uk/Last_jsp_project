<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8"
         trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>개인정보 수정</title>
  <link rel="stylesheet" href="css/profile.css"> <!-- 외부 스타일시트 적용 -->
  <script src="js/currentTime.js"></script> <!-- 현재 날짜, 현재 시각을 표현하는 외부 js 적용 -->
  <link href="css/font.css" rel="stylesheet"> <!-- Google Font 링크 추가 -->
</head>
<body>
<script>
    // 이메일 주소부분 메서드

    function textDomain() {
        const text = document.querySelector("#domain");
        const hid = document.querySelector("#hid_domain");

        hid.value = text.value;
    }

    function setDomain() {
        const text = document.querySelector("#domain");
        const hid = document.querySelector("#hid_domain");
        const sel = document.querySelector("#sel_domain");

        hid.value = sel.value;

        if (sel.selectedIndex === 0) {
            // 직접 입력 선택 시, input 비우고 활성화
            text.value = "";
            text.disabled = false;
            text.focus();
        } else {
            text.value = sel.value;
            text.disabled = true;
        }
        console.log("도메인 값 세팅됨:", text.value);
    }

    function getDomain() {
        const text = document.querySelector("#domain");
        const hid = document.querySelector("#hid_domain");
        const sel = document.querySelector("#sel_domain");

        const domainMap = {
            "gmail.com": 1,
            "naver.com": 2,
            "daum.net": 3
        };

            text.value = hid.value;
        if (domainMap.hasOwnProperty(hid.value)) {
            sel.selectedIndex = domainMap[hid.value];
            text.disabled = true;
        } else {
            sel.selectedIndex = 0; // "직접 입력" 같은 기본값

            // 직접 입력 선택 시, input 비우고 활성화
            text.disabled = false;
            text.focus();
        }
    }

    window.addEventListener("DOMContentLoaded", function() {
        getDomain();
    })

    function validateForm(form){
        if(form.nickname.value == ""){
            alert("닉네임을 입력하세요");
            form.nickname.focus();
            return false;
        }
        if(form.password.value.trim() == ""){
            alert("수정을 하실려면 비밀번호를 입력하세요");
            form.password.focus();
            return false;
        }
        if(form.editPassword.value.trim() != "" && form.editPassword.value != form.confirmEditPassword.value){
            alert("새 비밀번호가 일치하지 않습니다.");
            form.confirmEditPassword.focus();
            return false;
        }

        // 이메일 아이디
        if (form.email.value.trim() === "") {
            alert("이메일 아이디를 입력하세요.");
            form.email.focus();
            return false;
        }

        // 이메일 주소
        if (form.domain.value.length < 5 || !form.domain.value.includes(".")) {
            alert("올바른 이메일 도메인을 입력하세요. 예: naver.com, gmail.com 등");
            form.domain.focus();
            return false;
        }
        return true;
    }





</script>
<div id="wrapper">
  <main>
    <div class="profile-container">
      <h2>개인 정보 관리</h2>
      <form action="profile" method="post" onsubmit="return validateForm(this);">
        <div class="form-group">
          <label for="nickname">닉네임</label>
          <input type="text" id="nickname" name="nickname" value="${member.nickname}" minlength="1" maxlength="8">
          &nbsp;&nbsp;8자리이하로 입력하세요.
        </div>

        <div class="form-group">
          <label for="password">현재 비밀번호</label>
          <input type="text" id="password" name="password" minlength="8" maxlength="20" value="${member.password}">
        </div>
        <c:if test="${not empty error}">
          <div style="color: red;">${error}</div>
          <script>
              alert("${error}");
          </script>
        </c:if>

        <div class="form-group">
          <label for="editPassword">새 비밀번호</label>
          <input type="password" id="editPassword" name="editPassword" minlength="8" maxlength="20" placeholder="&nbsp;&nbsp;비밀번호를 8~20자 내로 입력해주세요.">
        </div>

        <div class="form-group">
          <label for="confirmEditPassword">새 비밀번호 확인</label>
          <input type="password" id="confirmEditPassword" name="confirmEditPassword" minlength="8" maxlength="20">
          <c:if test="${editPassword != confirmEditPassword}">
            <span>비밀번호를 다시 입력해주세요.</span>
          </c:if>
        </div>
        <div class="form-group">
          <label for="name">이름</label>
          <input type="text" id="name" name="name" value="${member.name}" minlength="3" placeholder="이름을 입력해주세요." required>
        </div>

        <div class="form-group">이메일
          <label class="inline-form">
            <input type="text" id="email" name="email" minlength="5" style="width: 150px" value="${fn:split(member.email,"@")[0]}">
            @
            <input id="domain" name="domain" type="text" onchange="textDomain()">
            <input type="hidden" name="hid_domain" id="hid_domain" value="${fn:split(member.email,"@")[1]}" onchange="getDomain()">
            <select name="sel_domain" id="sel_domain" onchange="setDomain()">
              <option name="sel_domain" value="" selected>직접 입력</option>
              <option name="sel_domain" value="gmail.com">gmail.com</option>
              <option name="sel_domain" value="naver.com">naver.com</option>
              <option name="sel_domain" value="daum.net">daum.net</option>
            </select>
          </label>
        </div>
        <div class="inline-form" style="display: inline">
          <div class="form-group" style="display: inline">
            <label for="carrier" style="margin-right: 60px;" style="border-radius: 5px; text-align: center; height: 37px">통신사</label>
            <label for="phone">휴대전화 번호</label> <br>
            <select id="carrier" name="carrier">
              <option value="SKT">SKT</option>
              <option value="KT">KT</option>
              <option value="LG">LG</option>
              <option value="SKT 알뜰폰">SKT 알뜰폰</option>
              <option value="KT 알뜰폰">KT 알뜰폰</option>
              <option value="LG 알뜰폰">LG 알뜰폰</option>
            </select>
          </div>
          <div class="form-group" style="display: inline">
            <input type="tel" id="phone" name="phone" value="${member.phone}" placeholder="-없이 숫자만 입력" required style="width: 150px">
          </div>
        </div>
        <div class="form-group" style="display: inline">
          <button type="submit" style="margin: 10px 0 10px;">수정</button> <!-- 수정 버튼 -->
        </div>
      </form>
    </div>
  </main>
</div>
</body>
</html>