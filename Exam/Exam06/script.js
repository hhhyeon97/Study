



let currentIndex = 0;
const notices = document.querySelectorAll('.notice');
const noticeContainer = document.getElementById('notice-container');

function moveNotices() {
    currentIndex = (currentIndex + 1) % notices.length;

    // 공지사항 변경
    const currentNotice = notices[currentIndex].innerText;
    document.querySelector('.content').innerText = `현재 공지: ${currentNotice}`;

    // 슬라이드 효과
    const offset = -currentIndex * notices[0].offsetWidth;
    noticeContainer.style.transform = `translateX(${offset}px)`;
}

function goToNoticePage(noticeText) {
    // 여기에 공지사항 페이지로 이동하는 코드를 추가하세요
    // 예: window.location.href = '/noticePage?notice=' + noticeText;
}

// 초기 공지사항 설정
document.querySelector('.content').innerText = `현재 공지: ${notices[0].innerText}`;

// 공지 이동 간격을 조절하려면 아래 setInterval의 시간을 조정하세요 (밀리초 단위)
setInterval(moveNotices, 3000);
