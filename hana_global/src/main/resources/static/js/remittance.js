document.getElementById('countrySearch').addEventListener('input', function () {
    const query = this.value.toLowerCase();
    const slides = document.querySelectorAll('.swiper-slide');
    for (let i = 0; i < slides.length; i++) {
        const countryName = slides[i].textContent.trim().toLowerCase();
        console.log(countryName);
        if (countryName.includes(query)) {
            // const adjustedIndex = i - 1;
            swiper.slideToLoop(i - 1, 500);  // 500ms의 속도로 해당 슬라이드로 이동합니다.
            break;
        }
    }
});


const swiper = new Swiper(".swiper-container", {
    slidesPerView: 2,
    slidesPerGroup: 1,
    centeredSlides: true,
    loop: true,
    direction: 'horizontal',
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    autoplay: {
        delay: 2000,
        disableOnInteraction: true,
    },
    pagination: {
        el: '.swiper-pagination',
        clickable: true,
    },
    // freeMode: true,
    // freeModeMomentum: true,
    // freeModeMomentumRatio: 0.5,
    breakpoints: {
        // when window width is >= 1500px
        1500: {
            slidesPerView: 3,
            slidesPerGroup: 1,
            spaceBetween: 5,
            centeredSlides: false
        },

        // when window width is >= 1800px
        1800: {
            slidesPerView: 6,
            slidesPerGroup: 6,
            spaceBetween: 5,
            centeredSlides: false
        }
    }
});
// 스와이프 멈추기
$('.swiper-slide').on('mouseover', function () {
    swiper.autoplay.stop();
});
$('.swiper-slide').on('mouseout', function () {
    swiper.autoplay.start();
});

// 결제 방식 선택 모달
const slides = document.querySelectorAll('.swiper-slide');

// 각 스와이퍼 슬라이드에 클릭 이벤트 리스너를 추가
slides.forEach(slide => {
    slide.addEventListener('click', () => {
        // 클릭하면 모달창을 표시합니다.
        document.querySelector('#myModal').style.display = 'block';
    });
});
// function closeModal() {
//     document.getElementById('myModal').style.display = 'none';
// }
// 모달창 외부를 클릭하면 모달창을 닫기
window.addEventListener('click', (event) => {
    const modal = document.querySelector('#myModal');
    if (event.target === modal) {
        modal.style.display = 'none';
    }
});


//=================================================
// 단계 별 구역 표시
// 초기 단계를 설정합니다.
// let currentStep = 1;
//
// // 각 단계의 구역을 배열에 저장합니다.
// let steps = [
//     document.querySelector('.selectCurAndPayment'),
//     document.querySelector('.compare_area'),
//     // document.querySelector('.recipient_info')
// ].filter(Boolean); // `null` 값 제거
//
// // 초기화 함수를 호출하여 첫 번째 단계만 표시합니다.
// function initialize() {
//     // 모든 단계를 숨깁니다.
//     steps.forEach(function (step) {
//         step.style.display = 'none';
//     });
//
//     // 첫 번째 단계만 표시합니다.
//     steps[0].style.display = 'block';
//     console.log("현재 스텝은 ", steps[0]);
// }
// initialize();
// // 다음 단계로 이동하는 함수를 정의.
// function nextStep() {
//     console.log(currentStep);
//     console.log(steps.length);
//     if (currentStep < steps.length) {
//         // 현재 단계를 숨기고 다음 단계를 표시.
//         console.log(steps[currentStep - 1]);
//         console.log(steps[currentStep]);
//         steps[currentStep - 1].style.display = 'none';
//         steps[currentStep].style.display = 'block';
//
//         currentStep++;
//         // 단계 번호를 증가.
//         console.log("증가한 현재 스텝은 ", currentStep);
//         console.log("증가한 현재 구역은 ", steps[currentStep]);
//     }
// }
//
// // 이전 단계로 돌아가는 함수를 정의.
// function prevStep() {
//     if (currentStep > 1) {
//         // 현재 단계를 숨기고 이전 단계를 표시.
//         steps[currentStep - 1].style.display = 'none';
//         steps[currentStep - 2].style.display = 'block';
//
//         // 단계 번호를 감소시킵니다.
//         currentStep--;
//     }
// }

// // "다음" 버튼에 이벤트 리스너를 연결하여 다음 단계로 이동합니다.
// document.getElementById('nextButton').addEventListener('click', nextStep);

// 환율계산 시작 ========================================================================

// 2단계 환율계산
const currencyUnits = {
    "AED": "dirham",
    "DZD": "dinar",
    "AUD": "dollar",
    "BHD": "dinar",
    "BDT": "taka",
    "BRL": "real",
    "BND": "dollar",
    "CAD": "dollar",
    "CLP": "peso",
    "CNY": "yuan",
    "COP": "peso",
    "CZK": "koruna",
    "DKK": "krone",
    "EGP": "pound",
    "EUR": "euro",
    "HKD": "dollar",
    "HUF": "forint",
    "INR": "rupee",
    "IDR": "rupiah",
    "ILS": "shekel",
    "JPY": "yen",
    "JOD": "dinar",
    "KES": "shilling",
    "KWD": "dinar",
    "KZT": "tenge",
    "KRW": "won",
    "LKR": "rupee",
    "MYR": "ringgit",
    "MXN": "peso",
    "MNT": "tugrik",
    "NZD": "dollar",
    "NOK": "krone",
    "OMR": "rial",
    "PKR": "rupee",
    "PLN": "złoty",
    "QAR": "riyal",
    "RUB": "ruble",
    "SAR": "riyal",
    "SEK": "krona",
    "SGD": "dollar",
    "ZAR": "rand",
    "CHF": "franc",
    "TZS": "shilling",
    "TRY": "lira",
    "GBP": "pound",
    "USD": "dollar",
    "VND": "dong"
};

// 환율 계산 함수

function calculateExchangeFromKRW(remittanceRate) {
    // ds_from_money 필드에서 원화 금액 가져오기
    const krwAmount = parseFloat(document.getElementById('ds_from_money').value.replace(/,/g, '')) || 0;
    const currencyCode = document.getElementById('currencyName').textContent;

    const targetAmount = (currencyCode === 'JPY' || currencyCode === 'VND') ?
        (krwAmount / remittanceRate) * 100 : krwAmount / remittanceRate;

    if (!isNaN(krwAmount)) {
        document.getElementById('ds_to_money').value = formatNumber(targetAmount.toFixed(2));

        const currencyName = currencyUnits[currencyCode] || currencyCode;
        document.getElementById('sourceCurrencyName').textContent = formatNumber(krwAmount) + ' won';
        document.getElementById('targetCurrencyName').textContent = formatNumber(targetAmount.toFixed(2)) + ' ' + currencyName;
    }
}

function calculateExchangeToKRW(remittanceRate) {
    const foreignAmount = parseFloat(document.getElementById('ds_to_money').value.replace(/,/g, '')) || 0;
    const currencyCode = document.getElementById('currencyName').textContent;

    const krwAmount = (currencyCode === 'JPY' || currencyCode === 'VND') ?
        (foreignAmount * remittanceRate) / 100 : foreignAmount * remittanceRate;

    if (!isNaN(foreignAmount)) {
        document.getElementById('ds_from_money').value = formatNumber(krwAmount.toFixed(2));
        const currencyName = currencyUnits[currencyCode] || currencyCode;
        document.getElementById('sourceCurrencyName').textContent = formatNumber(krwAmount) + ' won';
        document.getElementById('targetCurrencyName').textContent = formatNumber(foreignAmount.toFixed(2)) + ' ' + currencyName;
    }
}

document.getElementById('ds_from_money').addEventListener('input', function() {
    const currencyCode = document.getElementById('currencyName').textContent;
    const remittanceRate = selectCurrency(currencyCode);
    calculateExchangeFromKRW(remittanceRate);
});

document.getElementById('ds_to_money').addEventListener('input', function() {
    const currencyCode = document.getElementById('currencyName').textContent;
    const remittanceRate = selectCurrency(currencyCode);
    calculateExchangeToKRW(remittanceRate);
});

function formatNumber(num) {
    return num.toLocaleString('en-US');
}

function selectCurrency(currencyCode) {
    const rateInfo = exchangeRates[currencyCode];
    if (rateInfo) {
        return rateInfo.remittance;
    } else {
        console.error("환율 정보를 찾을 수 없습니다");
        return null;
    }
}

// function calculateExchange(remittanceRate) {
//     // ds_from_money 필드에서 원화 금액 가져오기
//     const krwAmount = parseFloat(document.getElementById('ds_from_money').value) || 1;
//     const currencyCode = document.getElementById('currencyName').textContent;
//     let targetAmount;
//
//     if (currencyCode === 'JPY' || currencyCode === 'VND') {
//         targetAmount = (krwAmount / remittanceRate) * 100;
//     } else {
//         targetAmount = krwAmount / remittanceRate;
//     }
//     console.log("현재 입력된 원화는 ", krwAmount);
//
//     if (!isNaN(krwAmount)) {
//         // 금액이 유효하면 환율 계산
//         // const targetAmount = krwAmount / remittanceRate;
//         // 결과를 ds_to_money 필드에 표시
//         // document.getElementById('ds_to_money').value = targetAmount.toFixed(2);
//         document.getElementById('ds_to_money').value = formatNumber(targetAmount.toFixed(2));
//
//         // 통화의 이름과 금액을 targetCurrencyName 필드에 표시
//         const currencyCode = document.getElementById('currencyName').textContent;
//         const currencyName = currencyUnits[currencyCode] || currencyCode;
//         console.log("현재 입력된 통화이름 ", currencyName);
//         // document.getElementById('targetCurrencyName').textContent = targetAmount.toFixed(2) + ' ' + currencyName;
//         document.getElementById('sourceCurrencyName').textContent = formatNumber(krwAmount) + ' won';
//         document.getElementById('targetCurrencyName').textContent = formatNumber(parseFloat(targetAmount.toFixed(2))) + ' ' + currencyName;
//         // document.getElementById('targetCurrencyName').textContent = formatNumber(targetAmount.toFixed(2)) + ' ' + currencyName;
//
//     }
// }
//
// function selectCurrency(currencyCode) {
//     // 국가의 환율 정보 가져오기
//     const rateInfo = exchangeRates[currencyCode];
//     console.log("선택된국가의 환율은 ", rateInfo);
//     if (rateInfo) {
//         // 환율 정보가 있으면 환율 계산을 위해 이 정보를 사용
//         console.log("선택된국가의 송금환율은 ", rateInfo.remittance);
//         calculateExchange(rateInfo.remittance);
//         return rateInfo.remittance;  // remittanceRate 반환
//     } else {
//         console.error("환율 정보를 찾을 수 없습니다");
//         return null;
//     }
// }
//
// // ds_from_money 필드의 input 이벤트에 대한 리스너 추가
// document.getElementById('ds_from_money').addEventListener('input', function () {
//     // 사용자가 입력할 때마다 환율 계산 실행
//     const currencyCode = document.getElementById('currencyName').textContent;
//     console.log("통화코드는 ", currencyCode);
//     selectCurrency(currencyCode);
// });
//
//
// // ds_from_money 필드의 input 이벤트에 대한 리스너 추가
// document.getElementById('ds_from_money').addEventListener('input', function() {
//     const krwAmount = document.getElementById('ds_from_money').value.replace(/,/g, '');
//     // const targetAmount = document.getElementById('ds_to_money').value.replace(/,/g, '');
//     document.getElementById('ds_from_money').value = formatNumber(krwAmount);
//     // document.getElementById('ds_to_money').value = formatNumber(targetAmount);
//     const currencyCode = document.getElementById('currencyName').textContent;
//     console.log("통화코드는 ", currencyCode);
//     selectCurrency(currencyCode);
// });
//
// // ds_to_money 필드 input 이벤트
// document.getElementById('ds_to_money').addEventListener('input', function() {
//     // ds_to_money 필드에서 타겟 통화 금액 가져오기
//     const foreignAmount = parseFloat(this.value.replace(/,/g, '')) || 0;
//     const currencyCode = document.getElementById('currencyName').textContent;
//     const remittanceRate = selectCurrency(currencyCode);  // selectCurrency로부터 remittanceRate를 가져옵니다.
//
//     if (!remittanceRate) {
//         console.error("송금 환율 정보를 가져오는데 실패했습니다.");
//         return;
//     }
//     let krwAmount;
//
//     if (currencyCode === 'JPY' || currencyCode === 'VND') {
//         krwAmount = (foreignAmount * remittanceRate) / 100;
//     } else {
//         krwAmount = foreignAmount * remittanceRate;
//     }
//
//     // 금액이 유효하면 원화로의 환율 계산
//     if (!isNaN(foreignAmount)) {
//         // 결과를 ds_from_money 필드에 표시
//         document.getElementById('ds_from_money').value = formatNumber(krwAmount.toFixed(2));
//
//         // 원화 금액을 sourceCurrencyName 필드에 표시
//         document.getElementById('sourceCurrencyName').textContent = formatNumber(parseFloat(krwAmount.toFixed(2))) + ' won';
//     }
// });
//
//
// // 숫자 포맷
// function formatNumber(num) {
//     return num.toLocaleString('en-US');
// }


// 환율계산 끝========================================================================

// 결제 창 보이기 및 환전 =============================================================
// 3단계 결제창과 결제방식 미리보기
function calculateAndPreviewPayment() {
    // Source에서 입력된 금액 및 통화를 가져옴.
    const sourceAmount = parseFloat(document.getElementById("ds_to_money").value);
    const sourceCurrencyImageSrc = document.querySelector('.nation').src; //
    const targetCurrencyCode = document.querySelector("#currencyName").textContent; //원화코드
    // const countryName = currencyNames[sourceCurrencyCode];
    const countryName = document.getElementById('countryName').textContent;

    document.querySelector(".previewPayment").style.display = "block";
    const previewPayment = document.querySelector('.previewPayment');
    previewPayment.scrollIntoView({behavior: "smooth"});
    previewPayment.classList.add('focusArea');
    // Target에서의 계산된 금액을 가져옵니다. (금액의 콤마를 제거)
    const targetAmount = parseFloat(document.getElementById("ds_from_money").value.replace(/,/g, ""));

    // 5000원의 수수료를 추가하고 10의 단위로 반올림
    // const finalAmountWithoutDecimal = Math.round(targetAmount);
    const finalAmountWithoutDecimal = Math.floor(targetAmount * 100) / 100;
    const adjustedAmount = finalAmountWithoutDecimal + 5000; // 수수료 5천원
    const finalAmount = Math.round(adjustedAmount / 10) * 10;


    // previewPayment 영역을 업데이트
    const previewElem = document.querySelector(".previewPayment .banking-cont table tbody");
    console.log("타겟코드 ", targetCurrencyCode);
    console.log("나라이름 ", countryName);
    previewElem.querySelector("tr:nth-child(1) .txt img").src = sourceCurrencyImageSrc;
    previewElem.querySelector("tr:nth-child(1) .txt em.currency").textContent = countryName + " " + targetCurrencyCode;
    previewElem.querySelector("tr:nth-child(1) .txt em.price").textContent = sourceAmount.toFixed(0);
    previewElem.querySelector("tr:nth-child(3) .txt em.point").textContent = finalAmount.toLocaleString();

    //  결제 방식을 동적으로 설정할 수 있는 로직을 추가
    const selectedOption = document.getElementById("selectAccountForm").value;
    const paymentMethodText = document.querySelector(".previewPayment .banking-cont table tbody tr:nth-child(4) .txt");

    // 계산된 값을 hidden input 필드에 설정
    // document.getElementById("targetCurrencyCode").value = targetCurrencyCode; // 외화
    // document.getElementById("hiddenSourceAmount").value = sourceAmount.toFixed(0); // 외화 금액
    // document.getElementById("hiddenFinalAmount").value = finalAmount; // 원화 결제할 금액
}

// 계좌선택시 잔액 표시
function displayBalance() {
    let selectElement = document.getElementById('selectAccountForm');
    let selectedOption = selectElement.options[selectElement.selectedIndex];
    console.log("선택된 계좌는 ", selectedOption);
    let balance = selectedOption.getAttribute('data-balance');
    // 숫자 포맷팅
    let balanceNumber = parseFloat(balance);
    let formattedBalance = formatNumber(balanceNumber);
    // 잔액을 표시할 span 엘리먼트를 찾아서 잔액을 설정
    let balanceDisplayElement = document.getElementById('balanceDisplay');
    let balanceRow = document.getElementById('balanceRow');  // 잔액 표시 tr
    let passwordRow = document.getElementById('passwordRow');  // 비밀번호 표시 tr
    let balanceThElement = balanceRow.querySelector('th');

    if (selectElement.value) {
        balanceDisplayElement.textContent = formattedBalance;
        balanceRow.style.display = '';
        passwordRow.style.display = '';

        let paymentAmountStr = document.getElementById('paymentAmount').innerText.replace(/,/g, '');
        let paymentAmount = parseFloat(paymentAmountStr);

        if (balanceNumber < paymentAmount) {
            balanceThElement.innerHTML = 'Available Withdrawal <img src="./images/red_warning_icon.png" alt="Warning Icon" style="vertical-align: middle; width: 27px; height: 27px;"><span style="color: red;">Insufficient Funds</span>';
        } else {
            balanceThElement.innerHTML = 'Available Withdrawal <img src="./images/green_check_icon.png" alt="Check Icon" style="vertical-align: middle; width: 27px; height: 27px;">';
        }
    } else {
        balanceRow.style.display = 'none';
        passwordRow.style.display = 'none';
    }

    const buttonArea = document.querySelector('.btn-area2');
    console.log(buttonArea);
    buttonArea.style.display = 'block';
}

// 결제 창 보이기 및 환전금액 계산

// 수취인 정보 입력 시작 =====================================================
// function nextStep(event) {
//     event.preventDefault();
//     let recipientDiv = document.getElementById('recipientDiv');
//     let compareArea = document.querySelector('.compare_area');
//     let bankAccountInfo = document.getElementById('bankAccountInfo');  // 이제 id를 사용하여 선택합니다.
//     let receiptPlaceInfo = document.getElementById('receiptPlaceInfo');  // 이제 id를 사용하여 선택합니다.
//
//     recipientDiv.style.display = 'block';
//     compareArea.style.display = 'none';
//     if (selectedPaymentMethod === 'selectAccount') {
//         bankAccountInfo.style.display = 'block';
//         receiptPlaceInfo.style.display = 'none';
//     } else if (selectedPaymentMethod === 'selectWesternUnion') {
//         bankAccountInfo.style.display = 'none';
//         receiptPlaceInfo.style.display = 'block';
//     }
// }


function proceedToNextStep() {
    let recipientDiv = document.getElementById('recipientDiv');
    let compareArea = document.querySelector('.compare_area');
    let bankAccountInfo = document.getElementById('bankAccountInfo');
    let receiptPlaceInfo = document.getElementById('receiptPlaceInfo');

    recipientDiv.style.display = 'block';
    compareArea.style.display = 'none';
    if (selectedPaymentMethod === 'selectAccount') {
        bankAccountInfo.style.display = 'block';
        receiptPlaceInfo.style.display = 'none';
    } else if (selectedPaymentMethod === 'selectWesternUnion') {
        bankAccountInfo.style.display = 'none';
        receiptPlaceInfo.style.display = 'block';
    }
}




// 수취인 정보 입력 끝 =====================================================



// function toggleRateInfo() {
//     let rateInfo = document.querySelector('.showExchangeRate');
//     let arrow = document.querySelector('.arrow');
//     let toggleText = document.querySelector('.toggleText');
//
//     if(rateInfo.classList.contains('open')) {
//         rateInfo.classList.remove('open');
//         arrow.innerHTML = '&#9660;'; // 아래쪽 화살표로 변경
//         toggleText.textContent = 'open'; // 텍스트를 '보기'로 변경
//     } else {
//         rateInfo.classList.add('open');
//         arrow.innerHTML = '&#9650;'; // 위쪽 화살표로 변경
//         toggleText.textContent = 'close'; // 텍스트를 '닫기'로 변경
//     }
// }

// 이메일 보내기 시작 =====================================
// function sendEmail() {
//     var selectedValue = document.querySelector('input[name="remittanceRadio"]:checked').value;
//     var details = remittanceList.find(remittance => remittance.remitSeq.toString() === selectedValue);
//
//     if (details) {
//         getCountryName(details.currencyCode).then(countryName => {
//             var emailContent = `
//                 <html>
//                 <head>
//                     <style>
//                         .modal-content {
//     background-color: #f9f9f9; /* 모달 배경색 */
//     border-radius: 8px; /* 모달 모서리 둥글게 */
// }
//
// .modal-header {
//     background-color: #007BFF; /* 헤더 배경색 */
//     color: white; /* 헤더 텍스트 색상 */
// }
//
// .modal-footer {
//     background-color: #e9ecef; /* 푸터 배경색 */
// }
//
// .modal-body {
//     padding: 20px; /* 본문 패딩 */
//     font-size: 1rem; /* 폰트 크기 */
//     line-height: 1.5; /* 라인 높이 */
// }
//
// .modal-details {
//     margin-bottom: 10px; /* 상세 정보 마진 */
// }
//
// .btn-secondary {
//     background-color: #007BFF; /* 버튼 색상 */
// }
//
// .modal-details-title {
//     font-weight: bold; /* 상세 정보 제목 볼드 */
//     margin-bottom: 5px; /* 상세 정보 제목 마진 */
// }
//
// .modal-details-content {
//     margin-left: 10px; /* 상세 정보 내용 마진 */
// }
//                     </style>
//                 </head>
//                 <body>
//                     <div class="modal-details">
//                         <div class="modal-details-title">[${details.status == 'W' ? '송금 진행 중' : details.status == 'N' ? '수취 대기' : '수취 완료'}]</div>
//                         <div class="modal-details-content">
//                             <p>Remittance Information</p>
//                             <p>MTCN: ${details.remitSeq}</p>
//                             <p>Sender: ${details.sender}</p>
//                             <p>Sender's Country: South of Korea</p>
//                             <p>Remittance Amount: ${details.currencyCode} ${details.receivableAmount}</p>
//                         </div>
//                         <div class="modal-details-title">Recipient Information</div>
//                         <div class="modal-details-content">
//                             <p>Recipient: ${details.recipient}</p>
//                             <p>Recipient's Country: ${countryName || 'Unknown'}</p>
//                         </div>
//                     </div>
//                 </body>
//                 </html>
//             `;
//
//             $.ajax({
//                 url: '/send-email',  // 'send-email' endpoint를 서버에서 설정해야 합니다.
//                 type: 'POST',
//                 contentType: 'application/json',
//                 data: JSON.stringify({ content: emailContent, to: 'njk116@naver.com', subject: 'Remittance Details' }),
//                 success: function(response) {
//                     alert('Email sent successfully');
//                 },
//                 error: function(error) {
//                     alert('Failed to send email');
//                 }
//             });
//         });
//     }
// }

// 이메일 보내기 끝 =====================================