<%--
&lt;%&ndash;
  Created by IntelliJ IDEA.
  User: JUNHA
  Date: 2023-08-25
  Time: 오후 5:03
  To change this template use File | Settings | File Templates.
&ndash;%&gt;
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>로그인 모달</title>
    <style>
        .modal {
            /* 여기에 모달에 대한 CSS를 작성하십시오. */
        }
        .loginModal {
            /* 여기에 loginModal에 대한 CSS를 작성하십시오. */
        }
        .close {
            width: 40px;
            height: 40px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-title {
            font-family: "Hana2-Heavy";
            font-size: 22px;
            color: black;
        }
        .modalContents {
            margin-top: 10px;
        }
        .input-form {
            /* 여기에 input-form에 대한 CSS를 작성하십시오. */
        }
        .loginBtn {
            /* 여기에 loginBtn에 대한 CSS를 작성하십시오. */
        }
        .link-text-container {
            width: 350px;
            text-align: right;
            padding-right: 20px;
        }
        .link-to-register {
            /* 여기에 link-to-register에 대한 CSS를 작성하십시오. */
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="modal">
    <div class="loginModal">
        <div class="close">
            <img src="path_to_CloseBtn_image" alt="close button" width="20" height="20" onclick="closeModal()">
        </div>
        <div class="login-title">로그인</div>

        <div class="modalContents">
            <input name="id" class="input-form" type="text" placeholder="아이디" id="idInput">
            <input name="password" class="input-form" type="password" placeholder="비밀번호" id="passwordInput">
            <button class="loginBtn" onclick="loginFunction()">로그인</button>
            <div class="link-text-container">
                <div onclick="openSignUp()" class="link-to-register">회원가입</div>
            </div>
        </div>
    </div>
</div>
<!-- SignIn 모달을 HTML 형식으로 여기에 추가하십시오. -->

<script>
    const modal = document.getElementById("modal");
    const openModalBtn = document.getElementById("open-modal");
    const closeModalBtn = document.getElementById("close-modal");
    // 이 곳에 closeModal, loginFunction, openSignUp 등의 자바스크립트 함수를 정의하십시오.
    function closeModal() {
        // 모달 닫기 로직
    }
    closeModalBtn.addEventListener("click", () => {
        modal.style.display = "none";
        document.body.style.overflow = "auto"; // 스크롤바 보이기
    });

    function loginFunction() {
        var email = document.getElementById('idInput').value;
        var password = document.getElementById('passwordInput').value;
        // 로그인 처리 로직 (JSP와의 통신 등)
    }

    function openSignUp() {
        // 회원가입 모달을 여는 로직
    }
</script>
</body>
</html>
--%>
