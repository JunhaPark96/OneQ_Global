<%@ page import="com.kopo.hanaglobal.hana_global.web.entity.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="assets/css/vendor/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- third party css end -->

    <!-- App css -->
<%--    <link href="./css/bootstrap/app-modern.min.css" rel="stylesheet" type="text/css" id="light-style" />--%>
<%--    <link href="./css/bootstrap/app-modern-dark.min.css" rel="stylesheet" type="text/css" id="dark-style" />--%>
    <!-- Bootstrap 5 CSS -->
</head>
<body>
<div class="header">
    <div class="logo">
        <a href="/">
            <img src="./images/hana_logo.png" class="hana_logo" alt="하나로고">
        </a>
    </div>
    <%--언어 설정--%>
    <div class="language">
<%--        <select id="language-select">--%>
<%--            <option value="en"><img src="./css/images/flags/us.jpg"/>English</option>--%>
<%--            <option value="ko">Korean</option>--%>
<%--            <!-- 기타 필요한 언어를 여기에 추가 -->--%>
<%--        </select>--%>
    <li class="dropdown notification-list topbar-dropdown d-none d-lg-block">
        <a class="nav-link dropdown-toggle arrow-none" data-toggle="dropdown" id="topbar-languagedrop" href="#" role="button" aria-haspopup="true" aria-expanded="false">
            <img src="./images/flags/us.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">English</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated topbar-dropdown-menu" aria-labelledby="topbar-languagedrop">
            <!-- 기본으로 보이는 "English" 항목 -->
            <a href="javascript:void(0);" class="dropdown-item notify-item selected">
                <img src="./images/flags/us.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">English</span>
            </a>

            <!-- 나머지 언어 항목들 -->
            <a href="javascript:void(0);" class="dropdown-item notify-item">
                <img src="./images/flags/germany.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">German</span>
            </a>
            <a href="javascript:void(0);" class="dropdown-item notify-item">
                <img src="./images/flags/italy.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">Italian</span>
            </a>
            <a href="javascript:void(0);" class="dropdown-item notify-item">
                <img src="./images/flags/spain.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">Spanish</span>
            </a>
            <a href="javascript:void(0);" class="dropdown-item notify-item">
                <img src="./images/flags/russia.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">Russian</span>
            </a>
        </div>
    </li>

    </div>
    <%--로그인 구역--%>
    <div class="login-box">
        <c:if test="${not empty currentMember}">
            <c:choose>
                <c:when test="${currentMember.name == 'admin'}">
                    <div class="signin">
                        <a href="${pageContext.request.contextPath}/dashboard"> DashBoard </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="signin">
                        <a href="${pageContext.request.contextPath}/profile"> MyProfile </a>
                    </div>
                </c:otherwise>
            </c:choose>
            <div class="signup">
                <a href="${pageContext.request.contextPath}/signout"> Sign Out </a>
            </div>
        </c:if>
        <c:if test="${empty currentMember}">
            <div class="signin">
                <a href="${pageContext.request.contextPath}/signin"> Sign In</a>
            </div>
            <div class="signup">
                <a href="${pageContext.request.contextPath}/signup"> Sign Up </a>
            </div>
        </c:if>
    </div>

    <div class="menubar">
        <div class="st"><a href="<c:choose><c:when test="${not empty currentMember}">${pageContext.request.contextPath}/accountInfo</c:when><c:otherwise>${pageContext.request.contextPath}/signin</c:otherwise></c:choose>">Account</a></div>
        <div class="st"><a href="<c:choose><c:when test="${not empty currentMember}">${pageContext.request.contextPath}/walletInfo</c:when><c:otherwise>${pageContext.request.contextPath}/signin</c:otherwise></c:choose>">Hana Wallet</a></div>
        <div class="st"><a href="<c:choose><c:when test="${not empty currentMember}">${pageContext.request.contextPath}/exchange</c:when><c:otherwise>${pageContext.request.contextPath}/signin</c:otherwise></c:choose>">Exchange</a></div>
        <div class="st"><a href="<c:choose><c:when test="${not empty currentMember}">${pageContext.request.contextPath}/remittance</c:when><c:otherwise>${pageContext.request.contextPath}/signin</c:otherwise></c:choose>">Remittance</a></div>
    </div>

    <div class="blank">
    </div>
    <div class="blank">
    </div>
</div>

<script>
    // 언어선택 드롭다운
    $(document).ready(function() {
        $("#topbar-languagedrop").click(function(e) {
            e.preventDefault();
            $(".dropdown-menu").toggle();
        });

        $(".dropdown-item").click(function() {
            // 클릭한 아이템의 이미지와 텍스트 가져오기
            let selectedImg = $(this).find('img').attr('src');
            let selectedText = $(this).find('span').text();

            // 메인 버튼의 이미지와 텍스트 업데이트
            $("#topbar-languagedrop img").attr('src', selectedImg);
            $("#topbar-languagedrop span").text(selectedText);

            // 드롭다운 메뉴에서 선택한 아이템 숨기기
            $(this).hide();

            // 기존에 숨겨져 있던 아이템들 보이기
            $(".dropdown-item").not(this).show();

            // 드롭다운 메뉴 숨기기
            $(".dropdown-menu").hide();
        });

        $(document).click(function(e) {
            if (!$(e.target).closest('.dropdown').length) {
                $(".dropdown-menu").hide();
            }
        });
    });



</script>


</body>
</html>