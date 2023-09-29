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
    <%--    스와이퍼--%>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <%--    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>--%>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/ionicons/7.1.2/esm/ionicons.min.js" integrity="sha512-2ySmquu6HK3CAvwLllh0R8K8buFPMZsUwWLZIlB7WW8c8ilUtoNyhsmEsQn2U0IV1USr2Oc/9DJzlr4cxAbuxA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>--%>
    <script src="https://cdn.jsdelivr.net/npm/ionicons@5.0.0/dist/ionicons.js"></script>

    <%--    <script src="./js/wallet.js"></script>--%>
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
                                <div class="selectWesternUnion" id="selectWesternUnion" onclick="closeModal()">
                                    <div><img src="./images/walletIcon.png" class="paymentImage" alt=""></div>
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
                                                                            <img src="./images/walletIcon_KRW.png"
                                                                                 class="_img"
                                                                                 width="35px"
                                                                                 height="30px">
                                                                        </span>
                                        <label class="_text">Korea <em> KRW</em></label>
                                    </div>

                                </div>
                            </div>
                            <div class="input_box _input_box">
                                                                <span id="drt_from_span" class="input">
                                                                    <input id="ds_from_money" maxlength="15" type="text"
                                                                           style="ime-mode:disabled;"
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
                                                                    <input id="ds_to_money" type="text"
                                                                           style="ime-mode:disabled;"
                                                                           value=""
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
                                                            <button type="button" class=""
                                                                    id="calExchange">Calculate </button>
                                                        </span>
                    </div>
                    <%--        결제 정보 미리보기 시작    --%>
                    <div class="col previewPayment" style="display: none">
                        <div class="banking-wrap input-focus-wrap">
                            <div class="title-cont">
                                <h5>Confirm the amount before making remittance</h5>
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
                                        <th>Transfer Fee</th>
                                        <td><span class="txt"><em>5,000 won</em></span></td>
                                    </tr>
                                    <tr>
                                        <th>The amount you will be paying(Won)</th>
                                        <td><span class="txt" style="color: #016f73; font-weight: 700; font-size: 20px"><em
                                                class="point"></em></span></td>
                                    </tr>

                                    <tr>
                                        <th>Payment method</th>
                                        <td>
                                            <span class="txt"></span>
                                            <%--                                                                                                        <select id="selectAccountForm" name="account" onchange="displayBalance()">--%>
                                            <%--                                                                                                            <option value="">-- Select an account --</option>--%>
                                            <%--                                                                                                            <!-- JSTL을 사용하여 accountList를 반복하고 각 계좌에 대한 옵션을 생성합니다 -->--%>
                                            <%--                                                                                                            <c:forEach var="account" items="${accountList}">--%>
                                            <%--                                                                                                                <option value="${account.acNo}"--%>
                                            <%--                                                                                                                        data-balance="${account.balance}">${account.acNo} ${account.acName}</option>--%>
                                            <%--                                                                                                            </c:forEach>--%>
                                            <%--                                                                                                        </select>--%>
                                            <select class="form-select border-3 w-60" name="senderAccountNo"
                                                    id="selectAccountForm" onchange="displayBalance()"
                                                    style="height: 45px;">
                                                <option value="" selected disabled>Choose Payment Method</option>

                                                <optgroup label="Accounts">
                                                    <c:forEach items="${accountList}" var="account">
                                                        <option value="${account.acNo}" data-account="${account}"
                                                                data-balance="${account.balance}">
                                                                ${account.acNo}
                                                        </option>
                                                    </c:forEach>
                                                </optgroup>

                                                <optgroup label="Hana Wallet">
                                                    <c:forEach items="${walletList}" var="wallet">

                                                        <option value="${wallet.currencyCode}" data-wallet="${wallet}"
                                                                data-balance="${wallet.balance}">
                                                                ${wallet.currencyCode}
                                                        </option>
                                                    </c:forEach>
                                                </optgroup>

                                            </select>
                                        </td>
                                    </tr>
                                    <tr style="display: none" id="balanceRow">
                                        <th>Available Withdrawal</th>
                                        <td>
                                            <span class="txt" id="balanceDisplay"></span>
                                        </td>
                                    </tr>
                                    <tr style="display: none" id="passwordRow">
                                        <th scope="row" class="text-start align-middle">Password</th>
                                        <td>
                                            <input type="password" name="account_password" id="account_password"
                                                   placeholder="password" maxlength="6"/>
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
                    <div class="fs-5" style="color: #bdbdbd">Remittance / <strong style="color: #000000">Recipient Information Entry</strong></div>
                    <div class="col-md-12">
                        <div class="card-body pe-5">
                            <table class="table" style="background-color: #f4f3ef;">
                                <tbody style="border-style: none">
                                <!-- Recipient's Name -->
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
                                        &nbsp;&nbsp;Note
                                    </th>
                                    <td>

                                        <div>
                                            <span class="fs-5"> <strong style="color: #000000; font-size: 14px">Please specify exact name written in your passport</strong></span>
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
                                        <select class="form-select border-3 w-60" name="addressState" id="addressState"
                                                style="height: 45px; width: 50%;">
                                            <option value="" selected disabled>State</option>
                                        </select>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <!-- Recipient's Bank Account Information -->
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
                                        <th scope="row" class="text-start align-middle">&nbsp;&nbsp;City</th>
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
                                WU빠른해외송금은 수취국가의 취급점에 방문하여 수취 가능합니다. 전세계 55만개 취급점의 위치와 수취 방법은 아래 링크에서 확인 가능
                            </div>


                            <div class="btn-area2 mt15 mb30">
                                        <span class="btn-pack btn-type-3 ui-btn-pack-a ui-set-btn-pack ui-set-btn-pack-event">
                                            <a href="${pageContext.request.contextPath}/walletInfo" id="buttonCancel"
                                               class="">Prev</a></span>
                                <span class="btn-pack btn-type-3c ui-btn-pack-button ui-set-btn-pack ui-set-btn-pack-event">
                                            <button id="btnComplete" onclick="">Remit </button></span>
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
                                    <p class="card__recipient">상대방이 받을 때 까지 약 3~5일 소요되며, 송금도착 후 자동송금 신청이 가능합니다</p>
                                    <p class="card__email"></p>
                                </div>

                                <p class="card__price">송금금액 <span>[송금통화] [송금금액]</span></p>
                                <p class="card__price">수취인 <span> [수취인이름]</span></p>
                                <p class="card__price">수취국가 <span>[수취국가이름]</span></p>
                                <button>
                                    송금추적
                                </button>
                                <p class="card__method">Payment method</p>
                                <div class="card__payment">
                                    <img src="./images/myAccount.png" class="card__credit-card">
                                    <div class="card__card-details">
                                        <p class="card__card-type">[계좌 또는 월렛]</p>
                                        <p class="card__card-number">[계좌 또는 월렛 번호]</p>
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
                <%--                송금 완료창 시작--%>
        </div>


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


    let selectedPaymentMethod = null;

    function initializeSelectionAndListeners() {
        let selectedCountry = null;

        // let selectedPaymentMethod = null;

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
    // 최종 컨트롤러
    $(document).ready(function() {
        $('#btnComplete').on('click', function(e) {
            e.preventDefault();

            let recipientName = $('#recipientName').val();
            console.log(recipientName);
            let address = $('#addressDetail').val() + ', ' + $('#addressCity').val() + ', ' + $('#addressState').val();
            console.log(address);

            if (selectedPaymentMethod === 'selectAccount') {
                let routingNo = $('#routingNo').val();
                let accountNo = $('#accountNo').val();

                $.ajax({
                    url: '${pageContext.request.contextPath}/selectAccountInfo',
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        recipientName: recipientName,
                        address: address,
                        routingNo: routingNo,
                        accountNo: accountNo
                    },
                    success: function(response) {
                        if (response.success) {
                            $('.remittance-complete').show();
                        } else {
                            alert('Error: ' + response.error);
                        }
                    },
                    error: function(xhr, status, error) {
                        alert('Error: ' + error);
                    }
                });
            } else if (selectedPaymentMethod === 'selectWesternUnion') {
                let paymentPlace = $('#receiptCity').val() + ', ' + $('#receiptState').val();

                $.ajax({
                    url: '${pageContext.request.contextPath}/selectPaymentPlaceInfo',
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        recipientName: recipientName,
                        address: address,
                        paymentPlace: paymentPlace
                    },
                    success: function(response) {
                        if (response.success) {
                            $('.remittance-complete').show();
                        } else {
                            alert('Error: ' + response.error);
                        }
                    },
                    error: function(xhr, status, error) {
                        alert('Error: ' + error);
                    }
                });
            }
        });
    });

</script>

</body>
</html>
