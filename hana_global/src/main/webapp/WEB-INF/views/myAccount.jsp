<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kopo.hanaglobal.hana_global.web.vo.Account" %><%--
  Created by IntelliJ IDEA.
  User: JUNHA
  Date: 2023-08-19
  Time: 오후 3:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
            crossorigin="anonymous"></script>

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
            <%
                List<Account> accounts = new ArrayList<>();
                accounts.add(new Account("저축계좌", "1234-5678-9012", "2021-01-01", "1,000,000원"));
                accounts.add(new Account("주계좌", "2345-6789-0123", "2021-01-01", "1,000,000원"));
                accounts.add(new Account("대출계좌", "4125-5231-5161", "2021-01-01", "1,000,000원"));
                accounts.add(new Account("보험계좌", "1622-3141-1212", "2021-01-01", "1,000,000원"));
                // ... 계좌 정보 추가
            %>

            <!-- 슬라이드 페이지 -->
            <div id="carouselExample" class="carousel slide">
                <div class="carousel-inner">
                    <% for(int i = 0; i < accounts.size(); i++) {
                        Account account = accounts.get(i);
                        boolean isActive = (i == 0);
                    %>
                    <div class="carousel-item <%= isActive ? "active" : "" %>">
<%--                        계좌구역--%>
                        <div class="row justify-content-center">
<%--                            왼블럭--%>
                            <div class="col-md-4 gradient-custom text-center text-black">
                                <!-- TODO: 왼쪽 파트 -->
                                <img src="./images/myAccount.png"
                                     alt="Avatar" class="img-fluid my-5" style="width: 130px;" />
<%--                                <div class="myAccount"></div>--%>
                                <h5 style="font-size:20px;"> 고객님</h5>
                                <p>반갑습니다!</p>
                                <div class="circle">

                                </div>
                            </div>
<%--                            오른쪽 블럭--%>
                            <div class="col-md-8 ">
                                <div class="card-body pe-5">
                                    <h4>View Account Information</h4>
                                    <hr class="mt-0 mb-4">

                                    <div class="row pt-1">
                                        <div class="col-6">
                                            <h4>예금주명</h4>
                                            <p class="text-muted" style="font-size:22px">
                                                박준하
                                                ${account.getAccountName()} </p>
                                        </div>
                                        <div class="col-6">
                                            <h4>계좌종류</h4>
                                            <p class="text-muted" style="font-size:22px">
                                                주거래 통장
                                                ${account.getAccountType()}</p>
                                        </div>
                                    </div>

                                    <div class="row pt-1">
                                        <div class="col-12">
                                            <h4>계좌번호</h4>
                                            <p class="text-muted" style="font-size:22px">
                                                1111-2222-3333-4444
                                                ${account.getAccountNumber()}</p>
                                        </div>
                                        <div class="col-6">
                                            <h4>잔액</h4>
                                            <p class="text-muted" style="font-size:20px">
                                                10,000,000
                                                ${account.getBalance()}원</p>
                                        </div>
                                        <div class="col-6 form-check form-switch ps-0 ms-auto my-auto">
<%--                                            <input style="margin-top:-30px;margin-left: 30px !important;"--%>
<%--                                                   class="form-check-input ms-auto" type="checkbox" id="navbarFixed"--%>
<%--                                                   onclick="navbarFixed(this)" checked="checked">--%>
                                        </div>
                                    </div>

                                    <div class="row pt-1">
                                        <div class="col-6 mb-3">
                                            <h4>계좌개설날짜</h4>
                                            <p class="text-muted" style="font-size:22px">
                                                2023-05-12
                                                ${account.getOpenAccountDate()} </p>
                                        </div>
                                        <div class="col-6 mb-3">
                                            <h4>마지막 거래 날짜</h4>
                                            <p class="text-muted" style="font-size:22px">
                                                2023-08-19
                                                ${account.getLastTransactionDate()}</p>
                                        </div>
                                    </div>
                                    <hr>

                                    <section class="certContain">
                                        <div class="btnArea" id="btnFclArea">
                                            <a href="/account_details" id="btnCancel" class="btn_s">거래 내역</a>
                                            <a href="/account_transfer" id="btnNext" class="btn_p">계좌 이체</a>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } %>
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
