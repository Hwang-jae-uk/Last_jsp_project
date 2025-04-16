window.onload = function() {
    // 각 태그에 출력할 내용 지정
    const contentMap = {
        title: "홈페이지 소개글",
        subtitle: "빠르게 변화하는 IT 및 과학 뉴스의 허브",
        intro: `현대 사회에서 기술 발전의 속도는 날로 빨라지고 있습니다.\n
                이러한 정보의 홍수 속에서 최신 IT 및 과학 분야의 소식을 신속하게 파악하는 것이 점점 더 중요해지고 있습니다.\n
                저희는 "최첨단 과학 뉴스 크롤링" 프로젝트를 통해 이러한 필요에 부응하고자 합니다.\n
                이 JSP 기반 프로젝트는 IntelliJ IDE를 사용하여 네이버 뉴스의 IT/과학 카테고리에서 최신 뉴스를 수집합니다.\n
                이를 통해 사용자 여러분은 최신 과학 정보를 실시간으로 접할 수 있습니다.\n
                우리의 목표는 과학의 최전선에서 벌어지는 사건들을 신속하게 전달하는 것입니다.`,
        communityTitle: "소통하는 커뮤니티",
        community: `또한, 저희는 사용자 간의 활발한 커뮤니케이션을 위해 게시판, 댓글, 좋아요 기능을 도입하였습니다.\n
                    여러분은 다양한 의견을 나누고 서로의 생각을 공유할 수 있는 공간을 가질 수 있습니다.\n
                    이를 통해 정보에 대한 상호작용을 증진하고, 사용자 간의 활발한 교류를 만들어 나갈 수 있습니다.`,
        developmentGoalTitle: "개발 목표",
        realTimeUpdatesTitle: "실시간 업데이트 기능",
        realTimeUpdatesContent: `뉴스가 자동으로 업데이트되어 최신 정보를 실시간으로 제공할 수 있는 효율적인 시스템을 구축합니다.`,
        communicationBoardTitle: "소통을 위한 게시판 기능",
        communicationBoardContent: `게시판 및 댓글 기능을 통해 사용자들 간의 소통의 장을 마련하고, 좋아요 기능을 통해 사용자들의 반응을 즉각적으로 확인할 수 있도록 합니다.`,
        footer: `저희의 플랫폼은 앞으로도 지속적으로 발전할 것이며, 여러분의 많은 관심과 참여를 부탁드립니다.\n
                 최신 과학 정보와 활발한 소통의 장에서 만나요!`
    };

    // 각 내용 출력 함수
    function printContent(id, text, delay) {
        const element = document.getElementById(id);
        let index = 0;
        let previousCharWasNewLine = false; // 이전 문자가 줄바꿈인지 여부를 저장하는 변수
        updateDateTime();

        function printCharacter() {
            if (index < text.length) {
                const currentChar = text[index]; // 현재 문자를 저장
                if (currentChar === '\n') {
                    if (!previousCharWasNewLine) { // 이전 문자가 줄바꿈이 아닐 때만 줄바꿈 처리
                        element.innerHTML += '<br/>'; // 줄바꿈을 <br/>로 변환
                        previousCharWasNewLine = true; // 현재 문자가 줄바꿈 처리되었음을 기록
                    }
                } else {
                    element.innerHTML += currentChar; // 한 글자씩 출력
                    previousCharWasNewLine = false; // 현재 문자가 줄바꿈이면 false로 설정
                }
                index++;
                setTimeout(printCharacter, delay); // delay 시간 뒤에 다음 글자 출력
            }
        }

        printCharacter();
    }

    // 각 태그에 내용을 순차적으로 출력
    printContent('title', contentMap.title, 10);
    setTimeout(() => printContent('subtitle', contentMap.subtitle, 10), (contentMap.title.length) * 10 + 300); // 300ms 후 출력
    setTimeout(() => printContent('intro-pre', contentMap.intro, 10), (contentMap.title.length + contentMap.subtitle.length + 2) * 10 + 600); // 600ms 후 출력
    setTimeout(() => printContent('community-title', contentMap.communityTitle, 10), (contentMap.title.length + contentMap.subtitle.length + contentMap.intro.split('<br/>').length) * 10 + 900); // 900ms 후 출력
    setTimeout(() => printContent('community-pre', contentMap.community, 10), (contentMap.title.length + contentMap.subtitle.length + contentMap.intro.split('<br/>').length + contentMap.communityTitle.length + 2) * 10 + 1200); // 1200ms 후 출력
    setTimeout(() => printContent('development-goal-title', contentMap.developmentGoalTitle, 10), (contentMap.title.length + contentMap.subtitle.length + contentMap.intro.split('<br/>').length + contentMap.communityTitle.length + contentMap.community.split('<br/>').length + 4) * 10 + 1500); // 1500ms 후 출력
    setTimeout(() => printContent('real-time-updates-title', contentMap.realTimeUpdatesTitle, 10), (contentMap.title.length + contentMap.subtitle.length + contentMap.intro.split('<br/>').length + contentMap.communityTitle.length + contentMap.community.split('<br/>').length + contentMap.developmentGoalTitle.length + 2) * 10 + 1800); // 1800ms 후 출력
    setTimeout(() => printContent('real-time-updates-content', contentMap.realTimeUpdatesContent, 10), (contentMap.title.length + contentMap.subtitle.length + contentMap.intro.split('<br/>').length + contentMap.communityTitle.length + contentMap.community.split('<br/>').length + contentMap.developmentGoalTitle.length + contentMap.realTimeUpdatesTitle.length + 2) * 10 + 2100); // 2100ms 후 출력
    setTimeout(() => printContent('communication-board-title', contentMap.communicationBoardTitle, 10), (contentMap.title.length + contentMap.subtitle.length + contentMap.intro.split('<br/>').length + contentMap.communityTitle.length + contentMap.community.split('<br/>').length + contentMap.developmentGoalTitle.length + contentMap.realTimeUpdatesTitle.length + contentMap.realTimeUpdatesContent.length + 4) * 10 + 2400); // 2400ms 후 출력
    setTimeout(() => printContent('communication-board-content', contentMap.communicationBoardContent, 10), (contentMap.title.length + contentMap.subtitle.length + contentMap.intro.split('<br/>').length + contentMap.communityTitle.length + contentMap.community.split('<br/>').length + contentMap.developmentGoalTitle.length + contentMap.realTimeUpdatesTitle.length + contentMap.realTimeUpdatesContent.length + contentMap.communicationBoardTitle.length + 2) * 10 + 2700); // 2700ms 후 출력
    setTimeout(() => printContent('footer-pre', contentMap.footer, 10), (contentMap.title.length + contentMap.subtitle.length + contentMap.intro.split('<br/>').length + contentMap.communityTitle.length + contentMap.community.split('<br/>').length + contentMap.developmentGoalTitle.length + contentMap.realTimeUpdatesTitle.length + contentMap.realTimeUpdatesContent.length + contentMap.communicationBoardTitle.length + contentMap.communicationBoardContent.length + 4) * 10 + 3000); // 3000ms 후 출력
}