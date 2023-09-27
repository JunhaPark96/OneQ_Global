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
    <%--    스와이퍼--%>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <%--    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>--%>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>


    <script src="./js/wallet.js"></script>
    <link href="./css/service-main.css" rel="stylesheet"/>
    <link href="./css/nav.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <%--    <link href="./css/exchange/doExchange.css" rel="stylesheet"/>--%>
    <link href="./css/wallet/flags.css" rel="stylesheet"/>
    <link href="./css/remittance/immediateRemittance.css" rel="stylesheet"/>
    <title>월렛 확인</title>
</head>
<body>
<% if (request.getAttribute("errorMessage") != null) { %>
<script>
    alert('<%= request.getAttribute("errorMessage") %>');
</script>
<% } %>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area">
        <%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
        <div class="">
            <h2>Overseas Remittance</h2>
            <form action="${pageContext.request.contextPath}/walletInfo" method="post" class="main-body">
                <%--            통화선택 시작    --%>
                <div class="selectCurAndPayment">
                    <div class="container">
                        <div class="fs-5" style="color: #bdbdbd">Remittance / <strong style="color: #000000">Select
                            Country</strong></div>
                        <br/>
                        <p class="text-start">Select Country where you want to make a Remittance</p>
                        <div style="text-align: right;">
                            <input type="text" id="countrySearch" placeholder="Search Country">
                        </div>
                        <div class="swiper-container" style="">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide" id="USA">
                                    <img src="./images/walletIcon_USD.png" alt="">
                                    <div class="searchName"> United States</div>
                                </div>
                                <div class="swiper-slide" style="height: 225px" id="KOR">
                                    <img src="./images/walletIcon_KRW.png">
                                    <div class="searchName" style="top: 89%; position: absolute;"> Korea</div>
                                </div>
                                <div class="swiper-slide" id="AUS">
                                    <img src="./images/walletIcon_AUD.png" alt="">
                                    <div class="searchName"> Australia</div>
                                </div>
                                <div class="swiper-slide" id="JPN">
                                    <img src="./images/walletIcon_JPY.png" alt="">
                                    <div class="searchName"> Japan</div>
                                </div>
                                <div class="swiper-slide" id="CHE">
                                    <img src="./images/walletIcon_CHF.png" alt="">
                                    <div class="searchName"> Switzerland</div>
                                </div>
                                <div class="swiper-slide" id="CHN">
                                    <img src="./images/walletIcon_CNY.png" alt="">
                                    <div class="searchName"> China</div>
                                </div>
                                <div class="swiper-slide" id="CZE">
                                    <img src="./images/walletIcon_Czech.png" alt="">
                                    <div class="searchName"> Czech</div>
                                </div>
                                <div class="swiper-slide" id="CAN">
                                    <img src="./images/walletIcon_CAD.png" alt="">
                                    <div class="searchName"> Canada</div>
                                </div>
                                <div class="swiper-slide" id="GBR">
                                    <img src="./images/walletIcon_GBP.png" alt="">
                                    <div class="searchName"> United Kingdom</div>
                                </div>
                                <div class="swiper-slide" id="HKG">
                                    <img src="./images/walletIcon_HKD.png" alt="">
                                    <div class="searchName"> Hong Kong</div>
                                </div>
                                <div class="swiper-slide" id="HUN">
                                    <img src="./images/walletIcon_HUF.png" alt="">
                                    <div class="searchName"> Hungary</div>
                                </div>
                                <div class="swiper-slide" id="IDN">
                                    <img src="./images/walletIcon_IDR.png" alt="">
                                    <div class="searchName"> Indonesia</div>
                                </div>
                                <div class="swiper-slide" id="PHL">
                                    <img src="./images/walletIcon_PHP.png" alt="">
                                    <div class="searchName"> Philippine</div>
                                </div>
                                <div class="swiper-slide" id="SWE">
                                    <img src="./images/walletIcon_SEK.png" alt="">
                                    <div class="searchName"> Sweden</div>
                                </div>
                                <div class="swiper-slide" id="SGP">
                                    <img src="./images/walletIcon_SGD.png" alt="">
                                    <div class="searchName"> Singapore</div>
                                </div>
                                <div class="swiper-slide" id="THA">
                                    <img src="./images/walletIcon_THB.png" alt="">
                                    <div class="searchName"> Thailand</div>
                                </div>
                                <div class="swiper-slide" id="VNM">
                                    <img src="./images/walletIcon_VND.png" alt="">
                                    <div class="searchName"> Vietnam</div>
                                </div>

                            </div>

                            <!-- Add Arrows -->
                            <div class="swiper-button-next" style="right: 1px"></div>
                            <div class="swiper-button-prev" style="left: 1px"></div>
                        </div>
                    </div>
                </div>
                <%--                    결제방식 선택 모달 시작--%>
                <div id="myModal" class="modalContainer">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="authenticateHeader">Choose Payment Method</div>
                            <span class="close" onclick="closeModal()">&times;</span>
                        </div>

                        <div class="modal-main">
                            <div class="selectPaymentWrapper">
                                <div class="selectAccount" id="selectAccount" onclick="closeModal()">
                                    <div><img src="./images/myAccount.png" class="paymentImage" alt=""></div>
                                    <div>
                                        <p>Remittance with <br/> <span>Bank Account</span></p>
                                        <p></p>
                                    </div>
                                </div>
                                <div class="selectWallet" id="selectWallet" onclick="closeModal()">
                                    <div><img src="./images/walletIcon.png" class="paymentImage" alt=""></div>
                                    <div>
                                        <p>Remittance with <br/> <span>Hana Wallet</span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--                    결제방식 선택 모달 끝--%>

                <%--          환전 계산 시작 --%>
                <div class="compare_area" style="display: none">
                    <div class="fs-5" style="color: #bdbdbd">Remittance / <strong
                            style="color: #000000">Calculation</strong></div>
                    Remittance by Wallet
                    <div class="compare_section">
                        <%--                    Source 통화 섹션 --%>
                        <div class="fr_info">
                            <div id="ds_sel" class="sbox">
                                <div class="selectbox_box _select_box">
                                    <div class="selectbox_label _trigger">
                                        <span class="nation_usd _flag">
                                            <img src="./images/walletIcon_KRW.png" class="_img" width="35px"
                                                 height="30px">
                                        </span>
                                        <label class="_text">Korea <em> KRW</em></label>
                                    </div>

                                </div>
                            </div>
                            <div class="input_box _input_box">
                                <span id="drt_from_span" class="input">
                                    <input id="ds_from_money" maxlength="15" type="text" style="ime-mode:disabled;"
                                           value="1"
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
                                        <span class="">
                                            <img src="" class="_img nation" width="30px" height="30px">
                                        </span>
                                        <label for="ds_to_money" class="_text"><span id="countryName"></span> <em
                                                id="currencyName"></em></label>
                                    </div>
                                </div>
                            </div>
                            <div class="input_box _input_box">
                                <span id="drt_to_span" class="input">
                                    <input id="ds_to_money" type="text" style="ime-mode:disabled;" value=""
                                           class="_input input_text">
                                </span>
                                <span class="recite _recite result" id="targetCurrencyName"></span>
                            </div>
                        </div>
                        <p class="cal_txt _noservice"></p>
                    </div>
                    <div class="btn-area" style="text-align: right">
                        <div class="toggleExchangeRate" onclick="toggleRateInfo()">
                        </div>
                        <span class=" btn-pack btn-type-3c ui-btn-pack-button ui-set-btn-pack ui-set-btn-pack-event">
                            <button type="button" class="" id="calExchange">Calculate </button>
                        </span>
                    </div>
                    <%--        결제 정보 미리보기 시작    --%>
                    <div class="col previewPayment" style="display: none">
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
                                										<img src="./images/walletIcon_.png"
                                                                             style="width: 30px; height: 30px"
                                                                             alt="국기" class="flag">
                                										<em class="currency"></em>
                                										<em class="price">10</em>
                                									</span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>The amount you will be paying(Won)</th>
                                        <td><span class="txt" style="color: #016f73; font-weight: 700; font-size: 20px"><em
                                                class="point"></em></span></td>
                                    </tr>

                                    <tr>
                                        <th>Payment method</th>
                                        <td><span class="txt"></span></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                    <%--        결제 정보 미리보기 끝    --%>
                </div>

        <%--          환전 계산 끝 --%>



        </div>





        <%--         연결계좌, 비밀번호 입력   --%>
        <%--                <div class="Authenticate">--%>
        <%--                    <div class="col-md-12>                                                                                                                                                                                                                                                                      ">--%>
        <%--                        <div class="card-body pe-5">--%>
        <%--                            <table class="table table-hover border-light">--%>
        <%--                                <tbody>--%>
        <%--                                &lt;%&ndash;                                계좌 선택 &ndash;%&gt;--%>
        <%--                                <tr class="text border-light">--%>
        <%--                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Select</th>--%>
        <%--                                    <td>--%>
        <%--                                        <select class="form-select border-3 w-60" name="senderAccountNo"--%>
        <%--                                                id="selectAccountForm" onchange="changeBalance()" style="height: 45px;">--%>
        <%--                                            <option value="" selected disabled>Choose Payment Method</option>--%>

        <%--                                            <optgroup label="Accounts">--%>
        <%--                                                <c:forEach items="${accountList}" var="account">--%>
        <%--                                                    <option value="${account.acNo}" data-account="${account}"--%>
        <%--                                                            data-balance="${account.balance}">--%>
        <%--                                                            ${account.acNo}--%>
        <%--                                                    </option>--%>
        <%--                                                </c:forEach>--%>
        <%--                                            </optgroup>--%>

        <%--                                            <optgroup label="Hana Wallet">--%>
        <%--                                                <option value="HANA Wallet" data-wallet="${walletKRW}"--%>
        <%--                                                        data-balance="${walletKRW.balance}">--%>
        <%--                                                    KRW Wallet--%>
        <%--                                                </option>--%>
        <%--                                            </optgroup>--%>

        <%--                                        </select>--%>
        <%--                                    </td>--%>
        <%--                                </tr>--%>

        <%--                                <tr class="border-light">--%>
        <%--                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Balance</th>--%>
        <%--                                    <td>--%>
        <%--                                        <div class="btnArea" id="btnFclArea">--%>
        <%--                                            &lt;%&ndash;                                            <input type="text" name="accountBalance" id="accountBalance"&ndash;%&gt;--%>
        <%--                                            &lt;%&ndash;                                                   placeholder="balance" maxlength="20" readonly/>&ndash;%&gt;--%>
        <%--                                            <p class="text-start align-middle" id="accountBalance"></p>--%>
        <%--                                        </div>--%>
        <%--                                    </td>--%>
        <%--                                </tr>--%>

        <%--                                <tr class="border-light">--%>
        <%--                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Password</th>--%>
        <%--                                    <td>--%>
        <%--                                        <input type="password" name="account_password" id="account_password"--%>
        <%--                                               placeholder="password" maxlength="6"/>--%>
        <%--                                    </td>--%>
        <%--                                </tr>--%>
        <%--                                </tbody>--%>
        <%--                            </table>--%>
        <%--                            Preferential rate is 100% with Hana Money!--%>
        <%--                        </div>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--            연결계좌, 비밀번호 입력 --%>
        <%--                <div class="btn-area2 mt15 mb30">--%>
        <%--                        <span class=" btn-pack btn-type-3 ui-btn-pack-a ui-set-btn-pack ui-set-btn-pack-event">--%>
        <%--                        <a href="${pageContext.request.contextPath}/walletInfo" id="buttonCancel"--%>
        <%--                           class="">Cancel</a></span>--%>
        <%--                    <span class=" btn-pack btn-type-3c ui-btn-pack-button ui-set-btn-pack ui-set-btn-pack-event">--%>
        <%--                        <button type="submit" class="" id="buttonConfirm">Topping up </button></span>--%>
        <%--                </div>--%>
        </form>
    </div>


    <footer>
    </footer>
</div>
</div>

<script src="./js/remittance.js"></script>
<%--<script src="./js/exchange.js"></script>--%>
<script>
    // 환율 정보 저장
    let exchangeRates = {};
    <c:forEach var="rate" items="${exchangeList}">
    exchangeRates["${rate.currencyCode}"] = {
        currencyCode: "${rate.currencyCode}",
        baseRate: ${rate.baseRate},
        usdConversionRate: ${rate.usdConversionRate},
        remittance: ${rate.remittance},
        receiving: ${rate.receiving},
        buyRate: ${rate.buyRate},
        sellRate: ${rate.sellRate}
    };
    </c:forEach>
    console.log("통화코드는 ", exchangeRates["VND"].currencyCode);
    // 컨트롤러에서 제공하는 객체 정보를 JavaScript 변수로 저장
    let walletInfo = {
        walletSeq: "${walletKRW.walletSeq}",
        userSeq: "${walletKRW.userSeq}",
        balance: "${walletKRW.balance}",
        walletPw: "${walletKRW.walletPw}",
        currencyCode: "${walletKRW.currencyCode}",
        currency: "${walletKRW.currency}"
    };

    console.log(exchangeRates);  // 테스트: 월렛 정보를 콘솔에 출력
    console.log(walletInfo);  // 테스트: 월렛 정보를 콘솔에 출력
    // 1 단계: 나라선택 및 결제방식 선택
    let countriesInfo;
    fetch('./json/country.json')
        .then(response => response.json())
        .then(data => {
            countriesInfo = data.countries;
        });

    function initializeSelectionAndListeners() {
        let selectedCountry = null;
        let selectedPaymentMethod = null;

        function selectCountry(country) {
            selectedCountry = country;
            console.log("선택된 국가는", selectedCountry);
        }

        function selectPaymentMethod(paymentMethod) {
            selectedPaymentMethod = paymentMethod;
            console.log("선택된 결제방식은 ", selectedPaymentMethod);
            $.ajax({
                url: '${pageContext.request.contextPath}/selectCountryAndPayment',
                method: 'post',
                data: {
                    selectedCountry: selectedCountry,
                    selectedPaymentMethod: selectedPaymentMethod
                },
                success: function (data) {
                    // document.getElementById('countryName').textContent = data.selectedCountry;
                    // json의 국가코드와 일치하면 데이터 가져오기
                    if (data.selectedCountry) {
                        const countryInfo = countriesInfo.find(country => country.countrySP === data.selectedCountry);
                        console.log(countryInfo);
                        if (countryInfo) {
                            document.getElementById('countryName').textContent = countryInfo.nationality;
                            document.getElementById('currencyName').textContent = countryInfo.currencyCode;
                            document.querySelector('.nation').src = countryInfo.imagePath;
                        }
                    }
                    if (data.selectedPaymentMethod === 'selectAccount') {
                        document.querySelector('.compare_area').style.display = 'block';
                        document.querySelector('.selectCurAndPayment').style.display = 'none';
                    } else if (data.selectedPaymentMethod == 'selectWallet') {
                        document.querySelector('.previewPayment').style.display = 'block';
                        document.querySelector('.selectCurAndPayment').style.display = 'none';
                    }
                },
                error: function (jqXHR) {
                    alert(jqXHR.responseText); // 서버에서 반환된 에러 메시지를 표시
                }
            })
        }

        document.querySelectorAll('.swiper-slide').forEach(function (slide) {
            slide.addEventListener('click', function () {
                selectCountry(slide.id);  // 이 id는 각 나라의 id와 일치해야 합니다.
            });
        });

        document.querySelectorAll('.selectPaymentWrapper div').forEach(function (paymentOption) {
            paymentOption.addEventListener('click', function () {
                selectPaymentMethod(paymentOption.id);

                document.getElementById('myModal').style.display = 'none';
            });
        });
    }

    initializeSelectionAndListeners();

    // calculate 버튼 클릭시
    document.addEventListener("DOMContentLoaded", function () {
        // 계산 버튼에 이벤트 리스너 추가
        document.getElementById("calExchange").addEventListener("click", function () {
            calculateAndPreviewPayment();
        });
    });

    // 3단계 결제창과 결제방식 미리보기
    function calculateAndPreviewPayment() {
        // Source에서 입력된 금액 및 통화를 가져옴.
        const sourceAmount = parseFloat(document.getElementById("ds_to_money").value);
        const sourceCurrencyImageSrc = document.querySelector('.nation').src; //
        const sourceCurrencyCode = document.querySelector(".selectbox_label ._text em").textContent; //원화코드
        // const countryName = currencyNames[sourceCurrencyCode];
        const countryName = document.getElementById('countryName');

        document.querySelector(".previewPayment").style.display = "block";
        const previewPayment = document.querySelector('.previewPayment');
        previewPayment.scrollIntoView({behavior: "smooth"});
        previewPayment.classList.add('focusArea');
        // Target에서의 계산된 금액을 가져옵니다. (금액의 콤마를 제거)
        const targetAmount = parseFloat(document.getElementById("ds_from_money").value.replace(/,/g, ""));

        // 1% 수수료를 추가하고 10의 단위로 반올림
        const finalAmountWithoutDecimal = Math.round(targetAmount);
        const adjustedAmount = finalAmountWithoutDecimal + 5000; // 수수료 5천원
        const finalAmount = Math.round(adjustedAmount / 10) * 10;


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

        // 계산된 값을 hidden input 필드에 설정
        document.getElementById("sourceCurrencyCode").value = sourceCurrencyCode; // 외화
        document.getElementById("hiddenSourceAmount").value = sourceAmount.toFixed(0); // 외화 금액
        document.getElementById("hiddenFinalAmount").value = finalAmount; // 원화 결제할 금액
    }

</script>

</body>
</html>
