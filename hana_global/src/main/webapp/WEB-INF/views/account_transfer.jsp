<%--
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

    <link href="./css/service-main.css" rel="stylesheet"/>
    <link href="./css/nav.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/account_transfer.css" rel="stylesheet"/>

    <title>계좌 이체</title>
</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area">
        <%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
        <div class="main-body">
            <h2 class="h2-account">Account Transfer</h2>

            <%--                        송금구역--%>
            <div class="account_transaction withdraw-card">
                <div class="col-md-12>                                                                                                                                                                                                                                                                      ">
                    <div class="card-body pe-5">
                        <table class="table table-hover mb-3 border-light">
                            <tr>
                                <th scope="col" class="h5 text-black-50 border-light" style="width: 15%"></th>
                                <th scope="col" class="h5 text-dark border-light" style="width: 85%"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="text border-light">
                                <th scope="row" class="text-center align-middle">&nbsp;&nbsp;계좌선택</th>
                                <td>
                                    <select class="form-select border-3 w-50" name="withdrawAccountNo"
                                            id="selectSenderAccount"
                                            onchange="changeBallance()" style="height: 45px;">
                                        <option value="" selected disabled>계좌를 선택하세요.</option>
                                        <c:forEach items="${accountList}" var="account">
                                            <option value="${account.accountNo}">
                                                    ${account.alias} (${account.accountNo})
                                            </option>
                                        </c:forEach>
                                        <option value="123456789">1234-5678-9 (Example Account)</option>
                                        <!-- 임의의 계좌 추가 -->
                                    </select>
                                </td>
                            </tr>

                            <tr class="border-light">
                                <th scope="row" class="text-center align-middle">&nbsp;&nbsp;잔액</th>
                                <td>
                                    <div class="btnArea" id="btnFclArea">
                                        <p class="text-center align-middle" id="balanceDisplay">
                                            0
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

                            <tr class="border-light">
                                <th scope="row" class="text-center align-middle">&nbsp;&nbsp;송금 금액</th>
                                <td>
                                    <%--                                    TODO: 계좌 연결, 금액 입력 받기--%>
                                    <%--                                    <input type="hidden" name="transfer_amount" id="transfer_amount" value="">--%>
                                    <div class="btn-amount">

                                        <button type="button" class="btn bg-white  border-1  me-2 pushButton border-2"
                                                onclick="selectAmount('10000')">10,000
                                        </button>
                                        <button type="button" class="btn bg-white  border-1  me-2 pushButton border-2"
                                                onclick="selectAmount('50000')">50,000
                                        </button>
                                        <button type="button" class="btn bg-white  border-1  me-2 pushButton border-2"
                                                onclick="selectAmount('100000')">100,000
                                        </button>
                                        <button type="button" class="btn bg-white  border-1  me-2 pushButton border-2"
                                                onclick="selectAmount('1000000')">1,000,000
                                        </button>
                                    </div>
                                    <div class="input-amount">
                                        <input type="text" name="transfer_amount" id="transfer_amount" value="10000"/>
                                        KRW

                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <%--                    보내는사람 입력 끝--%>
            <div class="arrow-box">

                <div class="arrow-div">
                    <%--                TODO: 아래화살표 이미지--%>
                </div>
            </div>
            <%--                    받는사람 입력--%>
            <div class="account_transaction deposit-card">
                <div class="col-md-12">
                    <div class="card-body pe-5">
                        <table class="table table-hover mb-3 border-light">
                            <tr>
                                <th scope="col" class="h5 text-black-50 border-light" style="width: 15%"></th>
                                <th scope="col" class="h5 text-dark border-light" style="width: 85%"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="text">
                                <th scope="row" class="text-center align-middle">은행선택</th>
                                <td>
                                    <select name="receiverBank" class="form-select border-3 w-50"
                                            id="receiverBankSelect">
                                        <option value="">Please select.</option>
                                        <option value="081" selected="selected">HANA BANK</option>
                                        <option value="039">THE GYOENGNAM BANK LTD</option>
                                        <option value="034">THE KWANGJU BANK LTD</option>
                                        <option value="004">KOOKMIN BANK</option>
                                        <option value="003">INDUSTRIAL BANK OF KOREA</option>
                                        <option value="011">NATIONAL AGRICULTURAL COOPERATIVE FEDERATION</option>
                                        <option value="031">THE DAEGU BANK LTD</option>
                                        <option value="055">DEUTSCHE BANK</option>
                                        <option value="032">THE BANK OF PUSAN,LTD</option>
                                        <option value="002">KOREA DEVELOPMENT BANK</option>
                                        <option value="050">KOREA FEDERATION OF MUTUAL SAVINGS</option>
                                        <option value="045">FEDERATION OF COMMUNITY CREDIT COOPERATIVES</option>
                                        <option value="007">Suhyup Bank</option>
                                        <option value="048">CREDIT UNION</option>
                                        <option value="088">SHINHAN BANK</option>
                                        <option value="020">WOORI BANK</option>
                                        <option value="071">POST - OFFICE</option>
                                        <option value="037">THE JEONBUK BANK LTD</option>
                                        <option value="035">THE BANK OF CHEJU,LTD</option>
                                        <option value="090">kakaobank</option>
                                        <option value="089">K bank</option>
                                        <option value="027">CITI BANK</option>
                                        <option value="060">BANK OF AMERICA</option>
                                        <option value="054">HSBC BANK</option>
                                        <option value="057">JP Morgan Chase</option>
                                        <option value="023">Standard Chartered BANK</option>
                                        <option value="270">Hana Securities co., Ltd.</option>
                                        <option value="261">Kyobo Securities Co., Ltd,</option>
                                        <option value="267">Daishin Securities Co., Ltd.,</option>
                                        <option value="238">MIRAE ASSET SECURITIES CO., LTD.</option>
                                        <option value="279">DB Financial Investment Co.,Ltd.</option>
                                        <option value="209">Yuanta Securities Korea co., Ltd.</option>
                                        <option value="287">Meritz Securities Co., Ltd.,</option>
                                        <option value="290">Bookook Securities Co., Ltd.,</option>
                                        <option value="240">Samsung Securities Co., Ltd.,</option>
                                        <option value="291">Shinyoung Securities Co., Ltd.,</option>
                                        <option value="278">Shinhan Securities Co., Ltd.,</option>
                                        <option value="247">NH Investment &amp; Securities Co., Ltd.,</option>
                                        <option value="280">Eugene Investment &amp; Securities Co., Ltd.,</option>
                                        <option value="264">Kiwoom Securities Co., Ltd.,</option>
                                        <option value="262">HI Investment &amp; Securities Co., Ltd.,</option>
                                        <option value="243">Korea Investment &amp; Securities Co., Ltd.,</option>
                                        <option value="269">Hanwha Investment &amp; Securities Co., Ltd.,</option>
                                        <option value="218">KB Securities co., Ltd.</option>
                                        <option value="265">E*BEST Investment &amp; Securities Co., Ltd.,</option>
                                        <option value="263">Hyundai Motor Securities Co., Ltd.</option>
                                        <option value="292">CAPE Investment &amp; Securities Co., Ltd.</option>
                                        <option value="266">SK Securities Co., Ltd.,</option>
                                        <option value="064">NATIONAL FORESTRY COOPERATIVE FEDERATION</option>
                                        <option value="062">Industrial and Commercial Bank of China</option>
                                        <option value="063">Bank of China Seoul Branch</option>
                                        <option value="067">China Construction Bank</option>
                                        <option value="061">BNP PARIBAS CORPORATE &amp; INVESTMENT BANKING</option>
                                        <option value="294">Korea Foss Securities Co.,Ltd</option>
                                        <option value="227">DAOL Investment &amp; Securities</option>
                                        <option value="224">BNK Investment &amp; Securities Co., Ltd.,</option>
                                        <option value="288">kakaopay securities Corp.</option>
                                        <option value="225">IBK Securities Co., Ltd.</option>
                                        <option value="271">Toss Securities Co., Ltd</option>
                                        <option value="092">Toss Innovation Co.,Ltd</option>
                                        <option value="221">SANGSNAGIN INVESTMENT &amp; SECURITIES CO.,LTD.</option>
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row" class="text-center align-middle">계좌번호</th>
                                <td>
                                    <div class="btnArea text-center align-middle" id="receiverAccountArea">
                                        <%--                                        <p class="text-center align-middle">--%>
                                        <%--                                            690-11-028690--%>
                                        <%--                                        </p>--%>
                                        <input type="text" id="receiverAccountNumber" placeholder="계좌번호 입력"/>
                                        <input type="button" class="btn btn-primary" id="checkReceiverBtn" value="조회"
                                               onclick="fetchReceiverName()">
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row" class="text-center align-middle">Recipient</th>
                                <td id="receiverName">Please check the account number.</td>
                            </tr>


                            </tbody>
                        </table>

                        <div class="btnArea justify-content-center " id="acc_trans_inquiry">
                            <%--                TODO: 계좌 거래내역 조회 기능--%>
                            <a href="#//hana_bank" id="btnNext" class="btn_p">송금 하기</a>
                        </div>
                    </div>
                </div>
            </div>
            <%--                    받는사람 입력 끝--%>

        </div>
    </div>
</div>
<footer>
    푸터
</footer>

<script>
    function fetchReceiverName() {
        // For demonstration purposes, let's assume "박준하" is the name associated with the given account number.
        // In a real-world scenario, you would make an AJAX request to a server to fetch the actual account holder's name.
        document.getElementById('receiverName').textContent = "박준하";
    }
</script>
<script>
    function changeBallance() {
        let selectedAccount = document.getElementById('selectSenderAccount').value;
        let balance = document.getElementById('balanceDisplay');

        if (selectedAccount === "123456789") {
            balance.textContent = "1,500,000"; // 임의의 잔액
        } else {
            balance.textContent = "0"; // 기타 계좌들에 대한 잔액, 실제 시나리오에서는 서버에서 가져올 데이터입니다.
        }
    }

    function selectAmount(amount) {
        document.getElementById('transfer_amount').value = amount;
    }
</script>
</body>

</html>
