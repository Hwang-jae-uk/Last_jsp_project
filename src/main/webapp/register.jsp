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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
  <script src="js/register.js"></script>
</head>
<body>
<div id="wrapper">
  <main>
    <div class="register-container">
      <h2>회원가입</h2>
      <form id="form" action="register" method="post">
        <div class="form-group">
          <label for="id">아이디</label>
          <input type="text" id="id" name="id" class="ent" placeholder="아이디를 5~20자 이내로 입력해주세요." onchange="changeCheck()">
          <label style="text-align: left; color: gray" id="check_result"><br></label>
          <button type="button" id="check" style="font-size: large">중복체크</button>
        </div>

        <div class="visible" id="pv">
          <label for="password">비밀번호</label>
          <input
            type="password" id="password" name="password" class="ent"
            minlength="8" maxlength="20" placeholder="비밀번호를 8~20자 내로 입력해주세요.">
          <div class="eyes"><i class="fas fa-eye"></i></div>
        </div>

        <div class="visible" id="cpv">
          <label for="confirmPassword">비밀번호 확인</label>
          <input type="password" id="confirmPassword" name="confirmPassword" minlength="8" maxlength="20"
                 placeholder="동일한 비밀번호를 다시 입력해주세요." class="ent">
          <div class="eyes"><i class="fas fa-eye"></i></div>
        </div>

        <div class="form-group">
          <label for="nickname">닉네임</label>
          <input type="text" id="nickname" name="nickname" placeholder="8자리이하로 입력하세요." maxlength="8" class="ent">
        </div>

        <div class="form-group">
          <label for="name">이름</label>
          <input type="text" id="name" name="name" placeholder="이름을 입력해주세요." class="ent">
        </div>

        <div class="form-group">
          <label>성별</label>
          <div>
            <label><input type="radio" checked name="gender" value="none" style="display: none"/></label>
            <label><input type="radio" name="gender" value="man"> 남자</label>
            <label><input type="radio" name="gender" value="woman"> 여자</label>
          </div>
        </div>

        <div class="form-group" oninput="birthday()">
          <label for="birthday">생년월일</label>
          <input type="hidden" id="birthday" name="birthday">
          <label class="inline-form" style="border: 1px solid gray; border-radius: 5px; width: fit-content;
          background-color: #f3fbff; align-self: center;">
            <input type="text" id="year" style="border: none; text-align: center"
                   minlength="4" maxlength="4" min="1900" class="ent">
            <label for="year">년</label>

            <select name="month" id="month" style="border:none; text-align: center; width: 70px" onchange="updateDays()" class="ent">
              <option disabled hidden selected></option>
              <%for (int i = 1; i <= 12; i++) {%>
              <option value="<%=i%>"><%=i%></option>
              <%}%>
            </select>
            <label for="month">월</label>

            <select name="date" id="date" style="border: none; text-align: center; width: 70px" class="ent">
              <option disabled hidden selected></option>
            </select>
            <label for="date">일</label>&nbsp;&nbsp;
          </label>
        </div>
        <div class="form-group">이메일
          <label class="inline-form" style="border: 1px solid gray; border-radius: 5px; width: fit-content;
          background-color: #f3fbff">
            <input type="text" id="email" name="email" minlength="5" placeholder="Input your email's ID"
                   style="width: 150px; border-color: transparent" class="ent" >
            @
            <input id="domain" type="text" onchange="textDomain()" placeholder="domain.com" style="border-color: transparent">
            <input type="hidden" name="domain" id="hid_domain">
            <select id="dom_select" onchange="selectDomain()" style="border-radius: 5px" class="ent">
              <option value="none" selected>직접 입력</option>
              <option value="gmail.com">gmail.com</option>
              <option value="naver.com">naver.com</option>
              <option value="daum.net">daum.net</option>
            </select> &nbsp;
          </label>
        </div>

        <div class="inline-form" style="display: inline">
          <div class="form-group" style="display: inline">
            <label for="carrier" style="margin-right: 80px">통신사</label>
            <label for="phone" style="right: 30px">휴대전화 번호</label> <c:forEach begin="1" end="8">&nbsp;</c:forEach>
            <br>
            <select id="carrier" name="carrier" style="border-radius: 5px; text-align: center;" class="ent">
              <option hidden disabled selected></option>
              <option value="SKT">SKT</option>
              <option value="KT">KT</option>
              <option value="LG">LG</option>
              <option value="SKT 알뜰폰">SKT 알뜰폰</option>
              <option value="KT 알뜰폰">KT 알뜰폰</option>
              <option value="LG 알뜰폰">LG 알뜰폰</option>
            </select>&nbsp;
            <input type="text" id="phone" name="phone" placeholder="- 없이 숫자만 입력" style="width: 200px; text-align: center"
                   maxlength="11" class="ent">
          </div>
        </div>
        <br><br>
        <button type="submit">회원가입</button> <!-- 회원가입 버튼 -->
      </form>
    </div>
    <script>

        document.getElementById("form").addEventListener("submit", validateForm);

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
                        document.getElementById("is_checked").value = true;
                    }
                });
            }
        });

        $(function() {
            // .eyes 요소(눈 아이콘)를 클릭할 때마다 아래 함수가 실행됩니다.
            $('#pv .eyes').on('click', function() {
                // .input_wrap 요소에 active 클래스를 토글(추가 또는 제거)합니다.
                $('#pv').toggleClass('active');

                // .input_wrap 요소에 active 클래스가 추가되었을 때 (즉, 비밀번호가 보이는 상태일 때)
                if ($('#pv').hasClass('active')) {
                    // 아이콘을 눈 모양에서 눈 슬래시 모양으로 변경합니다.
                    $(this).find('.fa-eye').attr('class', "fas fa-eye-slash");
                    // 비밀번호 입력 필드의 type을 "text"로 변경하여 비밀번호를 표시합니다.
                    $('#password').attr('type', "text");
                }
                // .input_wrap 요소에 active 클래스가 제거되었을 때 (즉, 비밀번호가 숨겨진 상태일 때)
                else {
                    // 아이콘을 눈 슬래시 모양에서 눈 모양으로 다시 변경합니다.
                    $(this).find('.fa-eye-slash').attr('class', "fas fa-eye");
                    // 비밀번호 입력 필드의 type을 "password"로 변경하여 비밀번호를 숨깁니다.
                    $('#password').attr('type', "password");
                }
            });
        });

        $(function() {
            // .eyes 요소(눈 아이콘)를 클릭할 때마다 아래 함수가 실행됩니다.
            $('#cpv .eyes').on('click', function() {
                // .input_wrap 요소에 active 클래스를 토글(추가 또는 제거)합니다.
                $('#cpv').toggleClass('active');

                // .input_wrap 요소에 active 클래스가 추가되었을 때 (즉, 비밀번호가 보이는 상태일 때)
                if ($('#cpv').hasClass('active')) {
                    // 아이콘을 눈 모양에서 눈 슬래시 모양으로 변경합니다.
                    $(this).find('.fa-eye').attr('class', "fas fa-eye-slash");
                    // 비밀번호 입력 필드의 type을 "text"로 변경하여 비밀번호를 표시합니다.
                    $('#confirmPassword').attr('type', "text");
                }
                // .input_wrap 요소에 active 클래스가 제거되었을 때 (즉, 비밀번호가 숨겨진 상태일 때)
                else {
                    // 아이콘을 눈 슬래시 모양에서 눈 모양으로 다시 변경합니다.
                    $(this).find('.fa-eye-slash').attr('class', "fas fa-eye");
                    // 비밀번호 입력 필드의 type을 "password"로 변경하여 비밀번호를 숨깁니다.
                    $('#confirmPassword').attr('type', "password");
                }
            });
        });
    </script>
  </main>
</div>
</body>
</html>