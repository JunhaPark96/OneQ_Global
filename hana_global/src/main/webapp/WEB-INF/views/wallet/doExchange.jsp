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
    <script src="./js/exchange.js"></script>
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
        <div class="main-body">
            <h2>Currency Exchange</h2>
            <%--         연결계좌, 비밀번호 입력   --%>
            <div class="Authenticate">
                <div class="col-md-12>                                                                                                                                                                                                                                                                      ">
                    <div class="card-body pe-5">
                        <table class="table table-hover border-light">
                            <form action="${pageContext.request.contextPath}/walletInfo" method="post">
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
                            </form>
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
                        <td><span class="txt"><em class="point" id="remittance">1,339.40</em></span></td>
                    </tr>
                    <tr>
                        <th>Receiving</th>
                        <td><span class="txt"><em class="point" id="receiving">1,313.60</em></span></td>
                    </tr>
                    <tr>
                        <th>Buying</th>
                        <td><span class="txt"><em class="point" id="buying">1,349.71</em></span></td>

                    </tr>
                    <tr>
                        <th>When selling</th>
                        <td><span class="txt"><em class="point" id="selling">1,303.29</em></span></td>
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
                                    <label class="_text">미국 <em>USD</em></label>
                                </div>
                                <div class="ch_wrap_ly ly_rate scroll _list" style="display: none;">
                                    <ul class="ly_cont _l" id="sourceCurrencyList">
                                        <c:forEach var="rate" items="${exchangeList}">
                                            <li class="_i" data-value="${rate.currencyCode}">
                                                <a onclick="currencySelected('${rate.currencyCode}', true);" href="javascript:void(0);">
                                                    <span id="countryNameFor_${rate.currencyCode}">${currencyNames[rate.currencyCode]}</span> <em>${rate.currencyCode}</em>
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
                            <span class="recite _recite" id="sourceCurrencyName">USD 통화이름</span>
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
                                    <label for="ds_to_money" class="_text">대한민국 <em>KRW</em></label>
                                </div>
                                <div class="ch_wrap_ly ly_rate2 scroll _list" style="display: none">
                                    <ul class="ly_cont" id="targetCurrencyList">
                                        <c:forEach var="rate" items="${exchangeList}">
                                            <li class="_i" data-value="${rate.currencyCode}">
                                                <a onclick="currencySelected('${rate.currencyCode}', false);"
                                                   href="javascript:void(0);">
                                                    <span id="countryNameFor_${rate.currencyCode}"></span> ${rate.currencyCode}
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="input_box _input_box">
                <span id="drt_to_span" class="input">
                    <input id="ds_to_money"  type="text" style="ime-mode:disabled;" value="1,327.90"
                           class="_input input_text">
                </span>
                            <span class="recite _recite result">1,327.90 원</span>
                        </div>
                    </div>
                    <p class="cal_txt _noservice"></p></div>
            </div>
            <%--          환전 계산 끝 --%>

            <%--        결제 정보 미리보기 시작    --%>
            <div class="col pt-1 previewPayment">
                <form>
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
                                    <col style="width: 600px"/>
                                </colgroup>

                                <tbody>
                                <tr>
                                    <th>Foreign exchange application amount</th>
                                    <td>
									<span class="txt">
										<img src="https://image.kebhana.com/pbk/cybrexh/resource/img/cyber/flag_USD.png"
                                             alt="미국" class="flag">
										미국 USD
										<em class="price">10</em>
									</span>
                                    </td>
                                </tr>

                                <tr>
                                    <th>The amount you will be paying(Won)</th>
                                    <td><span class="txt"><em class="point">13,313</em></span></td>
                                </tr>

                                <tr>
                                    <th>Payment method</th>
                                    <td><span class="txt">하나은행 계좌 출금</span></td>
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
                </form>
            </div>


        </div>
        <footer>
        </footer>
    </div>
</div>

<script>
    // 환율 정보 저장
    let exchangeRates = {};
    <c:forEach var="rate" items="${exchangeList}">
        exchangeRates["${rate.currencyCode}"] = ${rate.usdConversionRate};
    </c:forEach>

    // 환율 계산
    function calculateExchange(sourceCurrency, targetCurrency, amount) {
        if (sourceCurrency === "USD") {
            return amount * exchangeRates[targetCurrency];
        } else if (targetCurrency === "USD") {
            return amount / exchangeRates[sourceCurrency];
        } else {
            const amountInUSD = amount / exchangeRates[sourceCurrency];
            return amountInUSD * exchangeRates[targetCurrency];
        }
    }

    // 환율 계산 업데이트
    function updateExchangeRate() {
        const sourceCurrency = document.querySelector("#ds_sel ._text em").innerText;
        const targetCurrency = document.querySelector("#ds_sel2 ._text em").innerText;
        const amount = parseFloat(document.getElementById("ds_from_money").value);

        const result = calculateExchange(sourceCurrency, targetCurrency, amount);
        document.getElementById("ds_to_money").value = result.toFixed(2); // 소수점 두 자리로 고정
    }
    document.getElementById("ds_from_money").addEventListener("input", updateExchangeRate);

    // select box 통화 이미지, 통화코드, 나라 이름 설정
    function currencySelected(currencyCode, isSource) {
        // 해당 통화 코드에 대한 정보를 가져오기
        console.log("currency Code :" , currencyCode);
        const selectedRate = exchangeRates[currencyCode];

        const imageUrl = "./images/walletIcon_" + currencyCode + ".png";
        // console.log(imageUrl);
        // console.log(currencyCode);
        // console.log(selectedRate);
        const countryName = currencyNames[currencyCode];
        const currencyShortName = currencyCode;
        console.log("isSource" , isSource);
        console.log("countryName ", countryName);
        const divId = isSource ? "ds_sel" : "ds_sel2";
        const currencyDiv = document.getElementById(divId);
        const flagImg = currencyDiv.querySelector("._img");
        const currencyLabel = currencyDiv.querySelector("._text");
        console.log(currencyLabel);

        flagImg.src = imageUrl;
        flagImg.alt = countryName + " " + currencyShortName;
        currencyLabel.innerHTML = countryName + ' <em>' + currencyShortName + '</em>';
        console.log("나라이름은 " + countryName);
        console.log(currencyLabel);

        // 리스트 항목의 텍스트를 업데이트
        const listItem = document.querySelector(`#countryNameFor_${currencyCode}`);
        if (listItem) {
            listItem.textContent = countryName + ' ' + currencyShortName;
        }

        updateExchangeRate();
    }

    // 통화 선택 select box
    document.querySelectorAll("._trigger").forEach(trigger => {
        trigger.addEventListener("click", function () {
            const parent = this.closest("._select_box");
            const list = parent.querySelector("._list");

            if (list.style.display === "none" || list.style.display === "") {
                list.style.display = "block";
            } else {
                list.style.display = "none";
            }
        });
    });

    // 페이지 어느 곳이든 클릭했을 때 dropdown을 닫도록 합니다.
    document.addEventListener("click", function (event) {
        if (!event.target.closest("._select_box")) {
            document.querySelectorAll("._list").forEach(list => {
                list.style.display = "none";
            });
        }
    });


    function setCountryNames() {
        for (const currencyCode in currencyNames) {
            const element = document.getElementById(`countryNameFor_${currencyCode}`);
            if (element) {
                element.textContent = currencyNames[currencyCode];
            }
        }
    }

    // 페이지 로드 시 실행
    window.onload = setCountryNames;
</script>

</body>
</html>
