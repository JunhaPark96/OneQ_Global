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
        <a href="/account">계좌관리</a>
        <ul>
            <li><a href="${pageContext.request.contextPath}/accountInfo"> myAccount</a></li>
            <li><a href="${pageContext.request.contextPath}/accountDetail">계좌 내역</a></li>
            <li><a href="/account_transfer">계좌 이체</a></li>
        </ul>
    </li>
    <li>
        <a href="/exchange">환전관리</a>
        <ul>
            <li><a href="/exchange">환율조회</a></li>
            <li><a href="/exchange">환전하기</a></li>
            <li><a href="/exchange">환전거래내역</a></li>
            <li><a href="/exchange">월별자동환전</a></li>
        </ul>
    </li>
    <li>
        <a href="/transfer">송금관리</a>
        <ul>
            <li><a href="/transfer">송금하기</a></li>
            <li><a href="/transfer">송금거래내역</a></li>
        </ul>
    </li>
</ul>
</div>
</body>
</html>

</body>
</html>
