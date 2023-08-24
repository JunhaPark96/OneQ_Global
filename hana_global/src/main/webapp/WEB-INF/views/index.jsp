<%@ page import="com.kopo.hanaglobal.hana_global.web.vo.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link href="css/header.css" rel="stylesheet" />
    <link href="css/TTF.css" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet">
</head>
<body>
<%
    MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
    String redirectURL = (loginUser == null) ? "/signUp" : "";
%>

<div class="main-container">
<%--    <%@ include file="/WEB-INF/views/includes/header.jsp" %>--%>
    <div class="header">
        <div class="logo">
            <a href="/">
                <img src="./images/hana_logo.png" class="hana_logo" alt="하나로고">
            </a>
        </div>
        <div class="login-box">
            <div class="signin">Signin</div>
            <div class="signup">Signup</div>
        </div>
        <div class="language">
            <select id="language-select">
                <option value="en">English</option>
                <option value="ko">Korean</option>
                <!-- 기타 필요한 언어를 여기에 추가 -->
            </select>
        </div>
    </div>
    <div class="main-area">
        <div class="main-left">
            <div class="card card1">
                <a href="<%= redirectURL != "" ? redirectURL : "/account" %>">
                    <div class="card-image card-image1" alt="계좌"></div>
                    <div class="card-text">
                        Account
                    </div>
                </a>
            </div>
            <div class="card card2">
                <a href="<%= redirectURL != "" ? redirectURL : "/exchange" %>">
                    <div class="card-image card-image2" alt="환전"></div>
                    <div class="card-text">
                        Exchange
                    </div>
                </a>
            </div>
            <div class="card card3">
                <a href="<%= redirectURL != "" ? redirectURL : "/pay" %>">
                    <div class="card-image card-image3" alt="페이"></div>
                    <div class="card-text">
                        기능3
                    </div>
                </a>
            </div>
            <div class="card card4">
                <a href="<%= redirectURL != "" ? redirectURL : "/transfer" %>">
                    <div class="card-image card-image4" alt="송금"></div>
                    <div class="card-text">
                        Transfer
                    </div>
                </a>
            </div>
        </div>

        <div class="main-right">
            <div class="main-info">
                <div class="main-image"></div>
                <div class="main-text">
                    <h3>All-In-One Banking System</h3> <br>
                    simpler<br>
                    easier<br>
                    faster
                </div>
            </div>
            <div class="user-info">
                <div class="loginHeader">ID Log in</div>
                <div class="loginInput">
                    <div class="loginField loginId">
                        <label for="userId" class="login">ID</label>
                        <input type="text" name="userId" id="userId" maxlength="15">
                    </div>
                    <div class="loginField loginPw">
                        <label for="userPw" class="login">Passwd</label>
                        <input type="password" name="password" id="userPw" maxlength="16">
                    </div>
                    <div class="loginButton">
                        <a href="index.html" class="loginBtn">Log In</a>
                    </div>
                </div>
            </div>


        </div>
    </div>
    <footer>
        게시판 링크: <a href="${pageContext.request.contextPath}/board"> 게시판 </a>
    </footer>
</div>

</body>

</html>