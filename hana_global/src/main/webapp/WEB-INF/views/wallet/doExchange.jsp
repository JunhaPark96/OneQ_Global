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
    <link href="./css/exchange/doExchange.css" rel="stylesheet"/>
    <link href="./css/wallet/flags.css" rel="stylesheet"/>
    <title>월렛 확인</title>
</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area">
        <%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
        <div class="">
            <form action="${pageContext.request.contextPath}/walletInfo" method="post" class="main-body">
                <h2>Currency Exchange</h2>
                <%--         연결계좌, 비밀번호 입력   --%>
                <div class="Authenticate">
                    <div class="col-md-12>                                                                                                                                                                                                                                                                      ">
                        <div class="card-body pe-5">
                            <table class="table table-hover border-light">
                                <tbody>
                                <%--                                계좌 선택 --%>
                                <tr class="text border-light">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Select</th>
                                    <td>
                                        <select class="form-select border-3 w-60" name="senderAccountNo"
                                                id="selectAccountForm" onchange="changeBalance()" style="height: 45px;">
                                            <option value="" selected disabled>Choose Payment Method</option>

                                            <optgroup label="Accounts">
                                                <c:forEach items="${accountList}" var="account">
                                                    <option value="${account.acNo}" data-balance="${account.balance}">
                                                            ${account.acNo}
                                                    </option>
                                                </c:forEach>
                                            </optgroup>

                                            <optgroup label="Hana Wallet">
                                                <option value="HANA Wallet" data-balance="${walletKRW.balance}">
                                                    KRW Wallet
                                                </option>
                                            </optgroup>

                                        </select>
                                    </td>
                                </tr>

                                <tr class="border-light">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Balance</th>
                                    <td>
                                        <div class="btnArea" id="btnFclArea">
                                            <%--                                            <input type="text" name="accountBalance" id="accountBalance"--%>
                                            <%--                                                   placeholder="balance" maxlength="20" readonly/>--%>
                                            <p class="text-start align-middle" id="accountBalance"></p>
                                        </div>
                                    </td>
                                </tr>

                                <tr class="border-light">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Password</th>
                                    <td>
                                        <input type="password" name="account_password" id="account_password"
                                               placeholder="password" maxlength="6"/>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            Preferential rate is 100% with Hana Money!
                        </div>
                    </div>
                </div>
                <%--            연결계좌, 비밀번호 입력 --%>
                <%--         환율 정보 시작   --%>
                <div class="showExchangeRate">
                    <table>
                        <caption>ExchangeRate Info</caption>
                        <colgroup>
                            <col style="width: 55%;">
                            <col style="width: 35%;">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>When making a remittance</th>
                            <td><span class="txt"><em class="point" id="remittance"></em></span></td>
                        </tr>
                        <tr>
                            <th>Receiving</th>
                            <td><span class="txt"><em class="point" id="receiving"></em></span></td>
                        </tr>
                        <tr>
                            <th>Buying</th>
                            <td><span class="txt"><em class="point" id="buying"></em></span></td>

                        </tr>
                        <tr>
                            <th>When selling</th>
                            <td><span class="txt"><em class="point" id="selling"></em></span></td>
                        </tr>
                        </tbody>
                    </table>

                </div>
                <%--         환율 정보 끝   --%>


                <%--          환전 계산 시작 --%>
                <div class="compare_area">
                    <div class="compare_section">
                        <%--                    Source 통화 섹션 --%>
                        <div class="fr_info">
                            <div id="ds_sel" class="sbox">
                                <div class="selectbox_box _select_box">
                                    <div class="selectbox_label _trigger">
                        <span class="nation_usd _flag">
                            <img src="./images/walletIcon_USD.png" class="_img" alt="미국 USD" width="30px" height="30px">
                        </span>
                                        <label class="_text">United States <em>USD</em></label>
                                    </div>
                                    <div class="ch_wrap_ly ly_rate scroll _list" style="display: none;">
                                        <ul class="ly_cont _l" id="sourceCurrencyList">
                                            <c:forEach var="rate" items="${exchangeList}">
                                                <li class="_i" data-value="${rate.currencyCode}">
                                                    <a onclick="currencySelected('${rate.currencyCode}', true);"
                                                       href="javascript:void(0);">
                                                        <span id="countryNameFor_${rate.currencyCode}">${currencyNames[rate.currencyCode]}</span>
                                                        <em>${rate.currencyCode}</em>
                                                    </a>
                                                </li>
                                            </c:forEach>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="input_box _input_box">
                <span id="drt_from_span" class="input">
                    <input id="ds_from_money" maxlength="15" type="text" style="ime-mode:disabled;" value="1"
                           class="_input input_text">
                </span>
                                <span class="recite _recite" id="sourceCurrencyName"></span>
                            </div>
                        </div>
                        <%--                    Conversion 아이콘 --%>
                        <span class="ico_same"><span class="blind">=</span></span>
                        <%--                    Target 통화 섹션--%>
                        <div class="fr_info">
                            <div id="ds_sel2" class="sbox _select_box">
                                <div class="selectbox_box">
                                    <div class="selectbox_label _trigger">
                        <span class="nation_krw _flag">
                            <img src="./images/walletIcon_KRW.png" class="_img"
                                 alt="대한민국 KRW" width="30px" height="25px">
                        </span>
                                        <label for="ds_to_money" class="_text">Republic of Korea <em>KRW</em></label>
                                    </div>
                                    <div class="ch_wrap_ly ly_rate2 scroll _list" style="display: none">
                                        <ul class="ly_cont" id="targetCurrencyList">
                                            <c:forEach var="rate" items="${exchangeList}">
                                                <li class="_i" data-value="${rate.currencyCode}">
                                                    <a onclick="currencySelected('${rate.currencyCode}', false);"
                                                       href="javascript:void(0);">
                                                        <span id="countryNameFor_${rate.currencyCode}">${currencyNames[rate.currencyCode]}</span>
                                                        <em>${rate.currencyCode}</em>
                                                    </a>
                                                </li>
                                            </c:forEach>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="input_box _input_box">
                <span id="drt_to_span" class="input">
                    <input id="ds_to_money" type="text" style="ime-mode:disabled;" value="1,327.90"
                           class="_input input_text">
                </span>
                                <span class="recite _recite result" id="targetCurrencyName"></span>
                            </div>
                        </div>
                        <p class="cal_txt _noservice"></p></div>
                    <div class="btn-area" style="text-align: right">
                <span class=" btn-pack btn-type-3c ui-btn-pack-button ui-set-btn-pack ui-set-btn-pack-event">
                        <button type="button" class="" id="calExchange">계산 </button></span>
                    </div>
                </div>
                <%--          환전 계산 끝 --%>


                <%--        결제 정보 미리보기 시작    --%>
                <div class="col pt-1 previewPayment" style="display: none">
                    <%--                    <div class="btnArea text-start align-middle">--%>
                    <%--                        <p>Check Hana Bank's announced exchange rate every 5 minutes<br/> and proceed with automatic--%>
                    <%--                            charging if it is lower or equal to the set exchange rate</p>--%>
                    <%--                    </div>--%>

                    <div class="banking-wrap input-focus-wrap">
                        <div class="title-cont">
                            <h5>Confirm the amount before topping up</h5>
                        </div>
                        <br/>
                        <div class="banking-cont">
                            <table summary="환전신청금액,결제하실 금액(원),결제방법(으)로 이루어진 결제정보1 테이블입니다.">
                                <%--                                <caption>결제정보1</caption>--%>
                                <colgroup>
                                    <col style="width: 500px"/>
                                </colgroup>

                                <tbody>
                                <tr>
                                    <th>Foreign exchange application amount</th>
                                    <td>
									<span class="txt">
										<img src="./images/walletIcon_.png" style="width: 30px; height: 30px"
                                             alt="국기" class="flag">
										<em class="currency"></em>
										<em class="price">10</em>
									</span>
                                    </td>
                                </tr>

                                <tr>
                                    <th>The amount you will be paying(Won)</th>
                                    <td><span class="txt"><em class="point"></em></span></td>
                                </tr>

                                <tr>
                                    <th>Payment method</th>
                                    <td><span class="txt"></span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="btn-area mt15 mb30">
                        <span class=" btn-pack btn-type-3 ui-btn-pack-a ui-set-btn-pack ui-set-btn-pack-event">
                        <a href="${pageContext.request.contextPath}/walletInfo" id="buttonCancel"
                           class="">Cancel</a></span>
                        <span class=" btn-pack btn-type-3c ui-btn-pack-button ui-set-btn-pack ui-set-btn-pack-event">
                        <button type="submit" class="" id="buttonConfirm">Topping up </button></span>
                    </div>
                </div>

            </form>
        </div>
        <footer>
        </footer>
    </div>
</div>
<script>

    // 환율 정보 저장
    let exchangeRates = {};
    <c:forEach var="rate" items="${exchangeList}">
    exchangeRates["${rate.currencyCode}"] = {
        baseRate: ${rate.baseRate},
        usdConversionRate: ${rate.usdConversionRate},
        remittance: ${rate.remittance},
        receiving: ${rate.receiving},
        buyRate: ${rate.buyRate},
        sellRate: ${rate.sellRate}
    };
    </c:forEach>
</script>


<script src="./js/exchange.js"></script>
<script>
    // 페이지 로딩이 완료되었을 때 실행될 함수
    document.addEventListener("DOMContentLoaded", function () {
        // 기본 통화를 USD로 설정
        currencySelected("USD", true); // Source를 USD로 설정
        // currencySelected("KRW", false); // 이렇게 해서 대상 통화도 초기 설정할 수 있습니다.
    });

</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        // 계산 버튼에 이벤트 리스너 추가
        document.getElementById("calExchange").addEventListener("click", function () {
            calculateAndPreviewPayment();
        });
    });

    // 결제 창 보이기 및 환전금액 계산
    function calculateAndPreviewPayment() {
        // Source에서 입력된 금액 및 통화를 가져옵니다.
        const sourceAmount = parseFloat(document.getElementById("ds_from_money").value);
        const sourceCurrencyImageSrc = document.querySelector(".nation_usd ._img").src;
        const sourceCurrencyCode = document.querySelector(".selectbox_label ._text em").textContent;
        const countryName = currencyNames[sourceCurrencyCode];
        document.querySelector(".previewPayment").style.display = "block";
        // Target에서의 계산된 금액을 가져옵니다. (금액의 콤마를 제거)
        const targetAmount = parseFloat(document.getElementById("ds_to_money").value.replace(/,/g, ""));

        // 1% 수수료를 추가하고 10의 단위로 반올림
        const adjustedAmount = targetAmount * 1.01;
        const finalAmountWithoutDecimal = Math.round(adjustedAmount);
        const finalAmount = Math.round(finalAmountWithoutDecimal / 10) * 10;


        // previewPayment 영역을 업데이트
        const previewElem = document.querySelector(".previewPayment .banking-cont table tbody");

        previewElem.querySelector("tr:nth-child(1) .txt img").src = sourceCurrencyImageSrc;
        previewElem.querySelector("tr:nth-child(1) .txt em.currency").textContent = countryName + " " + sourceCurrencyCode;
        previewElem.querySelector("tr:nth-child(1) .txt em.price").textContent = sourceAmount.toFixed(0);
        previewElem.querySelector("tr:nth-child(2) .txt em.point").textContent = finalAmount.toLocaleString();

        //  결제 방식을 동적으로 설정할 수 있는 로직을 추가
        const selectedOption = document.getElementById("selectAccountForm").value;
        const paymentMethodText = document.querySelector(".previewPayment .banking-cont table tbody tr:nth-child(3) .txt");

        if (selectedOption === "HANA Wallet") {
            paymentMethodText.textContent = "Hana Wallet Money Withdrawal";
        } else {
            paymentMethodText.textContent = "Hana Bank Account Withdrawal";
        }
    }


</script>

</body>
</html>
