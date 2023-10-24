<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
  <div class="accordion" id="accordionExample">
    <div class="steps">
      <progress id="progress" value=0 max=100></progress>
      <div class="step-item">
        <button class="step-button text-center" type="button" data-bs-toggle="collapse"
                data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          1
        </button>
        <div class="step-title">
<%--          약관동의--%>
          Agreement
        </div>
      </div>
      <div class="step-item">
        <button class="step-button text-center collapsed" type="button" data-bs-toggle="collapse"
                data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          2
        </button>
        <div class="step-title">
<%--          계좌등록--%>
          Identity Verification
        </div>
      </div>
      <div class="step-item">
        <button class="step-button text-center collapsed" type="button" data-bs-toggle="collapse"
                data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          3
        </button>
        <div class="step-title">
<%--          본인확인--%>
          Personal Info
        </div>
      </div>
      <div class="step-item">
        <button class="step-button text-center collapsed" type="button" data-bs-toggle="collapse"
                data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
          4
        </button>
        <div class="step-title">
<%--          정보입력--%>
          Login Info
        </div>
      </div>
      <div class="step-item">
        <button class="step-button text-center collapsed" type="button" data-bs-toggle="collapse"
                data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
          5
        </button>
        <div class="step-title">
<%--          가입완료--%>
          Register Complete
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Stepper 부트스트랩 끝 -->
<%--진행률 단계별 채우기 스크립트 --%>
<script>
  const progress = document.querySelector('#progress');
  const stepButtons = document.querySelectorAll('.step-button');

  // URL에서 현재 단계를 추출
  const currentStep = parseInt(location.pathname.split("signUp_STEP")[1] - 1);

  progress.setAttribute('value', currentStep * 100 / (stepButtons.length - 1));

  for (let i = 0; i <= currentStep; i++) {
    stepButtons[i].classList.add('done');
  }
</script>


</body>
</html>
