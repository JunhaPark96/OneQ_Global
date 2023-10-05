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

    <link href="./css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
    <link href="./css/bootstrap/paper-dashboard.css?v=2.0.1" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
            <%--      <iframe src="https://openhanafn.ttmap.co.kr/content.jsp?search_flag=&amp;search_word=" title="영업점안내" frameborder="0" width="100%" height="1000" scrolling="no" name="bizBranch"></iframe>--%>
            <iframe src="https://openhanafn.ttmap.co.kr/content.jsp?search_flag=&amp;search_word=" title="영업점안내"
                    frameborder="0" width="900px" height="600px" scrolling="no" name="bizBranch"></iframe>
        </div>

    </div>
</div>
<footer>
</footer>
</div>
</body>
</html>
