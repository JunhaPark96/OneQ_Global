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
                                <div class="swiper-slide" id="UnitedStates">
                                    <img src="./images/walletIcon_USD.png" alt="">
                                    <div> USA</div>
                                </div>
                                <div class="swiper-slide" style="height: 225px" id="Korea">
                                    <img src="./images/walletIcon_KRW.png">
                                    <div style="top: 89%; position: absolute;"> Korea</div>
                                </div>
                                <div class="swiper-slide" id="Australia">
                                    <img src="./images/walletIcon_AUD.png" alt="">
                                    <div > Australia</div>
                                </div>
                                <div class="swiper-slide" id="Japan">
                                    <img src="./images/walletIcon_JPY.png" alt="">
                                    <div > Japan</div>
                                </div>
                                <div class="swiper-slide" id="Swiss">
                                    <img src="./images/walletIcon_CHF.png" alt="">
                                    <div> Swiss</div>
                                </div>

                                <div class="swiper-slide" id="China">
                                    <img src="./images/walletIcon_CNY.png" alt="">
                                    <div> China</div>
                                </div>
                                <div class="swiper-slide" id="Czechia">
                                    <img src="./images/walletIcon_Czech.png" alt="">
                                    <div> Czechia</div>
                                </div>
                                <div class="swiper-slide" id="Canada">
                                    <img src="./images/walletIcon_CAD.png" alt="">
                                    <div> Canada</div>
                                </div>

                                <div class="swiper-slide" id="UnitedKingdom">
                                    <img src="./images/walletIcon_GBP.png" alt="">
                                    <div > United Kingdom</div>
                                </div>
                                <div class="swiper-slide" id="HongKong">
                                    <img src="./images/walletIcon_HKD.png" alt="">
                                    <div> Hong Kong</div>
                                </div>
                                <div class="swiper-slide" id="Hungary">
                                    <img src="./images/walletIcon_HUF.png" alt="">
                                    <div> Hungary</div>
                                </div>
                                <div class="swiper-slide" id="Indonesia">
                                    <img src="./images/walletIcon_IDR.png" alt="">
                                    <div> Indonesia</div>
                                </div>
                                <div class="swiper-slide" id="Philippine">
                                    <img src="./images/walletIcon_PHP.png" alt="">
                                    <div> Philippine</div>
                                </div>
                                <div class="swiper-slide" id="Sweden">
                                    <img src="./images/walletIcon_SEK.png" alt="">
                                    <div> Sweden</div>
                                </div>
                                <div class="swiper-slide" id="Singapore">
                                    <img src="./images/walletIcon_SGD.png" alt="">
                                    <div> Singapore</div>
                                </div>
                                <div class="swiper-slide" id="Thailand">
                                    <img src="./images/walletIcon_THB.png" alt="">
                                    <div> Thailand</div>
                                </div>
                                <div class="swiper-slide" id="Vietnam">
                                    <img src="./images/walletIcon_VND.png" alt="">
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
                <%--                    <div class="selectCurrency">--%>
                <%--                        <div class="nation_header">--%>
                <%--                            <div>Select Country where you want to make a remittance</div>--%>
                <%--                            <div class="nation_usd _flag">--%>
                <%--                                <img src="./images/walletIcon_USD.png" class="_img" alt="미국 USD" width="30px" height="30px">--%>
                <%--                                <label class="_text"><em>United States</em></label>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                        <div class="currencyImages" id="currencyImages">--%>
                <%--                            <div class="walletCell" data-currency="USD"><img src="./images/walletIcon_USD.png">USA</div>--%>
                <%--                            <div class="walletCell" data-currency="KRW"><img src="./images/walletIcon_KRW.png">KOR</div>--%>
                <%--                            <div class="walletCell" data-currency="JPY"><img src="./images/walletIcon_JPY.png">JPN</div>--%>
                <%--                            <div class="walletCell" data-currency="AUD"><img src="./images/walletIcon_AUD.png"></div>--%>
                <%--                            <div class="walletCell" data-currency="CAD"><img src="./images/walletIcon_CAD.png"></div>--%>
                <%--                            <div class="walletCell" data-currency="CHF"><img src="./images/walletIcon_CHF.png"></div>--%>
                <%--                            <div class="walletCell" data-currency="CNY"><img src="./images/walletIcon_CNY.png"></div>--%>
                <%--                            <div class="walletCell" data-currency="Czech"><img src="./images/walletIcon_Czech.png"></div>--%>
                <%--                            <div class="walletCell" data-currency="EUR"><img src="./images/walletIcon_EUR.png"></div>--%>
                <%--                            <div class="walletCell" data-currency="GBP"><img src="./images/walletIcon_GBP.png"></div>--%>
                <%--                            <div class="walletCell" data-currency="HKD"><img src="./images/walletIcon_HKD.png"></div>--%>
                <%--                            <div class="walletCell" data-currency="HUF"><img src="./images/walletIcon_HUF.png"></div>--%>
                <%--                            <div class="walletCell" data-currency="IDR"><img src="./images/walletIcon_IDR.png"></div>--%>
                <%--                            <div class="walletCell" data-currency="PHP"><img src="./images/walletIcon_PHP.png"></div>--%>
                <%--                            <div class="walletCell" data-currency="SEK"><img src="./images/walletIcon_SEK.png"></div>--%>
                <%--                            <div class="walletCell" data-currency="SGD"><img src="./images/walletIcon_SGD.png"></div>--%>
                <%--                            <div class="walletCell" data-currency="THB"><img src="./images/walletIcon_THB.png"></div>--%>
                <%--                            <div class="walletCell" data-currency="VND"><img src="./images/walletIcon_VND.png"></div>--%>
                <%--                            <div>전체 국가 보기 +</div>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>

                <%--          환전 계산 시작 --%>
                <div class="compare_area">
                    Please select the currency you want to exchange
                    <div class="compare_section">
                        <%--                    Source 통화 섹션 --%>
                        <div class="fr_info">
                            <div id="ds_sel" class="sbox">
                                <div class="selectbox_box _select_box">
                                    <div class="selectbox_label _trigger">
                                        <span class="nation_usd _flag">
                                            <img src="./images/walletIcon_USD.png" class="_img" alt="미국 USD"
                                                 width="30px" height="30px">
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
                        <div class="toggleExchangeRate" onclick="toggleRateInfo()">
                        </div>
                        <span class=" btn-pack btn-type-3c ui-btn-pack-button ui-set-btn-pack ui-set-btn-pack-event">

                                        <button type="button" class="" id="calExchange">Calculate </button></span>
                    </div>
                </div>
                <%--          환전 계산 끝 --%>


                <%--        결제 정보 미리보기 시작    --%>
                <%--                <div class="col previewPayment" style="display: none">--%>
                <%--                    <div class="banking-wrap input-focus-wrap">--%>
                <%--                        <div class="title-cont">--%>
                <%--                            <h5>Confirm the amount before topping up</h5>--%>
                <%--                        </div>--%>
                <%--                        <br/>--%>
                <%--                        <div class="banking-cont">--%>
                <%--                            <table summary="환전신청금액,결제하실 금액(원),결제방법(으)로 이루어진 결제정보1 테이블입니다.">--%>
                <%--                                &lt;%&ndash;                                <caption>결제정보1</caption>&ndash;%&gt;--%>
                <%--                                <colgroup>--%>
                <%--                                    <col style="width: 500px"/>--%>
                <%--                                </colgroup>--%>

                <%--                                <tbody>--%>
                <%--                                <tr>--%>
                <%--                                    <th>Foreign exchange application amount</th>--%>
                <%--                                    <td>--%>
                <%--									<span class="txt">--%>
                <%--										<img src="./images/walletIcon_.png" style="width: 30px; height: 30px"--%>
                <%--                                             alt="국기" class="flag">--%>
                <%--										<em class="currency"></em>--%>
                <%--										<em class="price">10</em>--%>
                <%--									</span>--%>
                <%--                                    </td>--%>
                <%--                                </tr>--%>

                <%--                                <tr>--%>
                <%--                                    <th>The amount you will be paying(Won)</th>--%>
                <%--                                    <td><span class="txt" style="color: #016f73; font-weight: 700; font-size: 20px"><em class="point"></em></span></td>--%>
                <%--                                </tr>--%>

                <%--                                <tr>--%>
                <%--                                    <th>Payment method</th>--%>
                <%--                                    <td><span class="txt"></span></td>--%>
                <%--                                </tr>--%>
                <%--                                </tbody>--%>
                <%--                            </table>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>

                <%--                </div>--%>
                <%--        결제 정보 미리보기 끝    --%>


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


<script>

    // // 아코디언 토글 기능
    // document.querySelector('.nation_header').addEventListener('click', function () {
    //     let container = document.querySelector('.selectCurrency');
    //     if (container.classList.contains('open')) {
    //         container.classList.remove('open');
    //     } else {
    //         container.classList.add('open');
    //     }
    // });
    const countryToIndex = {
        USA: 0,
        Korea: 1,
        Canada: 2,
        Australia: 3,
        Japan: 4,
        Swiss: 5,
        China: 6,
        Czechia: 7,
        EU: 8,
        UnitedKingdom: 9,
        HongKong: 10,
        Hungary: 11,
        Indonesia: 12,
        Philippine: 13,
        Sweden: 14,
        Singapore: 15,
        Thailand: 16,
        Vietnam: 17
    };

    let selectedCountry = null;
    let selectedPaymentMethod = null;
    // 국가 및 결제 방식을 선택하면 호출할 함수를 정의합니다.
    function selectCountry(country) {
        selectedCountry = country;
        console.log("선택된 국가는", selectedCountry);
    }

    function selectPaymentMethod(paymentMethod) {
        selectedPaymentMethod = paymentMethod;
        console.log("선택된 결제방식은 ", selectedPaymentMethod);
        nextStep();
    }
    // HTML에서 국가 및 결제 방식을 선택할 수 있도록 버튼에 이벤트 리스너를 연결합니다.
    document.querySelectorAll('.swiper-slide').forEach(function(slide) {
        slide.addEventListener('click', function() {
            selectCountry(slide.id);  // 이 id는 각 나라의 id와 일치해야 합니다.
        });
    });

    document.querySelectorAll('.selectPaymentWrapper div').forEach(function(paymentOption) {
        paymentOption.addEventListener('click', function() {
            selectPaymentMethod(paymentOption.id);
            document.getElementById('myModal').style.display = 'none';
        });
    });


</script>
<script src="./js/remittance.js"></script>
</body>
</html>
