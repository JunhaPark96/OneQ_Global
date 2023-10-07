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
    document.getElementById('loadAmount').value = amount;
}

// document.getElementById("loadWallet").addEventListener("click", function() {
//     // 이 위치에서 walletSeq 값을 다시 가져옵니다.
//     let walletSeq = document.getElementById("myModal").getAttribute("data-wallet-id");
//
//     let loadAmount = document.getElementById('loadAmount').value;
//     const walletPasswd = document.getElementById('walletPasswd').value;
//
//     // loadAmount를 정수로 변환
//     loadAmount = parseInt(loadAmount, 10);
//
//     // NaN 확인 (parseInt에서 유효하지 않은 값이 입력되면 NaN을 반환합니다)
//     if (isNaN(loadAmount)) {
//         alert("Please Check loadAmount again.");
//         return;
//     }
//
//     $.ajax({
//         url: "/loadWallet",
//         method: "POST",
//         data: {
//             loadAmount: loadAmount, // 이제 loadAmount는 정수
//             walletPasswd: walletPasswd,
//             walletSeq: walletSeq  // 추가된 월렛 ID
//         },
//         success: function(response) {
//             alert(response); // "충전 성공!" 또는 서버에서 반환된 다른 메시지를 표시
//             closeModal();
//             location.reload(); // 월렛 정보를 업데이트하기 위해 페이지를 다시 로드
//         },
//         error: function(jqXHR) {
//             alert(jqXHR.responseText); // 서버에서 반환된 에러 메시지를 표시
//         }
//     });
// });
