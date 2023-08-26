<%@ page import="com.kopo.hanaglobal.hana_global.web.entity.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap 5 CSS -->
</head>
<body>
<%--<%
    Member loginUser = (Member) session.getAttribute("loginUser");
%>--%>
<div class="header">
    <div class="logo">
        <a href="/">
            <img src="./images/hana_logo.png" class="hana_logo" alt="하나로고">
        </a>
    </div>
    <div class="language">
        <select id="language-select">
            <option value="en">English</option>
            <option value="ko">Korean</option>
            <!-- 기타 필요한 언어를 여기에 추가 -->
        </select>
    </div>
    <%--<div class="login-box">
        <div class="signin">Signin</div>
        <div class="signup">
            <a href="${pageContext.request.contextPath}/signup"> Signup </a>
        </div>
        <div class="signin">MyProfile</div>
        <div class="signup">SignOut</div>
    </div>--%>
    <div class="login-box">
    <c:if test="${not empty currentMember}">
        <div class="signin">MyProfile</div>
        <div class="signup">SignOut</div>
        <%--<a href="${pageContext.request.contextPath}/logout">SignOut--</a><br>--%>
    </c:if>
    <c:if test="${empty currentMember}">
        <%--<div class="signin">
            <a href="${pageContext.request.contextPath}/signin"> Signin </a>
        </div>--%>
<%--        <div class="signin" id="openLoginModal" onclick="openModal()">Signin</div>--%>
        <button id="signInBtn" onclick="openModal()">Sign In</button>

        <div class="signup">
            <a href="${pageContext.request.contextPath}/signup"> Sign Up </a>
        </div>
    </c:if>
    </div>


    <div class="menubar">
        <div class="st">Account</div>
        <div class="st">Hana Wallet</div>
        <div class="st">Exchange</div>
        <div class="st">Transfer</div>
    </div>

    <div class="blank">
        <hr>
        <hr>
    </div>
    <div class="blank">
        <hr>
    </div>
</div>

<!-- Login Modal -->
<div id="loginModal" class="modal">
    <div class="modal-content">
        <%--<span class="close">&times;</span>
        <div class="loginHeader">Login</div>--%>
            <div class="modal-header">
                <div class="loginHeader">Login</div>
                <span class="close">&times;</span>
            </div>
        <form action="/signinAction" method="post" class="loginInput">
            <div class="loginField loginId">
                <label for="username">Username</label>
                <input type="text" name="username" id="username" placeholder="Username" required>
            </div>
            <div class="loginField loginPw">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" placeholder="Password" required>
            </div>
            <div class="loginButton">
                <input type="submit" value="Login" class="loginBtn">
            </div>
        </form>
    </div>
</div>


<script>
    document.addEventListener("DOMContentLoaded", function() {
        var closeButton = document.querySelector(".close");
        var modal = document.getElementById("loginModal");

        closeButton.addEventListener("click", closeModal);
        window.addEventListener("click", outsideModalClick);
    });

</script>
</body>
</html>