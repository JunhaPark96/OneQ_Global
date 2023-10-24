<%@ page import="com.kopo.hanaglobal.hana_global.web.entity.Member" %>
<%@ page import="com.kopo.hanaglobal.hana_global.web.Util.DateUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyProfile</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
            crossorigin="anonymous"></script>
    <link href="./css/bootstrap/paper-dashboard.css?v=2.0.1" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/profile.css" rel="stylesheet">
    <link href="./css/wallet/flags.css" rel="stylesheet">
    <link href="./css/member/readyToApply.css" rel="stylesheet"/>
    <link href="./css/member/completeAccount.css" rel="stylesheet"/>
    <link href="./css/remittance/immediateRemittance.css" rel="stylesheet"/>

</head>
<style>
    .table tr {
        border: solid 1px #ccc;
    }

    .table th {
        text-align: center;
    }
    .refund-information {
        background-color: #f7f7f7;
        padding: 15px;
        border: 1px solid #dcdcdc;
        border-radius: 5px;
        margin-top: 20px;
        font-size: 16px;
        line-height: 1.6;
    }

    .refund-information p {
        margin-bottom: 0;
    }

</style>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area" style="margin-left: 10%; margin-right: 10%;">
        <%@ include file="/WEB-INF/views/includes/mem_sidebar.jsp" %>
        <div>
            <div class="main-body">
                <div class="main-body" id="recipientDiv" style="width: 700px ;background-color: white; flex-direction: column; box-shadow: rgba(0, 0, 0, 0.25) 0px 0.0625em 0.0625em, rgba(0, 0, 0, 0.25) 0px 0.125em 0.5em, rgba(255, 255, 255, 0.1) 0px 0px 0px 1px inset; padding: 30px;">
                    <div class="fs-5 mt-2" style="color: #bdbdbd">Reimbursement / <strong
                            style="color: #000000">Billing</strong></div>
                    <div class="col-md-12">
                        <div class="card-body pe-3 ps-3">
                            <table class="table" style="background-color: #f4f3ef;">
                                <tbody style="border-style: none">
                                <tr class="" style="background-color: #f4f3ef;">
                                    <th colspan="2">
                                        <div class="fs-5" style="color: #000000">Applicant's Info <strong
                                                style="color: #bdbdbd"></strong></div>
                                    </th>
                                </tr>
                                <tr class="">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Name</th>
                                    <td>
                                        <input type="text" name="applicantName" id="applicantName"
                                               placeholder="Full Name"/>
                                    </td>
                                </tr>
                                <tr class="">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Email</th>
                                    <td>
                                        <input type="text" name="applicantEmail" id="applicantEmail"
                                               placeholder="yourEmail@domain"/>
                                    </td>
                                </tr>
                                <tr class="">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Account No</th>
                                    <td>
                                        <select class="form-select border-3" name="senderAccountNo"
                                                id="selectAccountForm"
                                                onchange="changeBalance()" style="width: 250px; height: 45px;">
                                            <option value="" selected disabled>Select an account.</option>
                                            <c:forEach items="${accountList}" var="account">
                                                <option value="${account.acNo}" data-balance="${account.balance}">
                                                    (${account.acNo.substring(0, 3)}-${account.acNo.substring(3, 9)}-${account.acNo.substring(9, 14)})
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Balance</th>
                                    <td class="text-start align-middle">
                                        <p style="margin-bottom: 0px;" id="accountBalance"></p>
                                    </td>
                                </tr>
                                <!-- Deposit Information -->
                                <tr class="">
                                    <th colspan="2">
                                        <div class="fs-5" style="color: #000000">Deposit Information <strong
                                                style="color: #bdbdbd"></strong></div>
                                    </th>
                                </tr>
                                <tr class="">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Account Holder Name</th>
                                    <td>
                                        <input type="text" name="accountHolderName" id="accountHolderName"
                                               placeholder="Account Holder Name"/>
                                    </td>
                                </tr>
                                <tr class="">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;SWIFT Code</th>
                                    <td>
                                        <input type="text" name="swiftCode" id="swiftCode" placeholder="SWIFT Code"/>
                                    </td>
                                </tr>

                                <tr class="">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Account No.</th>
                                    <td>
                                        <input type="text" name="accountNumber" id="accountNumber"
                                               placeholder="Account Number"/>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <h4>Reimbursement Information</h4>
                            <div class="refund-information">
                                <p><span style="color: #b90202"> Cancellation is not possible and will be processed as part of the final deposit amount shown.</span><br/>
                                    Fees will be applied based on the current displayed deposit amount. The reimbursed balance will be deposited into the provided account, and we are not responsible for incorrect account names.<br/>
                                    The cash Reimbursement will be completed within 3 days (business days) from the application date after going through the deposit waiting process.<br/></p>
                            </div>

                            <div class="btn-area2 mt15 mb30 mt-4">
                                <span class="btn-pack btn-type-3c ui-btn-pack-button ui-set-btn-pack ui-set-btn-pack-event">
                                            <button id="">Next </button></span>
                            </div>
                        </div>


                    </div>
                </div>

                <div class="main-body" id="refundDiv" style="width: 700px ;background-color: white; flex-direction: column; box-shadow: rgba(0, 0, 0, 0.25) 0px 0.0625em 0.0625em, rgba(0, 0, 0, 0.25) 0px 0.125em 0.5em, rgba(255, 255, 255, 0.1) 0px 0px 0px 1px inset; padding: 30px;">
                    <div class="fs-5 mt-2" style="color: #bdbdbd">Reimbursement / <strong style="color: #000000">Confirmation</strong></div>
                    <div class="col-md-12">
                        <div class="card-body pe-3 ps-3">
                            <table class="table" style="background-color: #f4f3ef;">
                                <tbody style="border-style: none">
                                <!-- Applicant's Name -->
                                <tr class="" style="background-color: #f4f3ef;">
                                    <th colspan="2">
                                        <div class="fs-5" style="color: #000000">Application Information <strong style="color: #bdbdbd"></strong></div>
                                    </th>
                                </tr>
                                <tr class="">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Name</th>
                                    <td>
                                        <p id="applicantNameCheck"></p>
                                    </td>
                                </tr>
                                <tr class="">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Email</th>
                                    <td>
                                        <p id="applicantEmailCheck"></p>
                                    </td>
                                </tr>
                                <tr class="">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Account No</th>
                                    <td>
                                        <p id="applicantAccountCheck"></p>
                                    </td>
                                </tr>
                                <tr class="">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Application Amount</th>
                                    <td class="text-start align-middle">
                                        <p style="margin-bottom: 0px;" id="applicationAmount"></p>
                                    </td>
                                </tr>
                                <tr class="">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Application Date</th>
                                    <td class="text-start align-middle">
                                        <p style="margin-bottom: 0px;" id="applicationDate"></p>
                                    </td>
                                </tr>
                                <!-- Deposit Information -->
                                <tr class="">
                                    <th colspan="2">
                                        <div class="fs-5" style="color: #000000">Estimated Reimbursement Amount <strong style="color: #bdbdbd"></strong></div>
                                    </th>
                                </tr>
                                <tr class="">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Application Amount</th>
                                    <td class="text-start align-middle">
                                        <p style="margin-bottom: 0px;" id="applicationAmountCheck"></p>
                                    </td>
                                </tr>
                                <tr class="">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Reimbursement Fee</th>
                                    <td class="text-start align-middle">
                                        <p style="margin-bottom: 0px;" id="refundFee"></p>
                                    </td>
                                </tr>

                                <tr class="">
                                    <th scope="row" class="text-start align-middle">&nbsp;&nbsp;Final Deposit Amount</th>
                                    <td class="text-start align-middle">
                                        <p style="margin-bottom: 0px;" id="depositAmount"></p>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <h4>Reimbursement Information</h4>
                            <div class="refund-information">
                                <p><span style="color: #b90202">Cancellation is not possible and will be processed as part of the final deposit amount shown.</span><br/>
                                    Fees will be applied based on the current displayed deposit amount. The reimbursed balance will be deposited into the provided account, and we are not responsible for incorrect account names.<br/>
                                    The cash Reimbursement will be completed within 3 days (business days) from the application date after going through the deposit waiting process.<br/></p>
                            </div>
                            <input type="checkbox" id="agreeCheckbox">
                            <label for="agreeCheckbox">I have reviewed all the details and agree to this.</label>

                            <div class="btn-area2 mt15 mb30 mt-4">
        <span class="btn-pack btn-type-3c ui-btn-pack-button ui-set-btn-pack ui-set-btn-pack-event">
            <button id="btnComplete" onclick="checkAgreement()">Reimbursement</button>
        </span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<footer>
</footer>
</div>
<div class="modal fade" id="refundModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" style="font-size: 22px;">Reimbursement Application Complete</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <p>Reimbursement application has been submitted successfully.</p>
                <p>The cash Reimbursement will be completed within 3 days (business days) from the application date after going through the deposit waiting process.</p>
            </div>
            <div class="modal-footer" style="width: 100%; justify-content: center">
                <button type="button" class="btn btn-primary" onclick="redirectToRefundDetail()">OK</button>

            </div>
        </div>
    </div>
</div>
<script>
    function changeBalance() {
        let select = document.getElementById("selectAccountForm");
        let selectedOption = select.options[select.selectedIndex];
        let balance = selectedOption.getAttribute("data-balance");
        document.getElementById("accountBalance").innerText = 'KRW ' + balance.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
</script>


<script>
    function checkAgreement() {
        let agreeCheckbox = document.getElementById("agreeCheckbox");

        if (agreeCheckbox.checked) {
            $('#refundModal').modal('show');
        } else {
            alert("You must agree to the refund terms. Please check the box.");
        }
    }

</script>
<script>
    function showRefundDiv() {
        var recipientDiv = document.getElementById("recipientDiv");
        var refundDiv = document.getElementById("refundDiv");

        document.getElementById("applicantNameCheck").innerText = document.getElementById("applicantName").value;
        document.getElementById("applicantEmailCheck").innerText = document.getElementById("applicantEmail").value;
        document.getElementById("applicantAccountCheck").innerText = document.getElementById("accountNumber").value;

        var balanceText = document.getElementById("accountBalance").innerText;
        var balance = parseInt(balanceText.replace("KRW", "").trim().replace(/,/g, ""));

        document.getElementById("applicationAmount").innerText = new Intl.NumberFormat().format(balance) + " won";
        document.getElementById("applicationAmountCheck").innerText = new Intl.NumberFormat().format(balance) + " won";

        var refundFee = 5000; // 원화로 5000원
        document.getElementById("refundFee").innerText = refundFee + " won";

        var finalAmount = balance - refundFee;
        document.getElementById("depositAmount").innerText = new Intl.NumberFormat().format(finalAmount) + " won";

        // 현재 날짜를 가져와서 applicationDate 요소에 설정합니다.
        var currentDate = new Date();
        var formattedDate = currentDate.getFullYear() + '-' + (currentDate.getMonth() + 1).toString().padStart(2, '0') + '-' + currentDate.getDate().toString().padStart(2, '0');
        document.getElementById("applicationDate").innerText = formattedDate;

        recipientDiv.style.display = "none";
        refundDiv.style.display = "block";
    }


    document.querySelector(".ui-btn-pack-button button").addEventListener("click", showRefundDiv);

    document.getElementById("refundDiv").style.display = "none";

    function redirectToRefundDetail() {
        location.href = "${pageContext.request.contextPath}/refundDetail";
    }

</script>
</body>
</html>
