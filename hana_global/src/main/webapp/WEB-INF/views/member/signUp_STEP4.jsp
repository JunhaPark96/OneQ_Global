<%--
  Created by IntelliJ IDEA.
  User: JUNHA
  Date: 2023-08-15
  Time: 오후 6:47
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
      <form name="frm" action="/signUp_STEP5" method="post" id="frm">
        <section>
          <div class="titArea">
            <h2>로그인 정보 입력</h2>
<%--            <h3 class="titH3">신청인 정보</h3>--%>
            <div class="title-area clearfix">
              <h3 class="fleft">이메일 패스워드</h3>
              <div class="infor mt4">
                <span class="asterisk">필수입력항목 표시가 있는 항목은 필수 입력사항입니다.</span>
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
              <td class="th">이메일</td>
              <td>
                <div class="iptWrap">
                  <input type="email" class="ipt uiAct" title="이메일 입력" id="email"
                         name="email" placeholder="hanaGlobal@gmail.com">
                </div>
              </td>
            </tr>
            <tr>
              <td class="th">비밀번호</td>
              <td>
                <div class="iptWrap">
                  <input type="password" class="ipt uiAct"
                         title="비밀번호 입력" id="userPasswd" name="userPasswd">
                </div>
              </td>
            </tr>
            <tr>
              <td class="th">비밀번호 확인</td>
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
            <h2>계좌 비밀번호 설정</h2>
<%--            <h3 class="titH3">신청인 정보</h3>--%>
            <div class="title-area clearfix">
              <h3 class="fleft">계좌 정보</h3>
              <div class="infor mt4">
                <span class="asterisk">필수입력항목 표시가 있는 항목은 필수 입력사항입니다.</span>
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
              <td class="th">계좌 비밀번호</td>
              <td>
                <div class="iptWrap">
                  <input type="text" class="ipt uiAct" title="계좌비밀번호 설정" id="acPasswd"
                         name="acPasswd" maxlength="4">
                </div>
              </td>
            </tr>
            <tr>
              <td class="th">비밀번호 확인</td>
              <td>
                <div class="iptWrap" >
                  <input type="text" class="ipt uiAct" title="국적 입력" id="acPasswdConfirm"
                         name="acPasswdConfirm" maxlength="4">
                </div>
              </td>
            </tr>

            </tbody>
          </table>
        </section>
        <section class="certContain">
          <div class="btnArea" id="btnFclArea">
            <a href="/signUp_STEP2" id="btnCancel" class="btn_s">이전</a>
            <button type="submit" id="btnNext" class="btn_p">다음</button>
          </div>
        </section>
      </form>
    </div>
  </main>

</div>
</body>
</html>
