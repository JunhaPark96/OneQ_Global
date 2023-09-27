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

// 환율 계산 함수
function calculateExchange(remittanceRate) {
    // ds_from_money 필드에서 원화 금액 가져오기
    const krwAmount = parseFloat(document.getElementById('ds_from_money').value) || 1;
    const currencyCode = document.getElementById('currencyName').textContent;
    let targetAmount;

    if (currencyCode === 'JPY' || currencyCode === 'VND') {
        targetAmount = (krwAmount / remittanceRate) * 100;
    } else {
        targetAmount = krwAmount / remittanceRate;
    }
    console.log("현재 입력된 원화는 ", krwAmount);

    if (!isNaN(krwAmount)) {
        // 금액이 유효하면 환율 계산
        // const targetAmount = krwAmount / remittanceRate;
        // 결과를 ds_to_money 필드에 표시
        // document.getElementById('ds_to_money').value = targetAmount.toFixed(2);
        document.getElementById('ds_to_money').value = formatNumber(targetAmount.toFixed(2));

        // 통화의 이름과 금액을 targetCurrencyName 필드에 표시
        const currencyCode = document.getElementById('currencyName').textContent;
        const currencyName = currencyUnits[currencyCode] || currencyCode;
        console.log("현재 입력된 통화이름 ", currencyName);
        // document.getElementById('targetCurrencyName').textContent = targetAmount.toFixed(2) + ' ' + currencyName;
        document.getElementById('sourceCurrencyName').textContent = formatNumber(krwAmount) + ' won';
        document.getElementById('targetCurrencyName').textContent = formatNumber(targetAmount.toFixed(2)) + ' ' + currencyName;

    }
}

function selectCurrency(currencyCode) {
    // 국가의 환율 정보 가져오기
    const rateInfo = exchangeRates[currencyCode];
    console.log("선택된국가의 환율은 ", rateInfo);
    if (rateInfo) {
        // 환율 정보가 있으면 환율 계산을 위해 이 정보를 사용
        console.log("선택된국가의 송금환율은 ", rateInfo.remittance);
        calculateExchange(rateInfo.remittance);
    } else {
        console.error("환율 정보를 찾을 수 없습니다");
    }
}

// ds_from_money 필드의 input 이벤트에 대한 리스너 추가
document.getElementById('ds_from_money').addEventListener('input', function () {
    // 사용자가 입력할 때마다 환율 계산 실행
    const currencyCode = document.getElementById('currencyName').textContent;
    console.log("통화코드는 ", currencyCode);
    selectCurrency(currencyCode);
});

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

// ds_from_money 필드의 input 이벤트에 대한 리스너 추가
document.getElementById('ds_from_money').addEventListener('input', function() {
    const krwAmount = document.getElementById('ds_from_money').value.replace(/,/g, '');
    document.getElementById('ds_from_money').value = formatNumber(krwAmount);
    const currencyCode = document.getElementById('currencyName').textContent;
    console.log("통화코드는 ", currencyCode);
    selectCurrency(currencyCode);
});

// 숫자 포맷
function formatNumber(num) {
    return num.toLocaleString('en-US');
}


// 환율계산 끝========================================================================

// 결제 창 보이기 및 환전 =============================================================


// 결제 창 보이기 및 환전금액 계산



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