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
    <title>송금추적</title>
</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area">
        <%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
        <div class="">
            <h2>Overseas Remittance</h2>
            <form action="${pageContext.request.contextPath}/walletInfo" method="post" class="main-body">
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
                            송금내역
                        </button>
                    </div>
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>MTCN</th>
                            <th>Sender</th>
                            <th>Sender Country</th>
                            <th>Currency Code</th>
                            <th>Recipient</th>
                            <th>Recipient Country</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
<%--                    td: mtcn(임의로 생성된 9자리번호), sender, Korea Republic of, currencyCode, recipient, json에 통화코드와 매핑된 국가이름, status(승인상태),--%>
                        <c:forEach var="remittance" items="${remittanceList}">
                            <tr>
                                <td>${remittance.remitSeq}</td>  <!-- 임의의 9자리 번호를 사용 -->
                                <td>${remittance.sender}</td>
                                <td>Korea Republic of</td>  <!-- 임의의 값 -->
                                <td>${remittance.currencyCode}</td>
                                <td>${remittance.recipient}</td>
                                <td class="recipient-country" data-currency-code="${remittance.currencyCode}">
                                </td>
                                <td>${remittance.status}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </form>
        </div>


    </div>
    <footer>
    </footer>
</div>
<script>
    async function getCountryName(currencyCode) {
        const country = countriesInfo.find(country => country.currencyCode === currencyCode);
        return country ? country.nationality : null;
    }

    let countriesInfo;
    fetch('./json/country.json')
        .then(response => response.json())
        .then(data => {
            countriesInfo = data.countries;
            updateRecipientCountries();  // 데이터가 로드되면 이 함수를 호출합니다.
        });

    function updateRecipientCountries() {
        document.querySelectorAll('.recipient-country').forEach((td, index) => {
            const currencyCode = td.getAttribute('data-currency-code');
            getCountryName(currencyCode).then(countryName => {
                td.textContent = countryName || 'Unknown';
            });
        });
    }


</script>
</body>
</html>
