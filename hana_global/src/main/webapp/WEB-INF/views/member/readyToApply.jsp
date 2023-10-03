<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Hana2.0+B&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Hana2.0+H&display=swap" rel="stylesheet"/>

    <link href="./css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/main-body.css" rel="stylesheet"/>
    <link href="./css/member/readyToApply.css" rel="stylesheet"/>
    <title>회원가입</title>

</head>
<body>

<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area">
                <div class="main-body-wrapper">
                    <div class="header-section">
                        <h2>Ready to apply?
                            <ul>
                            </ul>
                        </h2>
                        <p></p><p>Make sure you:</p>
                        <ul>
                            <li>Are aged 14 years and over</li>
                            <li>Will arrive in Korea in the next 14 days or;</li>
                            <li>Have arrived in Korea in the past three months</li>
                        </ul>
                        <p><b>Please ensure your travel plans have been confirmed before you open an account. For more information, please visit <a data-tracker-type="richtext" href="https://www.kebhana.com/cont/util/util04/util0401/index.jsp" style="color: #018085">hanabank.com/movingtokorea</a>.</b></p>
                        <p>You won’t be able to deposit funds or make account transactions until you’ve verified your ID at a Hana Bank branch in Korea.&nbsp;</p>
                        <p>You'll need to provide your ID for verification within 20 days of opening your account or your account may automatically close. You can reapply at any Hana Bank branch.</p>
                        <p></p>

                        <div class="button-section">
                            <p><a aria-label="Get started" href="${pageContext.request.contextPath}/openAccount" class="button_primary" data-tracker-type="button" data-tracker_ei="default_0_1" data-tracker-id="default_0_1">Get started</a>

                            </p>

                        </div>
                    </div>
                    <div class="content-section">
                        <div class="item  ">

                            <div class="item-inner">
                                <h3>Step 1: Complete the online form
                                </h3>
                                <div>
                                    <p></p><p>Provide us with your details, including your name (as it appears on your passport), your current address, email and phone number.&nbsp;</p>
                                    <p><b>Please note that you won’t be able to deposit funds or transact on your account until you complete Step 2.</b></p>
                                    <p>&nbsp;</p>
                                    <p></p>
                                </div>




                            </div>
                        </div>
                        <div class="item  ">

                            <div class="item-inner">
                                <h3>Step 2: Visit a branch
                                </h3>
                                <div>
                                    <p></p><p>Once you get to Korea, visit your chosen branch&nbsp;to identify yourself and collect your debit Mastercard. We'll just need to see your passport and confirm the countries where you're a <a data-tracker-type="richtext" dtmtracker="@@@@@@" href="/about-us/opportunity-initiatives/policies-and-practices/fatca.html">tax resident</a>.<br>
                                </p>
                                    <p></p>
                                </div>




                            </div>
                        </div>
                        <div class="item  ">

                            <div class="item-inner">
                                <h3>Step 3: Access your money
                                </h3>
                                <div>
                                    <p></p><p>After your identification check, you can start banking straight away. Download the Hana Bank app or log on to NetBank to manage your money securely. Withdraw cash from any Korean ATM instantly.&nbsp;</p>
                                    <p></p>
                                </div>




                            </div>
                        </div>
                        <div class="item  ">

                            <div class="item-inner">
                                <h3>Keep in mind
                                </h3>
                                <div>
                                    <p></p><p>You may be eligible for the <a data-tracker-type="richtext" dtmtracker="@@@@@@" href="/banking/streamline-basic.html">Streamline Basic</a> account which has no monthly fees, if you (or anyone else you are applying with) holds a Korean Government issued:</p>
                                    <ul>
                                        <li>Seniors Health card</li>
                                        <li>Pensioner Concession card, or</li>
                                        <li>Health Care card</li>
                                    </ul>
                                    <p>Show this card at a branch to apply for the Streamline Basic account.</p>
                                    <p></p>
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

</body>

</html>
