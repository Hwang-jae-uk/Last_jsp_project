function validateForm(event) {

    event.preventDefault();

    const form = event.target;

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
    form.submit();
}

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
        if (hid.value != null) {text.value = hid.value;}
        text.disabled = false;
        text.focus();
    } else {
        if (hid.value != null) {text.value = hid.value;}
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
    if (hid.value != null) {text.value = hid.value;}

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

function moveNextInput(event) {
    if (event.key === 'Enter') {
        event.preventDefault(); // 폼 제출 방지
        const inputs = document.querySelectorAll('.ent');
        const index = Array.from(inputs).indexOf(event.target);
        if (index >= 0 && index < inputs.length - 1) {
            inputs[index + 1].focus();
        }
    }
}

window.onload = function() {
    const inputs = document.querySelectorAll('.ent');
    inputs.forEach(input => {
        input.addEventListener('keydown', moveNextInput);
    });
}

// 버튼 누르면 비밀번호 변경이 생김
function passwirdHidden() {
    const fields = document.getElementById("passwordFields");
    fields.style.display = fields.style.display === "none" ? "block" : "none";
}


