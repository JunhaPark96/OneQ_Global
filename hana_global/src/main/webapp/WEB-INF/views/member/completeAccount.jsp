<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Hana2.0+B&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Hana2.0+H&display=swap" rel="stylesheet"/>

    <link href="./css/bootstrap/bootstrap2.min.css" rel="stylesheet"/>
    <link href="./css/main.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/main-body.css" rel="stylesheet"/>
    <link href="./css/member/readyToApply.css" rel="stylesheet"/>
    <link href="./css/member/completeAccount.css" rel="stylesheet"/>
    <title>회원가입 완료</title>

</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area" style="margin-left: 15%; margin-right: 15%;">
        <div>
            <!-- start ob-section-banner -->
            <div class="ob-section unselectable" id="ob-section-banner"
                 back-img="https://static.my.commbank.com.au/static/cmxAssets/MigrantOrigination/migrant-confirmation-bp5.jpg">
                &nbsp;
            </div>
            <!-- end ob-section-banner -->
            <!-- start ob-section-header -->
            <div class="ob-section unselectable" id="ob-section-header" unselectable="on">
                <div class="p-grid">
                    <div class="p-grid-row">
                        <div class="p-1">
                            <p id="last-logon">
                                <span data-ng-bind-html="pageData.FirstTimeLogon ? '' : (content.salutationText | formatString:pageData.FirstName)"
                                      class="ng-binding"></span>
                                <span></span>
                            </p>
                            <div data-ng-bind-html="content.welcomeText" class="welcome-text ng-binding"
                                 id="welcome-text" test-and-target="" tat-campaign-code="CB-EO-SA-MIG-PAGE2-COPY"
                                 tat-product-code-name="productCode"><h1>Thanks for choosing to bank with us. We've
                                created your Everyday Smart Access Account. Here are your next steps:</h1></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end ob-section-header -->
            <br/>
            <!-- start ob-section-body -->
            <div class="ob-section" id="ob-section-body">
                <div class="p-grid">
                    <div class="p-grid-row" id="welcome-letter-wrapper"
                         style="display: grid; grid-template-columns: 1fr 1fr;">
                        <div class="p-1-2 bp3-1">
                            <!-- start welcome-letter-step1 -->
                            <div class="welcome-letter-step" id="welcome-letter-step1">
                                <div data-ng-bind-html="content.beforeArrivalBody | formatString:pageData.NetbankId"
                                     id="welcome-info" test-and-target="" tat-campaign-code="CB-EO-SA-MIG-PAGE2-COPY2"
                                     tat-product-code-name="productCode" class="ng-binding"><h2>Please read and print
                                    your welcome letter</h2>
                                    <div class="subtitle"></div>
                                    <p>It has all your account details and the information you need to get your account
                                        up and running or to <a
                                                href="https://www.commbank.com.au/moving-to-australia/international-banking-team.html"
                                                target="_blank">contact us</a>.</p>
                                    <br>
                                    Make sure you keep a record of your new account details if you don’t have a printer.
                                    You’ll be able to use your account after you complete step 2.
                                </div>

                                <div class="row-spacer"></div>

                                <a href="#" id="ctl00_BodyPlaceHolder_readAndPrintButton"
                                   class="button secondary ng-binding" data-popup="" data-popup-width="1140"
                                   data-popup-height="800" data-popup-title="Welcome"
                                   data-ng-bind-html="content.readAndPrintButtonText"
                                   data-ng-popup-window="/netbank/EO.Onboarding/Migrants/WelcomeLetter.aspx?RID=krHO7GDP9E62KDv7XqyVeA&amp;SID=dOYJMccDHBo%3d"
                                   target="Welcome">Read and print</a>
                            </div>
                            <!-- end welcome-letter-step1 -->
                        </div>

                        <div class="p-1-2 bp3-1" style="border-left: 4px solid #b1aeae; padding-left: 20px;">
                            <!-- start welcome-letter-step2 -->
                            <div class="welcome-letter-step" id="welcome-letter-step2">
                                <div data-ng-bind-html="content.arrivalBody" id="arrival-info" class="ng-binding"><h2>
                                    When you
                                    arrive in Australia</h2>
                                    <div class="subtitle">Visit your chosen branch to identify yourself for full access
                                        to your
                                        account.<br><br>Please bring the following documents and information with you:
                                    </div>
                                    <ul>
                                        <li>Passport (original document required)</li>
                                        <li><a href="https://www.commbank.com.au/crs.html" target="_blank">Tax residency
                                            details</a></li>
                                        <li>Your welcome letter</li>
                                        <li>Student ID or enrolment letter, if you are a student</li>
                                    </ul>
                                    <br>You'll need to provide your ID for verification within 20 days of opening your
                                    account,
                                    or your account may automatically close. You can reapply at any CommBank branch.
                                </div>
                               <!-- end welcome-letter-step2 -->
                            </div>
                        </div>
                    </div>
                    <br/>
                    <!-- start portfolio-wrapper -->
                    <div class="p-grid-row portfolio-grid">
                        <div class="column" id="account-type-cell">
                            <div id="account-type-icon"></div>
                            <div id="account-type-wrapper">
                                <div class="portfolio-cell-label ng-binding"
                                     data-ng-bind-html="content.accountTypeLabel"
                                     aria-hidden="true">Account type
                                </div>
                                <div class="portfolio-cell-data">
                                    <span class="visually-hidden ng-binding">Account type</span>
                                    ${account.acName}
                                </div>
                            </div>
                        </div>
                        <div class="column" id="bsb-cell">
                            <div class="portfolio-cell-label ng-binding" data-ng-bind-html="content.bsbLabel"
                                 aria-hidden="true">SWIFT BIC
                            </div>
                            <div class="portfolio-cell-data">
                                <span class="visually-hidden ng-binding"
                                      data-ng-bind-html="content.bsbLabel">SWIFT BIC</span>
                                KOEXKRSE
                            </div>
                        </div>
                        <div class="column" id="account-no-cell">
                            <div class="portfolio-cell-label ng-binding" data-ng-bind-html="content.accountNumberLabel"
                                 aria-hidden="true">Account number
                            </div>
                            <div class="portfolio-cell-data">
                                <span class="visually-hidden ng-binding" data-ng-bind-html="content.accountNumberLabel">Account number</span>
                                ${account.acNo.substring(0, 3)}-${account.acNo.substring(3,9)}-${account.acNo.substring(9,14)}
                            </div>
                        </div>
                        <div class="column text-right" id="balance-cell">
                            <div class="portfolio-cell-label ng-binding" data-ng-bind-html="content.balanceLabel"
                                 aria-hidden="true">Balance
                            </div>
                            <div class="portfolio-cell-data">
                                <span class="visually-hidden ng-binding" data-ng-bind-html="content.balanceLabel">Balance</span>
                                $ ${account.balance}
                            </div>
                        </div>
                    </div>
                    <!-- end portfolio-wrapper-->


                    <div class="p-grid-row alert">
                        <i class="alert-icon info-icon" role="presentation" tabindex="{-1}" aria-hidden="true"></i>
                        <div class="alert-text ng-binding" id="portfolio-footer-alert"
                             data-ng-bind-html="content.portfolioFooterText | formatString:pageData.NetbankId">Your HANA
                            GLOBAL
                            client ID is ${member.id}. You will need this to log back into HANA GLOBAL.
                        </div>
                    </div>
                </div>
            </div>
            <!-- end ob-section-body -->
        </div>

    </div>
</div>
<footer>
</footer>
</div>

</body>

</html>
