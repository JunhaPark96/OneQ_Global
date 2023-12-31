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
    <link href="./css/bootstrap/paper-dashboard.css?v=2.0.1" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/profile.css" rel="stylesheet">
    <link href="./css/wallet/flags.css" rel="stylesheet">
    <link href="./css/member/readyToApply.css" rel="stylesheet"/>
    <link href="./css/member/completeAccount.css" rel="stylesheet"/>
    <script src="./js/main.js"></script>
</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area" style="margin-left: 10%; margin-right: 10%;">
        <%@ include file="/WEB-INF/views/includes/mem_sidebar.jsp" %>
        <div>
            <div class="ob-section unselectable" id="ob-section-banner"
                 back-img="https://static.my.commbank.com.au/static/cmxAssets/MigrantOrigination/migrant-confirmation-bp5.jpg">
                &nbsp;
            </div>
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
                                 tat-product-code-name="productCode"><h3>Thanks for choosing to bank with us. We've
                                created your Everyday Smart Access Account. Here are your next steps</h3></div>
                        </div>
                    </div>
                </div>
            </div>
            <br/>
            <div class="ob-section" id="ob-section-body">
                <div class="p-grid">
                    <div class="p-grid-row" id="welcome-letter-wrapper"
                         style="display: grid; grid-template-columns: 1fr 1fr;">
                        <div class="p-1-2 bp3-1">
                            <div class="welcome-letter-step" id="welcome-letter-step1">
                                <div data-ng-bind-html="content.beforeArrivalBody | formatString:pageData.NetbankId"
                                     id="welcome-info" test-and-target="" tat-campaign-code="CB-EO-SA-MIG-PAGE2-COPY2"
                                     tat-product-code-name="productCode" class="ng-binding"><h5>Please read and print
                                    your welcome letter</h5>
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
                                   target="Welcome">
                                </a>
                            </div>
                        </div>

                        <div class="p-1-2 bp3-1" style="border-left: 4px solid #b1aeae; padding-left: 20px;">
                            <div class="welcome-letter-step" id="welcome-letter-step2">
                                <div data-ng-bind-html="content.arrivalBody" id="arrival-info" class="ng-binding"><h5>
                                    When you
                                    arrive in Korea</h5>
                                    <div class="subtitle">Visit your chosen branch to identify yourself for full access
                                        to your
                                        account.<br><br>Please bring the following documents and information with you:
                                    </div>
                                    <ul>
                                        <li>Passport (original document required)</li>
                                        <li>Tax residency details</li>
                                        <li>Your welcome letter</li>
                                        <li>Student ID or enrollment letter, if you are a student</li>
                                    </ul>
                                    <br>You'll need to provide your ID for verification within 20 days of opening your
                                    account,
                                    or your account may automatically close. You can reapply at any CommBank branch.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br/>
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
                            <fmt:formatNumber value="${account.balance}" type="number" pattern="#,##0"/> Won
                        </div>
                    </div>
                </div>
                <div class="p-grid-row alert" style="border-radius: 2rem; border: 1px solid black; box-shadow: #018085; background-color: whitesmoke;">
                    <i class="alert-icon info-icon" role="presentation" tabindex="{-1}" aria-hidden="true"></i>
                    <div class="alert-text ng-binding"  style="color: black; line-height: 25px; ">
                        In case you are unable to enter Korea, please <a href="${pageContext.request.contextPath}/getRefund" style="text-decoration: underline">apply for a Reimbursement</a>. <br/>Fees for currency exchange and remittance will be applied for refunds.
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
