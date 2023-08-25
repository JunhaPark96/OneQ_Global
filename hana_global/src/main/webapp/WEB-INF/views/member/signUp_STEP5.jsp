<%--
  Created by IntelliJ IDEA.
  User: JUNHA
  Date: 2023-08-16
  Time: 오후 4:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Bootstrap 5 CSS -->
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
            <%--    1002962104821--%>
                <section>
                    <div class="titArea">
                        <h1>회원가입 완료!</h1>
                        <h2>하나 올인원 뱅킹 서비스에 가입하신것을 환영합니다</h2>
                    </div>

                    <table class="tableY formTbl">
                        <colgroup>
                            <col style="width:185px">
                            <col style="width:auto">
                        </colgroup>
                        <tbody>
                        <tr>
                            <td class="th">
                                제출하신 문서의 위변조를 판단합니다.<br>
                                관리자의 승인을 기다려 주십시오. 약 1 ~ 3일 소요 됩니다.<br>
                                제출하신 이메일과 연락처로 승인여부가 전송됩니다
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </section>

                <section class="certContain">
                    <div class="btnArea" id="btnFclArea">
                        <a href="/" id="btnNext" class="btn_p">메인 페이지로 이동</a>
                    </div>
                </section>
        </div>
    </main>
</div>


</body>
</html>