<%@ page import="com.kopo.hanaglobal.hana_global.web.entity.Member" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="org.springframework.web.servlet.LocaleResolver" %>
<%@ page import="java.util.Locale" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="assets/css/vendor/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css"/>
    <%--    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--%>
    <link href="./css/header.css" rel="stylesheet"/>

    <!-- App css -->
    <%--    <link href="./css/bootstrap/app-modern.min.css" rel="stylesheet" type="text/css" id="light-style" />--%>
    <%--    <link href="./css/bootstrap/app-modern-dark.min.css" rel="stylesheet" type="text/css" id="dark-style" />--%>
    <!-- Bootstrap 5 CSS -->

</head>
<body>
<%
    WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(application);
    LocaleResolver localeResolver = wac.getBean(LocaleResolver.class);
    Locale currentLocale = localeResolver.resolveLocale(request);
    String currentLang = currentLocale.getLanguage();
%>
<%
    Member currentMember = (Member) session.getAttribute("currentMember");

    if (currentMember != null && "admin".equals(currentMember.getId())) {
        localeResolver.setLocale(request, response, new Locale("ko"));
    }
%>

<div class="header">
    <div class="logo">
        <a href="/">
            <img src="./images/hana_logo.png" class="hana_logo" alt="하나로고">
        </a>
    </div>
    <%--언어 설정--%>
    <div class="language">
        <ul class="dropdown"> <!-- "dropdown" 클래스 추가 -->
            <li class="dropdown">
                <a id="" class="nav-link dropdown-toggle arrow-none" data-toggle="dropdown"
                   role="button" aria-haspopup="true" aria-expanded="false">
                </a>
                <%--                <a class="nav-link dropdown-toggle arrow-none" data-toggle="dropdown"--%>
                <%--                   role="button" aria-haspopup="true" aria-expanded="false" id="currentLanguage">--%>
                <%--                    <img id="currentFlag" src="./images/flags/us.jpg" alt="user-image" class="mr-1" height="12">--%>
                <%--                    <span id="currentLanguageText" class="align-middle">--%>
                <%--                        <spring:message code="label.language" text="English"/>--%>
                <%--                    </span>--%>
                <%--                </a>--%>
                <%--                <a class="nav-link dropdown-toggle arrow-none" data-toggle="dropdown"--%>
                <%--                   role="button" aria-haspopup="true" aria-expanded="false">--%>
                <%--                    <img id="flagImage" src="./images/flags/us.jpg" alt="user-image" class="mr-1" height="12"> <span--%>
                <%--                        class="align-middle"><spring:message code="label.language" text="English"/></span>--%>
                <%--                </a>--%>
                <ul class="dropdown-menu"> <!-- "dropdown-menu" 클래스 추가 -->
                    <!-- 기본으로 보이는 "English" 항목 -->
                    <li>
                        <a href="?lang=ko" class="dropdown-item" style="cursor: pointer"
                           onmouseover="this.style.backgroundColor='#018085'; this.style.color='#ffffff'"
                           onmouseout="this.style.backgroundColor=''; this.style.color=''">
                            <img src="./images/flags/kr.jpg" alt="user-image" class="mr-1" height="12"> <span
                                class="align-middle">Korean</span>
                        </a>
                    </li>
                    <li>
                        <a href="?lang=en" class="dropdown-item notify-item selected" style="cursor: pointer"
                           onmouseover="this.style.backgroundColor='#018085'; this.style.color='#ffffff'"
                           onmouseout="this.style.backgroundColor=''; this.style.color=''">
                            <img src="./images/flags/us.jpg" alt="user-image" class="mr-1" height="12">
                            <span class="">English</span>
                        </a>
                    </li>
                    <!-- 나머지 언어 항목들 -->
                    <li>
                        <a href="?lang=de" class="dropdown-item notify-item" style="cursor: pointer"
                           onmouseover="this.style.backgroundColor='#018085'; this.style.color='#ffffff'"
                           onmouseout="this.style.backgroundColor=''; this.style.color=''">
                            <img src="./images/flags/germany.jpg" alt="user-image" class="mr-1" height="12"> <span
                                class="align-middle">German</span>
                        </a>
                    </li>
                    <li>
                        <a href="?lang=it" class="dropdown-item notify-item">
                            <img src="./images/flags/italy.jpg" alt="user-image" class="mr-1" height="12"> <span
                                class="align-middle">Italian</span>
                        </a>
                    </li>
                    <li>
                        <a href="?lang=es" class="dropdown-item notify-item">
                            <img src="./images/flags/spain.jpg" alt="user-image" class="mr-1" height="12"> <span
                                class="align-middle">Spanish</span>
                        </a>
                    </li>
                    <li>
                        <a href="?lang=ru" class="dropdown-item notify-item">
                            <img src="./images/flags/russia.jpg" alt="user-image" class="mr-1" height="12"> <span
                                class="align-middle">Russian</span>
                        </a>
                    </li>

                </ul>
            </li>
        </ul>

    </div>
    <%--로그인 구역--%>
    <div class="login-box">
        <c:if test="${not empty currentMember}">
            <c:choose>
                <c:when test="${currentMember.name == 'ADMIN'}">
                    <div class="signin">
                        <a href="${pageContext.request.contextPath}/userManagement"> <spring:message
                                code="link.dashboard" text="default text"/> </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="signin">
                        <a href="${pageContext.request.contextPath}/profile"> <spring:message
                                code="link.myProfile" text="default text"/> </a>
                    </div>
                </c:otherwise>
            </c:choose>
            <div class="signup">
                <a href="${pageContext.request.contextPath}/signout"> <spring:message
                        code="link.signOut" text="default text"/> </a>
            </div>
        </c:if>
        <c:if test="${empty currentMember}">
            <div class="signin">
                <a href="${pageContext.request.contextPath}/signin"><spring:message code="link.signIn"
                                                                                    text="default text"/></a>
            </div>
            <div class="signup">
                <a href="${pageContext.request.contextPath}/signup"> <spring:message code="link.signUp"
                                                                                     text="default text"/> </a>
            </div>
        </c:if>
    </div>

    <div class="menubar">
        <div class="st"><a
                href="<c:choose><c:when test="${not empty currentMember}">${pageContext.request.contextPath}/accountInfo</c:when><c:otherwise>${pageContext.request.contextPath}/signin</c:otherwise></c:choose>"><spring:message
                code="link.account" text="default text"/></a>
        </div>
        <div class="st"><a
                href="<c:choose><c:when test="${not empty currentMember}">${pageContext.request.contextPath}/walletInfo</c:when><c:otherwise>${pageContext.request.contextPath}/signin</c:otherwise></c:choose>"><spring:message
                code="link.wallet" text="default text"/></a></div>
        <div class="st"><a
                href="<c:choose><c:when test="${not empty currentMember}">${pageContext.request.contextPath}/exchange</c:when><c:otherwise>${pageContext.request.contextPath}/signin</c:otherwise></c:choose>"><spring:message
                code="link.exchange" text="default text"/></a>
        </div>
        <div class="st"><a
                href="<c:choose><c:when test="${not empty currentMember}">${pageContext.request.contextPath}/remittance</c:when><c:otherwise>${pageContext.request.contextPath}/signin</c:otherwise></c:choose>"><spring:message
                code="link.remittance" text="default text"/></a>
        </div>
    </div>

    <div class="blank">
    </div>
    <div class="blank">
    </div>
</div>

<script>

    $(document).ready(function () {
        const langMap = {
            'en': './images/flags/us.jpg',
            'ko': './images/flags/kr.jpg',
            'de': './images/flags/germany.jpg',
            'it': './images/flags/italy.jpg',
            'es': './images/flags/spain.jpg',
            'ru': './images/flags/russia.jpg'
        };

        const langTextMap = {
            'en': 'English',
            'ko': '한국어',
            'de': 'Deutsch',
            'it': 'Italiano',
            'es': 'Español',
            'ru': 'Русский'
        };

        const defaultLang = '<%= currentLang %>';
        if (defaultLang in langMap) {
            const imgSrc = langMap[defaultLang];
            const langText = langTextMap[defaultLang] || defaultLang;
            document.querySelector(".dropdown-toggle").innerHTML = '<img src="' + imgSrc + '" alt="user-image" class="mr-1" height="12"> <span class="align-middle">' + langText + '</span>';
        }

        $(".dropdown-item").click(function (event) {
            let selectedImg = $(this).find('img').attr('src');
            let selectedText = $(this).find('span').text();
            document.querySelector(".dropdown-toggle").innerHTML = '<img src="' + selectedImg + '" alt="user-image" class="mr-1" height="12"> <span class="align-middle">' + selectedText + '</span>';
        });
    });
</script>

<script>
    $(document).ready(function () {
        // Korean 선택 시
        $('a[href="?lang=ko"]').click(function () {
            $('#currentFlag').attr('src', './images/flags/kr.jpg');
            $('#currentLanguageText').text('Korean');
        });

        // English 선택 시
        $('a[href="?lang=en"]').click(function () {
            $('#currentFlag').attr('src', './images/flags/us.jpg');
            $('#currentLanguageText').text('English');
        });
    });
</script>
</body>
</html>