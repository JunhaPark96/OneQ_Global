<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: JUNHA
  Date: 2023-08-21
  Time: 오전 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="./js/account.js"></script>

    <link href="./css/service-main.css" rel="stylesheet"/>
    <link href="./css/nav.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/account_details.css" rel="stylesheet"/>

    <%--    캘린더--%>
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.8.0/css/pikaday.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.8.0/pikaday.min.js"></script>

    <title>내 계좌 확인</title>
</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area">
        <%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
        <div class="main-body">
            <h2 class="h2-account">View Account Transaction History</h2>
            <p class="p-account">
                You may view transactions for the past year only. <br>
                (For your checking account, view the last 4 months of transactions (depending on volume)).<br>
                For additional transaction history, use 'Transaction History'.<br>
                Visit a nearby branch to request a printed copy of your interest payment history on a fully repaid loan.<br>
            </p>
            <%--                        계좌구역--%>
            <div class="account_transaction">
                <div class="col-md-12                                                                                                                                                                                                                                                                      ">
                    <div class="card-body pe-5">
                        <table class="table table-hover mb-3 border-light">
                            <tr>
                                <th scope="col" class="h5 text-black-50 border-light" style="width: 15%"></th>
                                <th scope="col" class="h5 text-dark border-light" style="width: 85%"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="text">
                                <th scope="row" class="text-center align-middle">&nbsp;&nbsp;계좌선택</th>
                                <td>
                                    <select class="form-select border-3 w-50" name="withdrawAccountNo"
                                            id="selectAccountForm"
                                            onchange="changeBalance()" style="height: 55px;">
                                        <option value="" selected disabled>계좌를 선택하세요.</option>
                                        <c:forEach items="${accountList}" var="account">
                                            <option value="${account.acNo}" data-balance="${account.balance}">
                                                (${account.acNo})
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
<%--                            기간 조회--%>
                            <tr>
                                <th scope="row" class="text-center align-middle">&nbsp;&nbsp;조회기간</th>
                                <td class="tbl_left">
                                    <div class="tbl_in">
                                        <input type="text" id="inqStrDt" name="inqStrDt" readonly>
                                        <img src="https://image.kebhana.com/pbk/easyone/resource/img/btn/btn_calendar.gif"
                                             alt="Start Date Calendar Tab" onclick="openCalendar('inqStrDt')">

                                        ~

                                        <input type="text" id="inqEndDt" name="inqEndDt" readonly>
                                        <img src="https://image.kebhana.com/pbk/easyone/resource/img/btn/btn_calendar.gif"
                                             alt="End Date Calendar Tab" onclick="openCalendar('inqEndDt')">

                                        <br>
                                        <span class="ml5">(Enter 8-digit date in YYYYMMDD format. e.g. 20120101)</span>
                                    </div>
                                </td>
                            </tr>
<%--                            거래 유형 선택--%>
                            <tr>
                                <th scope="row" class="text-center align-middle">&nbsp;&nbsp;거래유형</th>
                                <td>
                                    <input type="hidden" name="transaction_type" id="transaction_type" value="">
                                    <button type="button" class="btn bg-white border-1 me-2 pushButton border-2"
                                            onclick="selectTransType('ALL')">전체
                                    </button>
                                    <button type="button" class="btn bg-white border-1 me-2 pushButton border-2"
                                            onclick="selectTransType('1')">출금
                                    </button>
                                    <button type="button" class="btn bg-white border-1 me-2 pushButton border-2"
                                            onclick="selectTransType('0')">입금
                                    </button>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row" class="text-center align-middle">&nbsp;&nbsp;잔액</th>
                                <td>
                                    <div class="btnArea" id="btnFclArea">
                                        <p class="text-center align-middle" id="accountBalance">
                                            <%--                                            10,000,000--%>
                                        </p>
                                        <a href="/account_transfer" class="btn_p">계좌 이체</a>
                                    </div>
                                </td>
                            </tr>

                            </tbody>
                        </table>

                        <div class="btnArea justify-content-center" id="acc_trans_inquiry">
                            <input type="button" id="btnNext" class="btn_p" value="조회">
                        </div>

                    </div>
                </div>

            </div>

            <div class="transaction_history mt-5">
                <table id="transactionHistoryTable" class="table table-striped table-hover table-bordered">
                    <thead class="table-dark">
                    <tr>
                        <th>거래일시</th>
                        <th>거래금액</th>
                        <th>거래구분</th>
                        <th>잔액</th>
                        <th>거래대상</th>
                        <th>거래대상 계좌번호</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</div>
<footer>
</footer>
</div>

<script>
    $(document).ready(function () {
        $('#transactionHistoryTable thead').hide(); // 처음엔 숨기기

        $('#btnNext').click(function () {
            $('#transactionHistoryTable thead').show(); // 클릭 시 보이기

            let inqStrDt = document.getElementById('inqStrDt').value;
            let inqEndDt = document.getElementById('inqEndDt').value;
            let transactionType = document.getElementById('transaction_type').value;
            let withdrawAccountNo = document.getElementById('selectAccountForm').value;

            $.ajax({
                url: '${pageContext.request.contextPath}/accountDetail',
                method: 'post',
                data: {
                    inqStrDt: inqStrDt,
                    inqEndDt: inqEndDt,
                    transactionType: transactionType,
                    withdrawAccountNo: withdrawAccountNo
                },
                success: function (data) {
                    // Empty the table body
                    $('#transactionHistoryTable tbody').empty();

                    // Fill the table with response data
                    for (let i = 0; i < data.length; i++) {
                        let transactionTypeText = data[i].transactionType == '0' ? '입금' : '출금';
                        $('#transactionHistoryTable tbody').append('<tr>' +
                            '<td>' + data[i].tradeDate + '</td>' +
                            '<td>' + data[i].transactionAmount + '원</td>' +
                            '<td>' + transactionTypeText + '</td>' +
                            '<td>' + data[i].balance + '원</td>' +
                            '<td>' + data[i].target + '</td>' +
                            '<td>' + data[i].targetAccount + '</td>' +
                            '</tr>');
                    }
                },

                error: function () {
                    alert('Error retrieving transaction history.');
                }
            });
        });
    });

</script>
</body>

</html>