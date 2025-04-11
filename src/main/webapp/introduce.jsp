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
    <title>소개글</title>
    <script src="js/currentTime.js"></script> <!-- 현재 날짜, 현재 시각을 표현하는 외부 js 적용 -->
    <link rel="stylesheet" href="css/introduce.css"> <!-- 외부 스타일시트 적용 -->
    <link href="css/font.css" rel="stylesheet"> <!-- Google Font 링크 추가 -->
</head>
<body onload='resizeWindow(this)'>
<div id="wrapper">
    <jsp:include page="header_base.jsp"/>
    <main> <!-- main 태그는 블로그의 컨텐츠 내용을 담는 시맨틱 태그 -->
        <h1>홈페이지 소개글</h1>
        <h2>빠르게 변화하는 IT 및 과학 뉴스의 허브</h2>

        <pre>
        현대 사회에서 기술 발전의 속도는 날로 빨라지고 있습니다.
        이러한 정보의 홍수 속에서 최신 IT 및 과학 분야의 소식을 신속하게 파악하는 것이 점점 더 중요해지고 있습니다.
        저희는 "최첨단 과학 뉴스 크롤링" 프로젝트를 통해 이러한 필요에 부응하고자 합니다.

        이 JSP 기반 프로젝트는 IntelliJ IDE를 사용하여 네이버 뉴스의 IT/과학 카테고리에서 최신 뉴스를 수집합니다.
        이를 통해 사용자 여러분은 최신 과학 정보를 실시간으로 접할 수 있습니다.
        우리의 목표는 과학의 최전선에서 벌어지는 사건들을 신속하게 전달하는 것입니다.
        </pre>

        <h2>소통하는 커뮤니티</h2>
        <pre>
        또한, 저희는 사용자 간의 활발한 커뮤니케이션을 위해 게시판, 댓글, 좋아요 기능을 도입하였습니다.
        사용자님께서는 다양한 의견을 나누고 서로의 생각을 공유할 수 있는 공간을 가질 수 있습니다.
        이를 통해 정보에 대한 상호작용을 증진하고, 사용자 간의 활발한 교류를 만들어 나갈 수 있습니다.
        </pre>

        <h2>개발 목표</h2>
        <h3>실시간 업데이트 기능</h3>
        <h5>뉴스가 자동으로 업데이트되어 최신 정보를 실시간으로 제공할 수 있는 효율적인 시스템을 구축합니다.</h5>
        <h3>소통을 위한 게시판 기능</h3>
        <h5>게시판 및 댓글 기능을 통해 사용자들 간의 소통의 장을 마련하고, 좋아요 기능을 통해 사용자들의 반응을 즉각적으로 확인할 수 있도록 합니다.</h5>

        <pre>
        저희의 플랫폼은 앞으로도 지속적으로 발전할 것이며, 여러분의 많은 관심과 참여를 부탁드립니다.
        최신 과학 정보와 활발한 소통의 장에서 만나요!
        </pre>
    </main>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>