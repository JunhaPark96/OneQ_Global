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
    <link href="./css/member/readyToApply.css" rel="stylesheet"/>
    <link href="./css/member/completeAccount.css" rel="stylesheet"/>

    <script src="./js/main.js"></script>

    <style>
        .refund-info {
            background-color: #f2f2f2;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .refund-info-header {
            text-align: center;
            margin-bottom: 15px;
        }

        .refund-info-header h4 {
            font-size: 18px;
            color: #333;
        }

        .refund-info-content ul {
            list-style-type: disc;
            margin-left: 20px;
        }

        .refund-info-agreement label {
            display: block;
            font-weight: bold;
            margin-left: 25px;
        }

        .refund-info-agreement input[type="checkbox"] {
            margin-left: 10px;
        }
    </style>
</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area" style="margin-left: 10%; margin-right: 10%;">
        <!-- Include your sidebar here -->
        <%@ include file="/WEB-INF/views/includes/mem_sidebar.jsp" %>
        <div>
            <!-- Start ob-section-header -->
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
                                 tat-product-code-name="productCode">
                                <h3 style="margin-bottom: 0px;">Refund is in progress. Thank you for using our services.</h3>
                                <!-- Refund Information -->
                                <div class="refund-info">
                                    <div class="refund-info-header">
                                        <h4>Account Closure Notification</h4>
                                    </div>
                                    <div class="refund-info-content">
                                        <p>We would like to inform you that your account will be closed once the reimbursement process is successfully completed. Please read the following important information:</p>
                                        <ul>
                                            <li><strong>Account Closure:</strong> After the reimbursement is processed, your account will be closed automatically.</li>
                                            <li><strong>Balance:</strong> Ensure that your account balance is accurate before the closure.</li>
                                            <li><strong>Agreement:</strong> By proceeding, you agree to the account closure and confirm that you have received your refund.</li>
                                        </ul>
                                        <p>Please review the details carefully and confirm your agreement. If you have any questions or concerns, please don't hesitate to contact our customer support.</p>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End ob-section-header -->
            <br/>
            <!-- Start ob-section-body -->
            <div class="ob-section" id="ob-section-body">
                <div class="p-grid">
                    <div class="p-grid-row" id="welcome-letter-wrapper">
                        <div style="grid-column: span 2;">
                            <!-- Refund Table -->
                            <table id="refundTable" class="display" style="width: 100%; margin-top: 20px;">
                                <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Refund Account Number</th>
                                    <th>Refund Amount</th>
                                    <th>Recipient</th>
                                    <th>Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- Example rows (replace with actual data) -->
                                <tr>
                                    <td>2023-10-10</td>
                                    <td>1234-5678-9012</td>
                                    <td>5,000,000 Won</td>
                                    <td>HANA KIM</td>
                                    <td>In Progress</td>
                                </tr>
                                <!-- End of rows -->
                                </tbody>
                            </table>
                            <!-- End Refund Table -->
                        </div>
                    </div>
                </div>
                <br/>
                <!-- Start portfolio-wrapper -->
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
                <!-- End portfolio-wrapper-->
            </div>
            <!-- End ob-section-body -->
        </div>
    </div>
<footer>
</footer>
</div>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

<script>

    $(document).ready(function () {
        $('#refundTable').DataTable({
            "paging": false,
            "ordering": false,
            "searching": false

        });
    });
</script>

</body>
</html>
