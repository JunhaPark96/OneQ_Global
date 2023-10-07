<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kopo.hanaglobal.hana_global.web.entity.Account" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link href="./css/service-main.css" rel="stylesheet"/>
    <link href="./css/nav.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/main-body.css" rel="stylesheet"/>
    <link href="./css/myAccount.css" rel="stylesheet"/>

    <title>내 계좌 확인</title>
</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area">
        <%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
        <div class="main-body">

            <!-- 슬라이드 페이지 -->
            <div id="carouselExample" class="carousel slide">
                <%--                <div class="carousel-inner">--%>
                <%--                    <c:forEach items="${memberAccDTO}" var="account" varStatus="loop" begin="0">--%>
                <%--                        <div class="carousel-item <c:if test="${loop.index == 0}">active</c:if>">--%>
                <%--                                &lt;%&ndash;                        계좌구역&ndash;%&gt;--%>
                <%--                            <div class="row justify-content-center">--%>
                <%--                                    &lt;%&ndash;                            왼블럭&ndash;%&gt;--%>
                <%--                                <div class="col-md-4 gradient-custom text-center text-black">--%>
                <%--                                    <!-- TODO: 왼쪽 파트 -->--%>
                <%--&lt;%&ndash;                                    <h5 style="font-size:20px;"> ${account.name} <br/>고객님</h5>&ndash;%&gt;--%>
                <%--&lt;%&ndash;                                    <p>반갑습니다!</p>&ndash;%&gt;--%>
                <%--                                </div>--%>
                <%--                                    &lt;%&ndash;                            오른쪽 블럭&ndash;%&gt;--%>
                <%--                                <div class="col-md-8 ">--%>
                <%--                                    <div class="card-body pe-5">--%>
                <%--                                        <h4>View Account Information</h4>--%>
                <%--                                        <hr class="mt-0 mb-4">--%>

                <%--                                        <div class="row pt-1">--%>
                <%--                                            <div class="col-6">--%>
                <%--                                                <h4>예금주명</h4>--%>
                <%--                                                <p class="text-muted" style="font-size:22px">--%>
                <%--                                                        ${account.name} </p>--%>
                <%--                                            </div>--%>
                <%--                                            <div class="col-6">--%>
                <%--                                                <h4>계좌종류</h4>--%>
                <%--                                                <p class="text-muted" style="font-size:22px">--%>
                <%--                                                        ${account.acName}</p>--%>
                <%--                                            </div>--%>
                <%--                                        </div>--%>

                <%--                                        <div class="row pt-1">--%>
                <%--                                            <div class="col-12">--%>
                <%--                                                <h4>계좌번호</h4>--%>
                <%--                                                <p class="text-muted" style="font-size:22px">--%>
                <%--                                                        ${account.acNo}</p>--%>
                <%--                                            </div>--%>
                <%--                                            <div class="col-6">--%>
                <%--                                                <h4>잔액</h4>--%>
                <%--                                                <p class="text-muted" style="font-size:20px">--%>
                <%--                                                        ${account.balance}원</p>--%>
                <%--                                            </div>--%>
                <%--                                            <div class="col-6 form-check form-switch ps-0 ms-auto my-auto">--%>
                <%--                                                    &lt;%&ndash;                                            <input style="margin-top:-30px;margin-left: 30px !important;"&ndash;%&gt;--%>
                <%--                                                    &lt;%&ndash;                                                   class="form-check-input ms-auto" type="checkbox" id="navbarFixed"&ndash;%&gt;--%>
                <%--                                                    &lt;%&ndash;                                                   onclick="navbarFixed(this)" checked="checked">&ndash;%&gt;--%>
                <%--                                            </div>--%>
                <%--                                        </div>--%>

                <%--                                        <div class="row pt-1">--%>
                <%--                                            <div class="col-6 mb-3">--%>
                <%--                                                <h4>계좌개설날짜</h4>--%>
                <%--                                                <p class="text-muted" style="font-size:22px">--%>
                <%--                                                        ${account.signupDate} </p>--%>
                <%--                                            </div>--%>
                <%--                                            <div class="col-6 mb-3">--%>
                <%--                                                <h4>마지막 거래 날짜</h4>--%>
                <%--                                                <p class="text-muted" style="font-size:22px">--%>
                <%--                                                    2023-08-19--%>
                <%--                                                        &lt;%&ndash;${account.getLastTransactionDate()}&ndash;%&gt;</p>--%>
                <%--                                            </div>--%>
                <%--                                        </div>--%>
                <%--                                        <hr>--%>

                <%--                                        <section class="certContain">--%>
                <%--                                            <div class="btnArea" id="btnFclArea">--%>
                <%--                                                <a href="/account_details" id="btnCancel" class="btn_s">거래 내역</a>--%>
                <%--                                                <a href="/account_transfer" id="btnNext" class="btn_p">계좌 이체</a>--%>
                <%--                                            </div>--%>
                <%--                                        </section>--%>
                <%--                                    </div>--%>
                <%--                                </div>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                    </c:forEach>--%>
                <%--                </div>--%>
                <div class="carousel-inner">
                    <c:forEach items="${memberAccDTO}" var="account" varStatus="loop" begin="0">
                        <div class="carousel-item <c:if test="${loop.index == 0}">active</c:if>">
                                <%--                        계좌구역--%>
                            <div class="row justify-content-center">
                                    <%--                            왼블럭--%>
                                <div class="col-md-4 gradient-custom text-center text-black">
                                    <!-- TODO: 왼쪽 파트 -->
                                        <%--                                    <h5 style="font-size:20px;"> ${account.name} <br/>고객님</h5>--%>
                                        <%--                                    <p>반갑습니다!</p>--%>
                                </div>
                                    <%--                            오른쪽 블럭--%>
                                <div class="col-md-8 ">
                                    <div class="card-body pe-5">
                                        <div class="row pt-1">
                                            <div class="col-6">
                                                <h4>View Account Information</h4>
                                            </div>
                                            <div class="col-6">
                                                <h5><string>Account Type</string> &nbsp;&nbsp;
                                                        <span class="text-bold">
                                                        ${account.acName}</span>
                                                </h5>

<%--                                                <p class="text-muted" style="font-size:22px">--%>
<%--                                                        ${account.acName}</p>--%>
                                            </div>
                                        </div>
                                        <hr class="mt-0 mb-3">
<%--                                        <div class="col pt-1 text-end ">--%>
<%--                                            <div class="col-6">--%>
<%--                                            </div>--%>
<%--                                            <div class="col-6 text-end">--%>
<%--                                                <h4 class="text-start">마지막 거래 날짜</h4>--%>
<%--                                                <p class="text-muted p-border" style="font-size:22px">--%>
<%--                                                    2023-08-19--%>
<%--                                                        &lt;%&ndash;${account.getLastTransactionDate()}&ndash;%&gt;</p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
                                        <div class="col-grid">
                                            <div class="grid-left">
                                                <div class="row pt-1" style="height: 50px">
                                                    <div class="col d-flex align-items-center">
                                                        <h3>Account Holder Name <br/>
                                                            <span class="text-bold"> ${account.name}</span>
                                                        </h3>
<%--                                                        <p class="text-muted" style="font-size:22px">--%>
<%--                                                                ${account.name}--%>
<%--                                                        </p>--%>
                                                    </div>
                                                </div>
                                                <div class="account-image">
                                                <div class="myAccount"></div>
                                                </div>

                                            </div>
                                        <div class="col pt-1 grid-right">
                                            <div class="col">
                                                <h4 class="test-start"> Account Opening Date</h4>
                                                <p class="text-muted text-end p-border" style="font-size:22px">
                                                        ${account.signupDate} </p>
                                            </div>
                                            <div class="col text-end">
                                                <h4 class="text-start">Last Transaction Date</h4>
                                                <p class="text-muted p-border" style="font-size:22px">
                                                    2023-08-19
                                                        <%--${account.getLastTransactionDate()}--%></p>
                                            </div>
                                            <div class="col text-end">
                                                <h4 class="text-start">Account Number</h4>
                                                <p class="text-muted p-border" style="font-size:22px">
                                                        ${account.acNo.substring(0, 3)}-${account.acNo.substring(3, 9)}-${account.acNo.substring(9, 14)}</p>
                                            </div>
                                            <div class="col">
                                                <h4 class="text-start">Balance</h4>
                                                <p class="text-muted text-end p-border" style="font-size:20px">
                                                    <fmt:formatNumber value="${account.balance}" type="number"
                                                                      pattern="#,##0"/> Won</p>
                                            </div>
                                            <div class="col-6 form-check form-switch ps-0 ms-auto my-auto">
                                                    <%--                                            <input style="margin-top:-30px;margin-left: 30px !important;"--%>
                                                    <%--                                                   class="form-check-input ms-auto" type="checkbox" id="navbarFixed"--%>
                                                    <%--                                                   onclick="navbarFixed(this)" checked="checked">--%>
                                            </div>
                                        </div>
                                    </div>
                                        <hr>

                                        <section class="certContain">
                                            <div class="btnArea" id="btnFclArea">
                                                <a href="/account_details" id="btnCancel" class="btn_s">History</a>
                                                <a href="/account_transfer" id="btnNext" class="btn_p">Transfer</a>
                                            </div>
                                        </section>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!-- 컨트롤 버튼 -->
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExample"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <!-- 슬라이드 페이지 끝 -->
        </div>
    </div>
    <footer>
    </footer>
</div>
</body>

</html>
