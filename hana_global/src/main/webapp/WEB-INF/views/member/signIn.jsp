<%@ page import="com.kopo.hanaglobal.hana_global.web.entity.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link href="css/header.css" rel="stylesheet"/>
    <link href="css/TTF.css" rel="stylesheet"/>
    <link href="css/service-main.css" rel="stylesheet">
    <link href="css/login.css" rel="stylesheet">

    <script src="./js/main.js"></script>

    <script type="text/javascript">
        if ('${loginMsg}') {
            alert('${loginMsg}');
        }
    </script>
</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area">
        <div class="main-left">
        </div>

        <div class="main-body">
            <form:form action="${pageContext.request.contextPath}/signin" method="post" class="loginInput"
                       modelAttribute="loginDTO">
            <div class="loginHeader">Login</div>
                <div class="loginField loginId">
                    <label for="id">User ID</label>
                    <form:input path="id"/>
                    <form:errors path="id"/>
                </div>
                <div class="loginField loginPw">
                    <%--<label for="password">Password</label>
                    <input type="password" name="password" id="password" placeholder="Password" required>--%>
                        <label for="passwd">Password</label>
                        <form:input path="passwd"/>
                        <form:errors path="passwd"/>
                </div>
                <div class="loginButton">
                    <input type="submit" value="Login" class="loginBtn">
                </div>
            </form:form>
        </div>
    </div>
    <footer>
    </footer>
</div>


</body>

</html>