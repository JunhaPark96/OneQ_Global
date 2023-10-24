<%@ page import="com.kopo.hanaglobal.hana_global.web.entity.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="css/TTF.css" rel="stylesheet"/>
    <link href="css/main.css" rel="stylesheet">


    <script src="./js/main.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
        </div>
        <div class="main-body">

            <div class="main-left">
                <div class="main-info">
                    <div class="main-image"></div>
                    <div class="main-text">
                        <h3><spring:message code="allInOneBankingSystem"  /></h3>
                    </div>
                </div>
                <div class="card card1">
                    <a href="<%= redirectURL != "" ? redirectURL : "/account" %>">
                        <div class="card-area">
                            <div class="card-text-area">
                                <p class="text-header"><spring:message code="link.account"/></p>
                                <p class="card-text">
                                    <spring:message code="easyOnePackAccount"/>
                                </p>
                            </div>
                            <div class="card-image card-image1" alt="계좌"></div>
                        </div>
                    </a>
                </div>
                <div class="card card2">
                    <a href="<%= redirectURL != "" ? redirectURL : "/exchange" %>">
                        <div class="card-area">
                            <div class="card-text-area">
                                <p class="text-header"><spring:message code="exchange"/></p>
                                <p class="card-text">
                                    <spring:message code="exchangeDesc"/>
                            </div>
                            <div class="card-image card-image2" alt="환전"></div>
                        </div>
                    </a>
                </div>
            </div>

            <div class="main-right">

                <div class="card card3">
                    <a href="<%= redirectURL != "" ? redirectURL : "/walletInfo" %>">
                        <div class="card-image card-image3" alt="페이"></div>
                        <div class="card-area">
                            <div class="card-text-area">
                                <p class="text-header"><spring:message code="hanaWallet"/></p>
                                <p class="card-text">
                                    <spring:message code="hanaWalletDesc"/>
                                </p>
                            </div>
                            <div class="card-image card-image3" alt="하나월렛"></div>
                        </div>
                    </a>
                </div>
                <div class="card card4">
                    <a href="<%= redirectURL != "" ? redirectURL : "/remittance" %>">
                        <div class="card-area">
                            <div class="card-text-area">
                                <p class="text-header"><spring:message code="remittance"/></p>
                                <p class="card-text">
                                    <spring:message code="remittanceDesc"/>
                                </p>
                            </div>
                            <div class="card-image card-image4" alt="송금"></div>
                        </div>

                    </a>
                </div>

                <div class="main-info">
                <a href="${pageContext.request.contextPath}/readyToApply" style="text-decoration: none; color: black">
                    <div class="user-image"></div>
                    <div class="user-text">
                        <h3><spring:message code="openAccount"/></h3>
                        <spring:message code="openAccountDesc"/>
                    </div>
                </a>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</div>

</body>
</html>