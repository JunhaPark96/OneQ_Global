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
    <title>Document</title>

    <link href="./css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
    <link href="./css/bootstrap/paper-dashboard.css?v=2.0.1" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/profile.css" rel="stylesheet">
    <link href="./css/wallet/flags.css" rel="stylesheet">
    <script src="./js/main.js"></script>
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
                                <img class="avatar border-gray" src="./images/mike.jpg" style="margin-bottom: 0px">
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
                    <div class="card-footer">
                        <hr>
                        <div class="button-container">
                            <div class="row" style="justify-content: space-around">
                                <div class="col-lg-3 col-md-6 col-6 ml-auto">
                                    <h5>Email<br><small>${currentMember.email}</small></h5>
                                </div>
                                <div class="col-lg-4 col-md-6 col-6 ml-auto mr-auto">
                                    <h5>
                                        BirthDate<br><small>19${fn:substring(currentMember.registNo, 0, 2)}-${fn:substring(currentMember.registNo, 2, 4)}-${fn:substring(currentMember.registNo, 4, 6)}</small>
                                    </h5>
                                </div>
                                <%--                                    <div class="col-lg-3 col-md-6 col-6 mr-auto">--%>
                                <%--                                        <h5>Address<br><small>수원시 어쩌구 저쩌구 어쩌구</small></h5>--%>
                                <%--                                    </div>--%>
                                <div class="col-lg-3 col-md-6 col-6 mr-auto">
                                    <h5>Branch<br><small>Hana Branch</small></h5>
                                </div>
                                <div class="col-lg-3 col-md-6 col-6 mr-auto">
                                    <h5>VISA<br><small>E-2</small></h5>
                                </div>
                            </div>
                        </div>
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
                                                <h6> ${account.acNo}</h6>
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

                <div class="exchange-info">
                        <div class="">
                            자동환전 예약 리스트
                        </div>
                    <c:forEach items="${autoExchangeList}" var="autoWallet" varStatus="loop" begin="1">
                        <div class="card card-stats" >
                            <div class="card-body ">
                                <div class="row">
                                    <div class="col-5">
                                        <div class="icon-big text-center icon-warning">
                                            <i class=""></i>
                                            ${autoWallet.lowerBound} 이하가되면 ${autoWallet.exchangeDate} ${autoWallet.targetCurCode} ${autoWallet.exchangeAmount} 충전
                                        </div>
                                    </div>
                                    <div class="col-7 col-md-6">
                                        <div class="numbers">
                                            <p class="card-category">보유통화</p>
                                            <p class="card-title walletCell" data-currency="${autoWallet.targetCurCode}">
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
                                    Last day
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="remittance-info">
                    remittance
                </div>
            </div>
        </div>

    </div>
</div>
<footer>
    dd
</footer>
</div>
</body>
</html>
