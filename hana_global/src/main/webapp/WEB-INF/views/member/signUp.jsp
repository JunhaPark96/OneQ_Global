<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Hana2.0+B&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Hana2.0+H&display=swap" rel="stylesheet"/>

    <link href="./css/main.css" rel="stylesheet"/>
    <link href="./css/nav.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/main-body.css" rel="stylesheet"/>
    <link href="./css/signUp.css" rel="stylesheet"/>
    <title>회원가입</title>

</head>
<body>

<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="content">
        <dl class="description-box">
<%--            <dt class="desc-1">홈페이지 가입고객 이용안내</dt>--%>
            <dt class="desc-1">Online Banking Registration Guide for Customers</dt>
<%--            <dd class="desc-2">하나은행 홈페이지에서 회원가입하시면 계좌조회서비스를 이용하실 수 있습니다.<br>계좌이체/금융상품 신규 등의 거래를 원하시면 영업점에 방문하여 '인터넷뱅킹' 서비스를 가입하시기 바랍니다.</dd>--%>
            <dd class="desc-2">You can access account inquiry services by registering as a member on Hana Bank's website.<br>If you wish to conduct transactions such as account transfers or opening financial products, please visit a branch and sign up for 'Internet Banking' service.</dd>
        </dl>

        <ol class="step-box">
            <li class="round-box clearfix">
                <div class="step-num">
                    <p>
                        <span class="step">STEP</span>
                        <span class="num">01</span>
                    </p>
                </div>
                <div class="txt-box">
                    <dl>
                        <dt>Agreement</dt>
                        <dd>
                            <ul class="txt-box-depth1">
                                <li>Agree to the terms and conditions of electronic financial transactions.</li>
                            </ul>
                        </dd>
                    </dl>
                </div>
                <div class="bg_lt">&nbsp;</div>
                <div class="bg_rt">&nbsp;</div>
                <div class="bg_lb">&nbsp;</div>
                <div class="bg_rb">&nbsp;</div>
                <div class="bg_next">&nbsp;</div>
            </li>
            <li class="round-box clearfix">
                <div class="step-num">
                    <p>
                        <span class="step">STEP</span>
                        <span class="num">02</span>
                    </p>
                </div>
                <div class="txt-box">
                    <dl>
                        <dt>Account Registration and Identity Verification</dt>
                        <dd>
                            <ul class="txt-box-depth1">
                                <li>Apply for the account number for the inquiry service, register the account password, and verify the mobile phone number with a certificate or personal mobile phone.</li>
                            </ul>
                        </dd>
                    </dl>
                </div>
                <div class="bg_lt">&nbsp;</div>
                <div class="bg_rt">&nbsp;</div>
                <div class="bg_lb">&nbsp;</div>
                <div class="bg_rb">&nbsp;</div>
                <div class="bg_next">&nbsp;</div>
            </li>
            <li class="round-box clearfix">
                <div class="step-num">
                    <p>
                        <span class="step">STEP</span>
                        <span class="num">03</span>
                    </p>
                </div>
                <div class="txt-box">
                    <dl>
                        <dt>Information Input</dt>
                        <dd>
                            <ul class="txt-box-depth1">
                                <li>Register your name, user ID for internet banking login, and user password.</li>
                            </ul>
                        </dd>
                    </dl>
                </div>
                <div class="bg_lt">&nbsp;</div>
                <div class="bg_rt">&nbsp;</div>
                <div class="bg_lb">&nbsp;</div>
                <div class="bg_rb">&nbsp;</div>
                <div class="bg_next">&nbsp;</div>
            </li>
            <li class="round-box clearfix">
                <div class="step-num">
                    <p>
                        <span class="step">STEP</span>
                        <span class="num">04</span>
                    </p>
                </div>
                <div class="txt-box">
                    <dl>
                        <dt>Membership Registration Completed</dt>
                        <dd>
                            <ul class="txt-box-depth1">
                                <li></li>
                                <br>
                            </ul>
                        </dd>
                    </dl>
                </div>
                <div class="bg_lt">&nbsp;</div>
                <div class="bg_rt">&nbsp;</div>
                <div class="bg_lb">&nbsp;</div>
                <div class="bg_rb">&nbsp;</div>
            </li>
        </ol>

        <div class="btn-area mt10">
            <span class=" btn-pack btn-type-3c ui-btn-pack-a ui-set-btn-pack ui-set-btn-pack-event">
<%--                TODO: 링크 경로 바꾸기--%>
                <a href="/signUp_STEP1" class="">Go to New Membership Registration</a></span>
        </div>

    </div>
</div>
<footer>
</footer>
</div>

</body>

</html>
