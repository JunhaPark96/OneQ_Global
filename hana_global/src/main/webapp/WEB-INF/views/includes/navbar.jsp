<%--
  Created by IntelliJ IDEA.
  User: JUNHA
  Date: 2023-08-08
  Time: 오후 8:07
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
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
            <li><a href="${pageContext.request.contextPath}/topUp">Load Wallet</a></li>
            <li><a href="${pageContext.request.contextPath}/accountTransfer">Wallet Transaction Details</a></li>
        </ul>
    </li>
    <li>
        <a href="/exchange" style="padding-left: 15px">Foreign Exchange</a>
        <ul>
            <li><a href="/exchange">Exchange Rate</a></li>
            <li><a href="/exchange">Currency Exchange</a></li>
            <li><a href="/exchange">Exchange history</a></li>
            <li><a href="/exchange">Recurring Exchange</a></li>
        </ul>
    </li>
    <li>
        <a href="/transfer" style="padding-left: 15px">Overseas Remittance</a>
        <ul>
            <li><a href="/transfer">Immediate Remittance</a></li>
            <li><a href="/transfer">Remittance history</a></li>
        </ul>
    </li>
</ul>
</div>
</body>
</html>

</body>
</html>
