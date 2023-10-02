<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd H:mm:ss");
%>
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

    <link href="./css/service-main.css" rel="stylesheet"/>
    <link href="./css/nav.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/exchange/exchangeRate.css" rel="stylesheet"/>
    <%--    <link href="./css/bootstrap/bootstrap.min.css" rel="stylesheet"/>--%>
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
            <h2>Wallet Transaction Detail</h2>
            <div class="content">
                <div class="ms-5 fs-5" style="color: #bdbdbd">Wallet / <strong style="color: #000000">Wallet
                    Details</strong></div>
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4 p-2">
                        <div class="col-sm-12 col-xl-12 p-0">
                            <div class="d-flex">
                                <%--                                회원의 총 보유금액 시작--%>
                                <div class="col-7 border-5 border-top box p-4 rounded"
                                     style="border-color: #008485 !important; max-height: 200px; background-color: #6ec7e0;">
                                    <div class="d-flex mt-3 justify-content-between">
								<span class="fs-5 text-black-50" style="font-family: dotom">
									${currentMember.name}님 보유금액
								</span>
                                        <span class="fs-6 pt-1" style="font-family: dotom">
                                            									<%= sf.format(nowTime) %> 고시환율 기준
                                        </span>
                                    </div>
                                    <div class="mt-3 fs-5" style="color:#494949; font-family: hanaM">
                                        USD 환산
                                    </div>
                                    <div class="fs-3" id="usd_rate" value="">
                                    </div>
                                </div>
                                <%--                                회원의 총 보유금액 끝--%>

                            </div>
                        </div>
                        <div class="col-12 d-flex p-0"
                             style="background-color: #eceff1; border-radius: 10px 10px 0px 0px">
                            <button id="hold_history" type="button"
                                    class="col-4 text-center border-0 pt-3 pb-3 fs-5 bg-hanagreen"
                                    style="font-family: hanaM; color: #ffffff; border-radius: 10px 0px 0px 0px"
                                    onclick="click_hold_history()">
                                전체내역
                            </button>
                            <button id="hold_ccy" type="button" class="col-4 text-center border-0 pt-3 pb-3 fs-5"
                                    style="font-family: hanaM; color: #8d8d8d" onclick="click_hold_ccy()">
                                환전내역
                            </button>
                            <button id="exchange_reservation" type="button"
                                    class="col-4 text-center border-0 pt-3 pb-3 fs-5"
                                    style="font-family: hanaM; color: #8d8d8d; border-radius: 0px 10px 0px 0px"
                                    onclick="click_exchange_reservation()">
                                송금내역
                            </button>
                        </div>
                        <div class="col-12 bg-white mt-0 mb-4 pb-4" id="div_hold_history"
                             style="min-height: 350px; border-radius: 0px 0px 10px 10px">

                        </div>
                        <div class="col-12 bg-white mt-0 mb-4 d-none" id="div_hold_ccy"
                             style="min-height: 350px; border-radius: 0px 0px 10px 10px">
                        </div>
                        <div class="col-12 bg-white mt-0 mb-4 d-none" id="div_exchange_res"
                             style="min-height: 350px; border-radius: 0px 0px 10px 10px">

                        </div>
                        <%--				예약신청을 위한 숨겨진 form--%>
                        <form class="d-none" id="deliveryForm" action="/postDeliveryForm" method="post">
                            <input type="text" id="delivery_walletNo" name="walletNo" value="">
                            <input type="text" id="delivery_ccyCode" name="ccyCode" value="">
                        </form>
                    </div>
                </div>
            </div>

        </div>
        <footer>
        </footer>
    </div>
</div>
<script>

</script>
</body>
</html>
