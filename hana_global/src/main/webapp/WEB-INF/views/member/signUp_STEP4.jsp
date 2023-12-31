
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
  <link rel="stylesheet" href="./css/step-box.css">
  <link rel="stylesheet" href="./css/terms.css">
  <link rel="stylesheet" href="./css/step3.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
          crossorigin="anonymous"></script>

  <link href="./css/main.css" rel="stylesheet"/>
  <link href="./css/header.css" rel="stylesheet"/>
  <link href="./css/TTF.css" rel="stylesheet"/>
  <link href="./css/main-body.css" rel="stylesheet"/>
  <title>정보입력</title>
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
      <form name="frm" action="${pageContext.request.contextPath}/signUp_STEP5" method="post" id="frm">
        <input type="hidden" id="name" name="name" value="${sessionScope.name}">
        <input type="hidden" id="foreignRegNo" name="foreignRegNo" value="${sessionScope.foreignRegNo}">
        <input type="hidden" id="birthDate" name="birthDate" value="${sessionScope.birthDate}">
        <input type="hidden" id="gender" name="gender" value="${sessionScope.gender}">
        <input type="hidden" id="mobileDigit" name="mobileDigit" value="${sessionScope.mobileDigit}">
        <input type="hidden" id="emailId" name="emailId" value="${sessionScope.emailId}">
        <input type="hidden" id="nationality" name="nationality" value="${sessionScope.nationality}">
        <input type="hidden" id="countryCode" name="countryCode" value="${sessionScope.countryCode}">
        <input type="hidden" id="roadAddress" name="roadAddress" value="${sessionScope.roadAddress}">
        <input type="hidden" id="jibunAddress" name="jibunAddress" value="${sessionScope.jibunAddress}">
        <input type="hidden" id="detailAddress" name="detailAddress" value="${sessionScope.detailAddress}">
        <section>
          <div class="titArea">
            <h2>Enter Login Details</h2>
            <div class="title-area clearfix">
              <h3 class="fleft">ID & Password</h3>
              <div class="infor mt4">
                <span class="asterisk">*Fields marked with an asterisk are mandatory.</span>
              </div>
            </div>
          </div>

          <table class="tableY formTbl">
            <colgroup>
              <col style="width:185px">
              <col style="width:auto">
            </colgroup>

            <tbody>
            <tr>
              <td class="th">ID*</td>
              <td>
                <div class="iptWrap">
                  <input type="text" class="ipt uiAct" title="아이디 입력" id="userId"
                         name="userId" placeholder="">
                </div>
              </td>
            </tr>

            <tr>
              <td class="th">Password*</td>
              <td>
                <div class="iptWrap">
                  <input type="password" class="ipt uiAct"
                         title="비밀번호 입력" id="userPasswd" name="userPasswd">
                </div>
              </td>
            </tr>

            <tr>
              <td class="th">Confirm Password*</td>
              <td>
                <div class="iptWrap">
                  <input type="password" class="ipt uiAct"
                         title="비밀번호 입력" id="userPasswdConfirm" name="userPasswdConfirm">
                </div>
              </td>
            </tr>
            </tbody>
          </table>

        </section>
        <section class="account-password-section">
          <div class="titArea">
            <h2>Account Information</h2>
            <div class="title-area clearfix">
              <h3 class="fleft">Set Account Password</h3>
              <div class="infor mt4">
                <span class="asterisk">*Fields marked with an asterisk are mandatory.</span>
              </div>
            </div>
          </div>

          <table class="tableY formTbl">
            <colgroup>
              <col style="width:185px">
              <col style="width:auto">
            </colgroup>
            <tbody>

            <tr>
              <td class="th">Password</td>
              <td>
                <div class="iptWrap">
                  <input type="password" class="ipt uiAct" title="간편비밀번호 설정" id="acPasswd"
                         name="acPasswd" maxlength="4">
                </div>
              </td>
            </tr>

            <tr>
              <td class="th">Confirm Password</td>
              <td>
                <div class="iptWrap" >
                  <input type="password" class="ipt uiAct" title="국적 입력" id="acPasswdConfirm"
                         name="acPasswdConfirm" maxlength="4">
                </div>
              </td>
            </tr>

            </tbody>
          </table>
        </section>

        <section class="certContain">
          <div class="btnArea" id="btnFclArea">
            <a href="/signUp_STEP3" id="btnCancel" class="btn_s">Prev</a>
            <button type="submit" id="btnNext" class="btn_p">Next</button>
          </div>
        </section>
      </form>
    </div>
  </main>

</div>
</body>
</html>
