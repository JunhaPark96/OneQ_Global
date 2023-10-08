<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <%--    <link href="./css/bootstrap/bootstrap.min.css" rel="stylesheet"/>--%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <%--    스와이퍼--%>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <%--    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>--%>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/ionicons/7.1.2/esm/ionicons.min.js" integrity="sha512-2ySmquu6HK3CAvwLllh0R8K8buFPMZsUwWLZIlB7WW8c8ilUtoNyhsmEsQn2U0IV1USr2Oc/9DJzlr4cxAbuxA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>--%>
    <script src="https://cdn.jsdelivr.net/npm/ionicons@5.0.0/dist/ionicons.js"></script>

    <%--    <script src="./js/wallet.js"></script>--%>
    <link href="./css/service-main.css" rel="stylesheet"/>
    <link href="./css/nav.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <%--    <link href="./css/exchange/doExchange.css" rel="stylesheet"/>--%>
    <link href="./css/wallet/flags.css" rel="stylesheet"/>
    <link href="./css/transferComplete.css" rel="stylesheet"/>

    <title>계좌 이체 끝</title>
</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area">
        <%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
        <div class="main-body">

            <div class="transfer-complete">
                <div class="bg">
                    <div class="card">
                        <span class="card__success">
                            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="90" viewBox="0 0 512 512">
                                <path fill="none" stroke="white" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" d="M416 128L192 384l-96-96"/></svg>
                        </span>
                        <h1 class="card__msg">Transfer to ${targetMember.name}'s Account Completed</h1> <!-- Title updated to "계좌 이체 완료" -->
                        <h2 class="card__submsg">Hana ${targetAccount.acNo}</h2> <!-- Subtitle updated -->

                        <div class="card__body">
                            <div class="card__recipient-info">
                            </div>

                            <p class="card__price mb-5">Transfer Amount <span>${transferAmount}</span></p>
                            <div class="btn-wrapper">
                                <button class="mb-4 transferTrace" onclick="location.href='${pageContext.request.contextPath}/account_transfer.jsp';">
                                    Make Another Transfer
                                </button>
                                <button class="mb-4 transferTrace" onclick="location.href='${pageContext.request.contextPath}/account_details';">
                                    View Details
                                </button>
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


</body>

</html>
