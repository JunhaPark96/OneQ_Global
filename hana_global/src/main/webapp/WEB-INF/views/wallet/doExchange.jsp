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
            <%--         사용자에게 제공하는 정보 시작   --%>
            <div class="showBalance">
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
                                            <h6>예금주명 <br>
                                                <span class="text-bold"> Jane Smith</span>
                                            </h6>
                                        </div>
                                    </div>

                                </div>
                                <div class="col grid-right">
                                    <div class="col">
                                        <h6 class="text-start">계좌번호</h6>
                                        <p class="text-muted">멤버의 계좌리스트</p>
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
            <%--         사용자에게 제공하는 정보 끝   --%>
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
</body>
</html>
