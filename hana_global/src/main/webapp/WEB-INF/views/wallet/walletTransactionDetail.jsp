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
    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"--%>
    <%--          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">--%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
            crossorigin="anonymous"></script>

    <link href="./css/service-main.css" rel="stylesheet"/>
    <link href="./css/nav.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/bootstrap/bootstrap2.min.css" rel="stylesheet"/>
    <link href="./css/wallet/walletTransactionDetail.css" rel="stylesheet"/>
    <%--    <link href="./css/bootstrap/bootstrap.min.css" rel="stylesheet"/>--%>
    <style>
        .btn-link.dropdown-toggle::after {
            color: #2d9646; /* 부트스트랩의 기본 초록색 */
        }

        .dropdown-item:focus, .dropdown-item:hover {
            background-color: #018085; /* 원하는 색상으로 변경 */
        }

        .paginationWrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px 0; /* 상하 여백 추가 */
        }

        .page-number {
            display: inline-block;
            margin: 0 5px;
            padding: 5px 10px;
            border-radius: 5px;
            background-color: #eceff1;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-family: hanaM;
        }

        .page-number:hover {
            background-color: #d1d8e0;
        }

        .page-number.active {
            background-color: #018085;
            color: #ffffff;
        }

        .country-image {
            width: 50px;
            height: 50px;
            background-repeat: no-repeat;
            background-size: cover;
        }

        /*    월렛*/
        .wallet-card {
            background-color: #f6f6f6; /* 약간의 회색 톤으로 배경을 설정 */
            border: 1px solid #f61212;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
            border-radius: 15px; /* 모서리를 라운드 처리 */
            transition: transform .3s, box-shadow .3s; /* 호버 효과를 위한 전환 설정 */
        }

        .wallet-card:hover {
            transform: translateY(-5px); /* 호버시 약간 위로 이동 */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15); /* 그림자 강조 */
        }

        .wallet-card .border-bottom {
            border-bottom: 2px solid #e0e0e0;
        }

        .wallet-card .fa-link {
            color: #2c3e50; /* 아이콘의 색상을 변경 */
        }

        .wallet-card h5, .wallet-card div {
            margin-bottom: 8px;
        }

        .wallet-card .country-icon {
            position: absolute; /* 절대 위치 설정 */
            top: 3px; /* 오른쪽 상단에 위치하도록 설정 */
            right: 10px;
            width: 40px; /* 아이콘 크기 설정. 필요에 따라 조정 가능 */
            height: 40px;
            border-radius: 50%; /* 원형으로 만들기 위한 설정 */
            /*overflow: hidden; !* 이미지가 원 밖으로 나가지 않게 설정 *!*/
        }

        .wallet-card .country-icon img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* 이미지를 적절히 잘라내어 표시 */
        }

    </style>
    <title>월렛 확인</title>
</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area">
        <%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
        <div class="main-body">
            <h2 class="mb-4">Wallet Transaction Detail</h2>
            <div class="content">
                <div class="ms-4 mb-0 fs-5" style="color: #bdbdbd">Wallet / <strong style="color: #000000">Wallet
                    Details</strong></div>
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4 p-2">
                        <div class="col-sm-12 col-xl-12 p-0">
                            <div class="col-12 p-3 ms-0 d-flex row mb-4 " id="radio_Group"
                                 style="background-color: #eceff1">
                                <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
                                    <div class="carousel-inner">
                                        <c:forEach items="${walletList}" var="wallet" varStatus="status">
                                            <c:choose>
                                                <c:when test="${status.index % 3 == 0}">
                                                    <div class="carousel-item ${status.index == 0 ? 'active' : ''} ">
                                                    <div class="d-flex ">

                                                </c:when>
                                            </c:choose>
                                            <div class="border border-4 p-2 rounded box mb-2 bg-white col-4 wallet-card "
                                                 style="border-color: #e0e0e0 !important; position: relative;">
                                                <div class="country-icon">
                                                    <img src="./images/walletIcon_${wallet.currencyCode}.png"
                                                         alt="${wallet.currencyCode} Icon">
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input mt-2" type="radio"
                                                           name="flexRadioDefault" id="${wallet.walletSeq}"
                                                           autocomplete="off" value="${wallet.walletSeq}"
                                                           data-currency="${wallet.currencyCode}">
                                                    <label class="form-check-label fs-6 text-black-50 w-100"
                                                           for="${wallet.walletSeq}" style="font-family: hanaM">
                                                        <div>
                                                            <div class="border-bottom text-black-50 fs-5"
                                                                 style="font-family: Hana-bold">${wallet.currencyCode}
                                                                Wallet
                                                            </div>
                                                            <div class="mt-3" style="font-family: hanaM">Wallet Number
                                                            </div>
                                                            <div>${wallet.walletSeq}</div>
                                                            <div class="mt-2" style="font-family: hanaM">
                                                                Linked Account&nbsp;<i
                                                                    class="fa-solid fa-link text-hanagreen fa-fade"
                                                                    style="--fa-animation-duration: 2s"></i>
                                                            </div>
                                                            <div class="pb-1">${wallet.acNo.substring(0, 3)}-${wallet.acNo.substring(3, 9)}-${wallet.acNo.substring(9, 14)}</div>
                                                        </div>
                                                    </label>
                                                </div>
                                            </div>
                                            <c:choose>
                                                <c:when test="${status.index % 3 == 2 || status.index == walletList.size() - 1}">
                                                    </div>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </c:forEach>
                                    </div>
                                    <button class="carousel-control-prev" type="button"
                                            data-bs-target="#carouselExample"
                                            data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class=""><</span>
                                    </button>
                                    <button class="carousel-control-next" type="button"
                                            data-bs-target="#carouselExample"
                                            data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class=""> ></span>
                                    </button>
                                </div>
                            </div>


                            <div class="col-12 d-flex p-0"
                                 style="background-color: #eceff1; border-radius: 10px 10px 0px 0px">
                                <button id="whole_history" type="button"
                                        class="col-6 text-center border-0 pt-3 pb-3 fs-5 bg-hanagreen"
                                        style="font-family: hanaM; color: #ffffff; border-radius: 10px 0px 0px 0px"
                                        onclick="click_whole_history()">
                                    Total History
                                </button>
                                <button id="exchange_hist" type="button"
                                        class="col-6 text-center border-0 pt-3 pb-3 fs-5"
                                        style="font-family: hanaM; color: #8d8d8d; border-radius: 0px 10px 0px 0px"
                                        onclick="click_exchange_hist()">
                                    Auto Exchange History
                                </button>

                                <%--                            <button id="remittance_hist" type="button"--%>
                                <%--                                    class="col-4 text-center border-0 pt-3 pb-3 fs-5"--%>
                                <%--                                    style="font-family: hanaM; color: #8d8d8d; border-radius: 0px 10px 0px 0px"--%>
                                <%--                                    onclick="click_remittance_hist()">--%>
                                <%--                                송금내역--%>
                                <%--                            </button>--%>
                            </div>
                            <div class="col-12 bg-white mt-0 " id="div_whole_history"
                                 style="min-height: 350px; border-radius: 0px 0px 10px 10px">

                            </div>

                            <div class="col-12 bg-white mt-0 d-none" id="div_exchange_hist"
                                 style="min-height: 350px; border-radius: 0px 0px 10px 10px">
                            </div>
                            <div class="paginationWrapper">
                                <div id="pagination"></div>
                            </div>
                            <%--                        <div class="col-12 bg-white mt-0 mb-4 d-none" id="div_remittance_hist"--%>
                            <%--                             style="min-height: 350px; border-radius: 0px 0px 10px 10px">--%>

                            <%--                        </div>--%>
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
        window.onload = function () {
            ajax_whole_history();
            ajax_exchange_hist();
            // ajax_remittance_hist();
        }

        const whole_history = document.getElementById('whole_history');
        const exchange_hist = document.getElementById('exchange_hist');
        // const remittance_hist = document.getElementById('remittance_hist');

        const div_whole_history = document.getElementById('div_whole_history');
        const div_exchange_hist = document.getElementById('div_exchange_hist');
        // const div_remittance_hist = document.getElementById('div_remittance_hist');

        // 전체내역 클릭 색 변경
        function click_whole_history() {
            whole_history.classList.add('bg-hanagreen')
            exchange_hist.classList.remove('bg-hanagreen');
            // remittance_hist.classList.remove('bg-hanagreen');
            whole_history.style.color = '#ffffff'
            exchange_hist.style.color = '#8d8d8d'
            // remittance_hist.style.color = '#8d8d8d'
            div_whole_history.classList.remove('d-none');
            div_exchange_hist.classList.add('d-none');
            // div_remittance_hist.classList.add('d-none');
        }

        // 환전내역 클릭 색 변경
        function click_exchange_hist() {
            whole_history.classList.remove('bg-hanagreen')
            exchange_hist.classList.add('bg-hanagreen');
            // remittance_hist.classList.remove('bg-hanagreen');
            whole_history.style.color = '#8d8d8d'
            exchange_hist.style.color = '#ffffff'
            // remittance_hist.style.color = '#8d8d8d'
            div_whole_history.classList.add('d-none');
            div_exchange_hist.classList.remove('d-none');
            // div_remittance_hist.classList.add('d-none');
        }

        // 송금내역 클릭 색 변경
        // function click_remittance_hist() {
        //     whole_history.classList.remove('bg-hanagreen')
        //     exchange_hist.classList.remove('bg-hanagreen');
        //     remittance_hist.classList.add('bg-hanagreen');
        //     whole_history.style.color = '#8d8d8d'
        //     exchange_hist.style.color = '#8d8d8d'
        //     remittance_hist.style.color = '#ffffff'
        //     div_whole_history.classList.add('d-none');
        //     div_exchange_hist.classList.add('d-none');
        //     div_remittance_hist.classList.remove('d-none');
        // }

        $(document).on('click', '#radio_Group', function () {
            ajax_whole_history();
            ajax_exchange_hist();
            // ajax_remittance_hist();
            let r_walletNo = $('#radio_Group input:radio:checked').val();
            document.getElementById('delivery_walletNo').setAttribute('value', r_walletNo);
        })
        let currentPage = 1; // 기본적으로 첫 페이지
        const itemsPerPage = 10; // 한 페이지에 보여줄 항목 수
        // 전체내역
        function ajax_whole_history() {
            let r_walletNo = $('#radio_Group input:radio:checked').val();
            console.log("선택된 월렛 번호는 ", r_walletNo);

            // 추가: 페이지 정보를 함께 보냄
            $.ajax({
                url: '${pageContext.request.contextPath}/getWholeWalletHistory',
                method: 'post',
                contentType: "application/json",
                data: JSON.stringify({
                    walletNo: r_walletNo,
                    page: currentPage,
                    limit: itemsPerPage
                }),
                success: function (data) {
                    change_whole_history(data);
                    createPagination(data.length);
                    console.log("데이터 총 개수", data.length);
                }
            })
        }

        function createPagination(totalItems) {
            const totalPages = Math.ceil(totalItems / itemsPerPage);
            let paginationHTML = '';

            for (let i = 1; i <= totalPages; i++) {
                if (i == currentPage) {
                    paginationHTML += '<span class="page-number active">' + i + '</span>';
                } else {
                    paginationHTML += '<span class="page-number">' + i + '</span>';
                }
            }
            // 페이지 네비게이션 div를 추가 (예: #pagination)
            $('#pagination').html(paginationHTML);

            // 페이지 번호 클릭 이벤트
            $('.page-number').click(function () {
                currentPage = parseInt($(this).text());
                ajax_whole_history(); // 페이지를 변경하면 데이터를 다시 불러옴
            });
        }

        let currentFilterType = '';  // 기본적으로 모든 거래를 보기

        function filterByTransactionType(selectedType) { // <-- 파라미터를 추가
            currentFilterType = selectedType;
            ajax_whole_history();  // 필터링.
        }

        function getTransactionTypeName(type) {
            switch (type) {
                case 'E':
                    return 'Exchange';
                case 'A':
                    return 'Account';
                case 'T':
                    return 'Remittance';
                default:
                    return type;  // 기본값 (만약 알 수 없는 transactionType이 들어올 경우를 대비)
            }
        }

        // 전체내역
        function change_whole_history(data) {
            $('#div_whole_history').empty();
            if (data.length === 0) {
                $('#div_whole_history').append('<div class="fs-3 w-100 h-100 text-black-50" style="display: flex; align-items: center; justify-content: center; font-family: hanaM">No holdings available.</div>');
            } else {
                let str = '';
                str += '<table class="table border-0 table-hover text-end mt-3 border-top">';
                str += '<colgroup><col width=16%><col width=16%><col width=16%><col width=16%><col width=16%><col width=20%></colgroup>';
                str += '<thead>';
                str += '<tr class="text-black-50">';
                str += '<th class="text-center border-1 border-start-0 text-nowrap" style="background-color: #eceff1; border-color: #c7c7c7; font-family: hanaM;">Transaction No.</th>';
                str += '<th class="text-center border-1" style="font-family: hanaM;background-color: #eceff1; border-color: #c7c7c7">Withdrawal</th>';
                str += '<th class="text-center border-1" style="font-family: hanaM;background-color: #eceff1; border-color: #c7c7c7">Deposit</th>';

                str += '<th class="text-center border-1 position-relative" style="font-family: hanaM; background-color: #eceff1; border-color: #c7c7c7">';
                str += '<div style="display: inline-block;">Transaction Type</div>';
                str += `<div class="dropdown" style="display: inline-block; vertical-align: middle;">`;
                str += '<button id="dropdown-btn" class="btn btn-link dropdown-toggle p-0" style="font-size: 1.3rem; vertical-align: middle;" type="button" id="transactionTypeDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';
                str += '</button>';
                str += `<ul class="dropdown-menu" aria-labelledby="transactionTypeDropdown" style="left: 70%; transform: translateX(-90%) translateY(1%); transition: all 0.5s ease;">`;
                str += `<li><a class="dropdown-item" onmouseover="this.style.backgroundColor='#018085'; this.style.color='#ffffff'" onmouseout="this.style.backgroundColor=''; this.style.color=''" onclick="filterByTransactionType('');">All</a></li>`;
                str += `<li class="dropdown-item" style="cursor: pointer" onmouseover="this.style.backgroundColor='#018085'; this.style.color='#ffffff'" onmouseout="this.style.backgroundColor=''; this.style.color=''" onclick="filterByTransactionType('A');">Account</li>`;
                str += `<li class="dropdown-item" style="cursor: pointer" onmouseover="this.style.backgroundColor='#018085'; this.style.color='#ffffff'" onmouseout="this.style.backgroundColor=''; this.style.color=''" onclick="filterByTransactionType('E');">Exchange</li>`;
                str += `<li class="dropdown-item" style="cursor: pointer" onmouseover="this.style.backgroundColor='#018085'; this.style.color='#ffffff'" onmouseout="this.style.backgroundColor=''; this.style.color=''" onclick="filterByTransactionType('T');">Remittance</li>`;
                str += `</ul>`;
                str += '</div>';
                str += '</th>';


                str += '<th class="text-center border-1" style="font-family:hanaM;background-color: #eceff1; border-color: #c7c7c7">Balance</th>';
                str += '<th class="text-center border-1" style="font-family:hanaM; background-color: #eceff1; border-color: #c7c7c7">Currency</th>';
                str += '<th class="text-center border-1 border-end-0" style="font-family:hanaM; background-color: #eceff1; border-color: #c7c7c7">Transaction Date</th>';
                str += '</tr>';
                str += '</thead>';
                str += '<tbody>';

// (나머지 코드는 그대로 유지)


                data = data.filter(history => !currentFilterType || history.transactionType === currentFilterType);

                const startIndex = (currentPage - 1) * itemsPerPage;
                const endIndex = startIndex + itemsPerPage;
                const displayData = data.slice(startIndex, endIndex);

                displayData.forEach(function (history) {
                    str += '<tr class="border-1 border-start-0 border-end-0 text-center bg-white" style="border-color: #c7c7c7">';
                    str += '<td class="text-hanagreen border-1 border-start-0 text-black-50 fs-5 align-middle" style="border-color: #c7c7c7;font-family: hanaM">';
                    str += history.walletTransNo;
                    str += '</td>';
                    // str += '<td class="border-1 text-dark align-middle fs-5 text-black-50" style="font-family: hanaM; border-color: #c7c7c7">';
                    // str += history.transactionAmount.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
                    // str += '</td>';
                    str += '<td class="border-1 text-danger align-middle fs-5 " style="font-family: hanaM; border-color: #c7c7c7;">'; // Display in red
                    str += history.withdrawCur ? history.transactionAmount.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") : "-";
                    str += '</td>';
                    str += '<td class="border-1 text-success align-middle fs-5" style="font-family: hanaM; border-color: #c7c7c7;">'; // Display in green
                    str += history.depositCur ? history.transactionAmount.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") : "-";
                    str += '</td>';
                    str += '<td class="border-1 text-black-50 align-middle" style="border-color: #c7c7c7; font-family: hanaM">';
                    str += getTransactionTypeName(history.transactionType);
                    str += '</td>';
                    str += '<td class="border-1 align-middle" style="border-color: #c7c7c7; font-family: hanaM; color: #616161">';
                    str += history.balance.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
                    str += '</td>';
                    str += '<td class="text-black-50 align-middle" style="font-family: hanaM">';
                    str += history.withdrawCur ? history.withdrawCur : history.depositCur;
                    str += '</td>';
                    str += '<td class="border-1 align-middle" style="font-family: hanaM; border-color: #c7c7c7">'; // New column for tradeDate
                    str += history.tradeDate;
                    str += '</td>';
                    str += '</tr>';
                });
                str += '</tbody>';
                str += '</table>';
                $('#div_whole_history').append(str);
            }
        }

        const button = document.querySelector('.dropdown');

        button.addEventListener('click', () => {
            const dropdown = document.querySelector('#dropdown-btn');
            dropdown.style.display = 'block';
        });

        button.addEventListener('blur', () => {
            const dropdown = document.querySelector('.dropdown');
            dropdown.style.display = '';
        });

        // 자동환전
        function ajax_exchange_hist() {
            let r_walletNo = $('#radio_Group input:radio:checked').val();
            console.log("선택된 월렛 번호는 ", r_walletNo);
            $.ajax({
                url: '${pageContext.request.contextPath}/getExchangeHist',
                method: 'post',
                contentType: "application/json",  // 추가
                data: JSON.stringify({            // 수정
                    walletNo: r_walletNo
                }),
                success: function (data) {
                    console.log(data);
                    if (data.length == 0) {
                        change_exchange_hist(0);
                    } else {
                        change_exchange_hist(data);
                    }
                }
            })
        }

        // 자동환전 뷰
        function change_exchange_hist(data) {
            $('#div_exchange_hist').empty();
            if (data.length == 0) {
                $('#div_exchange_hist').append('<div class="fs-3 w-100 h-100 text-black-50" style="display: flex; align-items: center; justify-content: center; font-family: hanaM">자동환전 내역이 없습니다.</div>');
            } else {
                let str = '';
                str += '<table class="table border-0 table-hover text-end mt-3 border-top">';
                str += '<colgroup><col width=20%><col width=20%><col width=20%><col width=20%><col width=20%></colgroup>';
                str += '<thead>';
                str += '<tr class="fs-5 text-black-50">';
                // str += '<th class="text-center border-1 border-start-0" style="background-color: #eceff1; border-color: #c7c7c7; font-family: hanaM;"></th>';
                str += '<th class="text-center border-1 border-start-0" style="background-color: #eceff1; border-color: #c7c7c7; font-family: hanaM;">Exchange Deadline</th>';
                str += '<th class="text-center border-1" style="font-family: hanaM;background-color: #eceff1; border-color: #c7c7c7">Target Amount </th>';
                str += '<th class="text-center border-1" style="font-family: hanaM;background-color: #eceff1; border-color: #c7c7c7">Currency</th>';
                str += '<th class="text-center border-1" style="font-family: hanaM;background-color: #eceff1; border-color: #c7c7c7">Target Rate</th>';
                str += '<th class="text-center border-1 border-end-0" style="font-family:hanaM; background-color: #eceff1; border-color: #c7c7c7">Status</th>';
                str += '<th class="text-center border-1 border-end-0" style="font-family:hanaM; background-color: #eceff1; border-color: #c7c7c7"></th>';
                str += '</tr>';
                str += '</thead>';
                str += '<tbody>';
                data.forEach(function (exchange) {
                    console.log("Current exchange.aeSeq:", exchange.aeSeq);
                    str += '<tr class="border-1 border-start-0 border-end-0 text-center" data-aeSeq="' + exchange.aeSeq + '" style="border-color: #c7c7c7;background-color: ' + (exchange.status == 'S' ? '#e6f7ff' : exchange.status == 'W' ? '#fff5e5' : '#fde2e2') + ';">';
                    str += '<td class="text-black-50 border-1 border-start-0 fs-5 align-middle" style="border-color: #c7c7c7;font-family: hanaM">';
                    str += exchange.exchangeDate.toString().substring(0, 11);
                    str += '</td>';
                    str += '<td class="border-1 text-dark align-middle fs-5 text-black-50" style="font-family: hanaM; border-color: #c7c7c7">';
                    str += exchange.exchangeAmount.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
                    str += '</td>';
                    str += '<td class="border-1 text-black-50 align-middle" style="border-color: #c7c7c7; font-family: hanaM">';
                    str += exchange.targetCurCode;
                    str += '</td>';
                    str += '<td class="border-1 text-dark align-middle fs-5 text-black-50" style="font-family: hanaM; border-color: #c7c7c7">';
                    str += exchange.lowerBound.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
                    str += '</td>';
                    str += '<td class="border-1 text-black-50 align-middle" style="font-family: hanaM; border-color: #c7c7c7">';
                    str += exchange.status == 'S' ? 'Completed' : exchange.status == 'W' ? 'Pending' : 'Failed';
                    str += '</td>';
                    str += '<td><button class="deleteRowBtn" style="background-color: #e74c3c; color: #ffffff; border: none; border-radius: 5px; padding: 5px 10px;">Delete</button></td>';
                    str += '</tr>';
                });
                str += '</tbody>';
                str += '</table>';
                $('#div_exchange_hist').append(str);
                // 선택 자동환전 삭제
                attachRowDeleteEventListener();
            }
        }

    </script>
<%--    자동환전 삭제--%>
    <script>
        function getSelectedAeSeqs() {
            let selectedAeSeqs = [];
            $('.rowCheckbox:checked').each(function() {
                // let aeSeq = $(this).closest('tr').data('aeSeq');
                let aeSeq = $(this).closest('tr').data('aeSeq');

                selectedAeSeqs.push(aeSeq);
            });
            return selectedAeSeqs;
        }

        function attachRowDeleteEventListener() {
            $('#div_exchange_hist').on('click', '.deleteRowBtn', function() {
                console.log("Clicked row:", $(this).closest('tr'));
                // let aeSeq = $(this).closest('tr').data('aeSeq');
                let aeSeq = $(this).closest('tr').attr('data-aeSeq');
                console.log("Clicked row's aeSeq:", aeSeq);
                console.log("Deleting aeSeq:", aeSeq);
                $.ajax({
                    type: "POST",
                    url: "removeAutoExchange",
                    data: {
                        aeSeq: aeSeq
                    },
                    success: function(response) {
                        if (response.success) {
                            alert("Delete Complete");
                            location.reload();
                        } else {
                            alert(response.message);
                        }
                    },
                    error: function() {
                        alert("Error deleting the reservation.");
                    }
                });
            });
        }


    </script>
    <script>
        // 국가별 이미지
        $(document).ready(function () {
            $('#radio_Group .form-check-input').on('change', function () {
                const currencyCode = $(this).data('currency');

                // 각 통화 코드에 따른 국가 이미지 경로 설정
                const countryImages = {
                    'USD': './images/flags/us.jpg',  // 예제 경로
                    'KRW': './images/flags/kr.jpg',
                };

                const imagePath = countryImages[currencyCode] || '';  // 해당 통화 코드에 맞는 이미지 경로 가져오기
                $('.country-image').css('background-image', `url(${imagePath})`);  // 국가 이미지 변경
            });
        });
    </script>
</body>
</html>
