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
            <div class="account_transaction withdraw-card">
                <div class="col-md-12>                                                                                                                                                                                                                                                                      ">
                    <div class="card-body pe-5">
                        <table class="table table-hover border-light">
                            <form action="${pageContext.request.contextPath}/walletInfo" method="post">
                                <thead>
                                <tr>
                                    <th scope="col" class="h5 text-black-50 border-light" style="width: 50%"></th>
                                    <th scope="col" class="h5 text-dark border-light" style="width: 50%"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <%--                                계좌 선택 --%>
                                <tr class="text border-light">
                                    <th scope="row" class="text-center align-middle">&nbsp;&nbsp;Choose</th>
                                    <td>
                                        <select class="form-select border-3 w-50" name="senderAccountNo"
                                                id="selectAccountForm" onchange="changeBalance()" style="height: 45px;">
                                            <option value="" selected disabled>계좌를 선택하세요.</option>
                                            <c:forEach items="${accountList}" var="account">
                                                <option value="${account.acNo}" data-balance="${account.balance}">
                                                    (${account.acNo})
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>

                                <tr class="border-light">
                                    <th scope="row" class="text-center align-middle">&nbsp;&nbsp;잔액</th>
                                    <td>
                                        <div class="btnArea" id="btnFclArea">
                                            <p class="text-center align-middle" id="accountBalance">
                                            </p>
                                        </div>
                                    </td>
                                </tr>

                                <tr class="border-light">
                                    <th scope="row" class="text-center align-middle">&nbsp;&nbsp;비밀번호</th>
                                    <td>
                                        <input type="password" name="account_password" id="account_password"
                                               placeholder="계좌 비밀번호" maxlength="4"/>
                                    </td>
                                </tr>
                                </tbody>
                            </form>
                        </table>
                        Preferential rate is 100% with Hana Money!
                    </div>
                </div>
            </div>
            <%--         사용자에게 제공하는 정보 시작   --%>
            <div class="showBalance">
                <div class="apprslt">
                    <div class="apprslt_current">
                        <p class="tit">결제금액(원)</p>
                        <p class="price" name="p_krwAmt" id="p_krwAmt">13,313</p>
                    </div>

                    <div class="apprslt_result">
                        <ul>
                            <li>적용환율<span name="span_apclExhgRt" id="span_apclExhgRt">1,331.32 원</span></li>
                            <li>우대율<span name="span_apclPrimRt" id="span_apclPrimRt">90 %</span></li>
                        </ul>
                    </div>

                </div>
            </div>
            <%--         사용자에게 제공하는 정보 끝   --%>
            <div class="col pt-1 settingRecurring">
                <form>
                    <div class="btnArea text-start align-middle">
                        <p>Check Hana Bank's announced exchange rate every 5 minutes<br/> and proceed with automatic
                            charging if it is lower or equal to the set exchange rate</p>
                    </div>

                    <div class="banking-wrap input-focus-wrap">
                        <div class="title-cont">
                            <strong>결제정보를 입력하세요</strong>
                        </div>

                        <div class="banking-cont nothead">
                            <table summary="환전신청금액,결제하실 금액(원),결제방법(으)로 이루어진 결제정보1 테이블입니다.">
                                <caption>결제정보1</caption>
                                <colgroup>
                                    <col style="width: 150px">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>환전신청금액</th>
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
                                    <th>결제하실 금액(원)</th>
                                    <td><span class="txt"><em class="point">13,313</em></span></td>
                                </tr>
                                <tr>
                                    <th>결제방법</th>
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
