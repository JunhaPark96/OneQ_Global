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
                               title="Name" id="loadAmount" value=""
                               name="loadAmount">
                    </div>
                    <div class="btn-amount">
                        <button type="button"
                                class="btn bg-white  border-1  me-2 pushButton border-2"
                                onclick="selectAmount('10000')">10,000
                        </button>
                        <button type="button"
                                class="btn bg-white  border-1  me-2 pushButton border-2"
                                onclick="selectAmount('50000')">50,000
                        </button>
                        <button type="button"
                                class="btn bg-white  border-1  me-2 pushButton border-2"
                                onclick="selectAmount('100000')">100,000
                        </button>
                        <button type="button"
                                class="btn bg-white  border-1  me-2 pushButton border-2"
                                onclick="selectAmount('1000000')">1,000,000
                        </button>
                    </div>
                    <h6>최소 1000원 ~ 최대 2000원</h6>

                    <div class="input-group">
                        <label>간편 비밀번호 </label>
                    </div>
                    <div>
                        <input type="password" class="" maxlength="6"
                               placeholder="000000" title="간편 비밀번호 입력"
                               id="walletAuthentication" value=""
                               name="walletAuthentication">
                    </div>
                </div>
                <div class="modal-footer">
                        <button id="loadWallet" class="loadWallet" onclick="제출해야함">
                            충전
                        </button>
                </div>
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
    // 금액 선택
    function selectAmount(amount) {
        document.getElementById('loadAmount').value = amount;
    }
    // 원화 충전
    document.getElementById("loadWallet").addEventListener("click", function() {
        const loadAmount = document.getElementById('loadAmount').value;
        const walletAuthentication = document.getElementById('walletAuthentication').value;

        // 잔액 확인
        fetch("/checkBalance", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                loadAmount: loadAmount,
                walletAuthentication: walletAuthentication
            })
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) { // 잔액 확인 성공시
                    if (data.isEnough) { // 잔액이 충분할 경우
                        // 지갑 충전 API 호출
                        fetch("/loadWallet", {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/json"
                            },
                            body: JSON.stringify({
                                loadAmount: loadAmount,
                                walletAuthentication: walletAuthentication
                            })
                        })
                            .then(response => response.json())
                            .then(data => {
                                if (data.success) {
                                    alert("충전이 완료되었습니다.");
                                    closeModal(); // 모달 닫기
                                } else {
                                    alert("충전 중 오류가 발생했습니다.");
                                }
                            })
                    } else {
                        alert("계좌 잔액이 충분하지 않습니다.");
                    }
                } else {
                    alert("잔액 확인 중 오류가 발생했습니다.");
                }
            });
    });


</script>
</body>
</html>
