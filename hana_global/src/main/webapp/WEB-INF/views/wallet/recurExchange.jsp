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
    <link href="./css/wallet/recurExchange.css" rel="stylesheet"/>
    <link href="./css/wallet/flags.css" rel="stylesheet"/>

    <title>월렛 확인</title>
</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area">
        <%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
        <div class="main-body">
            <h2>Recur Currency</h2>
            <%--            월렛 카드 구역    --%>
            <div class="walletCell" data-currency="${selectedWallet.currencyCode}">
                <div class="walletCard">
                    <div class="cardHeader">
                        <h4>Hana Wallet</h4>
                        <button class="loadBtn">Load</button>
                    </div>
                    <div class="cardElem1">
                        <a href="${pageContext.request.contextPath}/accountInfo"> ${selectedWallet.balance}
                            &nbsp; ${selectedWallet.currency} </a>
                    </div>
                    <div class="cardElem2">
                        <a href="${pageContext.request.contextPath}/recurExchange?currency=${selectedCurrency}"> JPY
                            100 = 905.26원 새로고침 아이콘</a>
                    </div>
                    <div class="cardElem3">
                        <div class="btn_p">
                            <a href="/curExchange">Exchange</a>
                        </div>
                        <div class="btn_s">
                            <a href="/overseaRemittance">Remittance</a>
                        </div>
                    </div>
                </div>
            </div>
            <%--            월렛 카드 구역 끝   --%>
            <div class="col pt-1 showBalance">
                원화 잔액
                해당나라 잔액
                미화 잔액
                option: 해당국적의 환율로도 보여주기
            </div>

            <div class="col pt-1 settingRecurring">
                <form>
                    <%--                    <div class="row">--%>
                    <%--                        <h4 class="text-start"> 날짜 설정 </h4>--%>
                    <%--                        <p class="text-muted p-border"> </p>--%>
                    <%--                    </div>--%>
                    <%--                    날짜 설정--%>
                    <%--                    종료일 설정--%>
                    <%--                    충전통화설정--%>
                    <%--                    충전금액설정--%>
                    <%--                    목표환율설정--%>
                    <table class="table table-hover mb-3 border-light">
                        <tbody>
                        <tr>
                            <th scope="col" class="h5 text-black-50 border-light" style="width: 35%"></th>
                            <th scope="col" class="h5 text-dark border-light" style="width: 75%"></th>
                        </tr>

                        </tbody>

                        <tbody>

                        <tr>
                            <th scope="row" class="text-start align-middle">종료일 설정</th>
                            <td>
                                <div class="btnArea text-start align-middle">
                                    <input type="text" name="endDate" id="endDate"
                                           placeholder="종료 날짜">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row" class="text-start align-middle">충전 금액</th>
                            <td>
                                <div class="btnArea text-start align-middle">
                                    <input type="text" name="targetAmount" id="targetAmount"
                                           placeholder="목표 충전금액">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row" class="text-start align-middle">목표환율 설정(매매기준율)</th>
                            <td>
                                <div class="btnArea text-start align-middle">
                                    <input type="text" name="targetRate" id="targetRate"
                                           placeholder="목표 환율 설정">
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <br/>
                    <div class="btnArea text-center align-middle">
                        <p>2분 간격으로 하나은행 고시환율을 확인하여 설정한 환율보다 낮거나 같을 경우 자동충전을 진행</p>
                    </div>

                    <div class="btn-area mt15 mb30">
                        <span class=" btn-pack btn-type-3 ui-btn-pack-a ui-set-btn-pack ui-set-btn-pack-event">
                        <a href="${pageContext.request.contextPath}/walletInfo" id="buttonCancel"
                           class="">Cancel</a></span>
                        <span class=" btn-pack btn-type-3c ui-btn-pack-button ui-set-btn-pack ui-set-btn-pack-event">
                        <button type="submit" class="" id="buttonConfirm">Save </button></span>
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
