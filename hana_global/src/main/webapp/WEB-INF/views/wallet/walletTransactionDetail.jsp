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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link href="./css/service-main.css" rel="stylesheet"/>
    <link href="./css/nav.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/bootstrap/bootstrap2.min.css" rel="stylesheet"/>
    <%--    <link href="./css/bootstrap/bootstrap.min.css" rel="stylesheet"/>--%>
    <style>
        .btn-link.dropdown-toggle::after {
            color: #2d9646; /* 부트스트랩의 기본 초록색 */
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
            <h2>Wallet Transaction Detail</h2>
            <div class="content">
                <div class="ms-4 fs-5" style="color: #bdbdbd">Wallet / <strong style="color: #000000">Wallet
                    Details</strong></div>
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4 p-2">
                        <div class="col-sm-12 col-xl-12 p-0">
                            <div class="d-flex">
                                <%--                                회원의 총 보유금액 시작--%>
<%--                                <div class="col-7 border-5 border-top box p-4 rounded"--%>
<%--                                     style="border-color: #008485 !important; max-height: 200px; background-color: wheat;">--%>
<%--                                    <div class="d-flex mt-3 justify-content-between">--%>
<%--								<span class="fs-5 text-black-50" style="font-family: dotom">--%>
<%--									${currentMember.name}님 보유금액--%>
<%--								</span>--%>
<%--                                        <span class="fs-6 text-hanasilver pt-1" style="font-family: dotom">--%>
<%--                                            <%= sf.format(nowTime) %> 고시환율 기준--%>
<%--                                        </span>--%>
<%--                                    </div>--%>
<%--                                    <div class="mt-3 fs-5" style="color:#494949; font-family: hanaM">--%>
<%--                                        USD 환산--%>
<%--                                    </div>--%>
<%--                                    <div class="fs-3" id="usd_rate" value="">--%>
<%--                                    </div>--%>
<%--                                </div>--%>

                                <%--                                회원의 총 보유금액 끝--%>

                            </div>
                            <div class="col-12 p-3 ms-0 d-flex row" id="radio_Group" style="background-color: #eceff1">
                                <c:forEach items="${walletList}" var="wallet" >
                                    <div class="border border-4 p-2 rounded box mb-2 bg-white col-3 me-3"
                                         style="border-color: #e0e0e0 !important;">
                                        <div class="form-check">
                                            <input class="form-check-input mt-2" type="radio"
                                                   name="flexRadioDefault" id="${wallet.walletSeq}" autocomplete="off" value="${wallet.walletSeq}" checked>
                                            <label class="form-check-label fs-6 text-black-50 w-100"
                                                   for="${wallet.walletSeq}" style="font-family: hanaM">
                                                <div>
                                                    <div class="border-bottom text-black-50 fs-5"
                                                         style="font-family: hanaM">
                                                            ${wallet.currencyCode} Wallet
                                                    </div>
                                                    <div class="mt-3" style="font-family: hanaM">
                                                        지갑번호
                                                    </div>
                                                    <div>
                                                            <%--                                                                            ${wallet.walletSeq.substring(0, 3)}-${wallet.walletSeq.substring(3,9)}-${wallet.walletSeq.substring(9,14)}--%>
                                                            ${wallet.walletSeq}
                                                    </div>
                                                    <div class="mt-2" style="font-family: hanaM">
                                                        연동계좌&nbsp;<i class="fa-solid fa-link text-hanagreen fa-fade"
                                                                     style="--fa-animation-duration: 2s"></i>
                                                    </div>
                                                    <div class="pb-1">
                                                            ${wallet.acNo}
                                                    </div>
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="col-12 d-flex p-0"
                             style="background-color: #eceff1; border-radius: 10px 10px 0px 0px">
                            <button id="whole_history" type="button"
                                    class="col-4 text-center border-0 pt-3 pb-3 fs-5 bg-hanagreen"
                                    style="font-family: hanaM; color: #ffffff; border-radius: 10px 0px 0px 0px"
                                    onclick="click_whole_history()">
                                전체내역
                            </button>
                            <button id="exchange_hist" type="button" class="col-4 text-center border-0 pt-3 pb-3 fs-5"
                                    style="font-family: hanaM; color: #8d8d8d" onclick="click_exchange_hist()">
                                자동환전내역
                            </button>
                            <button id="remittance_hist" type="button"
                                    class="col-4 text-center border-0 pt-3 pb-3 fs-5"
                                    style="font-family: hanaM; color: #8d8d8d; border-radius: 0px 10px 0px 0px"
                                    onclick="click_remittance_hist()">
                                송금내역
                            </button>
                        </div>
                        <div class="col-12 bg-white mt-0 mb-4 pb-4" id="div_whole_history"
                             style="min-height: 350px; border-radius: 0px 0px 10px 10px">

                        </div>
                        <div class="col-12 bg-white mt-0 mb-4 d-none" id="div_exchange_hist"
                             style="min-height: 350px; border-radius: 0px 0px 10px 10px">
                        </div>
                        <div class="col-12 bg-white mt-0 mb-4 d-none" id="div_remittance_hist"
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
    window.onload = function () {
        ajax_whole_history();
        ajax_exchange_hist();
        // ajax_remittance_hist();
    }

    const whole_history = document.getElementById('whole_history');
    const exchange_hist = document.getElementById('exchange_hist');
    const remittance_hist = document.getElementById('remittance_hist');

    const div_whole_history = document.getElementById('div_whole_history');
    const div_exchange_hist = document.getElementById('div_exchange_hist');
    const div_remittance_hist = document.getElementById('div_remittance_hist');

    // 전체내역 클릭 색 변경
    function click_whole_history() {
        whole_history.classList.add('bg-hanagreen')
        exchange_hist.classList.remove('bg-hanagreen');
        remittance_hist.classList.remove('bg-hanagreen');
        whole_history.style.color = '#ffffff'
        exchange_hist.style.color = '#8d8d8d'
        remittance_hist.style.color = '#8d8d8d'
        div_whole_history.classList.remove('d-none');
        div_exchange_hist.classList.add('d-none');
        div_remittance_hist.classList.add('d-none');
    }

    // 환전내역 클릭 색 변경
    function click_exchange_hist() {
        whole_history.classList.remove('bg-hanagreen')
        exchange_hist.classList.add('bg-hanagreen');
        remittance_hist.classList.remove('bg-hanagreen');
        whole_history.style.color = '#8d8d8d'
        exchange_hist.style.color = '#ffffff'
        remittance_hist.style.color = '#8d8d8d'
        div_whole_history.classList.add('d-none');
        div_exchange_hist.classList.remove('d-none');
        div_remittance_hist.classList.add('d-none');
    }

    // 송금내역 클릭 색 변경
    function click_remittance_hist() {
        whole_history.classList.remove('bg-hanagreen')
        exchange_hist.classList.remove('bg-hanagreen');
        remittance_hist.classList.add('bg-hanagreen');
        whole_history.style.color = '#8d8d8d'
        exchange_hist.style.color = '#8d8d8d'
        remittance_hist.style.color = '#ffffff'
        div_whole_history.classList.add('d-none');
        div_exchange_hist.classList.add('d-none');
        div_remittance_hist.classList.remove('d-none');
    }

    $(document).on('click', '#radio_Group', function () {
        ajax_whole_history();
        ajax_exchange_hist();
        // ajax_remittance_hist();
        let r_walletNo = $('#radio_Group input:radio:checked').val();
        document.getElementById('delivery_walletNo').setAttribute('value', r_walletNo);
    })

    // 전체내역
    function ajax_whole_history() {
        let r_walletNo = $('#radio_Group input:radio:checked').val();
        console.log("선택된 월렛 번호는 ", r_walletNo);
        $.ajax({
            url: '${pageContext.request.contextPath}/getWholeWalletHistory',
            method: 'post',
            contentType: "application/json",  // 추가
            data: JSON.stringify({            // 수정
                walletNo: r_walletNo
            }),
            success: function (data) {
                console.log(data);
                if (data.length == 0) {
                    change_whole_history(0);
                } else {
                    change_whole_history(data);
                }
            }
        })
    }

    let currentFilterType = '';  // 기본적으로 모든 거래를 보기

    // function filterByTransactionType() {
    //     const selectedType = document.getElementById('filterTransactionType').value;
    //     currentFilterType = selectedType;
    //     ajax_whole_history();  // 필터링.
    // }
    function filterByTransactionType(selectedType) { // <-- 파라미터를 추가
        currentFilterType = selectedType;
        ajax_whole_history();  // 필터링.
    }

    // 전체내역
    function change_whole_history(data) {
        $('#div_whole_history').empty();
        if (data.length === 0) {
            $('#div_whole_history').append('<div class="fs-3 w-100 h-100 text-black-50" style="display: flex; align-items: center; justify-content: center; font-family: hanaM">보유내역이 없습니다.</div>');
        } else {
            let str = ''
            str += '<table class="table border-0 table-hover text-end mt-3 border-top">'
            str += '<colgroup><col width=16%><col width=16%><col width=16%><col width=16%><col width=16%><col width=20%></colgroup>' // Update colgroup to accommodate new column
            str += '<thead>'
            str += '<tr class="fs-5 text-black-50">'
            str += '<th class="text-center border-1 border-start-0" style="background-color: #eceff1; border-color: #c7c7c7; font-family: hanaM;">거래 번호</th>'
            str += '<th class="text-center border-1" style="font-family: hanaM;background-color: #eceff1; border-color: #c7c7c7">거래 금액 </th>'

            str += '<th class="text-center border-1 position-relative" style="font-family: hanaM; background-color: #eceff1; border-color: #c7c7c7">'; // position-relative 추가
            str += '거래 유형';

            str += `<div class="dropdown" style="position: absolute; right: 5px; top: 50%; transform: translateY(-50%);">`; // 위치 조정 스타일 추가
            str += '<button class="btn btn-link dropdown-toggle p-0" style="font-size: 1.3rem;" type="button" id="transactionTypeDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';
            str += '</button>';

            str += `<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="transactionTypeDropdown">`; // dropdown-menu-right 추가
            str += `<li><a class="dropdown-item" href="#" onclick="filterByTransactionType('');">모두</a></li>`;
            str += `<li class="dropdown-item" style="cursor: pointer" onclick="filterByTransactionType('A');">계좌</li>`; // cursor: auto에서 cursor: pointer로 변경
            str += `<li class="dropdown-item" onclick="filterByTransactionType('E');">환전</li>`;
            str += `<li class="dropdown-item" onclick="filterByTransactionType('T');">송금</li>`;
            str += `</ul>`;

            str += '</div>';  // 불필요한 </div> 태그 제거
            str += '</th>';



            str += '<th class="text-center border-1" style="font-family:hanaM;background-color: #eceff1; border-color: #c7c7c7">현재 잔액</th>'
            str += '<th class="text-center border-1" style="font-family:hanaM; background-color: #eceff1; border-color: #c7c7c7">통화</th>'
            str += '<th class="text-center border-1 border-end-0" style="font-family:hanaM; background-color: #eceff1; border-color: #c7c7c7">거래 일시</th>'  // New column header for tradeDate
            str += '</tr>'
            str += '</thead>'
            str += '<tbody>'
            data = data.filter(history => !currentFilterType || history.transactionType === currentFilterType);

            data.forEach(function (history) {
                str += '<tr class="border-1 border-start-0 border-end-0 text-center bg-white" style="border-color: #c7c7c7">'
                str += '<td class="text-hanagreen border-1 border-start-0 text-black-50 fs-5 align-middle" style="border-color: #c7c7c7;font-family: hanaM">'
                str += history.walletTransNo
                str += '</td>'
                str += '<td class="border-1 text-dark align-middle fs-5 text-black-50" style="font-family: hanaM; border-color: #c7c7c7">'
                str += history.transactionAmount.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
                str += '</td>'
                str += '<td class="border-1 text-black-50 align-middle" style="border-color: #c7c7c7; font-family: hanaM">'
                str += history.transactionType
                str += '</td>'
                str += '<td class="border-1 align-middle" style="border-color: #c7c7c7; font-family: hanaM; color: #616161">'
                str += history.balance.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
                str += '</td>'
                str += '<td class="text-black-50 align-middle" style="font-family: hanaM">'
                str += history.withdrawCur ? history.withdrawCur : history.depositCur
                str += '</td>'
                str += '<td class="border-1 align-middle" style="font-family: hanaM; border-color: #c7c7c7">'  // New column for tradeDate
                str += history.tradeDate
                str += '</td>'
                str += '</tr>'
            })
            str += '</tbody>'
            str += '</table>'
            $('#div_whole_history').append(str);
        }
    }



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
            str += '<th class="text-center border-1 border-start-0" style="background-color: #eceff1; border-color: #c7c7c7; font-family: hanaM;">환전 신청일</th>';
            str += '<th class="text-center border-1" style="font-family: hanaM;background-color: #eceff1; border-color: #c7c7c7">환전금액 </th>';
            str += '<th class="text-center border-1" style="font-family: hanaM;background-color: #eceff1; border-color: #c7c7c7">목표 화폐</th>';
            str += '<th class="text-center border-1" style="font-family:hanaM;background-color: #eceff1; border-color: #c7c7c7">최저 한도</th>';
            str += '<th class="text-center border-1 border-end-0" style="font-family:hanaM; background-color: #eceff1; border-color: #c7c7c7">상태</th>';
            str += '</tr>';
            str += '</thead>';
            str += '<tbody>';
            data.forEach(function (exchange) {
                str += '<tr class="border-1 border-start-0 border-end-0 text-center" style="border-color: #c7c7c7;background-color: ' + (exchange.status == 'S' ? '#e6f7ff' : exchange.status == 'W' ? '#fff5e5' : '#fde2e2') + ';">';
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
                str += '<td class="text-black-50 align-middle" style="font-family: hanaM">';
                str += exchange.status == 'S' ? '자동환전완료' : exchange.status == 'W' ? 'Pending' : '거래종료';
                str += '</td>';
                str += '</tr>';
            });
            str += '</tbody>';
            str += '</table>';
            $('#div_exchange_hist').append(str);
        }
    }

</script>
</body>
</html>
