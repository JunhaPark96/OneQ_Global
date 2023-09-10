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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script src="./js/wallet.js"></script>
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
                            <button class="loadBtn" onclick="openModal(${wallet.walletSeq})">Load</button>
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
                               id="walletPasswd" value=""
                               name="walletPasswd">
                    </div>
                </div>
                <div class="modal-footer">
                        <button id="loadWallet" class="loadWallet" >
                            충전
                        </button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    <%--// 모달 열기 함수--%>
    <%--function openModal(walletSeq) {--%>
    <%--    document.getElementById("myModal").setAttribute("data-wallet-id", walletSeq); // 월렛 지정--%>
    <%--    document.getElementById("myModal").style.display = "block";--%>
    <%--    document.getElementById('loadAmount').value = null;--%>
    <%--    document.getElementById('walletPasswd').value = null;--%>
    <%--}--%>


    <%--// 모달 닫기 함수--%>
    <%--function closeModal() {--%>
    <%--    document.getElementById("myModal").style.display = "none";--%>
    <%--}--%>
    <%--// 금액 선택--%>
    <%--function selectAmount(amount) {--%>
    <%--    document.getElementById('loadAmount').value = amount;--%>
    <%--}--%>

    <%--let walletSeq = document.getElementById("myModal").getAttribute("data-wallet-id");--%>
    <%--document.getElementById("loadWallet").addEventListener("click", function() {--%>
    <%--    let loadAmount = document.getElementById('loadAmount').value;--%>
    <%--    const walletPasswd = document.getElementById('walletPasswd').value;--%>

    <%--    // loadAmount를 정수로 변환--%>
    <%--    loadAmount = parseInt(loadAmount, 10);--%>

    <%--    // NaN 확인 (parseInt에서 유효하지 않은 값이 입력되면 NaN을 반환합니다)--%>
    <%--    if (isNaN(loadAmount)) {--%>
    <%--        alert("loadAmount 값을 확인해주세요.");--%>
    <%--        return;--%>
    <%--    }--%>

    <%--    $.ajax({--%>
    <%--        url: "/loadWallet",--%>
    <%--        method: "POST",--%>
    <%--        data: {--%>
    <%--            loadAmount: loadAmount, // 이제 loadAmount는 정수--%>
    <%--            walletPasswd: walletPasswd,--%>
    <%--            walletSeq: walletSeq  // 추가된 월렛 ID--%>
    <%--        },--%>
    <%--        success: function(data) {--%>
    <%--            alert(data);--%>
    <%--            closeModal();--%>
    <%--            let walletElem = document.querySelector(".cardElem1 a");--%>
    <%--            walletElem.textContent = `${data.newBalance} KRW`; // 잔액을 "KRW"와 함께 표시합니다. 필요에 따라 화폐 단위를 변경하십시오.--%>
    <%--            console.log(`${data.newBalance}`);--%>
    <%--        },--%>
    <%--        error: function(jqXHR, textStatus, errorThrown) {--%>
    <%--            alert(jqXHR.responseText || errorThrown);--%>
    <%--        }--%>
    <%--    });--%>
    <%--});--%>
    // 모달 열기 함수
    function openModal(walletSeq) {
        document.getElementById("myModal").setAttribute("data-wallet-id", walletSeq); // 월렛 지정
        document.getElementById("myModal").style.display = "block";
        document.getElementById('loadAmount').value = null;
        document.getElementById('walletPasswd').value = null;
    }

    // 모달 닫기 함수
    function closeModal() {
        document.getElementById("myModal").style.display = "none";
    }

    // 금액 선택
    function selectAmount(amount) {
        document.getElementById('loadAmount').value = amount;
    }

    document.getElementById("loadWallet").addEventListener("click", function() {
        // 이 위치에서 walletSeq 값을 다시 가져옵니다.
        let walletSeq = document.getElementById("myModal").getAttribute("data-wallet-id");

        let loadAmount = document.getElementById('loadAmount').value;
        const walletPasswd = document.getElementById('walletPasswd').value;

        // loadAmount를 정수로 변환
        loadAmount = parseInt(loadAmount, 10);

        // NaN 확인 (parseInt에서 유효하지 않은 값이 입력되면 NaN을 반환합니다)
        if (isNaN(loadAmount)) {
            alert("loadAmount 값을 확인해주세요.");
            return;
        }

        $.ajax({
            url: "/loadWallet",
            method: "POST",
            data: {
                loadAmount: loadAmount, // 이제 loadAmount는 정수
                walletPasswd: walletPasswd,
                walletSeq: walletSeq  // 추가된 월렛 ID
            },
            success: function(response) {
                alert(response); // "충전 성공!" 또는 서버에서 반환된 다른 메시지를 표시
                closeModal();
                location.reload(); // 월렛 정보를 업데이트하기 위해 페이지를 다시 로드합니다.
            },
            error: function(jqXHR) {
                alert(jqXHR.responseText); // 서버에서 반환된 에러 메시지를 표시
            }
        });
    });

</script>
</body>
</html>
