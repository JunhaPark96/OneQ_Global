<%@ page import="com.kopo.hanaglobal.hana_global.web.entity.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>대시보드</title>

  <link href="./css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
  <link href="./css/header.css" rel="stylesheet"/>
  <link href="./css/TTF.css" rel="stylesheet"/>
  <link href="./css/profile.css" rel="stylesheet">
  <script src="./js/main.js"></script>
</head>
<body>
<div class="main-container">
  <%@ include file="/WEB-INF/views/includes/header.jsp" %>
  <div class="main-area">
    <%@ include file="/WEB-INF/views/includes/mem_sidebar.jsp" %>
    <div class="main-body">
      <div class="main-wrapper">

        <div class="user-info">
          user
        </div>

        <div class="main-info">
        </div>


        <div class="exchange-info">
          exchange
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
