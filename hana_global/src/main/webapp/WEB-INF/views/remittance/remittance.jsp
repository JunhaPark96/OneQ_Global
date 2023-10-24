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
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/ionicons@5.0.0/dist/ionicons.js"></script>

    <link href="./css/service-main.css" rel="stylesheet"/>
    <link href="./css/nav.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
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
                        <div class="countrySearch" style="text-align: right;">
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
                                <div class="selectWesternUnion" id="selectWesternUnion" onclick="closeModal()">
                                    <div><img src="./images/western_union.png" class="paymentImage2" alt=""></div>
                                    <div>
                                        <p>Remittance with <br/> <span>Western Union</span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--                    결제방식 선택 모달 끝--%>

                <%--          환전 계산 시작 --%>
                <div class="compare_area" style="display: none">
                    <div class="fs-4 mb-5 mt-2" style="color: #bdbdbd">Remittance / <strong
                            style="color: #000000">Calculation</strong></div>
                    <div class="compare_section mb-5">
                        <%--                    Source 통화 섹션 --%>
                        <div class="fr_info me-3">
                            <div id="ds_sel" class="sbox">
                                <div class="selectbox_box _select_box">
                                    <div class="selectbox_label _trigger">
                                        <span class="nation_usd _flag">
                                            <img src="./images/walletIcon_KRW.png" class="_img"
                                                 width="35px" height="30px">
                                        </span>
                                        <label class="_text">Korea <em> KRW</em></label>
                                    </div>

                                </div>
                            </div>
                            <div class="input_box _input_box">
                                <span id="drt_from_span" class="input">
                                    <input id="ds_from_money" maxlength="15" type="text"
                                           style="ime-mode:disabled;" value="1" class="_input input_text">
                                </span><br/>
                                <span class="recite _recite" id="sourceCurrencyName"></span>
                            </div>
                        </div>
                        <%--                    Conversion 아이콘 --%>
                        <span class="ico_same"><span class="blind"><img src="./images/equals_sign.png"
                                                                        class="equal_icon"> </span></span>
                        <%--                    Target 통화 섹션--%>
                        <div class="fr_info ms-3">
                            <div id="ds_sel2" class="sbox _select_box">
                                <div class="selectbox_box">
                                    <div class="selectbox_label _trigger">
                                                                        <span class="">
                                                                            <img src="" class="_img nation" width="30px"
                                                                                 height="30px">
                                                                        </span>
                                        <label for="ds_to_money" class="_text"><span id="countryName"></span> <em
                                                id="currencyName"></em></label>
                                    </div>
                                </div>
                            </div>
                            <div class="input_box _input_box">
                                <span id="drt_to_span" class="input">
                                    <input id="ds_to_money" type="text" style="ime-mode:disabled;"
                                           value="" class="_input input_text">
                                </span><br/>
                                <span class="recite _recite result" id="targetCurrencyName"></span>
                            </div>
                        </div>
                        <p class="cal_txt _noservice"></p>
                        <div class="btn-area">
                            <div class="toggleExchangeRate" onclick="toggleRateInfo()">
                            </div>
                            <span class="btn-pack btn-type-3c ui-btn-pack-button ui-set-btn-pack ui-set-btn-pack-event">
                                <button type="button" class="" id="calExchange">Calculate </button>
                            </span>
                        </div>
                    </div>
                    <%--        결제 정보 미리보기 시작    --%>
                    <div class="col previewPayment ms-5" style="display: none">
                        <div class="banking-wrap input-focus-wrap">
                            <div class="title-cont">
                                <h5>Confirm the amount before making remittance</h5>
                            </div>
                            <br/>
                            <div class="banking-cont">
                                <table class="mb-5" summary="환전신청금액,결제하실 금액(원),결제방법(으)로 이루어진 결제정보1 테이블입니다.">
                                    <colgroup>
                                        <col style="width: 400px"/>
                                    </colgroup>

                                    <tbody class="fs-5" style="line-height: 40px;">
                                    <tr class="mb-5">
                                        <th>Foreign exchange application amount<br/></th>
                                        <td style="text-align: right">
                                                            <span class="txt">
                                                                <img src="./images/walletIcon_.png"
                                                                     style="width: 30px; height: 30px"
                                                                     alt="국기" class="flag">
                                                                <em class="currency"></em>
                                                                <em id="price" , class="price"></em>
                                                            </span>
                                        </td>
                                    </tr>
                                    <tr class="mb-5">
                                        <th>Estimated Fee</th>
                                        <td style="text-align: right"><span class="txt"><em>5,000 won</em></span></td>
                                    </tr>
                                    <tr class="mb-5">
                                        <th>Estimated Withdrawal Amount (Won)</th>
                                        <td style="text-align: right"><span class="txt"
                                                                            style="color: #016f73; font-weight: 700; font-size: 20px"><em
                                                class="point" id="paymentAmount"></em></span></td>
                                    </tr>
                                    <tr class="mb-5">
                                        <th>Estimated Withdrawal Amount (<span id="targetCurrencyUnit"></span>)</th>
                                        <td style="text-align: right">
                                            <span class="txt" style="color: #016f73; font-weight: 700; font-size: 20px">
                                                <em class="point" id="paymentAmountForeign"></em>

                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="font-size: 13px; text-align: right; color: #888;">
                                            The final withdrawal amount will be in the currency of the selected wallet. Please confirm the currency code before proceeding.
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Payment method</th>
                                        <td>
                                            <span class="txt"></span>
                                            <select class="form-select border-3 w-60" name="senderAccountNo"
                                                    id="selectAccountForm"
                                                    onchange="displayBalance(); updateRateAndCurrencyInfo();"
                                                    style="height: 45px;">
                                                <option value="" selected disabled>Choose Payment Method</option>

                                                <optgroup label="Hana Wallet">
                                                    <c:forEach items="${walletList}" var="wallet">

                                                        <option value="${wallet.currencyCode}" data-wallet="${wallet}"
                                                                data-balance="${wallet.balance}"
                                                                data-password="${wallet.walletPw}"
                                                                data-walletSeq="${wallet.walletSeq}"
                                                                data-acNo="${wallet.acNo}">
                                                                ${wallet.currencyCode}
                                                        </option>
                                                    </c:forEach>
                                                </optgroup>

                                            </select>
                                        </td>
                                    </tr>
                                    <%--                                    우대율에 따른 할인 금액--%>
                                    <%-- 우대율에 따른 할인 금액 --%>
                                    <%--                                    <tr id="anticipatedPrimeRow" style="display: none">--%>
                                    <%--                                        <th style="line-height: 22px;">Anticipated Prime<br/>--%>
                                    <%--                                            Amount--%>
                                    <%--                                        </th>--%>
                                    <%--                                        <td style="font-size: 14px; line-height: 15px; text-align: right">--%>
                                    <%--                                            <span class="txt"><em class="primeRate"></em></span><br/>--%>
                                    <%--                                            <span class="txt">Non-preferential exchange rate <em class="curCode"></em> </span><br/>--%>
                                    <%--&lt;%&ndash;                                            <span class="txt">Preferential exchange rate <em class="curCode"></em> </span><br/>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;                                            <span class="txt">Preferential exchange rate <em class="curCode"></em> </span>&ndash;%&gt;--%>
                                    <%--                                            <span class="txt">Preferential exchange rate <em class="curCode"></em><em class="preferentialRateValue"></em></span><br/>--%>
                                    <%--                                            <span class="txt"><em class="KRW"></em></span><br/>--%>
                                    <%--                                        </td>--%>
                                    <%--                                    </tr>--%>

                                    <tr style="display: none" id="balanceRow">
                                        <th>
                                            Available Withdrawal
                                        </th>
                                        <td style="text-align: right">
                                            <span class="txt" id="balanceDisplay"></span>
                                        </td>
                                    </tr>
                                    <tr class="input_box" style="display: none" id="passwordRow">
                                        <th scope="row" class="text-start align-middle">Password</th>
                                        <td style="text-align: right">
                                            <input type="password" name="account_password" id="account_password"
                                                   placeholder="password" maxlength="6" style="height: 35px"/>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <%--        결제 정보 미리보기 끝    --%>
                    <%--                 다음/이전 버튼 시작 --%>
                    <div class="btn-area2 mt15 mb30" style="display: none">
                                                                        <span class=" btn-pack btn-type-3 ui-btn-pack-a ui-set-btn-pack ui-set-btn-pack-event">
                                                                            <a href="${pageContext.request.contextPath}/walletInfo"
                                                                               class="">Prev</a></span>
                        <span class=" btn-pack btn-type-3c ui-btn-pack-button ui-set-btn-pack ui-set-btn-pack-event">
                                                                            <button id="btnNext"
                                                                                    onclick="nextStep(event)">Next </button></span>
                    </div>
                    <%--                 다음/이전 버튼 끝  --%>
                </div>

                <%--          환전 계산 끝 --%>
                <%--         수취인 정보 입력   --%>
                <div class="recipientDiv" id="recipientDiv" style="display: none">
                    <div class="fs-5 mt-2" style="color: #bdbdbd">Remittance / <strong style="color: #000000">Recipient
                        Information Entry</strong></div>
                    <div class="col-md-12">
                        <div class="card-body pe-5 ps-3">
                            <table class="table">
                                <tbody style="border-style: none">
                                <tr class="border-white">
                                    <th colspan="2">
                                        <div class="fs-5" style="color: #000000">Bene's Name <strong
                                                style="color: #bdbdbd"></strong></div>
                                    </th>
                                </tr>
                                <tr class="border-white">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Name</th>
                                    <td>
                                        <input type="text" name="recipientName" id="recipientName"
                                               placeholder="Full Name"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="text-start align-middle" style="color: red">
                                        &nbsp;&nbsp;
                                    </th>
                                    <td>

                                        <div>
                                            <span class="fs-5"> <strong style="color: #000000; font-size: 14px"><span
                                                    style="color: red">Note </span> Please specify exact name written in your passport</strong></span>
                                        </div>
                                    </td>
                                </tr>

                                <!-- Recipient's Address -->
                                <tr class="border-white">
                                    <th colspan="2">
                                        <div class="fs-5" style="color: #000000">Bene's Address <strong
                                                style="color: #bdbdbd"></strong></div>
                                    </th>
                                </tr>
                                <tr class="border-white">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Address Detail</th>
                                    <td>
                                        <input type="text" name="addressDetail" id="addressDetail"
                                               placeholder="Address"/>
                                    </td>
                                </tr>
                                <tr class="border-white">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;City</th>
                                    <td>
                                        <input type="text" name="addressCity" id="addressCity" placeholder="City"/>
                                    </td>
                                </tr>
                                <tr class="border-white">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;State</th>
                                    <td>
                                        <select class="form-select border-3 w-50" name="addressState" id="addressState"
                                                style="height: 45px; width: 50%;">
                                            <option value="" selected disabled>State</option>
                                            <option value="AB">Alberta</option>
                                            <option value="BC">British Columbia</option>
                                            <option value="MB">Manitoba</option>
                                            <option value="NB">New Brunswick</option>
                                            <option value="NL">Newfoundland and Labrador</option>
                                            <option value="NS">Nova Scotia</option>
                                            <option value="NT">Northwest Territories</option>
                                            <option value="NU">Nunavut</option>
                                            <option value="ON">Ontario</option>
                                            <option value="PE">Prince Edward Island</option>
                                            <option value="QC">Quebec</option>
                                            <option value="SK">Saskatchewan</option>
                                            <option value="YT">Yukon</option>
                                        </select>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div id="bankAccountInfo" style="display: none">
                                <table class="table" style="background-color: #f4f3ef;">
                                    <tbody style="border-style: none">
                                    <tr class="border-white">
                                        <th colspan="2">
                                            <div class="fs-5" style="color: #000000">Bene's Account Information <strong
                                                    style="color: #bdbdbd"></strong></div>
                                        </th>
                                    </tr>
                                    <tr class="border-white">
                                        <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Bank Code</th>
                                        <td>
                                            <input type="text" name="routingNo" id="routingNo"
                                                   placeholder="EFT Routing No."/>
                                        </td>
                                    </tr>
                                    <tr class="border-white">
                                        <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Account Number</th>
                                        <td>
                                            <input type="text" name="accountNo" id="accountNo"
                                                   placeholder="CAD Account No."/>
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
                                <ul>
                                    <li>Transit No. can be converted and used as EFT (Canada) Routing No.
                                    </li>
                                    <li>ABA Routing No. / MICR No. cannot be used</li>
                                    <li>USD account numbers cannot be used</li>
                                    <li>If branch code is included in the account number, it can be
                                        returned.
                                    </li>
                                </ul>
                            </div>
                            <!-- Recipient's receipt place -->
                            <div id="receiptPlaceInfo" style="display: none">
                                <table class="table" style="background-color: #f4f3ef;">
                                    <tbody style="border-style: none">
                                    <tr class="border-white">
                                        <th colspan="2">
                                            <div class="fs-5" style="color: #000000">Place of Payment <strong
                                                    style="color: #bdbdbd"></strong></div>
                                        </th>
                                    </tr>
                                    <tr class="border-white">
                                        <th scope="row" class="text-start align-middle" style="padding-right: 48px; ">
                                            &nbsp;&nbsp;City
                                        </th>
                                        <td>
                                            <input type="text" name="receiptCity" id="receiptCity"
                                                   placeholder="City"/>
                                        </td>
                                    </tr>
                                    <tr class="border-white">
                                        <th scope="row" class="text-start align-middle">&nbsp;&nbsp;State</th>
                                        <td>
                                            <input type="text" name="receiptState" id="receiptState"
                                                   placeholder="State"/>
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
                                Western Union’s global transfer network is the largest in the world, with more than
                                500,000 agent locations in 200 countries and territories across the globe.
                                <a href="https://www.westernunion.com/us/en/agent-locator.html" target="_blank">Find
                                    locations</a>
                            </div>

                            <div class="accordion mt-4" id="termsAccordion">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingTerms">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTerms" aria-expanded="true" aria-controls="collapseTerms">
                                            Overseas Remittance Agreement
                                        </button>
                                    </h2>
                                    <div id="collapseTerms" class="accordion-collapse collapse show" aria-labelledby="headingTerms" data-bs-parent="#termsAccordion">
                                        <div class="accordion-body">
                                            <p>By using Western Union's international money transfer service, you agree to the following terms and conditions:</p>
                                            <ol>
                                                <li>You must provide accurate and complete recipient information, including their full name and location.</li>
                                                <li>Western Union is not responsible for any delays, errors, or losses that may occur during the transfer process.</li>
                                                <li>The exchange rate used for the transfer will be determined at the time of processing and may differ from the rate displayed at the time of initiation.</li>
                                                <li>Service fees and charges may apply, and these will be deducted from the transferred amount.</li>
                                                <li>You acknowledge that the recipient may be required to provide identification and may incur additional fees imposed by their local Western Union agent.</li>
                                                <li>Western Union reserves the right to verify your identity and source of funds for regulatory compliance.</li>
                                                <li>Transfers may be subject to government regulations and restrictions, including sanctions and embargoes.</li>
                                                <li>Western Union may disclose your information to regulatory authorities if required by law.</li>
                                                <li>You agree to indemnify Western Union against any claims or losses arising from your use of the service.</li>
                                                <li>This agreement is binding and governs all international money transfers made through Western Union's platform.</li>
                                            </ol>
                                            <p>Please carefully read and accept these terms and conditions before proceeding with your international money transfer through Western Union.</p>

                                            <input type="checkbox" id="acceptTerms" name="acceptTerms">
                                            <label for="acceptTerms">I agree to the above terms and conditions.</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="btn-area2 mt15 mb30 mt-4">
                                        <span class="btn-pack btn-type-3 ui-btn-pack-a ui-set-btn-pack ui-set-btn-pack-event">
                                            <a href="${pageContext.request.contextPath}/walletInfo" id="buttonCancel"
                                               class="">Prev</a></span>
                                <span class="btn-pack btn-type-3c ui-btn-pack-button ui-set-btn-pack ui-set-btn-pack-event">
                                            <button id="btnComplete">Remit </button></span>
                            </div>
                        </div>
                    </div>
                </div>

                <%--         수취인 정보 입력 끝 --%>
                <%--                송금 완료창 시작--%>
                <div class="remittance-complete" style="display: none">
                    <div class="bg">
                        <div class="card">
                            <span class="card__success">
<%--                                <i class="ion-checkmark"></i>--%>
                                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="90" viewBox="0 0 512 512">
                                    <path fill="none" stroke="white" stroke-linecap="round" stroke-linejoin="round"
                                          stroke-width="32" d="M416 128L192 384l-96-96"/></svg>
                            </span>

                            <h1 class="card__msg">Transfer Complete</h1>
                            <h2 class="card__submsg">Thank you for your transfer</h2>

                            <div class="card__body">

                                <div class="card__recipient-info">
                                    <p class="card__recipient">The transfer will be completed in approximately 1 minute,
                                        and you can track <br/>the real-time transfer status below. </p>
                                    <p class="card__email"></p>
                                </div>
                                <div class="card__price_wrapper">
                                <p class="card__price">Transfer Amount <span></span></p>
                                <p class="card__price">Recipient <span> </span></p>
                                <p class="card__price">Recipient Country <span></span></p>
                                </div>
                                <button class="mb-4 remittanceTrace" onclick="remittanceTrace(event)">
                                    Trace Transfer
                                </button>
                                <p class="card__method">Payment method</p>
                                <div class="card__payment">
                                    <img src="./images/walletIcon.png" class="card__credit-card">
                                    <div class="card__card-details">
                                        <p class="card__card-type"></p>
                                        <p class="card__card-number"></p>
                                    </div>
                                </div>

                            </div>

                            <div class="card__tags">
                                <span class="card__tag">completed</span>
                                <span class="card__tag">#123456789</span>
                            </div>

                        </div>

                    </div>
                </div>
                <%--                송금 완료창 끝--%>
        </div>


        </form>
    </div>
    <footer>
    </footer>
</div>

<script src="./js/remittance.js"></script>
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
    let walletInfoList = {};
    <c:forEach var="wallet" items="${walletList}">
    walletInfoList["${wallet.currencyCode}"] = {
        walletSeq: ${wallet.walletSeq},
        acNo: "${wallet.acNo}",
        userSeq: ${wallet.userSeq},
        balance: ${wallet.balance},
        walletPw: "${wallet.walletPw}",
        currencyCode: "${wallet.currencyCode}",
        currency: "${wallet.currency}",
        primeRate: "${wallet.primeRate}"
    };
    </c:forEach>
    console.log("월렛 정보는 ", walletInfoList);
    let member = {
        userSeq: "${currentMember.userSeq}",
        name: "${currentMember.name}",
    };
    let accountInfoList = {};
    <c:forEach var="account" items="${accountList}">
    accountInfoList["${account.acNo}"] = {
        acNo: "${account.acNo}",
        userSeq: "${account.userSeq}",
        acPasswd: "${account.acPasswd}",
        balance: "${account.balance}"
    };
    </c:forEach>

    console.log(exchangeRates);
    let countriesInfo;
    fetch('./json/country.json')
        .then(response => response.json())
        .then(data => {
            countriesInfo = data.countries;
        });

    let remittanceDTO = {};

    // 송금방식
    let selectedPaymentMethod = null;
    let nationality = null;
    let selectedCountry = null;

    function initializeSelectionAndListeners() {
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
                    // json의 국가코드와 일치하면 데이터 가져오기
                    if (data.selectedCountry) {
                        const countryInfo = countriesInfo.find(country => country.countrySP === data.selectedCountry);
                        console.log(countryInfo);
                        if (countryInfo) {
                            document.getElementById('countryName').textContent = countryInfo.nationality;
                            document.getElementById('currencyName').textContent = countryInfo.currencyCode;
                            document.querySelector('.nation').src = countryInfo.imagePath;
                            nationality = countryInfo.nationality;
                            console.log("국가이름은 ", nationality);
                        }
                    }
                    if (data.selectedPaymentMethod === 'selectAccount') {
                        document.querySelector('.compare_area').style.display = 'block';
                        document.querySelector('.selectCurAndPayment').style.display = 'none';
                    } else if (data.selectedPaymentMethod == 'selectWesternUnion') {
                        document.querySelector('.compare_area').style.display = 'block';
                        document.querySelector('.selectCurAndPayment').style.display = 'none';
                    }
                    console.log("선택된 송금 방식은 ", selectedPaymentMethod);
                },
                error: function (jqXHR) {
                    alert(jqXHR.responseText); // 서버에서 반환된 에러 메시지를 표시
                }
            })
        }

        document.querySelectorAll('.swiper-slide').forEach(function (slide) {
            slide.addEventListener('click', function () {
                selectCountry(slide.id);
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

    function nextStep(event) {
        event.preventDefault();
        let selectedAccountOption = document.getElementById('selectAccountForm').selectedOptions[0];
        let password = document.getElementById('account_password').value;
        let paymentAmountStr;

        // 선택된 계좌의 통화를 확인
        const selectedCurrency = selectedAccountOption.value;

        if (selectedCurrency === "KRW") {
            paymentAmountStr = document.getElementById('paymentAmount').innerText.replace(/,/g, '');
        } else {
            paymentAmountStr = document.getElementById('paymentAmountForeign').innerText.replace(/,/g, ''); // 외화로 결제할 금액
        }
        let paymentAmount = parseFloat(paymentAmountStr);
        let accountBalance = parseFloat(selectedAccountOption.getAttribute('data-balance'));
        let accountPassword = selectedAccountOption.getAttribute('data-password');
        console.log("선택된 계좌는 ", selectedAccountOption);
        console.log("입력한 비밀번호는 ", password);
        console.log("지불할금액은 ", paymentAmount);
        console.log("계좌잔액 ", accountBalance);
        console.log("계좌비밀번호 ", accountPassword);

        remittanceDTO.walletSeq = selectedAccountOption.getAttribute('data-walletSeq');
        remittanceDTO.senderAc = selectedAccountOption.getAttribute('data-acNo');
        remittanceDTO.remitAmount = paymentAmount;
        remittanceDTO.receivableAmount = document.getElementById('price').textContent;
        remittanceDTO.countryName = document.getElementById('countryName').textContent;
        console.log("송금계좌는 ", remittanceDTO.senderAc);
        console.log("최종나라이름은 ", remittanceDTO.countryName);

        if (password !== accountPassword) {
            alert('Incorrect password!');
            return;
        }

        if (accountBalance < paymentAmount) {
            alert('Insufficient funds!');
            return;
        }
        proceedToNextStep();
    }

    // 최종 컨트롤러
    $(document).ready(function () {
        $('#btnComplete').on('click', function (e) {
            e.preventDefault();
            console.log("선택된 송금방식은 ", selectedPaymentMethod);
            let recipientName = $('#recipientName').val();
            console.log(recipientName);
            let address = $('#addressDetail').val() + ', ' + $('#addressCity').val() + ', ' + $('#addressState').val();
            console.log(address);

            remittanceDTO.sender = member.name;
            remittanceDTO.recipient = recipientName;
            remittanceDTO.currencyCode = document.getElementById('currencyName').textContent;
            remittanceDTO.address = address;

            if (selectedPaymentMethod === 'selectAccount') {
                let routingNo = $('#routingNo').val();
                let accountNo = $('#accountNo').val();
                console.log("보낼 routing No은 ", routingNo);
                console.log("보낼 accountNo은 ", accountNo);

                remittanceDTO.recipientAc = accountNo;
                remittanceDTO.bankCode = routingNo;
                console.log("담긴 정보는", remittanceDTO);
                // 여기서 DTO 객체를 만들고 필드를 설정

                $.ajax({
                    url: '${pageContext.request.contextPath}/selectAccountInfo',
                    type: 'POST',
                    data: {
                        'address': remittanceDTO.address,
                        'bankCode': remittanceDTO.bankCode,
                        'currencyCode': remittanceDTO.currencyCode,
                        'receivableAmount': remittanceDTO.receivableAmount,
                        'recipient': remittanceDTO.recipient,
                        'recipientAc': remittanceDTO.recipientAc,
                        'remitAmount': remittanceDTO.remitAmount,
                        'sender': remittanceDTO.sender,
                        'senderAc': remittanceDTO.senderAc,
                        'walletSeq': remittanceDTO.walletSeq,
                        'selectedCountry': nationality
                    },
                    success: function (response, jqXHR) {
                        if (response.success) {
                            document.querySelector('.remittance-complete').style.display = 'block';
                            $('.card__price:contains("Transfer Amount") span').text(response.currencyCode + ' ' + response.receivableAmount);
                            $('.card__price:contains("Recipient") span').text(response.recipient);
                            $('.card__price:contains("Receipient Country") span').text(response.country);
                            $('.card__card-type').text('Hana Wallet');  // 예를 들어, '월렛'으로 설정
                            $('.card__card-number').text(response.senderAc);  // 서버 응답에서 월렛 번호 가져오기

                            document.querySelector('.recipientDiv').style.display = 'none';
                        } else {
                            alert('Error: ' + jqXHR.responseText);
                            console.log(jqXHR.responseText);
                        }
                    },
                    error: function (jqXHR, status, error) {
                        console.log(jqXHR);
                        alert('Error: ' + jqXHR.responseText);
                    }
                });
            } else if (selectedPaymentMethod === 'selectWesternUnion') {
                let paymentPlace = $('#receiptCity').val() + ', ' + $('#receiptState').val();
                remittanceDTO.paymentPlace = paymentPlace;
                console.log("paymentPlace는 ", paymentPlace);
                $.ajax({
                    url: '${pageContext.request.contextPath}/selectPaymentPlaceInfo',
                    type: 'POST',
                    data: {
                        'address': remittanceDTO.address,
                        'bankCode': remittanceDTO.bankCode,
                        'currencyCode': remittanceDTO.currencyCode,
                        'receivableAmount': remittanceDTO.receivableAmount,
                        'recipient': remittanceDTO.recipient,
                        'recipientAc': remittanceDTO.recipientAc,
                        'remitAmount': remittanceDTO.remitAmount,
                        'sender': remittanceDTO.sender,
                        'senderAc': remittanceDTO.senderAc,
                        'walletSeq': remittanceDTO.walletSeq,
                        'countryName': remittanceDTO.countryName,
                        'paymentPlace': remittanceDTO.paymentPlace,
                    },
                    success: function (response, jqXHR) {
                        if (response.success) {
                            document.querySelector('.remittance-complete').style.display = 'block';
                            document.querySelector('.recipientDiv').style.display = 'none';
                            $('.card__price:contains("Transfer Amount") span').text(response.currencyCode + ' ' + response.receivableAmount);
                            $('.card__price:contains("Recipient") span').text(response.recipient);
                            $('.card__price:contains("Recipient Country") span').text(response.country);
                            $('.card__card-type').text('Hana Wallet');  // 예를 들어, '월렛'으로 설정
                            $('.card__card-number').text(response.senderAc);  // 서버 응답에서 월렛 번호 가져오기
                        } else {
                            console.log(jqXHR);
                            alert('Error: ' + jqXHR.responseText);
                        }
                    },
                    error: function (jqXHR, status, error) {
                        console.log(jqXHR);
                        alert('Error: ' + jqXHR.responseText);
                    }
                });
            }
        });
    });

    function remittanceTrace(event) {
        event.preventDefault();
        window.location.href = '${pageContext.request.contextPath}/remittanceTrace';
    }

</script>
<script>
    // 우대율 계산
    // function updateRateAndCurrencyInfo() {
    //     const targetCurrencyCode = document.getElementById("currencyName").textContent;
    //
    //     // 환전할 금액 가져오기 (필요한 경우 사용)
    //     const targetAmount = document.getElementById("ds_to_money").value;
    //     const selectedWallet = walletInfoList[targetCurrencyCode];
    //
    //     // 통화코드와 우대율 요소 선택
    //     const currencyCodeElements = document.querySelectorAll(".curCode");
    //     const primeRateElement = document.querySelector(".primeRate");
    //
    //     // 해외 송금 환율 가져오기
    //     const remittanceRate = selectCurrency(targetCurrencyCode);
    //     // 우대율 적용 환율 계산
    //     const preferentialExchangeRate = calculatePreferentialExchangeRate(remittanceRate, selectedWallet.primeRate);
    //
    //     const exchangedAmountUSD = parseFloat(targetAmount) / remittanceRate;
    //     // const anticipatedPrimeAmount = (remittanceRate - preferentialExchangeRate) * exchangedAmountUSD;
    //     const anticipatedPrimeAmount = (remittanceRate - preferentialExchangeRate) * exchangedAmountUSD;
    //     const feeAmount = 5000;
    //     const estimatedWithdrawalAmount = parseFloat(targetAmount) + anticipatedPrimeAmount - feeAmount;
    //
    //     // 통화코드 업데이트
    //     currencyCodeElements.forEach(element => {
    //         if (element) {
    //             element.textContent = "" + targetCurrencyCode + "";
    //         }
    //     });
    //
    //     // 우대율 업데이트
    //     if (primeRateElement && selectedWallet && selectedWallet.primeRate) {
    //         primeRateElement.textContent = "Prime Exchange Rate " + selectedWallet.primeRate + "%";
    //     }
    //     // 해외 송금 환율 업데이트
    //     const nonPreferentialRateElement = document.querySelector(".txt:nth-child(3) em");
    //     if (nonPreferentialRateElement) {
    //         nonPreferentialRateElement.textContent = "" + targetCurrencyCode + " 1 = KRW " + formatNumber(remittanceRate);
    //     }
    //
    //     // 우대율 적용 환율 업데이트
    //     const preferentialRateElement = document.querySelector(".txt .preferentialRateValue");
    //     if (preferentialRateElement) {
    //         preferentialRateElement.textContent = formatNumber(preferentialExchangeRate);
    //     }
    //     // 해당 <tr> 보이기
    //     const anticipatedPrimeRow = document.getElementById("anticipatedPrimeRow");
    //     // const anticipatedPrimeAmount = (remittanceRate - preferentialExchangeRate) * exchangedAmountUSD;
    //
    //     if (anticipatedPrimeRow) {
    //         anticipatedPrimeRow.style.display = 'table-row'; // 또는 'block'
    //     }
    //     document.getElementById('paymentAmount').textContent = formatNumber(estimatedWithdrawalAmount) + ' won';
    //     document.querySelector('.txt em.KRW').textContent = 'KRW ' + formatNumber(anticipatedPrimeAmount);
    //
    // }
    // function calculatePreferentialExchangeRate(baseRate, primeRate) {
    //     const discountAmount = (primeRate / 100) * (baseRate - 1);
    //     return baseRate - discountAmount;
    // }

</script>
<script>
    // 약관동의 아코디언
    document.getElementById('acceptTerms').addEventListener('change', function() {
        const btnComplete = document.getElementById('btnComplete');
        if (this.checked) {
            btnComplete.removeAttribute('disabled');
        } else {
            btnComplete.setAttribute('disabled', 'disabled');
        }
    });

</script>
</body>
</html>
