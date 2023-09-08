<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
            crossorigin="anonymous"></script>

    <link href="./css/service-main.css" rel="stylesheet"/>
    <link href="./css/nav.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/wallet/walletInfo.css" rel="stylesheet"/>
    <link href="./css/wallet/flags.css" rel="stylesheet"/>

    <title>월렛 확인</title>
</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area">
        <%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
        <div class="main-body">
            <h2>View Wallets</h2>
            <div class="account">
                <div class="accountWrap">
                    <div class="account-header">
                        연결계좌
                    </div>
                    <div class="account-content">
                        <h4>하나은행</h4>
                    </div>
                    <div class="account-footer">
                        <div class="accountNo">
                            ${walletList[0].acNo}
                        </div>
                        <div class="locRight">
                            변경
                        </div>
                    </div>
                </div>
            </div>
            <c:forEach items="${walletList}" var="wallet" varStatus="loop" begin="0">

                <div class="walletCell" data-currency="${wallet.currencyCode}">
                    <div class="walletCard">
                        <div class="cardHeader">
                            <h4>Hana Wallet</h4>
<%--                            <span onclick="openModal()"><a>Load</a></span>--%>
<%--                            <span><button class="loadBtn" onclick="openModal()">Load</button></span>--%>
                            <button class="loadBtn" onclick="openModal()">Load</button>
                        </div>
                        <div class="cardElem1">
                            <a href="${pageContext.request.contextPath}/accountInfo"> ${wallet.balance}
                                &nbsp; ${wallet.currency} </a>
                        </div>
                        <div class="cardElem2">
                            <a href="${pageContext.request.contextPath}/accountInfo"> recurring exchange ></a>
                        </div>
                        <div class="cardElem3">
                            <div class="btn_p">
                                <a href="/curExchange">Exchange</a>
                            </div>
                            <div class="btn_s">
                                <a href="/overseaRemittance">Remittance</a>
                            </div>
                        </div>
                    </div>
                </div>

            </c:forEach>
        </div>
        <footer>
        </footer>
    </div>
    <%--    모달 창 구역 --%>
    <div id="myModal" class="modalContainer">
        <div class="modal-content">
            <div class="modal-header">
                <div class="authenticateHeader">충전하기</div>
                <span class="close" onclick="closeModal()">&times;</span>
            </div>

            <div class="modal-main">
                        <div class="mdiptWrap">
                            <div class="input-group">
                                <label>금액 </label>
                                </div>
                                <div>
                                <input type="text" class="" maxlength="20"
                                       placeholder="Name" title="Name" id="loadAmount" value=""
                                       name="loadAmount">
                            </div>
                            <div class="input-group">
                                <label>간편 비밀번호 </label>
                                </div>
                                <div>
                                <input type="password" class="" maxlength="6"
                                       placeholder="000000" title="간편 비밀번호 입력"
                                       id="walletAuthentication" value=""
                                       name="walletAuthentication">
                                </div>
                                <h6>최소 1000원 ~ 최대 2000원</h6>
                        </div>
<%--                    <div class="modal-main-right">--%>
<%--                    </div>--%>
            </div>
        </div>
    </div>
</div>
<script>
    // 모달 열기 함수
    function openModal() {
        document.getElementById("myModal").style.display = "block";
    }
    // 모달 닫기 함수
    function closeModal() {
        document.getElementById("myModal").style.display = "none";
    }
</script>
</body>
</html>
