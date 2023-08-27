<%@ page import="com.kopo.hanaglobal.hana_global.web.entity.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%--<div id="loginModal" class="modal">
    <div class="modal-content">
        &lt;%&ndash;<span class="close">&times;</span>
        <div class="loginHeader">Login</div>&ndash;%&gt;
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

</script>--%>
</body>
</html>