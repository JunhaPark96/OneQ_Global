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
    <link href="./css/exchange/doExchange.css" rel="stylesheet"/>
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
            <h2>Currency Exchange</h2>
            <%--         연결게좌, 비밀번호 입력   --%>
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
                                            <option value="" selected disabled>Choose Accounts</option>
<%--                                            <c:forEach items="${accountList}" var="account">--%>
<%--                                                <option value="${account.acNo}" data-balance="${account.balance}">--%>
<%--                                                    (${account.acNo})--%>
<%--                                                </option>--%>
<%--                                            </c:forEach>--%>
                                        </select>
                                    </td>
                                </tr>

                                <tr class="border-light">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Balance</th>
                                    <td>
                                        <div class="btnArea" id="btnFclArea">
                                            <input type="text" name="inputBalance" id="inputBalance"
                                                   placeholder="잔액" maxlength="20"/>
                                        </div>
                                    </td>
                                </tr>

                                <tr class="border-light">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Password</th>
                                    <td>
                                        <input type="password" name="account_password" id="account_password"
                                               placeholder="계좌 비밀번호" maxlength="6"/>
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
            <%--         사용자에게 제공하는 정보 시작   --%>
            <div class="showExchangeRate">

                <div class="ExchangeInfo">
                    <table>
                        <caption>ExchangeRate Info</caption>
                        <colgroup>
                            <col style="width: 300px">
                            <col>
                        </colgroup>

                        <tbody>
                        <tr>
                            <th>When making a remittance</th>
                            <td>
                            <td><span class="txt"><em class="point" id="remittance">1,339.40</em></span></td>
                            </td>
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
            </div>
            <%--         사용자에게 제공하는 정보 끝   --%>


            <%--          환전 계산 시작 --%>
            <div class="compare_area">
                <div class="compare_section">
                    <div class="fr_info">
                        <div id="ds_sel" class="sbox">
                            <div class="selectbox_box _select_box" data-query="u3"
                                 data-option-query="u8=down&amp;u5=all">
                                <div class="selectbox_label _trigger"><span class="nation_usd _flag"> <img
                                        src="https://ssl.pstatic.net/sstatic/keypage/image/direct/img_blank.gif"
                                        class="_img" alt="미국 USD" width="1" height="1"> </span> <label class="_text">미국
                                    <em>USD</em></label></div>
                                <div class="ch_wrap_ly ly_rate scroll _list" style="display: none;">
                                    <ul class="ly_cont _l">
                                        <li class="_i" data-value="KRW"><a
                                                onclick="return goOtherCR(this,&quot;a=nco_x5m*a&amp;r=1&amp;i=&quot;+urlencode(&quot;0800042F_00000028AC42&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));"
                                                href="#">대한민국 KRW</a></li>
                                        <li class="_i on" data-value="USD"><a
                                                onclick="return goOtherCR(this,&quot;a=nco_x5m*a&amp;r=1&amp;i=&quot;+urlencode(&quot;0800042F_00000028AC42&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));"
                                                href="#">미국 USD</a></li>
                                        <li class="_i" data-value="EUR"><a
                                                onclick="return goOtherCR(this,&quot;a=nco_x5m*a&amp;r=1&amp;i=&quot;+urlencode(&quot;0800042F_00000028AC42&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));"
                                                href="#">유럽연합 EUR</a></li>
                                        <li class="_i" data-value="JPY"><a
                                                onclick="return goOtherCR(this,&quot;a=nco_x5m*a&amp;r=1&amp;i=&quot;+urlencode(&quot;0800042F_00000028AC42&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));"
                                                href="#">일본 JPY</a></li>
                                        <li class="_i" data-value="CNY"><a
                                                onclick="return goOtherCR(this,&quot;a=nco_x5m*a&amp;r=1&amp;i=&quot;+urlencode(&quot;0800042F_00000028AC42&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));"
                                                href="#">중국 CNY</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="input_box _input_box" data-query="u2" data-option-query="u8=down&amp;u5=info"><span
                                id="drt_from_span" class="input"> <input id="ds_from_money" maxlength="15" type="text"
                                                                         style="ime-mode:disabled;" value="1"
                                                                         class="_input input_text"> </span> <span
                                class="recite _recite">1 달러</span></div>
                    </div>
                    <span class="ico_same"><span class="blind">=</span></span>
                    <div class="fr_info">
                        <div id="ds_sel2" class="sbox _select_box" data-query="u4"
                             data-option-query="u8=down&amp;u5=all">
                            <div class="selectbox_box">
                                <div class="selectbox_label _trigger"><span class="nation_krw _flag"> <img
                                        src="https://ssl.pstatic.net/sstatic/keypage/image/direct/img_blank.gif"
                                        class="_img" alt="대한민국 KRW" width="1" height="1"> </span> <label
                                        for="ds_to_money" class="_text">대한민국 <em>KRW</em></label></div>
                                <div class="ch_wrap_ly ly_rate2 scroll _list" style="display: none">
                                    <ul class="ly_cont _l">
                                        <li class="_i on" data-value="KRW"><a
                                                onclick="return goOtherCR(this,&quot;a=nco_x5m*a&amp;r=1&amp;i=&quot;+urlencode(&quot;0800042F_00000028AC42&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));"
                                                href="#">대한민국 KRW</a></li>
                                        <li class="_i" data-value="USD"><a
                                                onclick="return goOtherCR(this,&quot;a=nco_x5m*a&amp;r=1&amp;i=&quot;+urlencode(&quot;0800042F_00000028AC42&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));"
                                                href="#">미국 USD</a></li>
                                        <li class="_i" data-value="EUR"><a
                                                onclick="return goOtherCR(this,&quot;a=nco_x5m*a&amp;r=1&amp;i=&quot;+urlencode(&quot;0800042F_00000028AC42&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));"
                                                href="#">유럽연합 EUR</a></li>
                                        <li class="_i" data-value="JPY"><a
                                                onclick="return goOtherCR(this,&quot;a=nco_x5m*a&amp;r=1&amp;i=&quot;+urlencode(&quot;0800042F_00000028AC42&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));"
                                                href="#">일본 JPY</a></li>
                                        <li class="_i" data-value="CNY"><a
                                                onclick="return goOtherCR(this,&quot;a=nco_x5m*a&amp;r=1&amp;i=&quot;+urlencode(&quot;0800042F_00000028AC42&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));"
                                                href="#">중국 CNY</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="input_box _input_box" data-query="u2" data-option-query="u8=up&amp;u5=info"><span
                                id="drt_to_span" class="input"> <input id="ds_to_money" maxlength="15" type="text"
                                                                       style="ime-mode:disabled;" value="1,327.90"
                                                                       class="_input input_text"> </span> <span
                                class="recite _recite result">1,327.90 원</span></div>
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
                            <strong>Confirm the amount before topping up</strong>
                        </div>

                        <div class="banking-cont">
                            <table summary="환전신청금액,결제하실 금액(원),결제방법(으)로 이루어진 결제정보1 테이블입니다.">
                                <caption>결제정보1</caption>
                                <colgroup>
                                    <col style="width: 600px">
                                    <col>
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
</body>
</html>
