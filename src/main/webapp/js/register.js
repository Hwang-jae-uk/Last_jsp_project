function changeCheck() {
    var check = document.getElementById("check_result")
    if (check.textContent == '사용할 수 있는 ID 입니다.' && check.style.color == 'green') {
        check.textContent = '다시 ID 중복 확인을 해주세요';
        check.style.color = 'red';
    }
}

function onLoginSubmit(event) {
    event.preventDefault();
}

document.querySelector("#form").addEventListener("submit", onLoginSubmit);

function validateForm(form) {

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
        const name = field.name;
        if (!name || name.value.trim() === "") {
            alert(field.message);
            name.focus();
            return false;
        } else if (name.value.trim() == "none") {
            alert(field.message);
            return false;
        } else if ( name == 'id' && document.getElementById("check_result").style.color != 'green') {
            alert("아이디가 중복되는지 확인해 주세요.")
            name.focus();
            return false;
        } else if ( name == 'confirmPassword' && document.getElementById("password").value != document.getElementById("confirmPassword").value) {
            alert("비밀번호가 일치하지 않습니다.")
            name.focus();
            return false;
        } else if ( name == 'email') {
            const hid_domain = $("#hid_domain").val();
            if (hid_domain.val().length == 0 || !(hid_domain.val().includes("."))) {
                alert("도메인이 정확하지 않습니다.")
                $("#domain").focus();
                return false;
            }
        }
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