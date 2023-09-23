<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Hana2.0+B&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Hana2.0+H&display=swap" rel="stylesheet"/>

    <link href="./css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
    <link href="./css/main.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/main-body.css" rel="stylesheet"/>
    <link href="./css/member/openAccount.css" rel="stylesheet"/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>회원가입</title>

</head>
<body>

<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area" style="margin-top: 5%">
        <form>
            <div class="step highlight" id="step1">
                <!-- Step 1 content -->
                <h3>Date of arrival in Korea</h3>
                <label for="arrivalDate">Arrival Date:</label>
                <input type="date" name="arrivalDate" id="arrivalDate" required>
                <button onclick="nextStep()">OK</button>
            </div>
            <div class="step" id="step2">
                <!-- Step 2 content -->
                <h3>What are your personal details?</h3>
                <p>Make sure you enter your name as it appears on your passport</p>
                <input type="text" name="firstName" placeholder="First Name" required>
                <input type="text" name="lastName" placeholder="Last Name" required>
                <button onclick="nextStep()">OK</button>
            </div>
            <div class="step" id="step3">
                <!-- Step 3 content -->
                <h3>What are your contact details?</h3>
                <label for="email">Email address:</label>
                <input type="email" name="email" id="email" placeholder="Email" required>
                <div class="row">
                    <div class="country-phone-group">
                        <label for="countryCode">Country code:</label>
                        <select name="countryCode" id="countryCode" required>
                            <!-- JavaScript로 option 불러오기 -->
                        </select>
                        <label for="phoneNumber">Mobile number:</label>
                        <input type="text" name="phoneNumber" id="phoneNumber" placeholder="Phone Number" required>
                    </div>
                </div>
                <button onclick="nextStep()">OK</button>
            </div>
            <div class="step" id="step4">
                <!-- Step 4 content -->
                <h3>What is your date of birth?</h3>
                <label for="dob">BirthDate:</label>
                <input type="date" name="dob" id="dob" required>
                <button onclick="nextStep()">OK</button>
            </div>
            <div class="step" id="step5">
                <!-- Step 5 content -->
                <h3>What is your current address?</h3>
                <input type="text" name="address" placeholder="Street, Town/City, Postcode/Zipcode" required style="width: 60%">
                <label for="country">Country:</label>
                <select name="country" id="country" required>
                    <!-- JavaScript로 option 불러오기 -->
                </select>
                <button onclick="nextStep()">OK</button>
            </div>
            <div class="step" id="step6">
                <!-- Step 6 content -->
                <h3>Choose a branch</h3>
                <p>This branch should be convenient for you to get to, once you arrive in Korea. Find and choose a
                    branch</p>
                <label for="branch">Hana Bank Branch:</label>
                <select name="branch" id="branch" required>
                    <option value="">Hana Bank Branch</option>
                    <option value="branch1">Branch 1</option>
                    <!-- ...other branches... -->
                </select>
                <button onclick="nextStep()">OK</button>
            </div>
            <div class="step" id="step7">
                <!-- Step 7 content -->
                <h3>Select your visa type</h3>
                <label for="visaType">Visa Type:</label>
                <select name="visaType" id="visaType" required>
                </select>
                <button onclick="nextStep()">OK</button>
            </div>
            <div class="step" id="step8">
                <!-- Step 8 content -->
                <h3>Create your ID and password</h3>
                <p>Once you have completed this form you will be able to access Hana Global, our online banking.</p>
                <input type="text" name="ID" placeholder="ID" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="password" name="confirmPassword" placeholder="Confirm Password" required>
                <p>Your password should be 8 - 16 characters, contain letters and at least one number</p>
                <button onclick="nextStep()">OK</button>
            </div>
            <div class="step" id="finalStep">
                <!-- Final Step content -->
                <h3>Thinks you should know</h3>
                <p>By clicking on ‘Accept and open now’ below to open a Smart Access account you:</p>
                <ul class="ng-scope">
                    <li>Agree to receive the <a href="http://www.commbank.com.au/personal/apply-online/download-printed-forms/FSRA0074_BR173_PrintVersion_1811.pdf" target="_blank">Financial Services Guide</a> (PDF 54KB), <a href="http://www.commbank.com.au/personal/apply-online/download-printed-forms/SavingsInvestment_ADB2852.pdf" target="_blank">Transaction, Savings and Investment Accounts Terms &amp; Conditions</a> (PDF 668KB) &amp; <a href="https://www.commbank.com.au/content/dam/commbank/personal/apply-online/download-printed-forms/ElectronicBanking_ADB2426.pdf" target="_blank">Electronic Banking Terms and Conditions</a> (PDF 243KB) electronically and accept the Terms and Conditions, including the section on Privacy. If you don't want to receive the Terms &amp; Conditions electronically, please do not open this account online - visit any branch once you arrive;
                    </li><li>Acknowledge that the Bank may pay a Global Alliance Partner payment to the agent or organisation assisting you and that if an agent is assisting you, they must not fill out this form on your behalf;</li>
                    <li>Acknowledge that the Bank may share your personal information, such as your name, email address and phone number for the purposes of reconciliation with the agent assisting you;</li>
                    <li>Are required by law to tell us if you're also known by another name, when you visit a branch;</li>
                    <li>Acknowledge that you must have opened your account online more than 7 days before arriving in Australia, to ensure that your Debit MasterCard is ready and waiting for you at your chosen branch. If you applied for your account after arriving in Australia, your Debit MasterCard will be mailed out to your Australian address. Students cannot receive a Debit MasterCard in branch – a card is mailed out to the applicant's address once ID has been verified in branch;</li>
                    <li>Acknowledge that once your account is opened online, you will be not able to transact on your account until you have provided supporting information, including but not limited to identification documentation, visa details and tax residency information – you can do this in a Commonwealth Bank branch in Australia.</li>
                    <li>Acknowledge that we use cookies and similar technologies on our websites and mobile applications to help provide you with the best possible online experience. By using our sites and apps, you agree that we may store and access cookies and similar technologies on your device. Find out more about the types of cookies we use and why <a href="https://www.commbank.com.au/important-info/cookies.html" target="_blank">here</a></li>
                    <li>Agree that you can opt out of receiving marketing information or change your NetBank password only after you have been identified in a branch in Australia;</li>
                    <li>Acknowledge and agree that if you’re over 18 years old, your account automatically comes with an overdraw feature. This means that if you have insufficient funds to cover a direct debit, cheque, scheduled BPay or card purchase, we may at our discretion, honour that payment. If we do honour the payment, your account may become overdrawn and you will be charged a $15 fee that day regardless of the number of transactions honoured. Interest will also be charged for as long as your account remains overdrawn. The current applicable interest rate is 14.90% p.a. but is subject to change.
                        <br><br>
                        You should only keep the overdraw feature if you think you'll use it irregularly to cover an accidental shortfall in funds. You can turn the overdraw feature off through NetBank or the CommBank app. Turning it off may cause payments to be dishonoured or returned and a $5 fee will apply. The overdraw feature may impact later credit assessments if you apply for loan products in the future. For full terms and conditions see the <a href="http://www.commbank.com.au/personal/apply-online/download-printed-forms/SavingsInvestment_ADB2852.pdf" target="_blank">Transaction, Savings and Investment Accounts Terms &amp; Conditions</a>.
                        <br><br>
                        If you need ongoing credit once you are living in Australia, one of our credit products may be suitable. The overdraw feature may impact later credit assessments if you apply for a loan product. Applications for credit are subject to application and credit assessment.</li>
                    <br>
                </ul>
                <button type="submit">Accept and open now</button>
            </div>

        </form>
    </div>
</div>
<footer>
</footer>
</div>


<script>
    const steps = document.querySelectorAll('.step');
    let currentStep = 0;  // 추가된 부분

    let observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                steps.forEach(step => step.classList.remove('highlight'));
                entry.target.classList.add('highlight');
                // Update currentStep based on the index of the intersecting element
                currentStep = Array.from(steps).indexOf(entry.target);  // 추가된 부분
            }
        });
    }, {threshold: 1});  // Adjust the threshold value to control when the callback is fired

    steps.forEach(step => {
        observer.observe(step);
    });

    function nextStep() {
        if (currentStep < steps.length - 1) {
            steps[currentStep].classList.remove('highlight');
            currentStep++;
            steps[currentStep].classList.add('highlight');
            steps[currentStep].scrollIntoView({behavior: 'smooth', block: 'center'});
        }
    }

    // 국가 코드 옵션 불러오기
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
            data.countries.forEach(country => {
                const option = document.createElement('option');
                option.value = country;
                option.textContent = country;
                select.appendChild(option);
            });
        })
        .catch(error => console.error('Error fetching countries:', error));
    // 비자 타입 불러오기
    fetch('./json/visaTypes.json')
        .then(response => response.json())
        .then(data => {
            const select = document.getElementById('visaType');
            data.visaTypes.forEach(option => {
                const optionElement = document.createElement('option');
                optionElement.value = option.VisaTypeId;
                optionElement.textContent = option.VisaType;
                select.appendChild(optionElement);
            });
        })
        .catch(error => console.error('Error fetching visa types:', error));
</script>

</body>

</html>