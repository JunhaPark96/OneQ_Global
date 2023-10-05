<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./css/nav.css" rel="stylesheet"/>
</head>
<body>
<div class="navbarWrap">
<div class="navbar">
<ul>
    <li>
        <a href="/account" style="padding-left: 15px">Accounts</a>
        <ul>
            <li><a href="${pageContext.request.contextPath}/accountInfo"> My Accounts</a></li>
            <li><a href="${pageContext.request.contextPath}/accountDetail">Transaction Details</a></li>
            <li><a href="${pageContext.request.contextPath}/accountTransfer">Account Transfer</a></li>
        </ul>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/walletInfo" style="padding-left: 15px">Hana Wallet</a>
        <ul>
            <li><a href="${pageContext.request.contextPath}/walletInfo"> My Wallet </a></li>
<%--            <li><a href="${pageContext.request.contextPath}/topUp">Load Wallet</a></li>--%>
            <li><a href="${pageContext.request.contextPath}/walletTransactionDetail">Wallet Transaction Details</a></li>
        </ul>
    </li>
    <li>
        <a href="/exchange" style="padding-left: 15px">Foreign Exchange</a>
        <ul>
            <li><a href="/exchange">Exchange Rate</a></li>
            <li><a href="${pageContext.request.contextPath}/doExchange?currency=KRW">Exchange</a></li>
<%--            <li><a href="/exchange">Exchange history</a></li>--%>
            <li><a href="/walletInfo">Recurring Exchange</a></li>
        </ul>
    </li>
    <li>
        <a href="/transfer" style="padding-left: 15px">Overseas Remittance</a>
        <ul>
            <li><a href="${pageContext.request.contextPath}/remittance">Immediate Remittance</a></li>
            <li><a href="${pageContext.request.contextPath}/remittanceTrace">Remittance Trace</a></li>
        </ul>
    </li>
</ul>
</div>
</div>
</body>
</html>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const currentPath = window.location.pathname;

        // 모든 하위 메뉴를 숨깁니다.
        document.querySelectorAll(".navbar ul li ul").forEach(function(innerItem) {
            innerItem.style.display = "none";
        });

        document.querySelectorAll(".navbar a").forEach(function(anchor) {
            if (anchor.getAttribute('href') === currentPath) {
                // 해당 메뉴 아이템을 활성화하고 부모의 하위 메뉴를 표시합니다.
                anchor.parentNode.classList.add('active');
                const submenu = anchor.closest('ul');
                if (submenu) {
                    submenu.style.display = "block";
                }
            }
        });

        document.querySelectorAll(".navbar > ul > li > a").forEach(function(item) {
            item.addEventListener("click", function(e) {
                e.preventDefault(); // 링크의 기본 동작을 방지

                const submenu = this.nextElementSibling;

                // 모든 하위 메뉴를 숨깁니다.
                document.querySelectorAll(".navbar ul li ul").forEach(function(innerItem) {
                    if (innerItem !== submenu) {
                        innerItem.style.display = "none";
                    }
                });

                // 클릭된 메뉴의 하위 메뉴를 토글
                if (submenu.style.display === "block") {
                    submenu.style.display = "none";
                } else {
                    submenu.style.display = "block";
                }
            });
        });
    });

</script>
</body>
</html>
