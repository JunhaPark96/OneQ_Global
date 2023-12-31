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
                    </div>

                    <div class="card-footer">
                        <hr>
                        <div class="button-container" style="text-align: start">
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
