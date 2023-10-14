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
    <link href="css/login.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script src="./js/main.js"></script>

<%--    <script src="https://cdn.lottiefiles.com/lottie-player.js"></script>--%>

    <script type="text/javascript">
        if ('${loginMsg}') {
            alert('${loginMsg}');
        }
    </script>

    <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
    <style>
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
<%--<div id="loadingDiv">--%>
<%--    <lottie-player src="./json/transfer.json" background="#FFFFFF" speed="1"--%>
<%--                   style="width: 800px; height: 800px;" loop autoplay></lottie-player>--%>
<%--</div>--%>

<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area">

        <div class="main-body">
            <form:form action="${pageContext.request.contextPath}/signin" method="post" class="loginInput"
                       modelAttribute="loginDTO">
            <div class="loginHeader"><spring:message
                    code="login.title" text="default text"/></div>
                <div class="loginField">
                    <div class="loginLabel1" style="width: 130px;">
                        <label for="id"><spring:message
                                code="login.userId" text="default text"/></label>
                    </div>
                    <div class="loginInputField1">
                        <form:input path="id"/>
                        <form:errors path="id"/>
                    </div>
                    <div class="loginLabel2">
                        <label for="passwd"><spring:message
                                code="login.password" text="default text"/></label>
                    </div>
                    <div class="loginInputField2">
                        <form:input path="passwd" type="password"/>
                        <form:errors path="passwd"/>
                    </div>
                    <div class="loginButton">
                        <input type="submit"  value="<spring:message code='login.loginButton' text='Login'/>" class="loginBtn">
                    </div>
<%--                <div class="loginId">--%>
<%--                    <label for="id">User ID</label>--%>
<%--                    <form:input path="id"/>--%>
<%--                    <form:errors path="id"/>--%>
<%--                </div>--%>
<%--                <div class="loginPw">--%>
<%--                    &lt;%&ndash;<label for="password">Password</label>--%>
<%--                    <input type="password" name="password" id="password" placeholder="Password" required>&ndash;%&gt;--%>
<%--                        <label for="passwd">Password</label>--%>
<%--                        <form:input path="passwd"/>--%>
<%--                        <form:errors path="passwd"/>--%>
<%--                </div>--%>
<%--                <div class="loginButton">--%>
<%--                    <input type="submit" value="Login" class="loginBtn">--%>
<%--                </div>--%>
                </div>
                <div class="login-option">
                    <div>
                        <a href="${pageContext.request.contextPath}/readyToApply"> <spring:message code='login.openAccount'/></a>
                    </div>
                    <div>
                        <a href="${pageContext.request.contextPath}/openAccount"> <spring:message code='login.forgotPassword'/> </a>
                    </div>
                </div>
            </form:form>

        </div>
    </div>
    <footer>
    </footer>
</div>

<script>
    $(window).on('load', function () {
        setTimeout(removeLoader, 2500);
    });

    function removeLoader() {
        $("#loadingDiv").fadeOut(500, function () {
            $("#loadingDiv").remove();
            let containerElement = document.getElementById("container");
            if(containerElement) { // Check if the element is not null
                containerElement.classList.remove("d-none");
            }
        });
    }
</script>
</body>

</html>