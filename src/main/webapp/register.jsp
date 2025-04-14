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
  <link rel="stylesheet" href="css/font.css"> <!-- Google Font 링크 추가 -->
  <link rel="stylesheet" href="css/register.css"> <!-- 외부 스타일시트 적용 -->
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
  <script src="js/register.js"></script>
</head>
<body>
<div id="wrapper">
  <main>
    <div class="register-container">
      <h2>회원가입</h2>
      <form id="form" action="register" method="post" onsubmit="return validateForm(this)">
        <div class="form-group">
          <label for="id">아이디</label>
          <input type="text" id="id" name="id" placeholder="아이디를 입력해주세요." onchange="changeCheck()">
          <label style="text-align: left; color: gray" id="check_result" >5~20자 이내로 입력해주세요.</label>
          <button type="button" id="check" style="font-size: large">중복체크</button>
        </div>

        <div class="form-group">
          <label for="password">비밀번호</label>
          <input
            type="password" id="password" name="password"
            minlength="8" maxlength="20" placeholder="비밀번호를 8~20자 내로 입력해주세요.">
        </div>

        <div class="form-group">
          <label for="confirmPassword">비밀번호 확인</label>
          <input type="password" id="confirmPassword" name="confirmPassword" minlength="8" maxlength="20" placeholder="동일한 비밀번호를 다시 입력해주세요.">
        </div>

        <div class="form-group">
          <label for="nickname">닉네임</label>
          <input type="text" id="nickname" name="nickname" placeholder="8자리이하로 입력하세요.">
        </div>

        <div class="form-group">
          <label for="name">이름</label>
          <input type="text" id="name" name="name" placeholder="이름을 입력해주세요.">
        </div>

        <div class="form-group">
          <label>성별</label>
          <div>
            <input type="radio" checked name="gender" value="none" style="display: none">
            <label><input type="radio" name="gender" value="man"> 남자</label>
            <label><input type="radio" name="gender" value="woman"> 여자</label>
          </div>
        </div>

        <div class="form-group">
          <label for="birthday">생년월일</label>
          <input type="hidden" id="birthday" name="birthday">
          <label class="inline-form" style="border: 1px solid gray; border-radius: 2px; width: fit-content;
          background-color: #f3fbff; align-self: center;">
            <input type="text" id="year" style="border: none">년
            <input type="text" id="month" style="border: none">월
            <input type="text" id="date" style="border: none">일
          </label>
        </div>
        <div class="form-group">이메일
          <label class="inline-form">
            <input type="text" id="email" name="email" minlength="5" style="width: 150px" placeholder="Input your email's ID">
            @
            <input id="domain" type="text" onchange="textDomain()" placeholder="domain.com">
            <input type="hidden" name="domain" id="hid_domain">
            <select id="dom_select" onchange="selectDomain()">
              <option value="none" selected>직접 입력</option>
              <option value="gmail.com">gmail.com</option>
              <option value="naver.com">naver.com</option>
              <option value="daum.net">daum.net</option>
            </select>
          </label>
        </div>

        <div class="inline-form" style="display: inline">
          <div class="form-group" style="display: inline">
            <label for="carrier" style="margin-right: 60px;">통신사</label>
            <label for="phone">휴대전화 번호</label> <br>
            <select id="carrier" name="carrier">
              <option value="SKT">SKT</option>
              <option value="KT">KT</option>
              <option value="LG">LG</option>
              <option value="SKT 알뜰폰">SKT 알뜰폰</option>
              <option value="KT 알뜰폰">KT 알뜰폰</option>
              <option value="LG 알뜰폰">LG 알뜰폰</option>
            </select>
            <input type="tel" id="phone" name="phone" placeholder="- 없이 숫자만 입력" style="width: 150px">
          </div>
        </div>
        <br><br>
        <button type="submit">회원가입</button> <!-- 회원가입 버튼 -->
      </form>
    </div>
    <script>
        $("#check").click(function () {
            const id = $("#id").val();
            if (id.includes(" ")) {
                alert("올바른 아이디를 입력해주세요");
            } else if (id.length < 5 || id.length > 20) {
                alert("5~20자 이내로 입력해주세요");
            } else {
                $.ajax({
                    url: "register",
                    data: {input: id},
                    type: "post",
                    success: function (result) {
                        console.log("ajax 통신 성공");
                        $("#check_result").text(result);
                    },
                    error: function () {
                        console.log("ajax 통신 실패");
                        $("#check_result").text("다시 시도해 주세요");
                    },
                    complete: function () {
                        var check = document.getElementById("check_result")
                        if (check.textContent == '사용할 수 있는 ID 입니다.') {
                            check.style.color = 'green';
                        } else {
                            check.style.color = 'red';
                        }
                    }
                });
            }
        });
    </script>
  </main>
</div>
</body>
</html>