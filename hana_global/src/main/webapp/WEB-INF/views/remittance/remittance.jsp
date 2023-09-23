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
                        <div class="toggleExchangeRate" onclick="toggleRateInfo()">
                        </div>
                        <span class=" btn-pack btn-type-3c ui-btn-pack-button ui-set-btn-pack ui-set-btn-pack-event">

                        <button type="button" class="" id="calExchange">Calculate </button></span>
                    </div>
                </div>
                <%--          환전 계산 끝 --%>


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
										<img src="./images/walletIcon_.png" style="width: 30px; height: 30px"
                                             alt="국기" class="flag">
										<em class="currency"></em>
										<em class="price">10</em>
									</span>
                                    </td>
                                </tr>

                                <tr>
                                    <th>The amount you will be paying(Won)</th>
                                    <td><span class="txt" style="color: #016f73; font-weight: 700; font-size: 20px"><em class="point"></em></span></td>
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
                                                    <option value="${account.acNo}" data-account="${account}"
                                                            data-balance="${account.balance}">
                                                            ${account.acNo}
                                                    </option>
                                                </c:forEach>
                                            </optgroup>

                                            <optgroup label="Hana Wallet">
                                                <option value="HANA Wallet" data-wallet="${walletKRW}"
                                                        data-balance="${walletKRW.balance}">
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
                <div class="btn-area2 mt15 mb30">
                        <span class=" btn-pack btn-type-3 ui-btn-pack-a ui-set-btn-pack ui-set-btn-pack-event">
                        <a href="${pageContext.request.contextPath}/walletInfo" id="buttonCancel"
                           class="">Cancel</a></span>
                    <span class=" btn-pack btn-type-3c ui-btn-pack-button ui-set-btn-pack ui-set-btn-pack-event">
                        <button type="submit" class="" id="buttonConfirm">Topping up </button></span>
                </div>
            </form>
        </div>



        <footer>
        </footer>
    </div>
</div>







</body>
</html>
