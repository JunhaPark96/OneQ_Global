<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>--%>
<%--    <link href="./css/bootstrap/bootstrap.min.css" rel="stylesheet"/>--%>

    <!-- CSS Files -->
    <link href="./css/bootstrap/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="./css/bootstrap/demo.css" rel="stylesheet" />
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/mem_sidebar.css" rel="stylesheet"/>
    <title>myPage sidebar</title>
</head>
<body>
<div class="sidebar" data-color="white" data-active-color="danger">
    <div class="logo">
        <a href="https://www.creative-tim.com" class="simple-text logo-mini">
            <div class="logo-image-small">
                <img src="./images/mascort.png">
            </div>
            <!-- <p>CT</p> -->
        </a>
        <a href="https://www.creative-tim.com" class="simple-text logo-normal">
            <c:choose>
                <c:when test="${currentMember.name == 'ADMIN'}">
                    ADMIN
                </c:when>
                <c:otherwise>
                    ${currentMember.name}
                </c:otherwise>
            </c:choose>
        </a>

    </div>
    <div class="sidebar-wrapper">
        <ul class="nav">
            <li class="active ">
                <a href="${pageContext.request.contextPath}/profile">
                    <i class="nc-icon nc-bank"></i>
                    <p>DashBoard</p>
                </a>
            </li>
            <li>
                <a href="./user.html">
                    <i class="nc-icon nc-single-02"></i>
                    <p>Edit Profile</p>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/profile">
                    <i class="nc-icon nc-diamond"></i>
                    <p>계좌연동</p>
                </a>
            </li>
            <li>
                <a href="./map.html">
                    <i class="nc-icon nc-pin-3"></i>
                    <p>자동환전</p>
                </a>
            </li>
            <li>
                <a href="./notifications.html">
                    <i class="nc-icon nc-bell-55"></i>
                    <p>송금예약</p>
                </a>
            </li>
        </ul>
    </div>
</div>


<%--<div class="navbarWrap">--%>
<%--    <div class="navbar">--%>
<%--        <ul>--%>
<%--            <li>--%>
<%--                <a href="/account" style="padding-left: 15px">Mypage</a>--%>
<%--                <ul>--%>
<%--                    <li><a href="${pageContext.request.contextPath}/accountInfo"> My Accounts</a></li>--%>
<%--                    <li><a href="${pageContext.request.contextPath}/accountDetail">Transaction Details</a></li>--%>
<%--                    <li><a href="${pageContext.request.contextPath}/accountTransfer">Account Transfer</a></li>--%>
<%--                </ul>--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="sidebar pb-3">--%>
<%--    <nav class="navbar navbar-dark" style="background-color: #f5f5f5">--%>
<%--        <div class="container-fluid justify-content-center mt-3 mb-4">--%>
<%--            <a href="account" class="navbar-brand">--%>
<%--                <h4 style="color: #008485"><i class="fa fa-user-edit"></i> OneQ Global</h4>--%>
<%--            </a>--%>
<%--        </div>--%>
<%--        <div class="d-flex container-fluid mb-4">--%>
<%--            <div class="bg-success rounded-circle border border-2 border-white p-1 ms-2"></div>--%>
<%--            <div class="ms-0">--%>
<%--                <h7 class="text-light">Welcome <strong style="font-family: hanaM">  </strong></h7>--%>
<%--                <br>--%>
<%--&lt;%&ndash;                <h8 class="text-light" id="mySessionTime">로그아웃 남은 시간 --:--</h8>&ndash;%&gt;--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="navbar-nav w-100">--%>
<%--            <div class="container-fluid ps-4 h-100 fs-6 mb-3">--%>
<%--                <strong>My Profile</strong>--%>
<%--            </div>--%>
<%--            <a href="/account" class="nav-item nav-link"><i--%>
<%--                    class="ms-3 fa-solid fa-money-check-dollar me-2 box"></i>Dashboard</a>--%>
<%--            <a href="/accountMember" class="nav-item nav-link"><i--%>
<%--                    class="ms-3 fa-solid fa-money-check-dollar me-2 box"></i>계좌연동</a>--%>
<%--            <a href="/transactionHistory" class="nav-item nav-link"><i--%>
<%--                    class="ms-3 fa-solid fa-money-check-dollar me-2 box"></i>자동환전</a>--%>
<%--            <a href="/accountMember" class="nav-item nav-link"><i--%>
<%--                    class="ms-3 fa-solid fa-money-check-dollar me-2 box"></i>송금예약</a>--%>
<%--        </div>--%>
<%--    </nav>--%>
<%--</div>--%>
</body>
</html>
