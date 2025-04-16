function changeCheck() {
    const check_result = document.getElementById("check_result");
    if (check_result.textContent == '사용할 수 있는 ID 입니다.' && check_result.style.color == 'green') {
        check_result.textContent = '다시 ID 중복 확인을 해주세요';
        check_result.style.color = 'red';
    }
}

function validateForm(event) {

    event.preventDefault(); // 기본 제출 막기

    const form = event.target;

    const fields = [
        {name: 'id', message: '아이디를 입력하세요.'},
        {name: 'password', message: '비밀번호를 입력하세요.'},
        {name: 'confirmPassword', message: '비밀번호를 한번 더 입력하세요.'},
        {name: 'nickname', message: '닉네임을 입력하세요.'},
        {name: 'name', message: '이름을 입력하세요.'},
        {name: 'gender', message: '성별을 고르세요.'},
        {name: 'birthday', message: '생일을 입력하세요.'},
        {name: 'email', message: '이메일을 입력하세요.'},
        {name: 'carrier', message: '통신사를 고르세요.'},
        {name: 'phone', message: '전화번호를 입력하세요. '}
    ];
    // 각 필드를 순회하면서 유효성 검사

    for (let field of fields) {
        const input = form[field.name];

        if (!input || input.value.trim() === "") {
            alert(field.message);
            input.focus();
            return false;
        }

        if (input.value.trim() === "none") {
            alert(field.message);
            return false;
        }

        if (field.name === 'id') {
            const check_result = document.getElementById("check_result");
            if (check_result && check_result.style.color !== 'green') {
                alert("아이디가 중복되는지 확인해 주세요.");
                input.focus();
                return false;
            }
        }

        if (field.name === 'confirmPassword') {
            if (form["password"].value !== input.value) {
                alert("비밀번호가 일치하지 않습니다.");
                input.focus();
                return false;
            }
        }
        if (field.name === 'email') {
            const hid_domain = document.getElementById("hid_domain");
            if (!hid_domain || hid_domain.value.trim().length === 0 || !hid_domain.value.includes(".")) {
                alert("도메인이 정확하지 않습니다.");
                document.getElementById("domain").focus();
                return false;
            }
        }
    }
    form.submit();
}

function birthday() {
    const year = parseInt(document.getElementById("year").value);
    const month = parseInt(document.getElementById("month").value);
    const date = parseInt(document.getElementById("date").value);
    document.getElementById("birthday").value = year + "-" + month + "-" + date;
}

function updateDays() {
    const year = parseInt(document.getElementById("year").value);
    const month = parseInt(document.getElementById("month").value);
    const lastDay = new Date(year, month, 0).getDate();
    const dateSelect = document.getElementById("date");

    // 기본 안내 option 유지하면서 날짜 옵션 새로 채우기
    dateSelect.innerHTML = "<option disabled hidden selected></option>";

    for (let i = 1; i <= lastDay; i++) {
        const option = document.createElement("option");
        option.value = i;
        option.textContent = i;
        dateSelect.appendChild(option);
    }
}

function textDomain() {
    var text = document.querySelector("#domain");
    var domain = document.querySelector("[name='domain']");
    domain.value = text.value;
}

function selectDomain() {
    const dom = document.querySelector("#dom_select").value;
    const text = document.querySelector("#domain"); // 사용자가 입력/선택하는 도메인 입력창
    const hiddenDomain = document.querySelector("[name='domain']"); // 실제 form 전송할 hidden input
    if (dom == 'none') {
        text.disabled = false;
        text.value = "";
        hiddenDomain.value = "";
    } else {
        text.disabled = true;
        text.value = dom;
        hiddenDomain.value = dom;
    }
}

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

document.addEventListener("DOMContentLoaded", function() {

    const inputRules = {
        id : /^[a-zA-Z0-9]*$/,
        password : /^[a-zA-Z0-9!@#$%^&*]*$/,
        confirmPassword : /^[a-zA-Z0-9!@#$%^&*]*$/,
        nickname : /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]*$/,
        name : /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]*$/,
        year : /^[0-9]*$/,
        email : /^[a-zA-Z0-9._-]*$/,
        domain : /^[a-zA-Z0-9._-]*$/,
        phone : /^[0-9]*$/
    };

    Object.keys(inputRules).forEach(function (fieldId) {
        const input = document.getElementById(fieldId);
        const allowedPattern = inputRules[fieldId];

        // 키 입력 차단 (event.key 기준)
        input.addEventListener("keydown", function (event) {
            if (event.ctrlKey || event.metaKey || event.key.length > 1) return; // Ctrl, Alt, 방향키 등 제외
            const nextChar = event.key;
            if (!allowedPattern.test(nextChar)) {
                event.preventDefault();
                alert("입력 형식이 맞지 않습니다.");
            }
        });

        // 붙여넣기나 한글 조합 등 후처리 (실시간 정리)
        input.addEventListener("input", function () {
            this.value = [...this.value].filter(c => allowedPattern.test(c)).join('');
        });
    });
});

window.onload = function() {
    const inputs = document.querySelectorAll('.ent');
    inputs.forEach(input => {
        input.addEventListener('keydown', moveNextInput);
    });
}
window.onload = function () {
    updateDays();
    document.getElementById("year").addEventListener("change", updateDays);
    document.getElementById("month").addEventListener("change", updateDays);
};
