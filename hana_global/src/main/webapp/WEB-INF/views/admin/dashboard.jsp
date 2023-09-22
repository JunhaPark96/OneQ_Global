<%@ page import="com.kopo.hanaglobal.hana_global.web.entity.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>대시보드</title>

  <link href="./css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
  <link href="./css/header.css" rel="stylesheet"/>
  <link href="./css/TTF.css" rel="stylesheet"/>
  <link href="./css/profile.css" rel="stylesheet">
  <script src="./js/main.js"></script>
</head>
<body>
<div class="main-container">
  <%@ include file="/WEB-INF/views/includes/header.jsp" %>
  <div class="main-area">
    <%@ include file="/WEB-INF/views/includes/mem_sidebar.jsp" %>
    <div class="main-body">
      <div class="main-wrapper">

        <div class="user-info">
          user
        </div>

        <div class="main-info">
          <div class="row justify-content-start">
            <div class="col-md-4 gradient-custom text-center text-black">
            </div>
            <div class="col-md-10 ">
              <div class="card-body pe-5">
                <div class="row">
                  <div class="col-12">
                    <h5>Linked Account</h5>
                    <h6>Hana Bank</h6>
                  </div>
                  <div class="account-image">
                    <div class="myAccount"></div>
                  </div>
                </div>
                <hr class="mt-0 mb-3">
                <div class="col-grid">
                  <div class="grid-left">
                    <div class="row" >
                      <div class="text-start">Depositor name
                        <h6> ${currentMember.name}</h6>
                      </div>

                    </div>
                    <div class="row" >
                      <div class="text-start">Account Number
                        <h6> 1110312422</h6>
                      </div>

                    </div>
                  </div>
                  <div class="col grid-right">
                    <div class="row">
                      <div class="text-start">Account Type
                        <h6 > 주거래</h6>
                      </div>

                    </div>
                    <div class="row">
                      <div class="text-start">Account Balance
                        <h6> asd</h6>
                      </div>

                    </div>
                  </div>

                </div>
              </div>
              <div class="modify-wrapper">
                <div class="locRight">
                  Modify
                </div>
              </div>
            </div>
          </div>
        </div>


        <div class="exchange-info">
          exchange
        </div>

        <div class="remittance-info">
          remittance
        </div>
      </div>
    </div>

  </div>
</div>
<footer>
  dd
</footer>
</div>
</body>
</html>