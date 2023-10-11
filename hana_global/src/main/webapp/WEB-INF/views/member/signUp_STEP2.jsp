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
                        <h2 class="titH3">Identification Information</h2>
                    </div>
                    <table class="tableY formTbl">
                        <colgroup>
                            <col style="width:185px">
                            <col style="width:auto">
                        </colgroup>
                        <tbody>
                        <tr>
                            <td class="th">Personal Identification</td>
                            <td>
                                <div class="idCardCerti" id="idCardCerti1">
                                    <div class="uniformImg"><img src="./images/alien_register.png" alt=""></div>
                                    <div></div>
                                    <div class="form">
                                        <div class="uploadField">
                                            <label for="idCardImage">Upload Identification Image</label>
                                            <input type="file" id="idCardImage" name="idCardImage" accept="image/*"
                                                   onchange="previewImage(event)" style="display: none;">
                                            <label for="idCardImage" class="custom-file-label">Upload File</label>
                                            <span class="txt">Please upload an image as shown in the example above, <br/>clearly displaying the foreigner registration number, name, and issue date on the identification card.</span>
                                        </div>
                                        <div class="btn_a" onclick="openModal()">
                                            <a id="certificateModalOpen">Authenticate</a>
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
            </form>
        </div>
    </main>
</div>

<%--
OCR API 호출: 사용자가 모달에서 'Authenticate' 버튼을 클릭하면, 서버에 이미지를 전송하고 OCR API를 호출하여 이미지에서 텍스트를 추출
텍스트 처리: OCR API의 응답에서 텍스트를 처리하고 필요한 정보를 추출
응답 표시: 추출된 텍스트를 모달의 입력 필드에 표시
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
        <form id="registrationForm" action="${pageContext.request.contextPath}/signUp_STEP3" method="post">
            <div class="btnWrap">
                <div class="submitButton">
                    <input type="submit" value="Authenticate" class="submitBtn" id="ocrCheck">
                </div>

                <input type="hidden" id="hiddenName" name="hiddenName">
                <input type="hidden" id="hiddenID" name="hiddenID">
                <input type="hidden" id="hiddenIssueDate" name="hiddenIssueDate">
                <input type="hidden" id="hiddenStatus" name="hiddenStatus">
                <input type="hidden" id="hiddenLocKor" name="hiddenLocKor">
                <input type="hidden" id="hiddenLocEng" name="hiddenLocEng">
                <input type="hidden" id="hiddenCountry" name="hiddenCountry">
                <div class="submitButton">
                    <input type="submit" value="Submit" class="submitBtn" id="submitOCR">
                    <div id="loadingScreen" class="spinner-border text-success" role="status">
                        <span class="sr-only"></span>
                    </div>
                </div>
            </div>
        </form>
    </div>
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

    // 첨부한 이미지 받아오기
    function previewImage(event) {
        let reader = new FileReader();
        reader.onload = function () {
            let output = document.getElementById('preview');
            output.src = reader.result;
        }
        reader.readAsDataURL(event.target.files[0]);
    }

    // ocr 추출 값 받아오기
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

                document.getElementById("hiddenLocKor").value = data.loc_kor;
                document.getElementById("hiddenLocEng").value = data.loc_eng;
                document.getElementById("hiddenCountry").value = data.Country;

                console.log("클라이언트사이드: " + data.name + " " + data.registerNo + " "
                    + data.status + " " + data.issueDate + data.loc_kor + " " + data.loc_eng
                    + data.Country)
            },
            error: function (error) {
                console.error(error);
            }
        });
    });
    // 제출
    document.querySelector("#submitOCR").addEventListener("click", function (event) {
        event.preventDefault();
        // Show loading screen
        document.getElementById("loadingScreen").style.display = "inline-block";

        document.getElementById("hiddenName").value = document.getElementById("registerName").value;
        document.getElementById("hiddenID").value = document.getElementById("registerID").value;
        document.getElementById("hiddenIssueDate").value = document.getElementById("registerDate").value;
        document.getElementById("hiddenStatus").value = document.getElementById("registerAuthentication").value;

        setTimeout(function () {
            // Hide loading screen
            document.getElementById("loadingScreen").style.display = "none";

            // Alert user
            alert('Authentication has been completed');
            document.getElementById("registrationForm").submit();
            // Store input values in hidden fields
        }, 2000);  // 2 seconds delay
    });

    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("loadingScreen").style.display = "none";
    });
</script>
</body>
</html>
