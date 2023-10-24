<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="./css/bootstrap/paper-dashboard.css?v=2.0.1" rel="stylesheet"/>
    <link href="./css/bootstrap/demo.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/mem_sidebar.css" rel="stylesheet"/>
    <title>myPage sidebar</title>
    <style>
        a::before, a::after {
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="sidebar" data-color="white" data-active-color="danger">
    <div class="logo" style="display: flex; justify-content: space-around">
        <a href="" class="simple-text logo-normal">
            <c:choose>
                <c:when test="${currentMember.name == 'ADMIN'}">
                    ADMIN
                </c:when>
                <c:otherwise>
                    ${currentMember.name}
                </c:otherwise>
            </c:choose>
        </a>
        <div class="logo-image-small logo-mini">
            <img src="./images/mascort.png" style="width: 45px; height: 45px;">
        </div>

    </div>
    <div class="sidebar-wrapper">
        <ul class="nav">
            <li class="active ">
                <c:choose>
                    <c:when test="${currentMember.name != 'ADMIN'}">
                        <a href="${pageContext.request.contextPath}/profile">
                        <i class="nc-icon nc-bank"></i>
                        <p>DashBoard</p>
                        </a>
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>
            </li>
            <li>
                <c:choose>
                    <c:when test="${currentMember.name == 'ADMIN'}">
                        <a href="${pageContext.request.contextPath}/userManagement">
                            <i class="nc-icon nc-single-02"></i>
                            <p>회원 관리</p>
                        </a>
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>
            </li>
            <li>
                <c:choose>
                    <c:when test="${not currentMember.name == 'ADMIN'}">
                        <a href="${pageContext.request.contextPath}/profile">
                            <i class="nc-icon nc-diamond"></i>
                            <p>계좌연동</p>
                        </a>
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>
            </li>
            <li>
                <c:choose>
                    <c:when test="${currentMember.name != 'ADMIN'}">
                        <a href="${pageContext.request.contextPath}/branch">
                            <i class="nc-icon nc-pin-3"></i>
                            <p>Branch</p>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/branch">
                            <i class="nc-icon nc-pin-3"></i>
                            <p>지점</p>
                        </a>
                    </c:otherwise>
                </c:choose>
            </li>
            <li>
                <c:choose>
                    <c:when test="${currentMember.name != 'ADMIN'}">
                        <a href="${pageContext.request.contextPath}/refundAccount">
                            <i class="nc-icon nc-pin-3"></i>
                            <p>Reimbursement</p>
                        </a>
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>

            </li>
        </ul>
    </div>
    <div id="sidebarToggleButton"
         style="display: none; position: absolute; top: 50%; left: 12px; transform: translate(-100%, -50%);">
        <button class="btn btn-primary" style="padding-left: 5px; padding-right: 5px">☰</button>
    </div>
</div>

<script>
    $(document).ready(function () {

        // Sidebar toggle 동작
        let isSidebarVisible = true;
        function toggleSidebar() {
            if (isSidebarVisible) {
                $('.sidebar').animate({width: '0px'}, 400, function () {
                    $('.sidebar-wrapper').hide();
                    $('#sidebarToggleButton').show();
                });
                $('iframe[name="bizBranch"]').animate({width: '1100px'}, 400);
                $('iframe[name="bizBranch"]').animate({height: '800px'}, 400);
            } else {
                $('#sidebarToggleButton').hide();
                $('.sidebar-wrapper').show();
                $('.sidebar').animate({width: '250px'}, 400);
                $('iframe[name="bizBranch"]').animate({width: '900px'}, 400);
                $('iframe[name="bizBranch"]').animate({height: '600px'}, 400);
            }
            isSidebarVisible = !isSidebarVisible;
        }
        $('.logo').on('click', toggleSidebar);
        $('#sidebarToggleButton').on('click', toggleSidebar);

    });
    $(document).ready(function () {

        function setActiveFromLocalStorage() {
            let activeLinkIndex = localStorage.getItem('activeLinkIndex');
            if (activeLinkIndex !== null) {
                $(".nav li").removeClass('active');
                $(".nav li").eq(activeLinkIndex).addClass('active');
            }
        }

        // 페이지 로드 시 저장된 항목에 스타일 적용
        setActiveFromLocalStorage();

        // li 항목 클릭 시 스타일 변경 및 로컬 스토리지에 저장
        $(".nav li a").click(function (event) {
            console.log("Link clicked");
            event.preventDefault();
            $(".nav li").removeClass('active');
            $(this).parent().addClass('active');
            const index = $(".nav li a").index($(this));
            localStorage.setItem('activeLinkIndex', index);
            console.log(localStorage.getItem('activeLinkIndex'));
            window.location.href = $(this).attr('href');
        });
    });



</script>
</body>
</html>
