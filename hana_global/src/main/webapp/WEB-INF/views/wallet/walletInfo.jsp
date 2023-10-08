<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- format 태그 라이브러리--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
            crossorigin="anonymous"></script>

    <script src="./js/wallet.js"></script>
    <link href="./css/service-main.css" rel="stylesheet"/>
    <link href="./css/nav.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/wallet/walletInfo.css" rel="stylesheet"/>
    <link href="./css/wallet/flags.css" rel="stylesheet"/>

    <title>월렛 확인</title>
</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="main-area">
        <%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
        <div class="main-body">
            <h2>View Wallets</h2>
            <div class="row justify-content-start">
                <div class="col-md-4 gradient-custom text-center text-black">
                </div>
                <div class="col-md-6 ">
                    <div class="card-body pe-5">
                        <div class="row">
                            <div class="col-5">
                                <h6>Linked Account</h6>
                                <h6>Hana Bank</h6>
                            </div>
                            <div class="account-image">
                                <div class="myAccount"></div>
                            </div>
                        </div>
                        <hr class="mt-0 mb-3">
                        <div class="col-grid">
                            <div class="grid-left">
                                <div class="row" style="height: 50px">
                                    <div class="col ">
                                        <h6 >Depositor name
                                        </h6>
                                            <p class="text-bold"> ${currentMember.name}</p>
                                    </div>
                                </div>

                            </div>
                            <div class="col grid-right">
                                <div class="col">
                                    <h6 class="text-start">Account Number</h6>
                                    <p class="text-muted">${selectedWallet.acNo.substring(0, 3)}-${selectedWallet.acNo.substring(3, 9)}-${selectedWallet.acNo.substring(9, 14)}</p>
                                    <div class="locRight">
                                        Modify
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<%--            <div class="account">--%>
<%--                <div class="accountWrap">--%>
<%--                    <div class="account-header">--%>
<%--                        연결계좌--%>
<%--                    </div>--%>
<%--                    <div class="account-content">--%>
<%--                        <h4>하나은행</h4>--%>
<%--                    </div>--%>
<%--                    <div class="account-footer">--%>
<%--                        <div class="accountNo">--%>
<%--                            ${walletList[0].acNo}--%>
<%--                        </div>--%>
<%--                        <div class="locRight">--%>
<%--                            변경--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
            <!-- 원화 (KRW) 월렛 구역 -->
            <c:if test="${walletList[0].currencyCode eq 'KRW'}">
                <div class="walletCell" data-currency="KRW" style="grid-row: 3;">
                    <div class="walletCard">
                        <div class="cardHeader">
                            <h4>Hana Wallet</h4>
                            <button class="loadBtn" onclick="openModal(${walletList[0].walletSeq})">Load</button>
                        </div>
                        <div class="cardElem1" style="height: 56%;">
                            <a href="${pageContext.request.contextPath}/accountInfo">
                                <fmt:formatNumber value="${walletList[0].balance}" type="number" pattern="#,##0"/>
                                &nbsp; ${walletList[0].currency}
                            </a>

                        </div>
                        <div class="cardElem3">
                            <div class="btn_p">
                                <a href="${pageContext.request.contextPath}/doExchange">Exchange</a>
                            </div>
                            <div class="btn_s">
                                <a href="/overseaRemittance">Remittance</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>

            <!-- 나머지 외화 월렛 구역 -->
            <c:forEach items="${walletList}" var="wallet" varStatus="loop" begin="1">
                <div class="walletCell" data-currency="${wallet.currencyCode}" style="grid-row: ${3 + Math.ceil((loop.index + 1) / 3.0)};">
                    <div class="walletCard">
                        <div class="cardHeader">
                            <h4>Hana Wallet</h4>
                        </div>
                        <div class="cardElem1">
                            <a href="${pageContext.request.contextPath}/accountInfo">
                                <fmt:formatNumber value="${wallet.balance}" type="number" pattern="#,##0"/>
                                &nbsp; ${wallet.currency}
                            </a>

                        </div>
                        <div class="cardElem2">
                            <a href="${pageContext.request.contextPath}/recurExchange?currency=${wallet.currencyCode}"> recurring exchange ></a>
                        </div>
                        <div class="cardElem3">
                            <div class="btn_p">
                                <a href="${pageContext.request.contextPath}/doExchange?selectedCurrency=${wallet.currencyCode}">Exchange</a>
                            </div>
                            <div class="btn_s">
                                <a href="/overseaRemittance">Remittance</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <footer>
        </footer>
    </div>
    <%--    모달 창 구역 --%>
    <div id="myModal" class="modalContainer">
        <div class="modal-content">
            <div class="modal-header">
                <div class="authenticateHeader">Load Wallet</div>
                <span class="close" onclick="closeModal()">&times;</span>
            </div>

            <div class="modal-main">
                <div class="mdiptWrap">
                    <div class="input-group">
                        <label>Amount </label>
                    </div>
                    <div>
                        <input type="text" class="" maxlength="20"
                               title="Name" id="loadAmount" value=""
                               name="loadAmount">
                    </div>
                    <div class="btn-amount">
                        <button type="button"
                                class="btn   border-1  me-2 pushButton border-2"
                                onclick="selectAmount('10000')">10,000
                        </button>
                        <button type="button"
                                class="btn  border-1  me-2 pushButton border-2"
                                onclick="selectAmount('50000')">50,000
                        </button>
                        <button type="button"
                                class="btn border-1  me-2 pushButton border-2"
                                onclick="selectAmount('100000')">100,000
                        </button>
                        <button type="button"
                                class="btn  border-1  me-2 pushButton border-2"
                                onclick="selectAmount('1000000')">1,000,000
                        </button>
                    </div>
                    <h6>Minimum 1000 won ~ Maximum 1,000,000 won</h6>

                    <div class="input-group">
                        <label>Simple Password </label>
                    </div>
                    <div>
                        <input type="password" class="" maxlength="6"
                               placeholder="000000" title="간편 비밀번호 입력"
                               id="walletPasswd" value=""
                               name="walletPasswd">
                    </div>
                </div>
                <div class="modal-footer">
                        <button id="loadWallet" class="loadWallet" >
                            Load
                        </button>
                </div>
            </div>
        </div>
    </div>
<%--    모달 창 끝--%>

<%--    비밀번호 설정 모달 시작--%>
    <!-- Password Modal -->
    <div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="passwordModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="passwordModalLabel">Set New Password</h5>
                    <!-- 모달 닫기 버튼 제거
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                    -->
                </div>
                <h6 id="passwordPrompt">To use wallet services, you need to set a password for the first time.</h6>

                <div class="modal-body" style="width: 100%">
                        <div class="password-panel text-center mb-3">
                            <div class="password-dots">
                                <div class="dot"></div>
                                <div class="dot"></div>
                                <div class="dot"></div>
                                <div class="dot"></div>
                                <div class="dot"></div>
                                <div class="dot"></div>
                            </div>
                            <input type="password" class="form-control" id="paymentPassword" hidden="hidden"
                                   readonly>
                        </div>
                        <div class="keypad">
                            <button class="btn btn-light keypad-btn" data-value="1">1</button>
                            <button class="btn btn-light keypad-btn" data-value="2">2</button>
                            <button class="btn btn-light keypad-btn" data-value="3">3</button>
                            <button class="btn btn-light keypad-btn" data-value="4">4</button>
                            <button class="btn btn-light keypad-btn" data-value="5">5</button>
                            <button class="btn btn-light keypad-btn" data-value="6">6</button>
                            <button class="btn btn-light keypad-btn" data-value="7">7</button>
                            <button class="btn btn-light keypad-btn" data-value="8">8</button>
                            <button class="btn btn-light keypad-btn" data-value="9">9</button>
                            <button class="btn btn-danger keypad-btn-delete">C</button>
                            <button class="btn btn-light keypad-btn" data-value="0">0</button>
                            <button class="btn btn-light keypad-btn-delete">⬅</button>
                        </div>
                </div>
                <div class="modal-footer" style="width: 100%">
                    <button type="button" class="btn btn-primary" id="confirmPayment" style="background-color: #018085">확인</button>
                </div>
            </div>
        </div>
    </div>

<%--    비밀번호 설정 모달 끝--%>
</div>
</body>
<%--비밀번호 설정 스크립트 --%>
<script>
    <c:if test="${showPasswordModal}">
    $(document).ready(function() {
        $("#passwordModal").modal('show');
    });
    </c:if>

    $(document).ready(function() {
        let tempPassword = "";  // 비밀번호를 임시로 저장할 변수
        $('#confirmPayment').on('click', function() {
            let currentPasswordVal = $('#paymentPassword').val();

            if (currentPasswordVal.length !== 6) {
                alert("6자리 비밀번호를 모두 입력해주세요.");
                return;
            }
            // 첫 번째 입력인 경우
            if (tempPassword == "") {
                tempPassword = currentPasswordVal;  // 첫 번째 입력값 저장
                $('#paymentPassword').val('');  // 입력 필드 초기화
                updateDots('');  // dot도 초기화
                $('#passwordPrompt').text('Please enter your password again to confirm.');
            }
            // 두 번째 입력인 경우
            else {
                if (tempPassword == currentPasswordVal) {
                    $.ajax({
                        type: "POST",
                        url: "/changeWalletPassword",
                        data: {
                            walletPw: tempPassword,
                        },
                        success: function(response) {
                            // 서버에서 성공 응답을 받았을 때 수행할 코드
                            $("#passwordModal").modal('hide');  // 모달 창 닫기
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            // 서버에서 에러 응답을 받았을 때 수행할 코드
                            alert("An error occurred while setting the password. Please try again.");
                        }
                    });
                    alert("Password setting is complete.");
                    $("#passwordModal").modal('hide');  // 모달 창 닫기
                } else {
                    alert("Passwords do not match. Please enter again.");
                    tempPassword = "";  // 임시 저장된 비밀번호 초기화
                    $('#paymentPassword').val('');  // 입력 필드 초기화
                    updateDots('');  // dot도 초기화
                }
            }
        });

        // 숫자 버튼 클릭 이벤트
        $('.keypad-btn').on('click', function() {
            console.log('Number button clicked:', $(this).data('value'));
            let currentVal = $('#paymentPassword').val();
            // 6자리가 넘지 않도록 설정
            if (currentVal.length < 6) {
                let newVal = currentVal + $(this).data('value');
                $('#paymentPassword').val(newVal);
                updateDots(newVal);
            }
        });

        // ⬅ 버튼 클릭 이벤트
        $('.keypad-btn-delete').on('click', function() {
            console.log('Backspace button clicked');
            let currentVal = $('#paymentPassword').val();
            let newVal = currentVal.slice(0, -1);
            $('#paymentPassword').val(newVal);
            updateDots(newVal);
        });

        // C 버튼 클릭 이벤트
        $('.btn-danger.keypad-btn-delete').on('click', function() {
            console.log('Clear button clicked');
            $('#paymentPassword').val('');
            updateDots('');
        });

        function updateDots(val) {
            $('.dot').removeClass('dot-filled');
            for (let i = 0; i < val.length; i++) {
                $('.dot').eq(i).addClass('dot-filled');
            }
        }

    });


</script>
<%--비밀번호 설정 스크립트 끝--%>
<script>
    // 모달 열기 함수
    function openModal(walletSeq) {
        document.getElementById("myModal").setAttribute("data-wallet-id", walletSeq); // 월렛 지정
        document.getElementById("myModal").style.display = "block";
        document.getElementById('loadAmount').value = null;
        document.getElementById('walletPasswd').value = null;
    }

    // 모달 닫기 함수
    function closeModal() {
        document.getElementById("myModal").style.display = "none";
    }

    // 금액 선택
    function selectAmount(amount) {
        const inputField = document.getElementById('loadAmount');
        // 현재 입력값을 가져오기
        let currentAmount = parseInt(inputField.value, 10);
        // NaN일 경우 0으로 초기화
        if (isNaN(currentAmount)) {
            currentAmount = 0;
        }
        // 기존 값에 새로운 값을 더하기
        const newAmount = currentAmount + parseInt(amount, 10);
        inputField.value = newAmount;
    }


    document.getElementById("loadWallet").addEventListener("click", function() {
        // 이 위치에서 walletSeq 값을 다시 가져옴
        let walletSeq = document.getElementById("myModal").getAttribute("data-wallet-id");

        let loadAmount = document.getElementById('loadAmount').value;
        const walletPasswd = document.getElementById('walletPasswd').value;

        // loadAmount를 정수로 변환
        loadAmount = parseInt(loadAmount, 10);

        // NaN 확인 (parseInt에서 유효하지 않은 값이 입력되면 NaN을 반환합니다)
        if (isNaN(loadAmount)) {
            alert("Please Check Load Amount again.");
            return;
        }

        $.ajax({
            url: "/loadWallet",
            method: "POST",
            data: {
                loadAmount: loadAmount, // 이제 loadAmount는 정수
                walletPasswd: walletPasswd,
                walletSeq: walletSeq  // 추가된 월렛 ID
            },
            success: function(response) {
                alert(response); // "충전 성공!" 또는 서버에서 반환된 다른 메시지를 표시
                closeModal();
                location.reload(); // 월렛 정보를 업데이트하기 위해 페이지를 다시 로드.
            },
            error: function(jqXHR) {
                alert(jqXHR.responseText); // 서버에서 반환된 에러 메시지를 표시
            }
        });
    });

</script>
</html>
