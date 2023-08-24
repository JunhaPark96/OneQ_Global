<%--
  Created by IntelliJ IDEA.
  User: JUNHA
  Date: 2023-08-14
  Time: 오전 12:39
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
    <link rel="stylesheet" href="./css/step2.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link href="./css/main.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/main-body.css" rel="stylesheet"/>
    <title>계좌 등록 </title>

    <script>
        $(document).ready(function() {
            $('#btnNext').on('click', function(event) {
                event.preventDefault(); // 기본 submit 동작을 방지

                let formData = new FormData($('#frm')[0]); // Form 데이터를 가져옵니다.

                $.ajax({
                    url: '/signUp_STEP3',
                    type: 'POST',
                    data: formData,
                    processData: false,  // 이 설정을 false로 지정하여 jQuery가 데이터를 query string으로 변환하는 것을 방지
                    contentType: false,  // 이 설정을 false로 지정하여 jQuery가 contentType을 설정하는 것을 방지
                    success: function(response) {
                        // 응답이 성공적인 경우 처리 (예: 다음 페이지로 리디렉션)
                        window.location.href = '/signUp_STEP3';  // 다음 페이지로 리디렉션. URL을 필요에 따라 수정하세요.
                    },
                    error: function(xhr, status, error) {
                        // 오류 발생시 처리
                        alert("데이터 전송 오류 발생: " + error);
                    }
                });
            });
        });
    </script>

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
                <form id="frm" name="step2-form" action="/signUp_STEP3" method="post" enctype="multipart/form-data">
                    <section>
                        <div class="titArea">
                            <h2 class="titH3">신분증 정보</h2>
                        </div>
                        <table class="tableY formTbl">
                            <colgroup>
                                <col style="width:185px">
                                <col style="width:auto">
                            </colgroup>
                            <tbody>
                            <tr>
                                <td class="th">본인 신분증</td>
                                <td>
                                    <div class="idCardCerti" id="idCardCerti1">
                                        <div class="uniformImg"><img src="./images/registerEx.png" alt=""></div>
                                        <div class="form">
                                            <div class="iptWrap">
                                                <input type="tel" class="ipt uiAct" maxlength="8" placeholder="'20200101'과 같이 숫자만 입력해주세요." title="주민등록증 발급일자 숫자만 입력해주세요." id="pressIsuDy8" value="" name="pressIsuDy8">
                                            </div>
                                            <span class="txt">주민등록증 하단의 발급일자를 입력해주세요.</span>
                                            <div class="uploadField">
                                                <label for="idCardImage">신분증 이미지 업로드:</label>
                                                <input type="file" id="idCardImage" name="idCardImage" accept="image/*">
                                                <span class="txt">신분증 이미지를 업로드해주세요.</span>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </section>

                    <section>
                        <div class="titArea">
                            <h2 class="titH3">비자 정보</h2>
                        </div>
                        <table class="tableY formTbl">
                            <colgroup>
                                <col style="width:185px">
                                <col style="width:auto">
                            </colgroup>
                            <tbody>
                            <tr>
                                <td class="th">비자 번호</td>
                                <td>
                                    <div class="uniformImg"><img src="./images/visaEx.jpg" alt=""></div>
                                    <div class="iptWrap">
                                        <input type="text" class="ipt uiAct" placeholder="비자 번호를 입력해주세요." title="비자 번호 입력" id="visaNumber" name="visaNumber">
                                    </div>
                                    <span class="txt">유효한 비자 번호를 입력해주세요.</span>

                                    <div class="uploadField">
                                        <label for="visaImage">비자 이미지 업로드:</label>
                                        <input type="file" id="visaImage" name="visaImage" accept="image/*">
                                        <span class="txt">비자 이미지를 업로드해주세요.</span>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </section>

                    <section>
                        <div class="titArea">
                            <h2 class="titH3">여권 정보</h2>
                        </div>
                        <table class="tableY formTbl">
                            <colgroup>
                                <col style="width:185px">
                                <col style="width:auto">
                            </colgroup>
                            <tbody>
                            <tr>
                                <td class="th">여권 번호</td>
                                <td>
                                    <div class="uniformImg"><img src="./images/passportEx.jpg" alt=""></div>
                                    <div class="iptWrap">
                                        <input type="text" class="ipt uiAct" placeholder="여권 번호를 입력해주세요." title="여권 번호 입력" id="passportNumber" name="passportNumber">
                                    </div>
                                    <span class="txt">유효한 여권 번호를 입력해주세요.</span>

                                    <div class="uploadField">
                                        <label for="passportImage">여권 이미지 업로드:</label>
                                        <input type="file" id="passportImage" name="passportImage" accept="image/*">
                                        <span class="txt">여권 이미지를 업로드해주세요.</span>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </section>

                    <section class="certContain">
                        <div class="btnArea" id="btnFclArea">
                            <a href="/signUp_STEP1" id="btnCancel" class="btn_s">취소</a>
                            <button type="submit" id="btnNext" class="btn_p">다음</button>
                        </div>
                    </section>
                </form>
        </div>
    </main>
</div>
</body>
</html>
