<%@ page import="com.kopo.hanaglobal.hana_global.web.entity.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원관리</title>

    <link href="./css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
    <link href="./css/headerAdmin.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/profile.css" rel="stylesheet">
    <link href="./css/app-modern.min.css" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <%--    <link href="./css/bootstrap/bootstrap.min.css" rel="stylesheet"/>--%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
            crossorigin="anonymous"></script>

    <script src="./js/main.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link href="./css/bootstrap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css"/>
    <%--    차트 js--%>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-zoom@0.7.3"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js"></script>
    <%--    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.css">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.css">
    <%--   data tables--%>
    <style>
        #world-map-markers > div > svg {
            width: 600px;
        }

        .sort-header {
            cursor: pointer; /* 마우스를 가져다 대면 손가락 모양으로 바뀝니다. */
        }

        .sort-header:after {
            content: "⇅"; /* 화살표 아이콘 */
            padding-left: 5px; /* 아이콘과 텍스트 사이에 간격을 줍니다. */
            font-size: 0.8em; /* 아이콘 크기 조절 */
        }

        .sort-header.ascending:after {
            content: "↑";
        }

        .sort-header.descending:after {
            content: "↓";
        }

        p {
            margin-bottom: 0px;
        }
    </style>
</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/admin/headerAdmin.jsp" %>
    <div class="main-area">
        <%@ include file="/WEB-INF/views/admin/sidebarAdmin.jsp" %>
        <div class="main-body">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body" style="display: grid;
                    grid-template-areas: 'div-header div-header'
                    'div-left div-right'; margin-top: 0px; column-gap: 50px">
                        <div class="div-header" style="grid-area: div-header; grid-column: span 2">
                            <h4 class="header-title" style="margin-bottom: 0px; margin-top: 0px;">국가별 회원 수</h4>
                            <div class="dropdown float-right">
                                <a href="#" class="dropdown-toggle arrow-none card-drop" data-toggle="dropdown"
                                   aria-expanded="false">
                                    <i class="mdi mdi-dots-vertical"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item">Sales Report</a>
                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item">Export Report</a>
                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item">Profit</a>
                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item">Action</a>
                                </div>
                            </div>
                        </div>
                        <div class="div-left" style="display: grid; grid-area: div-left;">
                            <c:forEach var="entry" items="${countryMemberCounts}">
                                <h6 class="mb-1 mt-0 font-weight-normal">${entry.key}</h6>
                                <div class="progress-w-percent">
                                    <span class="progress-value font-weight-bold">${entry.value}k </span>
                                    <div class="progress progress-sm">
                                        <div class="progress-bar" role="progressbar" style="width: ${entry.value}%"
                                             aria-valuenow="${entry.value}"
                                             aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                        <div class="div-right" style="display: grid; grid-area: div-right; ">
                            <div class="mb-4 mt-4">
                                <div id="world-map-markers" style="height: 254px; "></div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


            <div class="user-info">
                <h2>회원 관리</h2>
                <div class="col-12 d-flex p-0"
                     style="background-color: #eceff1; border-radius: 10px 10px 0px 0px">
                    <button id="whole_history" type="button"
                            class="col-6 text-center border-0 pt-3 pb-3 fs-5 bg-hanagreen"
                            style="font-family: hanaM; color: #ffffff; border-radius: 10px 0px 0px 0px"
                            onclick="click_whole_history()">
                        임시계좌승인
                    </button>
                    <button id="exchange_hist" type="button"
                            class="col-6 text-center border-0 pt-3 pb-3 fs-5"
                            style="font-family: hanaM; color: #8d8d8d; border-radius: 0px 10px 0px 0px"
                            onclick="click_exchange_hist()">
                        임시계좌철회
                    </button>
                </div>
                <div class="col-12 bg-white mt-0 " id="div_whole_history"
                     style="min-height: 350px; border-radius: 0px 0px 10px 10px; padding-left: 0px; padding-right: 0px;">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr style="text-align: center">
                            <th>선택</th>
                            <th>회원 ID</th>
                            <th>이름</th>
                            <th>계좌번호</th>
                            <th>국가</th>
                            <th>신청일</th>
                            <%--                        <th>승인상태</th>--%>
                            <th id="statusHeader" class="sort-header">승인상태</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="member" items="${memberList}">
                            <c:if test="${member.id != 'admin'}">

                                <tr>
                                    <td style="text-align: center"><input type="radio" name="selectedMember"
                                                                          value="${member.userSeq}"></td>
                                    <td>${member.id}</td>
                                    <td>${member.name}</td>
                                    <td>
                                            ${fn:substring(firstAccountForMembers[member.userSeq].acNo, 0, 3)}-${fn:substring(firstAccountForMembers[member.userSeq].acNo, 3, 8)}-${fn:substring(firstAccountForMembers[member.userSeq].acNo, 8, 14)}
                                    </td>
                                    <td>${member.nationality}</td>
                                        <%--                                <td>${member.signupDate}</td>--%>
                                    <td>${fn:substring(member.signupDate, 0, 4)}${fn:substring(member.signupDate, 4, 7)}${fn:substring(member.signupDate, 7, 10)}</td>

                                        <%--                                <td><fmt:formatDate value="${member.signupDate}" pattern="yyyy-MM-dd" /></td>--%>

                                    <td style="text-align: center">
                                        <c:choose>
                                            <c:when test="${member.status == 'N'}">
                                                <button class="btn btn-warning"
                                                        onclick="approveMember(${member.userSeq}, this)">대기
                                                </button>
                                            </c:when>
                                            <c:when test="${member.status == 'Y'}">
                                                <button class="btn btn-success" disabled>승인완료</button>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="col-12 bg-white mt-0 d-none" id="div_exchange_hist"
                     style="min-height: 350px; border-radius: 0px 0px 10px 10px; padding-right: 0px; padding-left: 0px;">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr style="text-align: center">
                            <th>선택</th>
                            <th>계좌생성날짜</th>
                            <th>계좌번호</th>
                            <th>계좌타입</th>
                            <th>잔액(원)</th>
                            <th id="requestStatusHeader" class="sort-header">처리요청상태</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="account" items="${accountList}">
                            <c:if test="${account.status != 1}">
                                <tr>
                                    <td style="text-align: center"><input type="radio" name="selectedAccount"
                                                                          value="${account.userSeq}"></td>
                                    <td>${fn:substring(account.openDate, 0, 4)}${fn:substring(account.openDate, 4, 7)}${fn:substring(account.openDate, 7, 10)}</td>
                                    <td>${fn:substring(account.acNo, 0, 3)}-${fn:substring(account.acNo, 3, 8)}-${fn:substring(account.acNo, 8, 14)}</td>
                                    <td>${account.acName}</td>
                                    <td><fmt:formatNumber value="${account.balance}" type="number" pattern="#,##0"/></td>
                                    <td style="text-align: center">
                                        <c:choose>
                                            <c:when test="${account.status == 0}">
                                                <button class="btn btn-warning" onclick="showRefundModal()">승인 대기</button>
                                            </c:when>
                                            <c:when test="${account.status == 2}">
                                                <button class="btn btn-success" onclick="approveClosure(${account.userSeq}, this)">승인 완료</button>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- end row -->

        <div class="modal fade" id="refundModal" style="--bs-modal-width: 700px;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" style="font-size: 22px;">환불 요청 승인</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body" style="padding: 0px;">
                        <div class="col-md-12">
                            <div class="card-body pe-3 ps-3">
                                <table class="table" style="background-color: #f4f3ef;">
                                    <tbody style="border-style: none">
                                    <!-- 신청자 정보 -->
                                    <tr class="" style="background-color: #f4f3ef;">
                                        <th colspan="2">
                                            <div class="fs-5" style="color: #000000">신청 정보 <strong style="color: #bdbdbd"></strong></div>
                                        </th>
                                    </tr>
                                    <tr class="">
                                        <th scope="row" class="text-start align-middle">&nbsp;&nbsp;이름</th>
                                        <td>
                                            <p id="applicantNameCheck">Sam Smith</p>
                                        </td>
                                    </tr>
                                    <tr class="">
                                        <th scope="row" class="text-start align-middle">&nbsp;&nbsp;이메일</th>
                                        <td class="align-middle">
                                            <p id="applicantEmailCheck">njk116@gmail.com</p>
                                        </td>
                                    </tr>
                                    <tr class="">
                                        <th scope="row" class="text-start align-middle">&nbsp;&nbsp;하나 계좌 번호</th>
                                        <td>
                                            <p id="applicantAccount">477-38836-521864</p>
                                        </td>
                                    </tr>
                                    <tr class="">
                                        <th scope="row" class="text-start align-middle">&nbsp;&nbsp;입금 계좌 번호</th>
                                        <td>
                                            <p id="applicantAccountCheck">128-709338-84148</p>
                                        </td>
                                    </tr>
                                    <tr class="">
                                        <th scope="row" class="text-start align-middle">&nbsp;&nbsp;신청 금액</th>
                                        <td class="text-start align-middle">
                                            <p style="margin-bottom: 0px;" id="applicationAmount">5,000,000원</p>
                                        </td>
                                    </tr>
                                    <tr class="">
                                        <th scope="row" class="text-start align-middle">&nbsp;&nbsp;신청일</th>
                                        <td class="text-start align-middle">
                                            <p style="margin-bottom: 0px;" id="applicationDate">2023-10-15</p>
                                        </td>
                                    </tr>
                                    <!-- 입금 정보 -->
                                    <tr class="">
                                        <th colspan="2">
                                            <div class="fs-5" style="color: #000000">예상 환불 금액 <strong style="color: #bdbdbd"></strong></div>
                                        </th>
                                    </tr>
                                    <tr class="">
                                        <th scope="row" class="text-start align-middle">&nbsp;&nbsp;신청 금액</th>
                                        <td class="text-start align-middle">
                                            <p style="margin-bottom: 0px;" id="applicationAmountCheck">5,000,000원</p>
                                        </td>
                                    </tr>
                                    <tr class="">
                                        <th scope="row" class="text-start align-middle">&nbsp;&nbsp;환불 수수료</th>
                                        <td class="text-start align-middle">
                                            <p style="margin-bottom: 0px;" id="refundFee">5,000원</p>
                                        </td>
                                    </tr>
                                    <tr class="">
                                        <th scope="row" class="text-start align-middle">&nbsp;&nbsp;최종 입금 금액</th>
                                        <td class="text-start align-middle">
                                            <p style="margin-bottom: 0px;" id="depositAmount">4,995,000원</p>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer" style="width: 100%; justify-content: center">
                        <button type="button" class="btn btn-primary" onclick="approveRefund()">승인</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- partial -->

    </div>
</div>


<footer>
</footer>

<!-- bundle -->
<script src="./js/vendor/vendor.min.js"></script>
<script src="./js/vendor/app.min.js"></script>

<!-- third party js -->
<script src="./js/vendor/apexcharts.min.js"></script>
<script src="./js/vendor/jquery-jvectormap-1.2.2.min.js"></script>
<script src="./js/vendor/jquery-jvectormap-world-mill-en.js"></script>
<!-- third party js ends -->

<!-- demo app -->
<script src="./js/vendor/demo.dashboard.js"></script>
<!-- end demo js-->
</div>
<script>
    window.onload = function () {
        ajax_whole_history();
        ajax_exchange_hist();
        // ajax_remittance_hist();
    }

    const whole_history = document.getElementById('whole_history');
    const exchange_hist = document.getElementById('exchange_hist');
    // const remittance_hist = document.getElementById('remittance_hist');

    const div_whole_history = document.getElementById('div_whole_history');
    const div_exchange_hist = document.getElementById('div_exchange_hist');
    // const div_remittance_hist = document.getElementById('div_remittance_hist');

    // 전체내역 클릭 색 변경
    function click_whole_history() {
        whole_history.classList.add('bg-hanagreen')
        exchange_hist.classList.remove('bg-hanagreen');
        // remittance_hist.classList.remove('bg-hanagreen');
        whole_history.style.color = '#ffffff'
        exchange_hist.style.color = '#8d8d8d'
        // remittance_hist.style.color = '#8d8d8d'
        div_whole_history.classList.remove('d-none');
        div_exchange_hist.classList.add('d-none');
        // div_remittance_hist.classList.add('d-none');
    }

    // 환전내역 클릭 색 변경
    function click_exchange_hist() {
        whole_history.classList.remove('bg-hanagreen')
        exchange_hist.classList.add('bg-hanagreen');
        // remittance_hist.classList.remove('bg-hanagreen');
        whole_history.style.color = '#8d8d8d'
        exchange_hist.style.color = '#ffffff'
        // remittance_hist.style.color = '#8d8d8d'
        div_whole_history.classList.add('d-none');
        div_exchange_hist.classList.remove('d-none');
        // div_remittance_hist.classList.add('d-none');
    }

    function showRefundModal() {
        $('#refundModal').modal('show');
    }

    function redirectToRefundDetail() {
        alert("환불 처리가 승인 되었습니다.");
        $('#refundModal').modal('hide');
    }
</script>
<script>

    function approveMember(userSeq, btnElement) {
        // let isApproved = confirm("Do you want to activate this member's account?");
        let isApproved = confirm("이 회원의 계정을 활성화하시겠습니까?");
        if (isApproved) {
            $.post("/approveMember", {userSeq: userSeq}, function (response) {
                if (response.success === "true") {
                    alert(response.message);
                    // 버튼 상태를 'Complete'로 변경
                    btnElement.textContent = "Complete";
                    btnElement.classList.remove("btn-warning");
                    btnElement.classList.add("btn-success");
                    btnElement.setAttribute("disabled", "disabled");
                } else {
                    alert(response.message);
                }
            });
        }
    }

    document.addEventListener("DOMContentLoaded", function(){
        document.getElementById('statusHeader').addEventListener('click', function () {
            sortTableWithDirectionToggle(this, 6);
        });

        document.getElementById('requestStatusHeader').addEventListener('click', function () {
            console.log('Request Status Header Clicked!');
            sortTableWithDirectionToggle(this, 5);
        });
    });

    function sortTableWithDirectionToggle(element, columnIndex) {
        let currentDirection = element.getAttribute("data-direction");
        if (currentDirection === "asc") {
            element.setAttribute("data-direction", "desc");
            element.classList.remove("ascending");
            element.classList.add("descending");
            sortTable(columnIndex, "desc");
        } else {
            element.setAttribute("data-direction", "asc");
            element.classList.remove("descending");
            element.classList.add("ascending");
            sortTable(columnIndex, "asc");
        }
    }


    function sortTable(n, dir) {
        let table, rows, switching, i, x, y, shouldSwitch;
        table = document.querySelector(".table");
        switching = true;

        while (switching) {
            switching = false;
            rows = table.rows;
            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;
                x = rows[i].getElementsByTagName("TD")[n];
                y = rows[i + 1].getElementsByTagName("TD")[n];
                if (dir == "asc") {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                } else if (dir == "desc") {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                }
            }
            if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
            }
        }
    }


</script>

<link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet">
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script>
    function approveRefund() {
        let accountNumber = $("#applicantAccount").text().trim();
        let email = $("#applicantEmailCheck").text().trim();
        let applicationAmount = $("#applicationAmount").text().trim();
        let applicationDate = $("#applicationDate").text().trim();
        let refundFee = $("#refundFee").text().trim();
        let depositAmount = $("#depositAmount").text().trim();
        console.log($("#applicantAccount").length); // 1 이면 요소가 존재, 0 이면 요소가 없음

        // '-' 문자를 제거
        let processedAccountNumber = accountNumber.replace(/-/g, '');
        console.log("계좌번호는 ", processedAccountNumber);
        let emailContent =
            '<html>' +
            '<head>' +
            '</head>' +
            '<body>' +
            '<div class="email-content">' +
            '<h1>Refund Approved</h1>' +
            '<p>Dear Customer,</p>' +
            '<p>We are pleased to inform you that your refund request, initially submitted on ' + applicationDate + ', has been approved.</p>' +
            '<p>Here are the details of your refund:</p>' +
            '<ul>' +
            '<li>Requested Amount: ' + applicationAmount + '</li>' +
            '<li>Refund Fee: ' + refundFee + '</li>' +
            '<li>Total Refund Amount: ' + depositAmount + '</li>' +
            '</ul>' +
            '<p>The refund will be processed shortly and will be deposited into the following account:</p>' +
            '<p>Account Number: ' + processedAccountNumber + '</p>' +
            '<p>Thank you for choosing us. We apologize for any inconvenience caused and appreciate your understanding.</p>' +
            '<p>Sincerely,<br>The Hana Global Team</p>' +
            '</div>' +
            '</body>' +
            '</html>';

        $.ajax({
            type: "POST",
            url: "/approveRefundAndSendEmail",
            contentType: "application/json",
            data: JSON.stringify({
                "accountNumber": processedAccountNumber, // 수정된 accountNumber 사용
                "email": email,
                "emailContent": emailContent,
                "emailSubject": "[Hana Global] Refund Approved"
            }),
            success: function(response) {
                alert("환불이 승인되고 이메일이 전송되었습니다.");
                location.reload();
            },
            error: function(xhr, status, error) {
                alert("환불 승인 및 이메일 전송에 실패하였습니다.");
            }
        });
    }

    $(document).ready(function () {
        $('.table').DataTable({
            searching: true, //검색 여부
            language: { //언어 설정
                searching: {
                  search: "검색"
                },
                paginate: {
                    previous: "이전",
                    next: "다음"
                },
                zeroRecords: "검색 결과가 없습니다.",
                info: "전체 거래내역 _TOTAL_개 중에서 _START_ 번부터 _END_ 번까지의 결과",
                lengthMenu: "_MENU_ 행까지 조회"
            }
            , columnDefs: [
                {
                    targets: -1,
                    className: 'dt-body-center'
                },

            ]

        });
    });
</script>

</body>
</html>
