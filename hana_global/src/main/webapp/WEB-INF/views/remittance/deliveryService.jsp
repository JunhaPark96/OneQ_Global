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

    <link href="./css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"--%>
<%--          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">--%>

    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/wallet/flags.css" rel="stylesheet">
    <link href="./css/service-main.css" rel="stylesheet"/>
    <script src="./js/main.js"></script>
    <link href="./css/remittance/deliveryService.css" rel="stylesheet">


</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area">
        <%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
        <div class="main-body">
            <h2>Remittance Delivery Service</h2>
            <div class="container-fluid">
                <div class="row g-4">
                    <div class="col-sm-12 col-md-12 col-xl-12">
                        <div class="row bg-white rounded box mb-2" style="padding-top: 0px; padding-left: 1.5rem; padding-right: 1.5rem">
                            <div class="fs-5 mb-3" style="color: #bdbdbd; font-size: 1.5rem;">Remittance / <strong style="color: #000000; margin-bottom: 0px;">Delivery</strong></div>
                            <form action="${pageContext.request.contextPath}/deliveryComplete" method="post" style="width: 100%">
                                <table class="table table-hover mb-3 border-light">
                                    <thead>
                                    <tr>
                                        <th scope="col" class="h5  border-light" style="width: 30%; ">

                                Remittance Information
                                        </th>
                                        <th scope="col" class="h5 text-dark border-light" style="width: 55%"></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="border-0">
                                        <th scope="row" class="text-center align-middle">
                                            &nbsp;&nbsp;MTCN <br/>(Money Transfer <br/>Control Number)
                                        </th>
                                        <td style="padding-left: 20px; vertical-align: middle">
                                            <input class="form-control " type="text" value="486439619"
                                                   name="mtcn" style="width: 45%; padding: 10px 5px 10px 15px; font-size: 17px; color: black">
                                        </td>
                                    </tr>
                                    <tr class="border-0">
                                        <th scope="row" class="text-center align-middle">
                                            &nbsp;&nbsp;Recipient
                                        </th>
                                        <td style="padding-left: 20px;">
                                            <input class="form-control" type="text" value="Sophia Moore"
                                                   name="sender" style="width: 45%; padding: 10px 5px 10px 15px; font-size: 17px; color: black">
                                        </td>
                                    </tr>
                                    <tr class="border-0">
                                        <th scope="row" class="text-center align-middle">
                                            &nbsp;&nbsp;Recipient's Country
                                        </th>
                                        <td style="padding-left: 20px;">
                                            <input class="form-control" type="text" value="Dominion of Canada"
                                                   name="senderCountry" style="width: 45%; padding: 10px 5px 10px 15px; font-size: 17px; color: black">
                                        </td>
                                    </tr>

                                    <tr class="border-0">
                                        <th scope="row" class="text-center align-middle">
                                            Applied Currency &<br/> Available Balance
                                        </th>
                                        <td style="padding-left: 20px;">
                                            <div style="display: flex; gap: 20px;">
                                                <input class="form-control" type="text" value="CAD" name="appliedCurrency" readonly style="width: 45%; padding: 10px 5px 10px 15px; font-size: 17px; color: black">
                                                <input class="form-control" type="text" value="499" name="availableBalance" readonly style="width: 45%; padding: 10px 5px 10px 15px; font-size: 17px; color: black">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="border-0">
                                        <th scope="row" class="text-center align-middle" >
                                            Bill Selection
                                        </th>
                                        <td style="padding-left: 20px; text-align: start;">
                                            <!-- Denomination and quantity selection -->
                                            100
                                            <select name="quantity_100" class="form-control pe-2" style="display: inline-block; width: 70px; ">
                                                <!-- Quantities -->
                                                <option value="0">0</option>
                                            </select>
                                            50
                                            <select name="quantity_50" class="form-control" style="display: inline-block; width: 70px;">
                                                <!-- Quantities -->
                                                <option value="0">0</option>
                                            </select>
                                            20
                                            <select name="quantity_20" class="form-control mb-2" style="display: inline-block; width: 70px;">
                                                <!-- Quantities -->
                                                <option value="0">0</option>
                                            </select>
                                            <br/>
                                            10
                                            <select name="quantity_10" class="form-control" style="display: inline-block; width: 70px;">
                                                <!-- Quantities -->
                                                <option value="0">0</option>
                                            </select>
                                            5
                                            <select name="quantity_5" class="form-control" style="display: inline-block; width: 70px;">
                                                <!-- Quantities -->
                                                <option value="0">0</option>
                                            </select>
                                            1
                                            <select name="quantity_1" class="form-control" style="display: inline-block; width: 70px;">
                                                <!-- Quantities -->
                                                <option value="0">0</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <!-- Additional row for total amount -->
                                    <tr class="border-0">
                                        <th scope="row" class="text-center align-middle" >
                                            Total Amount
                                        </th>
                                        <td style="padding-left: 20px; display: flex;">
                                            <input class="form-control" type="text" name="totalAmount" readonly style="width: 45%; padding: 10px 5px 10px 15px; font-size: 17px; color: black">
                                            <!-- Add reset button -->
                                            <button type="button" id="resetButton" class="btn btn-secondary" style="margin-left: 10px;">Reset</button>
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>


                                <table class="table table-hover mb-3 border-light">
                                    <thead>
                                    <tr>
                                        <th scope="col" class="h5  border-light" style="width: 30%; font-size: 22px;">
                                            Receipt Information
                                        </th>
                                        <th scope="col" class="h5 text-dark border-light" style="width: 85%"></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="border-0">
                                        <th scope="row" class="text-center align-middle">
                                            &nbsp;&nbsp;Address
                                        </th>
                                        <td>
                                            <div class="step" id="step5">
                                                <!-- Step 5 content -->
                                                <label for="country">Country</label>
                                                <select name="country" id="country"></select>
                                                <input type="text" name="address"
                                                       placeholder="Street, Town/City, Postcode/Zipcode"
                                                       style="width: 100%">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="border-0">
                                        <th scope="row" class="text-center align-middle">
                                            &nbsp;&nbsp;Mobile Phone
                                        </th>
                                        <td class="d-flex">
                                            <div class="step" id="step3">
                                                <div class="row" style="gap: 30px">
                                                    <div class="country-phone-group" style="width: 200px;">
                                                        <label for="countryCode">Country code</label>
                                                        <select name="countryCode" id="countryCode"
                                                                style="width: 100%;">
                                                        </select>
                                                    </div>
                                                    <div class="country-phone-group">
                                                        <label for="phoneNumber">Mobile number</label>
                                                        <input type="text" name="phoneNumber" id="phoneNumber"
                                                               placeholder="Phone Number" style="width: 100%;">
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="border-0">
                                        <th scope="row" class="text-center align-middle pt-2 pb-2">&nbsp;&nbsp;Desired Delivery Date</th>
                                        <td>
                                            <div class="mb-2" style="width: 30%!important; padding-left: 20px;">
                                                <div class="row form-group">
                                                    <div class="input-group date" id="datepicker" style="display: flex; align-items: center; gap: 10px;">
                                                        <input class="form-control" name="receiptDate" type="text" id="receipt_date" style="font-size: 16px; border-radius: 4px; border: 1px solid #ccc; ">
                                                        <img src="https://image.kebhana.com/pbk/easyone/resource/img/btn/btn_calendar.gif" style="width: 25px; height: 25px" onclick="openCalendar('receipt_date')">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="ms-1 text-black-50 mb-2"
                                                 style="font-size: 16px;">
                                                <i class="fa-solid fa-exclamation text-hanared"></i>&nbsp;Available within 3 business days to 15 business days from the application date.
                                            </div>
                                            <div class="ms-1 text-black-50" style="font-size: 16px;">
                                                <i class="fa-solid fa-exclamation text-hanared"></i>&nbsp;If the desired delivery date falls on a temporary public holiday, <br/>it will be delivered on the next business day.
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>

                                <div class="container-fluid bg-white mt-3 mb-3">
								<span class="float-start" style="text-align: left">
                                    Delivery Fee<br>
                                    - Free to Customer-Paid (₩3,000 KRW)<br>
                                    - (Exempted for transactions of USD 600 or more equivalent)<br><br>
                                    Delivery Areas<br>
                                    - Nationwide (excluding some remote areas where post office delivery is not available)<br><br>
                                    Currency Pickup<br>
                                    - Pickup by the Account Holder Only (Proxy pickup not allowed, pickup possible after verifying the amount, denomination, and quantity)<br>
                                    - For currency pickup, the account holder's identification and currency exchange message (SMS) are required.
                                </span>
                                </div>
                                <div style="width: 100%; display: flex; justify-content: center" data-context-path="${pageContext.request.contextPath}">
                                    <button id="applyButton" class="btn bg-hanagreen text-white float-end"
                                            style="width: 100px; height: 50px" type="button">Apply
                                    </button>
                                </div>

                                <table class="table table-hover border-white mb-5 d-none" id="showTable">
                                    <thead>
                                    <tr>
                                        <th scope="col" class="h5 text-center" style="width: 15%; color: #6C7293">거래일시
                                        </th>
                                        <th scope="col" class="h5 text-center" style="width: 15%; color: #6C7293">적요
                                        </th>
                                        <th scope="col" class="h5 text-center" style="width: 15%; color: #6C7293">거래금액
                                        </th>
                                        <th scope="col" class="h5 text-center" style="width: 15%; color: #6C7293">잔액
                                        </th>
                                    </tr>
                                    </thead>

                                    <tbody class="border-1" id="tbody">
                                    </tbody>
                                </table>
                            </form>
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

<script>
    fetch('./json/countryCodes.json')
        .then(response => response.json())
        .then(data => {
            let select = document.getElementById('countryCode');
            for (let i = 0; i < data.length; i++) {
                let country = data[i].country;
                let dial_code = data[i].dial_code;
                let option = document.createElement('option');
                option.text = country + " (" + dial_code + ")";
                option.value = dial_code;
                select.add(option);
            }
        });
    // 국가 옵션 불러오기
    fetch('./json/country.json')
        .then(response => response.json())
        .then(data => {
            const select = document.getElementById('country');
            for (const country of data.countries) {
                const option = document.createElement('option');
                option.textContent = country.nationality;  // 국가 이름 표시
                option.value = country.countrySP;  // 국가 코드 저장
                select.appendChild(option);
            }
        })
        .catch(error => console.error('Error fetching countries:', error));


</script>
<!-- 날짜 입력 필드에 대한 스크립트 추가 -->
<!-- Pikaday 라이브러리 포함 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.8.0/css/pikaday.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.8.0/pikaday.min.js"></script>

<script>
    let picker = new Pikaday({
        field: document.getElementById('receipt_date'),
        format: 'YYYY-MM-DD',
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

<script>
    document.addEventListener("DOMContentLoaded", function(){
        const availableBalanceInput = document.querySelector("[name='availableBalance']");
        const billSelections = document.querySelectorAll("select[name^='quantity_']");
        const totalAmountInput = document.querySelector("[name='totalAmount']");
        const previousValues = {};
        const resetButton = document.getElementById('resetButton');

        updateBillSelectionOptions();

        resetButton.addEventListener("click", function(){
            resetValues();
        });

        billSelections.forEach((selectElement) => {
            selectElement.addEventListener("change", function(){
                updateTotalAmount();
                validateTotalAmount();
            });
        });

        availableBalanceInput.addEventListener("input", function(){
            updateBillSelectionOptions();
            updateTotalAmount();
        });

        function updateTotalAmount() {
            let totalAmount = 0;
            let availableBalance = parseFloat(availableBalanceInput.value.replace(/[^\d.-]/g, ''));

            billSelections.forEach((selectElement) => {
                const denomination = parseInt(selectElement.name.replace(/[^\d.-]/g, ''));
                const quantity = parseInt(selectElement.value);
                totalAmount += denomination * quantity;
                // Store the current value for future validation
                previousValues[selectElement.name] = selectElement.value;
            });

            totalAmountInput.value = new Intl.NumberFormat().format(totalAmount);
        }

        function updateBillSelectionOptions() {
            let availableBalance = parseFloat(availableBalanceInput.value.replace(/[^\d.-]/g, ''));

            billSelections.forEach((selectElement, index) => {
                let totalChosenAmount = 0;

                // Calculate the totalChosenAmount excluding the current denomination
                for (let i = 0; i < billSelections.length; i++) {
                    if (i !== index) {  // Exclude the current denomination
                        const denomination = parseInt(billSelections[i].name.replace(/[^\d.-]/g, ''));
                        const quantity = parseInt(billSelections[i].value);
                        totalChosenAmount += denomination * quantity;
                    }
                }

                const remainingBalance = availableBalance - totalChosenAmount;
                const denomination = parseInt(selectElement.name.replace(/[^\d.-]/g, ''));
                let maxQuantity = Math.floor(remainingBalance / denomination);

                selectElement.innerHTML = "";

                for (let i = 0; i <= maxQuantity; i++) {
                    const option = document.createElement("option");
                    option.value = i;
                    option.textContent = i;
                    selectElement.appendChild(option);
                }

                // Revert the selection to previous value
                selectElement.value = Math.min(maxQuantity, parseInt(selectElement.value));
            });
        }


        function validateTotalAmount() {
            let totalAmount = parseFloat(totalAmountInput.value.replace(/[^\d.-]/g, ''));
            let availableBalance = parseFloat(availableBalanceInput.value.replace(/[^\d.-]/g, ''));

            if (totalAmount > availableBalance) {
                alert("Selected amount exceeds available balance.");
                // Revert the selections to previous values
                billSelections.forEach((selectElement) => {
                    selectElement.value = previousValues[selectElement.name];
                });
                updateTotalAmount();  // Recalculate the total amount
            }
        }
        function resetValues() {
            billSelections.forEach((selectElement) => {
                selectElement.value = "0";
            });
            totalAmountInput.value = new Intl.NumberFormat().format(0);
        }
    });
</script>

<script>
    document.addEventListener("DOMContentLoaded", function(){
        const applyButton = document.getElementById('applyButton');
        const contextPath = applyButton.parentElement.getAttribute('data-context-path');

        applyButton.addEventListener("click", function(){
            window.location.href = contextPath + '/deliveryComplete';
        });
    });

</script>

</body>
</html>
