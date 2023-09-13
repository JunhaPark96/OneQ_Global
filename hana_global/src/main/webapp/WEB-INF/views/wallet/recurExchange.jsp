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
                        <a href="${pageContext.request.contextPath}/accountInfo"> ${selectedWallet.balance}
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
            <div class="showBalance">
                <div class="col pt-1">
                    Hana Wallet Balance (${walletKRW.currency}) ${walletKRW.balance}<br/>
                    USD Converted Balance <br/>
                    option: 해당국적의 환율로도 보여주기
                </div>
                <div class="account">
                    <div class="accountWrap">
                        <div class="account-header">
                            Linked Accounts
                        </div>
                        <div class="account-content">
                            <h4>Hana Bank</h4>
                        </div>
                        <div class="account-footer">
                            <div class="accountNo">
                                ${selectedWallet.acNo}
                            </div>
                            <div class="locRight">
                                Modify
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col pt-1 settingRecurring">
                <form>
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
                                    <input type="text" id="endDate" name="endDate" readonly>
                                    <img src="https://image.kebhana.com/pbk/easyone/resource/img/btn/btn_calendar.gif"
                                         alt="Start Date Calendar Tab" onclick="openCalendar('endDate')">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row" class="text-start align-middle">Load Amount</th>
                            <td>
                                <div class="btnArea text-start align-middle">
                                    <input type="text" name="targetAmount" id="targetAmount"
                                           placeholder="Enter Amount">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row" class="text-start align-middle">Set Target Exchange Rate
                                <br/>(Based on Selling Rate)</th>
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
                                    <input type="hidden" id="selectedRate" name="selectedRate" value="">
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <br/>
                    <div class="btnArea text-start align-middle">
                        <p>Check Hana Bank's announced exchange rate every 5 minutes<br/> and proceed with automatic
                            charging if it is lower or equal to the set exchange rate</p>
                    </div>

                    <div class="btn-area mt15 mb30">
                        <span class=" btn-pack btn-type-3 ui-btn-pack-a ui-set-btn-pack ui-set-btn-pack-event">
                        <a href="${pageContext.request.contextPath}/walletInfo" id="buttonCancel"
                           class="">Cancel</a></span>
                        <span class=" btn-pack btn-type-3c ui-btn-pack-button ui-set-btn-pack ui-set-btn-pack-event">
                        <button type="submit" class="" id="buttonConfirm">Confirm </button></span>
                    </div>
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

    //     목표 환율 직접입력 선택 시
    function updateHiddenInput() {
        let select = document.getElementById("rateSelect");
        let selectedValue = select.options[select.selectedIndex].value;

        if (selectedValue === "custom") {
            // 직접입력 선택 시 별도의 입력 필드 보여주기
            document.getElementById("customInputContainer").style.display = "block";
        } else {
            document.getElementById("customInputContainer").style.display = "none";
        }
    }

    function copyCustomValueToHidden() {
        document.getElementById("selectedRate").value = document.getElementById("customRateInput").value;
    }
</script>
</body>
</html>
