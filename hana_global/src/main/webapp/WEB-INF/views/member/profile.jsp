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
    <link href="./css/bootstrap/paper-dashboard.css?v=2.0.1" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/profile.css" rel="stylesheet">
    <link href="./css/wallet/flags.css" rel="stylesheet">
    <script src="./js/main.js"></script>
    <link href="./css/member/completeAccount.css" rel="stylesheet"/>

</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area">
        <%@ include file="/WEB-INF/views/includes/mem_sidebar.jsp" %>
        <div class="main-body">
            <div class="main-wrapper">
                <div class="card card-user">
                    <div class="image">
                        <img src="./images/damir-bosnjak.jpg" alt="...">
                    </div>
                    <div></div>
                    <div class="card-body">
                        <div class="author">
                            <a href="#">
                                <img class="avatar border-gray" src="./images/person.png" style="margin-bottom: 0px">
                                <h5 class="title" style="margin-bottom: 5px">${currentMember.name}</h5>
                            </a>
                            <p class="description" style="margin-bottom: 0px">
                                <c:choose>
                                    <c:when test="${currentMember.status == 'N'}">Inactive</c:when>
                                    <c:when test="${currentMember.status == 'Y'}"><span
                                            style="color: #016f73">Active</span></c:when>
                                    <c:otherwise>상태 불명</c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                        <%--                            <p class="description text-center">--%>
                        <%--                                유저 이름, 이메일, 생년월일, 주소, 지점, 비자--%>
                        <%--                            </p>--%>
                    </div>
                    <%--                    <div class="card-footer">--%>
                    <%--                        <hr>--%>
                    <%--                        <div class="button-container">--%>
                    <%--                            <div class="row" style="justify-content: space-around">--%>
                    <%--                                <div class="col-lg-3 col-md-6 col-6 ml-auto">--%>
                    <%--                                    <h5>Email<br><small>${currentMember.email}</small></h5>--%>
                    <%--                                </div>--%>
                    <%--                                <div class="col-lg-4 col-md-6 col-6 ml-auto mr-auto">--%>
                    <%--                                    <h5>--%>
                    <%--                                        BirthDate<br><small>${currentMember.birthDate}</small>--%>
                    <%--                                    </h5>--%>
                    <%--                                </div>--%>
                    <%--                                &lt;%&ndash;                                    <div class="col-lg-3 col-md-6 col-6 mr-auto">&ndash;%&gt;--%>
                    <%--                                &lt;%&ndash;                                        <h5>Address<br><small>수원시 어쩌구 저쩌구 어쩌구</small></h5>&ndash;%&gt;--%>
                    <%--                                &lt;%&ndash;                                    </div>&ndash;%&gt;--%>
                    <%--                                <div class="col-lg-3 col-md-6 col-6 mr-auto">--%>
                    <%--                                    <h5>Branch<br><small>66 EULJI-RO JUNG-GU SEOUL</small></h5>--%>
                    <%--                                </div>--%>
                    <%--                                <div class="col-lg-3 col-md-6 col-6 mr-auto">--%>
                    <%--                                    <h5>VISA<br><small>E-2</small></h5>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <div class="card-footer">
                        <hr>
                        <div class="button-container" style="text-align: start">
                            <%--                            <div class="row">--%>
                            <!-- Email -->
                            <div class="row">
                                <div class="col-4">
                                    <h6>Email</h6>
                                </div>
                                <div class="col-8">
                                    <h6>${currentMember.email}</h6>
                                </div>
                            </div>

                            <!-- BirthDate -->
                            <div class="row">
                                <div class="col-4">
                                    <h6>BirthDate</h6>
                                </div>
                                <div class="col-8">
                                    <h6>${currentMember.birthDate}</h6>
                                </div>
                            </div>

                            <!-- Branch -->
                            <div class="row">
                                <div class="col-4">
                                    <h6>Branch</h6>
                                </div>
                                <div class="col-8">
                                    <h6>66 EULJI-RO JUNG-GU SEOUL</h6>
                                </div>
                            </div>
                            <%--                            VISA--%>
                            <div class="row">
                                <div class="col-4">
                                    <h6>VISA</h6>
                                </div>
                                <div class="col-8">
                                    <h6>E-2</h6>
                                </div>
                            </div>
                        </div>

                        <%--                        </div>--%>
                    </div>

                </div>

                <div class="main-info">
                    <div class="row justify-content-start">
                        <div class="col-md-4 gradient-custom text-center text-black">
                        </div>
                        <div class="col-md-10 ">
                            <div class="card-body pe-5">
                                <div class="row">
                                    <div class="col-12">
                                        <h5>Linked Account</h5>
                                        <h6>Hana Bank</h6>
                                    </div>
                                    <div class="account-image">
                                        <div class="myAccount"></div>
                                    </div>
                                </div>
                                <hr class="mt-0 mb-3">
                                <div class="col-grid">
                                    <div class="grid-left">
                                        <div class="row">
                                            <div class="text-start">Depositor name
                                                <h6> ${currentMember.name}</h6>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="text-start">Account Number
                                                <h6> ${account.acNo.substring(0, 3)}-${account.acNo.substring(3,9)}-${account.acNo.substring(9,14)}</h6>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col grid-right">
                                        <div class="row">
                                            <div class="text-start">Account Type
                                                <h6> ${account.acName}</h6>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="text-start">Account Balance
                                                <h6><fmt:formatNumber value="${account.balance}" type="number"
                                                                      pattern="#,##0"/> won</h6>

                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="modify-wrapper">
                                <div class="locRight">
                                    Modify
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <c:if test="${currentMember.status == 'Y'}">
                    <div class="exchange-info">
                        <div class="title-text">
                            Waiting List for Automatic Exchange Reservations<br/><br/>
                        </div>
                        <div class="card-wrapper">
                            <c:forEach items="${autoExchangeList}" var="autoWallet" varStatus="loop" begin="0">
                                <c:if test="${autoWallet.status == 'W'}">
                                    <div class="card card-stats" data-aeSeq="${autoWallet.aeSeq}">
                                        <div class="card-header" style="overflow: hidden;">
                                            <div style="float: left;">
                                                <h6>Automatic Exchange at Target Rate</h6>
                                            </div>
                                            <div style="float: right;">
                                                <button onclick="deleteReservation(${autoWallet.aeSeq})"
                                                        style="border: none; background: none;">
                                                    <img src="./images/recycle-bin.png" style="width: 20px">
                                                </button>
                                            </div>
                                        </div>
                                        <div class="card-body" style="margin-top: 0px">
                                            <div class="row" style="margin-right: 0px">
                                                <div class="col-7">
                                                    <div class="icon-big text-start icon-warning"
                                                         style="line-height: 20px">
                                                        <i class=""></i>
                                                        If it drops below ${autoWallet.lowerBound} Won <br/>
                                                        Recharge <span
                                                            style="color: #51cbce; font-weight: 700"> ${autoWallet.targetCurCode} ${autoWallet.exchangeAmount} </span>
                                                    </div>
                                                </div>
                                                <div class="col-7 col-md-5">
                                                    <div class="numbers mt-3">
                                                        <p class="card-category">Currency</p>
                                                        <p class="card-title walletCell"
                                                           data-currency="${autoWallet.targetCurCode}">
                                                                ${autoWallet.targetCurCode}
                                                        <p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer ">
                                            <hr>
                                            <div class="stats">
                                                <i class="fa fa-calendar-o"></i>
                                                End Date ${autoWallet.exchangeDate} <a
                                                    href="${pageContext.request.contextPath}/walletInfo"
                                                    style="font-weight: bold; padding-left: 120px"> modify </a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>

                </c:if>
<%--                <c:if test="${currentMember.status == 'N'}">--%>
<%--                    <div style="grid-column: span 2">--%>
<%--                        <!-- start ob-section-banner -->--%>
<%--                        <div class="ob-section unselectable" id="ob-section-banner"--%>
<%--                             back-img="https://static.my.commbank.com.au/static/cmxAssets/MigrantOrigination/migrant-confirmation-bp5.jpg">--%>
<%--                            &nbsp;--%>
<%--                        </div>--%>
<%--                        <!-- end ob-section-banner -->--%>
<%--                        <!-- start ob-section-header -->--%>
<%--                        <div class="ob-section unselectable" id="ob-section-header" unselectable="on">--%>
<%--                            <div class="p-grid">--%>
<%--                                <div class="p-grid-row">--%>
<%--                                    <div class="p-1">--%>
<%--                                        <p id="last-logon">--%>
<%--                                <span data-ng-bind-html="pageData.FirstTimeLogon ? '' : (content.salutationText | formatString:pageData.FirstName)"--%>
<%--                                      class="ng-binding"></span>--%>
<%--                                            <span></span>--%>
<%--                                        </p>--%>
<%--                                        <div data-ng-bind-html="content.welcomeText" class="welcome-text ng-binding"--%>
<%--                                             id="welcome-text" test-and-target="" tat-campaign-code="CB-EO-SA-MIG-PAGE2-COPY"--%>
<%--                                             tat-product-code-name="productCode"><h3>Thanks for choosing to bank with us. We've--%>
<%--                                            created your Everyday Smart Access Account. Here are your next steps</h3></div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <!-- end ob-section-header -->--%>
<%--                        <br/>--%>
<%--                        <!-- start ob-section-body -->--%>
<%--                        <div class="ob-section" id="ob-section-body">--%>
<%--                            <div class="p-grid">--%>
<%--                                <div class="p-grid-row" id="welcome-letter-wrapper"--%>
<%--                                     style="display: grid; grid-template-columns: 1fr 1fr;">--%>
<%--                                    <div class="p-1-2 bp3-1">--%>
<%--                                        <!-- start welcome-letter-step1 -->--%>
<%--                                        <div class="welcome-letter-step" id="welcome-letter-step1">--%>
<%--                                            <div data-ng-bind-html="content.beforeArrivalBody | formatString:pageData.NetbankId"--%>
<%--                                                 id="welcome-info" test-and-target="" tat-campaign-code="CB-EO-SA-MIG-PAGE2-COPY2"--%>
<%--                                                 tat-product-code-name="productCode" class="ng-binding"><h5>Please read and print--%>
<%--                                                your welcome letter</h5>--%>
<%--                                                <div class="subtitle"></div>--%>
<%--                                                <p>It has all your account details and the information you need to get your account--%>
<%--                                                    up and running or to <a--%>
<%--                                                            href="https://www.commbank.com.au/moving-to-australia/international-banking-team.html"--%>
<%--                                                            target="_blank">contact us</a>.</p>--%>
<%--                                                <br>--%>
<%--                                                Make sure you keep a record of your new account details if you don’t have a printer.--%>
<%--                                                You’ll be able to use your account after you complete step 2.--%>
<%--                                            </div>--%>

<%--                                            <div class="row-spacer"></div>--%>

<%--                                            <a href="#" id="ctl00_BodyPlaceHolder_readAndPrintButton"--%>
<%--                                               class="button secondary ng-binding" data-popup="" data-popup-width="1140"--%>
<%--                                               data-popup-height="800" data-popup-title="Welcome"--%>
<%--                                               data-ng-bind-html="content.readAndPrintButtonText"--%>
<%--                                               data-ng-popup-window="/netbank/EO.Onboarding/Migrants/WelcomeLetter.aspx?RID=krHO7GDP9E62KDv7XqyVeA&amp;SID=dOYJMccDHBo%3d"--%>
<%--                                               target="Welcome">--%>
<%--                                                    &lt;%&ndash;                                    Read and print&ndash;%&gt;--%>
<%--                                            </a>--%>
<%--                                        </div>--%>
<%--                                        <!-- end welcome-letter-step1 -->--%>
<%--                                    </div>--%>

<%--                                    <div class="p-1-2 bp3-1" style="border-left: 4px solid #b1aeae; padding-left: 20px;">--%>
<%--                                        <!-- start welcome-letter-step2 -->--%>
<%--                                        <div class="welcome-letter-step" id="welcome-letter-step2">--%>
<%--                                            <div data-ng-bind-html="content.arrivalBody" id="arrival-info" class="ng-binding"><h5>--%>
<%--                                                When you--%>
<%--                                                arrive in Korea</h5> <!-- 나라 이름 변경 -->--%>
<%--                                                <div class="subtitle">Visit your chosen branch to identify yourself for full access--%>
<%--                                                    to your--%>
<%--                                                    account.<br><br>Please bring the following documents and information with you:--%>
<%--                                                </div>--%>
<%--                                                <ul>--%>
<%--                                                    <li>Passport (original document required)</li>--%>
<%--                                                    <li>Tax residency details</li>--%>
<%--                                                    <li>Your welcome letter</li>--%>
<%--                                                    <li>Student ID or enrollment letter, if you are a student</li>--%>
<%--                                                </ul>--%>
<%--                                                <br>You'll need to provide your ID for verification within 20 days of opening your--%>
<%--                                                account,--%>
<%--                                                or your account may automatically close. You can reapply at any CommBank branch.--%>
<%--                                            </div>--%>
<%--                                        </div> <!-- end welcome-letter-step2 -->--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <br/>--%>
<%--                            <!-- start portfolio-wrapper -->--%>
<%--                            <div class="p-grid-row portfolio-grid">--%>
<%--                                <div class="column" id="account-type-cell">--%>
<%--                                    <div id="account-type-icon"></div>--%>
<%--                                    <div id="account-type-wrapper">--%>
<%--                                        <div class="portfolio-cell-label ng-binding"--%>
<%--                                             data-ng-bind-html="content.accountTypeLabel"--%>
<%--                                             aria-hidden="true">Account type--%>
<%--                                        </div>--%>
<%--                                        <div class="portfolio-cell-data">--%>
<%--                                            <span class="visually-hidden ng-binding">Account type</span>--%>
<%--                                                ${account.acName}--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="column" id="bsb-cell">--%>
<%--                                    <div class="portfolio-cell-label ng-binding" data-ng-bind-html="content.bsbLabel"--%>
<%--                                         aria-hidden="true">SWIFT BIC--%>
<%--                                    </div>--%>
<%--                                    <div class="portfolio-cell-data">--%>
<%--                                <span class="visually-hidden ng-binding"--%>
<%--                                      data-ng-bind-html="content.bsbLabel">SWIFT BIC</span>--%>
<%--                                        KOEXKRSE--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="column" id="account-no-cell">--%>
<%--                                    <div class="portfolio-cell-label ng-binding" data-ng-bind-html="content.accountNumberLabel"--%>
<%--                                         aria-hidden="true">Account number--%>
<%--                                    </div>--%>
<%--                                    <div class="portfolio-cell-data">--%>
<%--                                        <span class="visually-hidden ng-binding" data-ng-bind-html="content.accountNumberLabel">Account number</span>--%>
<%--                                            ${account.acNo.substring(0, 3)}-${account.acNo.substring(3,9)}-${account.acNo.substring(9,14)}--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="column text-right" id="balance-cell">--%>
<%--                                    <div class="portfolio-cell-label ng-binding" data-ng-bind-html="content.balanceLabel"--%>
<%--                                         aria-hidden="true">Balance--%>
<%--                                    </div>--%>
<%--                                    <div class="portfolio-cell-data">--%>
<%--                                        <span class="visually-hidden ng-binding" data-ng-bind-html="content.balanceLabel">Balance</span>--%>
<%--                                        <fmt:formatNumber value="${account.balance}" type="number" pattern="#,##0"/> Won--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <!-- end portfolio-wrapper-->--%>
<%--                            <div class="p-grid-row alert" style="border-radius: 2rem; border: 1px solid black; box-shadow: #018085; background-color: whitesmoke;">--%>
<%--                                <i class="alert-icon info-icon" role="presentation" tabindex="{-1}" aria-hidden="true"></i>--%>
<%--                                <div class="alert-text ng-binding"  style="color: black; line-height: 25px; ">--%>
<%--                                    In case you are unable to enter Korea, please <a href="${pageContext.request.contextPath}/refund" style="text-decoration: underline">apply for a refund</a>. <br/>Fees for currency exchange and remittance will be applied for refunds.--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="p-grid-row alert">--%>
<%--                                <i class="alert-icon info-icon" role="presentation" tabindex="{-1}" aria-hidden="true"></i>--%>
<%--                                <div class="alert-text ng-binding" id="portfolio-footer-alert" style="color: black">Your HANA--%>
<%--                                    GLOBAL--%>
<%--                                    client ID is  <span style="font-weight:bold; text-decoration:underline;">${currentMember.id}</span>. You will need this to log back into HANA GLOBAL.--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </c:if>--%>
            </div>
        </div>

    </div>
</div>
<footer>
</footer>
</div>

<script>
    function deleteReservation(aeSeq) {
        $.ajax({
            type: "POST",
            url: "removeAutoExchange",
            data: {
                aeSeq: aeSeq
            },
            success: function (response) {
                if (response.success) {
                    // 화면에서 해당 카드를 제거
                    $(`[data-aeSeq='${aeSeq}']`).remove();
                    alert("Delete Complete");
                    location.reload();
                } else {
                    // 에러 메시지를 표시
                    alert(response.message);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                // 서버와의 통신에 실패한 경우 에러를 표시
                alert("Error deleting the reservation.");
            }
        });
    }

</script>

</body>
</html>
