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
    <link href="./css/exchange/exchangeRate.css" rel="stylesheet"/>
    <%--    캘린더--%>
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.8.0/css/pikaday.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.8.0/pikaday.min.js"></script>
    <%--    차트 js--%>
<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.js"></script>--%>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-zoom@0.7.3"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js"></script>
<%--    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.css">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.css">

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
                                    id="selectQuote">
                                <option>First</option>
                                <option>Current</option>
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
                            </select>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="btnArea justify-content-center" id="acc_trans_inquiry">
                    <input type="button" id="btnNext" class="btn_p" value="조회">
                </div>
            </div>
            <%--            환율 조회 테이블--%>
            <div class="exchange_rate_hist mt-5">
                <table id="exchange_rate_tbl" class="table table-striped table-hover table-bordered">
                    <thead class="table-dark">
                    <tr>
                        <th>Currency</th>
                        <th>Rate Date</th>
                        <th>Buy Rate</th>
                        <th>Sell Rate</th>
                        <th>Sending</th>
                        <th>Receiving</th>
                        <th>Base Rate</th>
                        <th>Prev Rate</th>
                        <th>USD Conversion Rate</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <%--            검색 통화 그래프 --%>
            <div class="mt-5">
                <canvas id="exchangeRateChart" width="400" height="200"></canvas>
<%--                <button id="reset_zoom">Reset Zoom</button>--%>
<%--                <button id="disable_zoom">Disable Zoom</button>--%>
<%--                <button id="enable_zoom">Enable Zoom</button>--%>
            </div>


        </div>
        <footer>
        </footer>
    </div>
</div>

<script>
    let myChart;
    $(document).ready(function () {
        $('#exchange_rate_tbl thead').hide(); // 처음엔 숨기기

        $('#btnNext').click(function () {

            let inqStrDt = document.getElementById('inqDt').value;
            let currency = document.getElementById('selectCurrency').value;

            // 1. 특정 날짜의 환율 정보를 가져옵니다.
            $.ajax({
                url: '${pageContext.request.contextPath}/exchange',
                method: 'post',
                contentType: 'application/json',
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
                        let rawDate = data[i].rateDate;
                        let formattedDate = new Date(rawDate).toISOString().split('T')[0];
                        $('#exchange_rate_tbl tbody').append('<tr>' +
                            '<td>' + data[i].currencyCode + '</td>' +
                            '<td>' + formattedDate + '</td>' +
                            '<td>' + data[i].buyRate + '</td>' +
                            '<td>' + data[i].sellRate + '</td>' +
                            '<td>' + data[i].remittance + '</td>' +
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

            // 2. 최근 6개월 동안의 해당 통화의 환율 정보를 가져옵니다.
            $.ajax({
                url: '${pageContext.request.contextPath}/exchange/lastSixMonths',
                method: 'post',
                contentType: 'application/json',
                data: JSON.stringify({
                    currency: currency
                }),
                success: function (data) {
                    let rateDates = [];
                    let baseRates = [];
                    for (let i = 0; i < data.length; i++) {
                        let rawDate = data[i].rateDate;
                        let formattedDate = new Date(rawDate).toISOString().split('T')[0];
                        rateDates.push(formattedDate);
                        baseRates.push(data[i].baseRate);
                    }

                    let ctx = document.getElementById('exchangeRateChart').getContext('2d');
                    if (myChart) {
                        myChart.destroy(); // 이전 차트 인스턴스 제거
                    }
                    myChart = new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: rateDates,
                            datasets: [{
                                label: 'Base Rate',
                                data: baseRates,
                                borderColor: 'rgb(75, 192, 192)',
                                borderWidth: 1,
                                fill: true
                            }]
                        },
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        },
                        plugins: {
                            zoom: {
                                pan: {
                                    enabled: true,
                                    mode: 'xy', // 'x'와 'y' 축 모두를 패닝하도록 설정
                                    speed: 0.1,
                                    threshold: 10
                                },
                                zoom: {
                                    enabled: true,
                                    drag: true, // 사용자가 드래그하여 확대할 수 있도록 설정
                                    mode: 'xy', // 'x'와 'y' 축 모두를 확대하도록 설정
                                    speed: 0.1,
                                    threshold: 2,
                                    sensitivity: 3

                                }
                            }
                        }
                    });
                    myChart.options.plugins.zoom.zoom.enabled = true;
                    myChart.options.plugins.zoom.pan.enabled = true;
                },
                error: function (jqXHR) {
                    console.log(jqXHR.responseText);
                    alert('Error code: ' + jqXHR.status + '. Error message: ' + jqXHR.responseText);
                }

            });
        });
    });
    // $('#reset_zoom').click(function () {
    //     if (myChart) {
    //         myChart.resetZoom();
    //     }
    // });
    //
    // $('#disable_zoom').click(function () {
    //     if (myChart) {
    //         myChart.options.plugins.zoom.zoom.enabled = false;
    //         myChart.options.plugins.zoom.pan.enabled = false;
    //         myChart.update(); // 차트 설정 업데이트
    //     }
    // });
    //
    // $('#enable_zoom').click(function () {
    //     if (myChart) {
    //         myChart.options.plugins.zoom.zoom.enabled = true;
    //         myChart.options.plugins.zoom.pan.enabled = true;
    //         myChart.update(); // 차트 설정 업데이트
    //     }
    // });

</script>
</body>
</html>
