<%--
  Created by IntelliJ IDEA.
  User: JUNHA
  Date: 2023-08-12
  Time: 오후 4:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Hana2.0+B&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Hana2.0+H&display=swap" rel="stylesheet"/>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <!-- Stepper Styles -->
    <link rel="stylesheet" href="./css/step-box.css">
    <link rel="stylesheet" href="./css/terms.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
            crossorigin="anonymous"></script>

    <link href="./css/main.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/main-body.css" rel="stylesheet"/>
    <title>회원가입 step 1 약관동의 </title>
</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <main>

        <%@ include file="/WEB-INF/views/includes/stepper.jsp" %>
        <div class="content">
            <%--        약관 헤더 박스--%>
            <div class="title-area clearfix">
                <h3 class="fleft">전자금융거래 기본약관</h3>
            </div>
            <%--        약관 내용 박스--%>
            <div class="agree-box" tabindex="0">
                <div class="agree-txt">
                    <div class="agree-txt">
                        <h4 class="font-13 pb0 font-normal">전자금융거래기본약관</h4>
                    </div>
                </div>
            </div>

            <%--        약관 헤더 박스--%>
            <div class="title-area clearfix">
                <h3 class="fleft">개인정보처리방침</h3>
            </div>
            <%--        약관 내용 박스--%>
            <div class="agree-box" tabindex="0">
                <div class="agree-txt">
                    <div class="agree-txt">
                        <h4 class="font-13 pb0 font-normal">전자금융거래기본약관</h4>
                    </div>
                </div>
            </div>

            <div class="agree-check clearfix mt7 mb15">
	<span class="fleft"> <input type="checkbox" id="p6" value="">
		<label for="p6"><em>위 약관의 내용을 확인하고 동의합니다.</em></label>
	</span>
            </div>

            <form name="frm" id="frm" method="post" action="/signUp_STEP2">
                <input type="hidden" name="dummy">
                <input type="hidden" id="agreeYN" name="agreeYN" value="">
                <div class="btn-area mt15 mb30">
                    <span class=" btn-pack btn-type-3c ui-btn-pack-button ui-set-btn-pack ui-set-btn-pack-event">
                        <button
                            type="submit" class="" id="buttonConfirm"
                            onclick="return chkAgree();">확인
                        </button>
                    </span>
                    <span class=" btn-pack btn-type-3 ui-btn-pack-a ui-set-btn-pack ui-set-btn-pack-event">
                        <a href="/signUp" id="buttonCancel" class="">취소</a></span>
                </div>
                <input type="hidden" name="transkey_i" id="transkey_i" value="0">
                <input type="hidden"
                       name="transkey_inputs"
                       id="transkey_inputs"
                       value="">
                <input type="hidden" name="transkeyUuid" id="transkeyUuid" value="undefined">
            </form>

        </div>
    </main>

</div>

<%--<script>--%>
<%--    const progress = document.querySelector('#progress');--%>
<%--    const stepButtons = document.querySelectorAll('.step-button');--%>

<%--    Array.from(stepButtons).forEach((button, index) => {--%>
<%--        button.addEventListener('click', () => {--%>
<%--            progress.setAttribute('value', index * 100 / (stepButtons.length - 1)); // 5단계로 확장--%>

<%--            stepButtons.forEach((item, secindex) => {--%>
<%--                if (index >= secindex) {--%>
<%--                    item.classList.add('done');--%>
<%--                }--%>
<%--                if (index < secindex) {--%>
<%--                    item.classList.remove('done');--%>
<%--                }--%>
<%--            })--%>
<%--        })--%>
<%--    })--%>

<%--</script>--%>

<script>
<%--    약관 체크--%>
    function chkAgree() {
        let agreeBox = document.getElementById('p6');
        let agreeInput = document.getElementById('agreeYN');

        if (agreeBox.checked) {
            agreeInput.value = "Y";
            return true;
        } else {
            let confirmResult = confirm('약관 내용을 확인하고 모두 동의하십니까?');
            if (confirmResult) {
                agreeInput.value = "Y";
                return true;
            } else {
                return false; // Form submission is cancelled.
            }
        }
    }
</script>

</body>
</html>
