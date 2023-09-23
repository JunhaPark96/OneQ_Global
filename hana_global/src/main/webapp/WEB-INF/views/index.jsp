<%@ page import="com.kopo.hanaglobal.hana_global.web.entity.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link href="css/header.css" rel="stylesheet"/>
    <link href="css/TTF.css" rel="stylesheet"/>
    <link href="css/main.css" rel="stylesheet">

    <script src="./js/main.js"></script>
</head>
<body>
<%
    Member loginUser = (Member) session.getAttribute("currentMember");
    String redirectURL = (loginUser == null) ? "/signin" : "";
%>

<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area">
        <div class="main-top">
            <%--<h1>All-In-One Banking System</h1>
            <p style=" margin-top: 0px; margin-bottom: 0px;">
            <h3>Global Digital Lounge</h3>
            An extensive global network reaching the world market
            </p>--%>
        </div>
        <div class="main-body">

            <div class="main-left">
                <div class="main-info">
                    <div class="main-image"></div>
                    <div class="main-text">
                        <h3>All-In-One <br>Banking System</h3> <br>
                    </div>
                </div>
                <div class="card card1">
                    <a href="<%= redirectURL != "" ? redirectURL : "/account" %>">
                        <div class="card-area">
                            <div class="card-text-area">
                                <p class="text-header">Account</p>
                                <p class="card-text">Easy-One Pack <br>
                                    Account</p>
                            </div>
                            <div class="card-image card-image1" alt="계좌"></div>
                        </div>
                        <%--<div class="card-text-border">
                            <p class="card-text">
                            Account
                            </p>
                        </div>--%>
                    </a>
                </div>
                <div class="card card2">
                    <a href="<%= redirectURL != "" ? redirectURL : "/exchange" %>">
                        <div class="card-area">
                            <div class="card-text-area">
                                <p class="text-header">Exchange</p>
                                <p class="card-text">
                                    Enjoy excellent <br>
                                    exchange rates <br>
                                    for 29 currencies</p>
                            </div>
                            <div class="card-image card-image2" alt="환전"></div>
                        </div>
                        <%--<div class="card-text-border">
                            <p class="card-text">
                            Exchange
                            </p>
                        </div>--%>
                    </a>
                </div>
            </div>

            <div class="main-right">

                <div class="card card3">
                    <a href="<%= redirectURL != "" ? redirectURL : "/walletInfo" %>">
                        <div class="card-image card-image3" alt="페이"></div>
                        <div class="card-area">
                            <div class="card-text-area">
                                <p class="text-header">Hana Wallet</p>
                                <p class="card-text">
                                    Experience an easier <br>
                                    banking system <br>
                                    with Hana Wallet
                                </p>
                            </div>
                            <div class="card-image card-image3" alt="하나월렛"></div>
                        </div>
                    </a>
                </div>
                <div class="card card4">
                    <a href="<%= redirectURL != "" ? redirectURL : "/transfer" %>">
                        <div class="card-area">
                            <div class="card-text-area">
                                <p class="text-header">Transfer</p>
                                <p class="card-text">
                                    Hana Bank supports<br>
                                    your overseas<br>
                                    remittance
                                </p>
                            </div>
                            <div class="card-image card-image4" alt="송금"></div>
                        </div>

                    </a>
                </div>

                <%-- <div class="user-info">
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
                 </div>--%>
                <div class="main-info">
                <a href="${pageContext.request.contextPath}/openAccount" style="text-decoration: none; color: black">
                    <div class="user-image"></div>
                    <div class="user-text">
                        <h3>Open Account</h3>
                        Open a Hana Bank account up to 14 days before you arrive in Korea, or up to three months after you arrive.
                    </div>
                </a>
                </div>
            </div>
        </div>
    </div>
    <footer>
        게시판 링크: <a href="${pageContext.request.contextPath}/boardlist"> 게시판 </a>
    </footer>
</div>

</body>
</html>