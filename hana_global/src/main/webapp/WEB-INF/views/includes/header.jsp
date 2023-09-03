<%@ page import="com.kopo.hanaglobal.hana_global.web.entity.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <select id="language-select">
            <option value="en">English</option>
            <option value="ko">Korean</option>
            <!-- 기타 필요한 언어를 여기에 추가 -->
        </select>
    </div>
    <%--로그인 구역--%>
    <div class="login-box">
        <c:if test="${not empty currentMember}">
            <%--TODO: 마이페이지 구현--%>
            <div class="signin">MyProfile</div>
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
        <div class="st"><a href="<c:choose><c:when test="${not empty currentMember}">${pageContext.request.contextPath}/account</c:when><c:otherwise>${pageContext.request.contextPath}/signin</c:otherwise></c:choose>">Account</a></div>
        <div class="st"><a href="<c:choose><c:when test="${not empty currentMember}">${pageContext.request.contextPath}/hanawallet</c:when><c:otherwise>${pageContext.request.contextPath}/signin</c:otherwise></c:choose>">Hana Wallet</a></div>
        <div class="st"><a href="<c:choose><c:when test="${not empty currentMember}">${pageContext.request.contextPath}/exchange</c:when><c:otherwise>${pageContext.request.contextPath}/signin</c:otherwise></c:choose>">Exchange</a></div>
        <div class="st"><a href="<c:choose><c:when test="${not empty currentMember}">${pageContext.request.contextPath}/transfer</c:when><c:otherwise>${pageContext.request.contextPath}/signin</c:otherwise></c:choose>">Transfer</a></div>
    </div>

    <div class="blank">
    </div>
    <div class="blank">
    </div>
</div>

</body>
</html>