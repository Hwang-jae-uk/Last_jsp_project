// 현재 날짜와 시각을 가져와서 요소에 표시하는 함수
function updateDateTime() {
    const now = new Date();
    const date = now.toISOString().split('T')[0]; // 날짜 (yyyy-mm-dd 포맷)
    const time = now.toTimeString().split(' ')[0].substring(0, 5); // 시각 (hh:mm 포맷)
    document.getElementById('copyright').textContent = `This is team project, No Copyright | 현재 날짜: ${date}, 현재 시각: ${time}`;

    // 다음 호출까지의 딜레이 시간 계산
    const seconds = now.getSeconds(); // 현재 초
    const delay = 60000 - (1000 * seconds); // 60000 ms에서 현재 초에 해당하는 milliseconds를 빼기

    // 다음 업데이트 예약
    setTimeout(updateDateTime, delay); // 계산된 시간만큼 지연 후 호출
}

// 페이지가 로드될 때 첫 번째로 날짜와 시각을 업데이트
window.onload = updateDateTime; // 페이지 로드 시 한 번 호출