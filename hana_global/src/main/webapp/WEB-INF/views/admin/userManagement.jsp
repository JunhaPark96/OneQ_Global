<%@ page import="com.kopo.hanaglobal.hana_global.web.entity.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원관리</title>

    <link href="./css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/profile.css" rel="stylesheet">
    <link href="./css/app-modern.min.css" rel="stylesheet">
    <script src="./js/main.js"></script>

    <link href="./css/bootstrap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css"/>
    <%--    차트 js--%>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-zoom@0.7.3"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js"></script>
    <%--    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.css">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.css">
<%--    DataTables --%>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

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
        /*#world-map-markers > div > svg > g{*/
        /*    transform: scale(0.5763475444023498) translate(118.3202837962236, 0);*/
        /*}*/
    </style>
</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area">
        <%@ include file="/WEB-INF/views/includes/mem_sidebar.jsp" %>
        <div class="main-body">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body" style="display: grid;
                    grid-template-areas: 'div-header div-header'
                    'div-left div-right'; margin-top: 0px; column-gap: 50px">
                        <div class="div-header" style="grid-area: div-header; grid-column: span 2">
                            <h4 class="header-title">국가별 회원 수</h4>
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
                                <h5 class="mb-1 mt-0 font-weight-normal">${entry.key}</h5>
                                <div class="progress-w-percent">
                                    <span class="progress-value font-weight-bold">${entry.value}k </span>
                                    <div class="progress progress-sm">
                                        <div class="progress-bar" role="progressbar" style="width: ${entry.value}%" aria-valuenow="${entry.value}"
                                             aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </c:forEach>
<%--                            <h5 class="mb-1 mt-0 font-weight-normal">New York</h5>--%>
<%--                            <div class="progress-w-percent">--%>
<%--                                <span class="progress-value font-weight-bold">72k </span>--%>
<%--                                <div class="progress progress-sm">--%>
<%--                                    <div class="progress-bar" role="progressbar" style="width: 72%;" aria-valuenow="72"--%>
<%--                                         aria-valuemin="0" aria-valuemax="100"></div>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <h5 class="mb-1 mt-0 font-weight-normal">San Francisco</h5>--%>
<%--                            <div class="progress-w-percent">--%>
<%--                                <span class="progress-value font-weight-bold">39k </span>--%>
<%--                                <div class="progress progress-sm">--%>
<%--                                    <div class="progress-bar" role="progressbar" style="width: 39%;" aria-valuenow="39"--%>
<%--                                         aria-valuemin="0" aria-valuemax="100"></div>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <h5 class="mb-1 mt-0 font-weight-normal">Sydney</h5>--%>
<%--                            <div class="progress-w-percent">--%>
<%--                                <span class="progress-value font-weight-bold">25k </span>--%>
<%--                                <div class="progress progress-sm">--%>
<%--                                    <div class="progress-bar" role="progressbar" style="width: 39%;" aria-valuenow="39"--%>
<%--                                         aria-valuemin="0" aria-valuemax="100"></div>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <h5 class="mb-1 mt-0 font-weight-normal">Singapore</h5>--%>
<%--                            <div class="progress-w-percent mb-0">--%>

<%--                                <span class="progress-value font-weight-bold">61k </span>--%>
<%--                                <div class="progress progress-sm">--%>
<%--                                    <div class="progress-bar" role="progressbar" style="width: 61%;" aria-valuenow="61"--%>
<%--                                         aria-valuemin="0" aria-valuemax="100"></div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                        </div>
                        <div class="div-right" style="display: grid; grid-area: div-right; ">
                            <div class="mb-4 mt-4">
                                <div id="world-map-markers" style="height: 254px; "></div>
                            </div>
                        </div>

                    </div> <!-- end card-body-->
                </div> <!-- end card-->
            </div> <!-- end col-->


            <div class="user-info">
                <h2>회원관리</h2>
                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th>선택</th>
                        <th>아이디</th>
                        <th>성명</th>
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
                                <td><input type="radio" name="selectedMember" value="${member.userSeq}"></td>
                                <td>${member.id}</td>
                                <td>${member.name}</td>
                                <td>${firstAccountForMembers[member.userSeq].acNo}</td>
                                <td>${member.nationality}</td>
                                <td>${member.signupDate}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${member.status == 'N'}">
                                            <button class="btn btn-warning"
                                                    onclick="approveMember(${member.userSeq}, this)">Pending
                                            </button>
                                        </c:when>
                                        <c:when test="${member.status == 'Y'}">
                                            <button class="btn btn-success" disabled>Complete</button>
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
        <!-- end row -->


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

    function approveMember(userSeq, btnElement) {
        let isApproved = confirm("회원의 계좌를 활성화 하시겠습니까?");
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
    document.getElementById('statusHeader').addEventListener('click', function() {
        let currentDirection = this.getAttribute("data-direction");
        if (currentDirection === "asc") {
            this.setAttribute("data-direction", "desc");
            this.classList.remove("ascending");
            this.classList.add("descending");
            sortTable(6, "desc");
        } else {
            this.setAttribute("data-direction", "asc");
            this.classList.remove("descending");
            this.classList.add("ascending");
            sortTable(6, "asc");
        }
    });

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

</body>
</html>
