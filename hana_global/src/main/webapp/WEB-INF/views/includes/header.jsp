<%@ page import="com.kopo.hanaglobal.hana_global.web.vo.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<%
    MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
%>
<div class="header">
    <div class="logo">
        <a href="/">
            <img src="./images/hana_logo.png" class="hana_logo" alt="하나로고">
        </a>
    </div>
    <div class="login-box">
        <% if (loginUser == null) { %>
        <div class="signin">Signin</div>
        <div class="signup">Signup</div>
        <% } else { %>
        <div class="signin">MyProfile</div>
        <div class="signup">SignOut</div>
        <% } %>
    </div>
    <div class="language">
        <select id="language-select">
            <option value="en">English</option>
            <option value="ko">Korean</option>
            <!-- 기타 필요한 언어를 여기에 추가 -->
        </select>
    </div>
</div>
</body>
</html>