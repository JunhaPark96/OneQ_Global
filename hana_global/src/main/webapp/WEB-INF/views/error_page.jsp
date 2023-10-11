<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="css/TTF.css" rel="stylesheet"/>
    <link href="css/service-main.css" rel="stylesheet">
    <script src="./js/account.js"></script>

    <style>
        body {
            background-color: #f4f4f9;
        }

        .error-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 70vh;
            flex-direction: column;
        }

        .error-card {
            padding: 2rem;
            background-color: #fff;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
            border-radius: 8px;
            text-align: center;
            line-height: 40px;
        }

        .error-message {
            font-size: 2rem;
            color: #e74c3c;
            margin-bottom: 1rem;
        }

        .btn-branch {
            padding: 0.5rem 1rem;
            background-color: #016f73;
            border: none;
            border-radius: 5px;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .btn-branch:hover {
            background-color: #014946;
        }
    </style>
</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-body">
        <div class="error-container">
            <div class="error-card">
                <div class="error-message">${error}</div>
                <span style="font-size: large;">

                We apologize for the inconvenience. <br/>
                Please visit the nearest <a class="btn-branch" href="${pageContext.request.contextPath}/profile"> branch</a>
                </span>
            </div>
        </div>
    </div>
    <footer>
    </footer>
</div>
</body>
</html>
