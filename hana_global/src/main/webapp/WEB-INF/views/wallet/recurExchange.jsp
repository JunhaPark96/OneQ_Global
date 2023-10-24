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
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.8.0/css/pikaday.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.8.0/pikaday.min.js"></script>
    <%--    차트 js--%>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-zoom@0.7.3"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.css">
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
                    </div>
                    <div class="baseRateNote">
                        Balance
                    </div>
                    <div class="cardElem1">
                        <a href="${pageContext.request.contextPath}/accountInfo">
                            <fmt:formatNumber value="${selectedWallet.balance}" type="number" pattern="#,##0"/>
                            ${selectedWallet.currency} </a>
                    </div>
                    <div class="baseRateNote">
                        baseRate
                    </div>
                    <div class="cardElem2">
                        <c:choose>
                            <c:when test="${selectedWallet.currencyCode == 'JPY' || selectedWallet.currencyCode == 'VND'}">
                                <span class="rateInfo">${selectedWallet.currencyCode} 100 = <span
                                        style="color: red"> ${currencyCode.baseRate} Won </span> </span>
                                <button id="updateRateBtn" style="background: none; border: none; cursor: pointer;">
                                    <img src="./images/update.png" alt="새로고침" width="20px" style="margin-bottom: 3px">
                                </button>
                            </c:when>
                            <c:otherwise>
                                <span class="rateInfo">${selectedWallet.currencyCode} 1 = <span
                                        style="color: red"> ${currencyCode.baseRate} Won </span></span>
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
                <canvas id="exchangeRateChart" width="400" height="300"></canvas>
            </div>
            <%--                계좌 구역 끝--%>

            <%--         사용자에게 제공하는 정보 끝   --%>
            <div class="col pt-1 settingRecurring">
                <form action="${pageContext.request.contextPath}/autoExchange" method="post">
                    <table class="table table-hover mb-3 border-light">

                        <tbody>
                        <tr>
                            <th scope="row" class="text-start align-middle">Set End Date</th>
                            <td>
                                <div class="btnArea text-start align-middle">
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
                                    <input type="hidden" id="selectedRate" name="lowerBound" value="">
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <br/>
                    <div class="btnArea text-start align-middle">
                        <p>Check Hana Bank's announced exchange rate every 5 minutes<br/> and proceed with automatic
                            charging if it is lower or equal to the set exchange rate<br/><br/>
                            When automatic currency conversion is initiated upon payment, a fee of 1% will be
                            applied.<br/>
                            If the target exchange rate is not reached, it will be automatically canceled on the last
                            day.
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
<%-- 환율 그래프 --%>
<script>
    let myChart;
    let currencyCode = "${currencyCode.currencyCode}";
    $(document).ready(function () {
        initializeChart();

        function initializeChart() {
            let currentDate = new Date().toISOString().split('T')[0]; // 현재 날짜
            let currency = currencyCode;
            console.log("현재날짜", currentDate);
            console.log("선택된 통화", currency);
            $.ajax({
                url: '${pageContext.request.contextPath}/exchange/lastSixMonths',
                method: 'post',
                contentType: 'application/json',
                data: JSON.stringify({
                    currency: currency,
                    endDate: currentDate
                }),
                success: function (data) {
                    console.log(data);
                    let rateDates = [];
                    let baseRates = [];
                    console.log(rateDates);
                    console.log(baseRates);

                    for (let i = 0; i < data.length; i++) {
                        let rawDate = data[i].rateDate;
                        let formattedDate = new Date(rawDate).toISOString().split('T')[0];
                        rateDates.push(formattedDate);
                        baseRates.push(data[i].baseRate);
                    }

                    let ctx = document.getElementById('exchangeRateChart').getContext('2d');
                    if (myChart) {
                        myChart.destroy();
                    }
                    myChart = new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: rateDates,
                            datasets: [{
                                label: 'Base Rate',
                                data: baseRates,
                                borderColor: 'rgb(75, 192, 192)',
                                borderWidth: 1,
                                fill: true,
                                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                pointRadius: 0,
                                pointHitRadius: 10
                            }]
                        },
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        },
                        plugins: {
                            zoom: {
                                pan: {
                                    enabled: true,
                                    mode: 'xy',
                                    speed: 0.1,
                                    threshold: 10
                                },
                                zoom: {
                                    enabled: true,
                                    drag: true,
                                    mode: 'xy',
                                    speed: 0.1,
                                    threshold: 2,
                                    sensitivity: 3
                                }
                            }
                        }
                    });
                    myChart.options.plugins.zoom.zoom.enabled = true;
                    myChart.options.plugins.zoom.pan.enabled = true;
                },
                error: function (jqXHR) {
                    console.log(jqXHR.responseText);
                    alert('Error code: ' + jqXHR.status + '. Error message: ' + jqXHR.responseText);
                }
            });
        }
    });

</script>
<%-- 환율 그래프 끝--%>
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

    $(document).ready(function () {
        updateHiddenInput();
    });

</script>
</body>
</html>
