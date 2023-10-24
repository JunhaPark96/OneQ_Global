<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Bootstrap 5 CSS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <!-- Stepper Styles -->
    <link rel="stylesheet" href="./css/step-box.css">
    <link rel="stylesheet" href="./css/terms.css">
    <link rel="stylesheet" href="./css/step3.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
            crossorigin="anonymous"></script>
    <%--    주소 api 링크--%>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="./js/main.js"></script>

    <link href="./css/main.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <title>본인 확인</title>
</head>
<body>
<div class="main-container">
    <%--  공통 헤더--%>
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <main>
        <%--  단계 --%>
        <%@ include file="/WEB-INF/views/includes/stepper.jsp" %>
        <div class="content">
            <section>
                <div class="titArea">
                    <h1>Registration Complete!</h1>
                    <h2>Welcome to Hana All-in-One Banking Service</h2>
                </div>

                <table class="tableY formTbl">
                    <colgroup>
                        <col style="width:185px">
                        <col style="width:auto">
                    </colgroup>
                    <tbody>
                    <tr>
                        <td class="th">
                            We are assessing the authenticity of the documents you submitted.<br>
                            Please await administrative approval. This process may take 1 to 3 minutes.<br>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </section>

            <section class="certContain">
                <div class="btnArea" id="btnFclArea">
                    <a href="${pageContext.request.contextPath}/signin" id="btnNext" class="btn_p">Proceed to Login Page</a>
                </div>
            </section>
        </div>
    </main>
</div>


</body>
</html>