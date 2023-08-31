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
    <script src="./js/main.js"></script>

    <link href="./css/main.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/main-body.css" rel="stylesheet"/>
    <title>계좌 등록 </title>


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
                                        <div class="uploadField">
                                            <label for="idCardImage">신분증 이미지 업로드:</label>
                                            <input type="file" id="idCardImage" name="idCardImage" accept="image/*"
                                                   onchange="previewImage(event)">
                                            <span class="txt">신분증 이미지를 업로드해주세요.</span>
                                        </div>
                                        <div class="btn_a" onclick="openModal()">
                                            <a id="certificateModalOpen">인증하기</a>
                                            <%--                                            <a id="certificateModalOpener">인증하기</a>--%>
                                        </div>
                                        <br/>


                                        <%--                                            <span class="txt">주민등록증 하단의 발급일자를 입력해주세요.</span>--%>
                                    </div>
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

<%--
OCR API 호출: 사용자가 모달에서 'Authenticate' 버튼을 클릭하면, 서버에 이미지를 전송하고 OCR API를 호출하여 이미지에서 텍스트를 추출합니다.

텍스트 처리: OCR API의 응답에서 텍스트를 처리하고 필요한 정보를 추출합니다.

응답 표시: 추출된 텍스트를 모달의 입력 필드에 표시합니다.
--%>
<%-- 인증 페이지 --%>
<div id="certificateModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <div class="authenticateHeader">Authenticate</div>
            <span class="close">&times;</span>
        </div>


        <div class="modal-main">
            <div class="modal-main-left">
                <img id="preview" width="100%">
            </div>

            <form action="/authenticateAction" method="post" class="authenticateInput">

                <div class="modal-main-right">
                    <div class="mdiptWrap">
                        <div class="input-group">
                            <label>Name </label><br>
                            <input type="text" class="" maxlength="20"
                                   placeholder="Name" title="Name" id="registerName" value=""
                                   name="registerName">
                        </div>
                        <div class="input-group">
                            <label>Foreigner Registration Number </label><br/>
                            <input type="text" class=""
                                   placeholder="Enter 13 digits without hyphen."
                                   title="Only enter the numbers of your ID." id="registerID"
                                   value="" name="registerID">
                        </div>
                        <div class="input-group">
                            <label>Residency Status </label><br/>
                            <input type="text" class="" maxlength="20"
                                   placeholder="Residency Status" title="Only enter the numbers of your ID."
                                   id="registerAuthentication" value=""
                                   name="registerAuthentication">
                        </div>
                        <div class="input-group">
                            <label>Issue Date </label><br/>
                            <input type="text" class="" maxlength="20"
                                   placeholder="Enter numbers like '20200101'."
                                   title="Only enter the issue date of your ID in numbers." id="registerDate"
                                   value="" name="registerDate">
                        </div>
                    </div>
                </div>
            </form>

        </div>
        <div class="btnWrap">
            <div class="submitButton">
                <input type="submit" value="Authenticate" class="submitBtn" id="ocrCheck">
            </div>

            <div class="submitButton">
                <input type="submit" value="Submit" class="submitBtn" id="submitOCR">
            </div>
        </div>
        </form>
    </div>
</div>

<script>
    <%--    인증 모달 끄기--%>
    document.addEventListener("DOMContentLoaded", function () {
        let closeButton = document.querySelector(".close");
        let modal = document.getElementById("certificateModal");
        closeButton.addEventListener("click", closeModal);
        window.addEventListener("click", outsideModalClick);
    });

    function previewImage(event) {
        let reader = new FileReader();
        reader.onload = function () {
            let output = document.getElementById('preview');
            output.src = reader.result;
        }
        reader.readAsDataURL(event.target.files[0]);
    }

    document.querySelector("#ocrCheck").addEventListener("click", function (event) {
        event.preventDefault();

        let formData = new FormData();
        formData.append("image", document.getElementById("idCardImage").files[0]);

        $.ajax({
            type: "POST",
            url: "/authenticateAction",
            data: formData,
            processData: false,
            contentType: false,
            success: function (data) {
                // Populate the input fields with the extracted data
                document.getElementById("registerName").value = data.name;
                document.getElementById("registerID").value = data.registerNo;
                document.getElementById("registerAuthentication").value = data.status;
                document.getElementById("registerDate").value = data.issueDate;
                console.log("클라이언트사이드: " + data.name + " " + data.registerNo + " " + data.status + " " + data.issueDate)
            },
            error: function (error) {
                console.error(error);
            }
        });
    });
</script>
</body>
</html>
