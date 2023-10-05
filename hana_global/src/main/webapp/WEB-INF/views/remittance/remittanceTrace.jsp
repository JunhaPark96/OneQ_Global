<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <%--    <link href="./css/bootstrap/bootstrap.min.css" rel="stylesheet"/>--%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <%--    <script src="./js/wallet.js"></script>--%>
    <link href="./css/service-main.css" rel="stylesheet"/>
    <link href="./css/nav.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <%--    <link href="./css/exchange/doExchange.css" rel="stylesheet"/>--%>
    <link href="./css/wallet/flags.css" rel="stylesheet"/>
    <link href="./css/remittance/remittanceTrace.css" rel="stylesheet"/>

    <script src="./js/remittance.js"></script>

    <title>송금추적</title>
</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area">
        <%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
        <div class="main-body">
            <h2>Overseas Remittance</h2>
            <div class="showRemittanceDetails">

                <div class="fs-5" style="color: #bdbdbd">Remittance / <strong style="color: #000000">Tracing
                    Remittance</strong>
                </div>
                <br/>
                <div class="col-12 d-flex p-0" style="background-color: #eceff1; border-radius: 10px 10px 0px 0px">
                    <button id="hold_history" type="button"
                            class="col-12 text-center border-0 pt-3 pb-3 fs-5 bg-hanagreen"
                            style="font-family: hanaM; color: #ffffff; border-radius: 10px 0px 0px 0px"
                            onclick="click_hold_history()">
                        Remittance History
                    </button>
                </div>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <%--                            <th>MTCN</th>--%>
                        <th></th>
                        <th>Sender</th>
                        <th>Sender Account No.</th>
                        <th>Sender Country</th>
                        <th>Currency Code</th>
                        <th>Recipient</th>
                        <%--                            <th>Recipient Country</th>--%>
                        <th>Remittance Amount (KRW)</th>
                        <th>Issue Date</th>
                        <th>Status</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%--                    td: mtcn(임의로 생성된 9자리번호), sender, Korea Republic of, currencyCode, recipient, json에 통화코드와 매핑된 국가이름, status(승인상태),--%>
                    <c:forEach var="remittance" items="${remittanceList}">
                        <tr>
                            <td><input type="radio" name="remittanceRadio" value="${remittance.remitSeq}"/></td>
                                <%--                                <td>${remittance.remitSeq}</td>  --%>
                            <td>${remittance.sender}</td>
                            <td>${remittance.senderAc}</td>
                            <td>Korea Republic of</td>  <!-- 임의의 값 -->
                            <td>${remittance.currencyCode}</td>
                            <td>${remittance.recipient}</td>
                            <td>${remittance.remitAmount}</td>
                            <td>${remittance.tradeDate}</td>
                                <%--                                <td class="recipient-country" data-currency-code="${remittance.currencyCode}">--%>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${remittance.status eq 'Y'}">Completed</c:when>
                                    <c:when test="${remittance.status eq 'N'}">In Progress</c:when>
                                    <c:when test="${remittance.status eq 'W'}">Awaiting Recipient</c:when>
                                    <c:otherwise>Unknown</c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <div>
                    <button onclick="showRemittanceDetails()">Notify Recipient</button>
                </div>
            </div>
        </div>

        <%--        송금내역 상세 모달창 시작--%>
        <div class="modal fade" id="remittanceModal" tabindex="-1" aria-labelledby="remittanceModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="remittanceModalLabel">Remittance Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Remittance details will go here -->
                        <div>
                            Please share the following information with the recipient of the international remittance
                        </div>
                        <div id="modalContent" class="modal-details">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="email" id="emailAddress" placeholder="Email Address" required>
                        <%--                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Send Email</button>--%>
                        <button type="button" class="btn btn-secondary" onclick="sendEmail()">Send Email</button>

                    </div>
                </div>
            </div>
        </div>
        <%--        송금내역 상세 모달창 끝--%>

    </div>
    <footer>
    </footer>
</div>
<script>
    let remittanceList = [];

    <c:forEach var="data" items="${remittanceList}">
    remittanceList.push({
        remitSeq: "${data.remitSeq}",
        walletSeq: "${data.walletSeq}",
        sender: "${data.sender}",
        recipient: "${data.recipient}",
        senderAc: "${data.senderAc}",
        remitAmount: "${data.remitAmount}",
        receivableAmount: "${data.receivableAmount}",
        currencyCode: "${data.currencyCode}",
        address: "${data.address}",
        tradeDate: "${data.tradeDate}",
        status: "${data.status}"
    });
    </c:forEach>

    console.log("송금정보는", remittanceList);

    async function getCountryName(currencyCode) {
        const country = countriesInfo.find(country => country.currencyCode === currencyCode);
        return country ? country.nationality : null;
    }

    let countriesInfo;
    fetch('./json/country.json')
        .then(response => response.json())
        .then(data => {
            countriesInfo = data.countries;
            updateRecipientCountries(); // 데이터가 로드되면 이 함수를 호출합니다.
        });

    function updateRecipientCountries() {
        document.querySelectorAll('.recipient-country').forEach((td, index) => {
            const currencyCode = td.getAttribute('data-currency-code');
            getCountryName(currencyCode).then(countryName => {
                td.textContent = countryName || 'Unknown';
            });
        });
    }

    function showRemittanceDetails() {
        const selectedValue = document.querySelector('input[name="remittanceRadio"]:checked').value;
        // 선택된 remittance의 정보를 찾아서 모달에 표시
        const details = remittanceList.find(remittance => remittance.remitSeq.toString() === selectedValue);
        console.log("선택된 송금정보는", selectedValue);
        console.log("디테일은", details);

        if (details) {
            getCountryName(details.currencyCode).then(countryName => {
                const modalContent = document.getElementById('modalContent');
                const status = details.status;
                const statusText = status == 'W' ? 'Awaiting Recipient' : status == 'N' ? 'In Progress' : 'Completed';
                const htmlString =
                    "<div class='step " + (status == 'N' ? "current-step" : "") + "'>In Progress</div>" +
                    "<div class='step " + (status == 'W' ? "current-step" : "") + "'>Awaiting Recipient</div>" +
                    "<div class='step " + (status == 'C' ? "current-step" : "") + "'>Completed</div>" +
                    "<div class='modal-details-title'>[Sender Information]</div>" +
                    "<div class='modal-details-content'>" +
                    "<p>MTCN: " + details.remitSeq + "</p>" +
                    "<p>Sender: " + details.sender + "</p>" +
                    "<p>Sender's Country: South of Korea</p>" +
                    "<p>Remittance Amount: " + details.currencyCode + " " + details.receivableAmount + "</p>" +
                    "</div>" +
                    "<div class='modal-details-title'>[Recipient Information]</div>" +
                    "<div class='modal-details-content'>" +
                    "<p>Recipient: " + details.recipient + "</p>" +
                    "<p>Recipient's Country: " + (countryName || 'Unknown') + "</p>" +
                    "</div>";

                modalContent.innerHTML = htmlString;

                // 모달 열기
                const remittanceModal = new bootstrap.Modal(document.getElementById('remittanceModal'), {});
                remittanceModal.show();
            });
        }
    }


    // 이메일 보내기
    function sendEmail() {
        let selectedValue = document.querySelector('input[name="remittanceRadio"]:checked').value;
        let details = remittanceList.find(remittance => remittance.remitSeq.toString() === selectedValue);
        // 입력받은 이메일 주소
        let emailAddress = document.getElementById('emailAddress').value;
        if (details) {
            getCountryName(details.currencyCode).then(countryName => {
                let emailContent =
                    '<html>' +
                    '<body>' +
                    '<div style="margin-bottom: 10px;">' +
                    '<div style="font-weight: bold; margin-bottom: 5px;">[' +
                    (details.status == 'W' ? 'Awaiting Recipient' : details.status == 'N' ? 'In Progress' : 'Completed') +
                    ']</div>' +
                    '<div style="margin-left: 10px;">' +
                    '<div style="font-weight: bold; margin-bottom: 5px;">Remittance Information</div>' +
                    '<p>MTCN: ' + details.remitSeq + '</p>' +
                    '<p>Sender: ' + details.sender + '</p>' +
                    '<p>Sender\'s Country: South of Korea</p>' +
                    '<p>Remittance Amount: ' + details.currencyCode + ' ' + details.receivableAmount + '</p>' +
                    '</div>' +
                    '<div style="font-weight: bold; margin-bottom: 5px;">Recipient Information</div>' +
                    '<div style="margin-left: 10px;">' +
                    '<p>Recipient: ' + details.recipient + '</p>' +
                    '<p>Recipient\'s Country: ' + (countryName || 'Unknown') + '</p>' +
                    '</div>' +
                    '</div>' +
                    '</body>' +
                    '</html>';

                $.ajax({
                    url: '/send-email',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        content: emailContent,
                        to: emailAddress,
                        subject: 'Western Union Receipt'
                    }),
                    success: function (response) {
                        alert('Email sent successfully');
                    },
                    error: function (error) {
                        alert('Failed to send email');
                    }
                });
            });
        }
    }

</script>
</body>
</html>