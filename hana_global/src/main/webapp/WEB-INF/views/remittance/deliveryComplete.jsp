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

    <%--    <link href="./css/bootstrap/bootstrap.min.css" rel="stylesheet"/>--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/wallet/flags.css" rel="stylesheet">
    <link href="./css/service-main.css" rel="stylesheet"/>
    <script src="./js/main.js"></script>
    <link href="./css/remittance/deliveryComplete.css" rel="stylesheet">

    <script src="https://cdn.lottiefiles.com/lottie-player.js"></script>
    <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>

    <style>
        #btn_info:hover {
            background-color: #40c4ff !important;
            color: whitesmoke !important;
            transition: all 0.5s;
            transition-timing-function: ease;
        }

        #loadingDiv {
            position: fixed;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background-color: #fff;
            z-index: 99;
        }
    </style>
</head>
<body>
<div id="loadingDiv">
    <lottie-player src="./json/delivery.json" background="#FFFFFF" speed="3"
                   style="width: 800px; height: 800px;" loop autoplay></lottie-player>
</div>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area">
        <%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
        <div class="main-body">
            <h2>Remittance Delivery Service</h2>
            <div class="fs-5 mb-3" style="color: #bdbdbd; font-size: 1.5rem;">Remittance / <strong
                    style="color: #000000; margin-bottom: 0px;">Delivery-Complete</strong></div>
            <div class="remittance-complete">
                <div class="bg">
                    <div class="card">
            <span class="card__success">
                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="90" viewBox="0 0 512 512">
                    <path fill="none" stroke="white" stroke-linecap="round" stroke-linejoin="round"
                          stroke-width="32" d="M416 128L192 384l-96-96"/></svg>
            </span>

                        <h1 class="card__msg">Delivery reservation completed.</h1>
                        <h2 class="card__submsg">Delivery date may vary depending on the distance.</h2>
                        <div class="rounded col-6 border mt-2 border-4 box w-100 justify-content-center">
                            <div class="col-12 row">
                                <div class="col-12">
                                    <div>
                                        <img src="./images/walletIcon_CAD.png"
                                             style="width: 100px; height: 90px">
                                    </div>
                                    <div class="fs-5 text-black-50">
                                        Canada CAD <span style="color: #018085">2,500</span>
                                    </div>
                                </div>
                                <div class="mt-2 text-black-50">
                                    Check detailed reservation information.
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-center bg-white text-center rounded pt-5 pb-4 mb-4"
                             style="float: none; margin: 0 auto; width: 100%; ">
                            <div class="fs-4 text-start border-bottom border-2 pb-2 ps-0">
                                Application Details
                            </div>
                            <div class="col-12 p-0 d-flex justify-content-between mt-3">
                                <div class="text-start ps-0  fs-5">
                                    Applicant
                                </div>
                                <div class="text-start ps-0  fs-5">
                                    Sophia Moore
                                </div>
                            </div>
                            <div class="col-12 p-0 d-flex justify-content-between mt-2">
                                <div class="text-start ps-0  fs-5">
                                    Phone Number
                                </div>
                                <div class="text-start ps-0  fs-5">
                                    1-844-533-1725
                                </div>
                            </div>
                            <div class="col-12 p-0 d-flex justify-content-between mt-2">
                                <div class="text-start ps-0  fs-5">
                                    Delivery Address
                                </div>
                                <div class="text-start ps-0 fs-5">
                                    4950 Yonge St. Suite 1101, Toronto, ON, M2N 6K1
                                </div>
                            </div>
                            <div class="col-12 p-0 d-flex justify-content-between mt-2 mb-4">
                                <div class="text-start ps-0  fs-5">
                                    Expected Delivery Date
                                </div>
                                <div class="text-start ps-0  fs-5">
                                    2023-10-17
                                </div>
                            </div>
                            <hr>
                            <div class="mt-4">
                                <a class="btn btn-primary fs-6 p-2 border-0 me-3 pe-4 ps-4"
                                   style="font-size: 20px!important;border-radius: 20px; background-color: #018085;"
                                   href="${pageContext.request.contextPath}/remittanceTrace">
                                    View Remittance History
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>

    </div>
</div>
<footer>
</footer>
</div>

<!-- 날짜 입력 필드에 대한 스크립트 추가 -->
<!-- Pikaday 라이브러리 포함 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.8.0/css/pikaday.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.8.0/pikaday.min.js"></script>

<script>
    $(window).on('load', function () {
        setTimeout(removeLoader, 2000); //wait for page load PLUS two seconds.
    });

    function removeLoader() {
        $("#loadingDiv").fadeOut(500, function () {
            $("#loadingDiv").remove();
            document.getElementById("container").classList.remove("d-none");
        });
    }
</script>
</body>
</html>
