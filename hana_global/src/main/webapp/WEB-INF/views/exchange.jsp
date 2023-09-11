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

    <link href="./css/service-main.css" rel="stylesheet"/>
    <link href="./css/nav.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/account_details.css" rel="stylesheet"/>
    <link href="./css/exchange/exchangeRate.css" rel="stylesheet"/>
    <%--    캘린더--%>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.8.0/css/pikaday.min.css">
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
            <h2>View Exchange Rate</h2>
            <div class="card-body pe-5">
                <table class="table table-hover mb-3 border-light">
                    <thead>
                    <tr>
                        <th scope="col" class="h5 text-black-50 border-light" style="width: 20%"></th>
                        <th scope="col" class="h5 text-dark border-light" style="width: 80%"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <%--                            기간 조회--%>
                    <tr>
                        <th scope="row" class="text-center align-middle">&nbsp;&nbsp;조회기간</th>
                        <td class="tbl_left">
                            <div class="tbl_in">
                                <input type="text" id="inqDt" name="inqDt">
                                <img src="https://image.kebhana.com/pbk/easyone/resource/img/btn/btn_calendar.gif"
                                     alt="Start Date Calendar Tab" onclick="openCalendar('inqDt')">
                                <br>
                                <span class="ml5">(Enter 8-digit date in YYYYMMDD format. e.g. 2023-09-11)</span>
                            </div>
                        </td>
                    </tr>
                    <%--                             선택--%>
                    <tr class="text">
                        <th scope="row" class="text-center align-middle">&nbsp;&nbsp;Select Quote No</th>
                        <td>
                            <select class="form-select border-3 w-50" name="withdrawAccountNo"
                                    id="selectQuote"
                                    onchange="viewExchangeRate()">
                                <option>First</option>
                                <option value="" selected disabled>Current</option>
                            </select>
                        </td>
                    </tr>

                    <tr class="text">
                        <th scope="row" class="text-center align-middle">&nbsp;&nbsp;Select Currency</th>
                        <td>
                            <select class="form-select border-3 w-50" name="withdrawAccountNo"
                                    id="selectCurrency"
                                    onchange="viewExchangeRate() ">
                                <option value="" selected disabled>Select Currency</option>
                                <option value="USD">USD</option>
                            </select>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="btnArea justify-content-center" id="acc_trans_inquiry">
                    <input type="button" id="btnNext" class="btn_p" value="조회">
                </div>
            </div>

            <div class="exchange_rate_hist mt-5">
                <table id="exchange_rate_tbl" class="table table-striped table-hover table-bordered">
                    <thead class="table-dark">
                    <tr>
                        <th>currency code</th>
                        <th>rate date</th>
                        <th>buy rate</th>
                        <th>sell rate</th>
                        <th>sending</th>
                        <th>receiving</th>
                        <th>base rate</th>
                        <th>prev rate</th>
                        <th>usd conversion rate</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>

        </div>
        <footer>
        </footer>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#exchange_rate_tbl thead').hide(); // 처음엔 숨기기

        $('#btnNext').click(function () {

            let inqStrDt = document.getElementById('inqDt').value;
            // let quoteNo = document.getElementById('selectQuote').value;
            let currency = document.getElementById('selectCurrency').value;

            $.ajax({
                url: '${pageContext.request.contextPath}/exchange',
                method: 'post',
                contentType: 'application/json', // 추가
                data: JSON.stringify({
                    inqDt: inqStrDt,
                    currency: currency
                }),
                success: function (data) {
                    // Empty the table body
                    $('#exchange_rate_tbl thead').show(); // 클릭 시 보이기
                    $('#exchange_rate_tbl tbody').empty();

                    // Fill the table with response data
                    for (let i = 0; i < data.length; i++) {
                        $('#exchange_rate_tbl tbody').append('<tr>' +
                            '<td>' + data[i].currencyCode + '</td>' +
                            '<td>' + data[i].rateDate + '</td>' +
                            '<td>' + data[i].buyRate + '</td>' +
                            '<td>' + data[i].sellRate + '</td>' +
                            '<td>' + data[i].sending + '</td>' +
                            '<td>' + data[i].receiving + '</td>' +
                            '<td>' + data[i].baseRate + '</td>' +
                            '<td>' + data[i].prevRate + '</td>' +
                            '<td>' + data[i].usdConversionRate + '</td>' +
                            '</tr>');
                    }
                },

                error: function () {
                    alert('Error retrieving exchange rate.');
                }
            });
        });
    });

    function openCalendar(id) {
        let input = document.getElementById(id);
        let picker = new Pikaday({
            field: input,
            format: 'YYYY-MM-DD',
        });
        picker.show();
    }
</script>
</body>

</html>
