<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- format 태그 라이브러리--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <script src="./js/account.js"></script>

    <script src="./js/wallet.js"></script>
    <link href="./css/service-main.css" rel="stylesheet"/>
    <link href="./css/nav.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/wallet/recurExchange.css" rel="stylesheet"/>
    <link href="./css/wallet/flags.css" rel="stylesheet"/>

    <%--    캘린더--%>
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.8.0/css/pikaday.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.8.0/pikaday.min.js"></script>

    <title>월렛 확인</title>
</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area">
        <%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
        <div class="main-body">
            <h2>Recur Currency</h2>
            <%--            월렛 카드 구역    --%>
            <div class="walletCell" data-currency="${selectedWallet.currencyCode}">
                <div class="walletCard">
                    <div class="cardHeader">
                        <h4>Hana Wallet</h4>
                        <button class="loadBtn">Load</button>
                    </div>
                    <div class="cardElem1">
                        <a href="${pageContext.request.contextPath}/accountInfo">
                            <fmt:formatNumber value="${selectedWallet.balance}" type="number" pattern="#,##0"/>
                            &nbsp; ${selectedWallet.currency} </a>
                    </div>
                    <div class="cardElem2">
                        <c:choose>
                            <c:when test="${selectedWallet.currencyCode == 'JPY' || selectedWallet.currencyCode == 'VND'}">
                                <span class="rateInfo">${selectedWallet.currencyCode} 100 = ${currencyCode.baseRate} Won</span>
                                <button id="updateRateBtn" style="background: none; border: none; cursor: pointer;">
                                    <img src="./images/update.png" alt="새로고침" width="20px" style="margin-bottom: 3px">
                                </button>
                            </c:when>
                            <c:otherwise>
                                <span class="rateInfo">${selectedWallet.currencyCode} 1 = ${currencyCode.baseRate} Won</span>
                                <button id="updateRateBtn" style="background: none; border: none; cursor: pointer;">
                                    <img src="./images/update.png" alt="새로고침" width="20px" style="margin-bottom: 3px">
                                </button>

                            </c:otherwise>
                        </c:choose>
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
            <%--            월렛 카드 구역 끝   --%>
            <%--         사용자에게 제공하는 정보 시작   --%>
            <div class="showBalance">
                <div class="balanceInfo col pt-1">
                    <div class="walletBalance">
                        Hana Wallet Balance (${walletKRW.currency})
                        <fmt:formatNumber value="${walletKRW.balance}" type="number" pattern="#,##0"/>
                    </div>
                    <div class="usdBalance">
                        USD Converted Balance
                    </div>
                    <div class="conversionOption">
                        option: 해당국적의 환율로도 보여주기
                    </div>
                </div>
<%--                계좌 구역 시작--%>
                <div class="row justify-content-start">
                    <div class="col-md-4 gradient-custom text-center text-black">
                    </div>

                    <div class="col-md-8 ">
                        <div class="card-body pe-5">
                            <div class="row">
                                <div class="col-5">
                                    <h6>Linked Account</h6>
                                    <h6>Hana Bank</h6>
                                </div>
                                <div class="account-image">
                                    <div class="myAccount"></div>
                                </div>
                            </div>
                            <hr class="mt-0 mb-3">
                            <div class="col-grid">
                                <div class="grid-left">
                                    <div class="row" style="height: 50px">
                                        <div class="col d-flex">
                                            <h6>Depositor name <br>
                                                <span class="text-bold"> Jane Smith</span>
                                            </h6>
                                        </div>
                                    </div>

                                </div>
                                <div class="col grid-right">
                                    <div class="col">
                                        <h6 class="text-start">Account Number</h6>
                                        <p class="text-muted">${selectedWallet.acNo}</p>
                                        <div class="locRight">
                                            Modify
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <%--                계좌 구역 끝--%>

            <%--         사용자에게 제공하는 정보 끝   --%>
            <div class="col pt-1 settingRecurring">
                <form action="${pageContext.request.contextPath}/autoExchange" method="post">
                    <table class="table table-hover mb-3 border-light">
                        <%--                        <tbody>--%>
                        <%--                        <tr>--%>
                        <%--                            <th scope="col" class="h5 text-black-50 border-light" style="width: 35%"></th>--%>
                        <%--                            <th scope="col" class="h5 text-dark border-light" style="width: 75%"></th>--%>
                        <%--                        </tr>--%>
                        <%--                        </tbody>--%>
                        <tbody>
                        <tr>
                            <th scope="row" class="text-start align-middle">Set End Date</th>
                            <td>
                                <div class="btnArea text-start align-middle">
                                    <%--                                    <input type="text" name="endDate" id="endDate"--%>
                                    <%--                                           placeholder="종료 날짜">--%>
                                    <input type="text" id="endDate" name="exchangeDate" readonly>
                                    <img src="https://image.kebhana.com/pbk/easyone/resource/img/btn/btn_calendar.gif"
                                         alt="Start Date Calendar Tab" onclick="openCalendar('endDate')">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row" class="text-start align-middle">Load Amount</th>
                            <td>
                                <div class="btnArea text-start align-middle">
                                    <input type="text" name="exchangeAmount" id="targetAmount"
                                           placeholder="Enter Amount">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row" class="text-start align-middle">Set Target Exchange Rate
                                <br/>(Based on Selling Rate)
                            </th>
                            <td>
                                <div class="btnArea text-start align-middle">
                                    <select id="rateSelect" onchange="updateHiddenInput()">
                                        <option value="threeMonths"> ${lowestRateThreeMonths.baseRate} Won (Lowest
                                            Amount Last Three Months)
                                        </option>
                                        <option value="lastMonth"> ${lowestRateLastMonth.baseRate} Won (Lowest Amount
                                            Last Month)
                                        </option>
                                        <option value="lastWeek"> ${lowestRateLastWeek.baseRate} Won (Lowest Amount Last
                                            Week)
                                        </option>
                                        <option value="custom"> Enter Manually</option>
                                    </select>

                                    <!-- 숨겨진 custom 입력 필드 추가 -->
                                    <div id="customInputContainer" style="display: none;">
                                        Enter Manually: <input type="text" id="customRateInput"
                                                               onkeyup="copyCustomValueToHidden()">
                                    </div>
                                    <!-- Hidden Inputs -->
                                    <input type="hidden" id="selectedRate" name="lowerBound" value="">
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <br/>
                    <div class="btnArea text-start align-middle">
                        <p>Check Hana Bank's announced exchange rate every 5 minutes<br/> and proceed with automatic
                            charging if it is lower or equal to the set exchange rate<br/>
                            자동환전이 결제될 시, 수수료는 1%<br/>
                            목표환율에 도달하지 못하면 마지막 날짜에 자동결제 됩니다
                        </p>
                    </div>

                    <div class="btn-area mt15 mb30">
                        <span class=" btn-pack btn-type-3 ui-btn-pack-a ui-set-btn-pack ui-set-btn-pack-event">
                        <a href="${pageContext.request.contextPath}/walletInfo" id="buttonCancel"
                           class="">Cancel</a></span>
                        <span class=" btn-pack btn-type-3c ui-btn-pack-button ui-set-btn-pack ui-set-btn-pack-event">
                        <button type="submit" class="" id="buttonConfirm">Confirm </button></span>
                    </div>
                    <input type="hidden" name="walletSeq" value="${selectedWallet.walletSeq}">
                    <input type="hidden" name="targetCurCode" value="${selectedWallet.currencyCode}">
                </form>
            </div>


        </div>
        <footer>
        </footer>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#updateRateBtn').on('click', function () {
            let currency = $('.walletCell').data('currency');
            $(this).addClass('rotating');  // 회전 시작
            $.ajax({
                url: "${pageContext.request.contextPath}/getLatestExchangeRate",
                method: "GET",
                data: {currency: currency},
                success: function (data) {
                    if (currency === 'JPY' || currency === 'VND') {
                        $('.cardElem2 .rateInfo').html(currency + " 100 = " + data.baseRate + " Won");
                    } else {
                        $('.cardElem2 .rateInfo').html(currency + " 1 = " + data.baseRate + " Won");
                    }
                },
                error: function () {
                    alert("Error fetching data!");
                },
                complete: function () {
                    $('.updateRateBtn').removeClass('rotating');  // 회전 중지
                }
            });
        });
    });

    // 목표환율 input에 입력
    function updateHiddenInput() {
        let selectedValue = document.getElementById('rateSelect').value;
        let hiddenInput = document.getElementById('selectedRate');

        if (selectedValue === "custom") {
            hiddenInput.value = document.getElementById('customRateInput').value;
            document.getElementById('customInputContainer').style.display = 'block';
        } else {
            let selectedText = document.getElementById('rateSelect').selectedOptions[0].textContent;
            let matchedRate = selectedText.match(/\d+(\.\d{1,2})?/); // 숫자와 소수점을 찾습니다.

            if (matchedRate && matchedRate[0]) {
                hiddenInput.value = matchedRate[0];
            }

            document.getElementById('customInputContainer').style.display = 'none';
        }
    }

    function copyCustomValueToHidden() {
        let customRate = document.getElementById('customRateInput').value;
        document.getElementById('selectedRate').value = customRate;
    }
    $(document).ready(function() {
        updateHiddenInput(); // 페이지 로딩 시 함수 호출하여 초기값 설정
    });

</script>
</body>
</html>
