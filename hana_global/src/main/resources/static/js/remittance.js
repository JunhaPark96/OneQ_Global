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
let currentStep = 1;

// 각 단계의 구역을 배열에 저장합니다.
let steps = [
    document.querySelector('.compare_area'),
    document.querySelector('.selectCurAndPayment'),
    // document.querySelector('.recipient_info')
];

// 초기화 함수를 호출하여 첫 번째 단계만 표시합니다.
initialize();

function initialize() {
    // 모든 단계를 숨깁니다.
    steps.forEach(function (step) {
        step.style.display = 'none';
    });

    // 첫 번째 단계만 표시합니다.
    steps[0].style.display = 'block';
    console.log("현재 스텝은 ", steps[0]);
}

// 다음 단계로 이동하는 함수를 정의.
function nextStep() {
    if (currentStep < steps.length) {
        // 현재 단계를 숨기고 다음 단계를 표시.
        steps[currentStep - 1].style.display = 'none';
        steps[currentStep].style.display = 'block';

        // 단계 번호를 증가.
        currentStep++;
        console.log("증가한 현재 스텝은 ", currentStep);
        console.log("증가한 현재 구역은 ", steps[currentStep]);
    }
}

// 이전 단계로 돌아가는 함수를 정의.
function prevStep() {
    if (currentStep > 1) {
        // 현재 단계를 숨기고 이전 단계를 표시.
        steps[currentStep - 1].style.display = 'none';
        steps[currentStep - 2].style.display = 'block';

        // 단계 번호를 감소시킵니다.
        currentStep--;
    }
}

// "다음" 버튼에 이벤트 리스너를 연결하여 다음 단계로 이동합니다.
document.getElementById('nextButton').addEventListener('click', nextStep);

// 결제 창 보이기 및 환전 =============================================================

document.addEventListener("DOMContentLoaded", function () {
    // 계산 버튼에 이벤트 리스너 추가
    document.getElementById("calExchange").addEventListener("click", function () {
        calculateAndPreviewPayment();
    });
});
// 결제 창 보이기 및 환전금액 계산
function calculateAndPreviewPayment() {
    // Source에서 입력된 금액 및 통화를 가져옵니다.
    const sourceAmount = parseFloat(document.getElementById("ds_from_money").value);
    const sourceCurrencyImageSrc = document.querySelector(".nation_usd ._img").src;
    const sourceCurrencyCode = document.querySelector(".selectbox_label ._text em").textContent;
    const countryName = currencyNames[sourceCurrencyCode];
    document.querySelector(".previewPayment").style.display = "block";
    const previewPayment = document.querySelector('.previewPayment');
    previewPayment.scrollIntoView({behavior: "smooth"});
    previewPayment.classList.add('focusArea');
    // Target에서의 계산된 금액을 가져옵니다. (금액의 콤마를 제거)
    const targetAmount = parseFloat(document.getElementById("ds_to_money").value.replace(/,/g, ""));

    // 1% 수수료를 추가하고 10의 단위로 반올림
    const adjustedAmount = targetAmount * 1.01;
    const finalAmountWithoutDecimal = Math.round(adjustedAmount);
    const finalAmount = Math.round(finalAmountWithoutDecimal / 10) * 10;


    // previewPayment 영역을 업데이트
    const previewElem = document.querySelector(".previewPayment .banking-cont table tbody");

    previewElem.querySelector("tr:nth-child(1) .txt img").src = sourceCurrencyImageSrc;
    previewElem.querySelector("tr:nth-child(1) .txt em.currency").textContent = countryName + " " + sourceCurrencyCode;
    previewElem.querySelector("tr:nth-child(1) .txt em.price").textContent = sourceAmount.toFixed(0);
    previewElem.querySelector("tr:nth-child(2) .txt em.point").textContent = finalAmount.toLocaleString();

    //  결제 방식을 동적으로 설정할 수 있는 로직을 추가
    const selectedOption = document.getElementById("selectAccountForm").value;
    const paymentMethodText = document.querySelector(".previewPayment .banking-cont table tbody tr:nth-child(3) .txt");

    if (selectedOption === "HANA Wallet") {
        paymentMethodText.textContent = "Hana Wallet Money Withdrawal";
    } else {
        paymentMethodText.textContent = "Hana Bank Account Withdrawal";
    }

    // 계산된 값을 hidden input 필드에 설정
    document.getElementById("sourceCurrencyCode").value = sourceCurrencyCode; // 외화
    document.getElementById("hiddenSourceAmount").value = sourceAmount.toFixed(0); // 외화 금액
    document.getElementById("hiddenFinalAmount").value = finalAmount; // 원화 결제할 금액
}

function changeBalance() {
    const selectElem = document.getElementById("selectAccountForm");
    const selectedOption = selectElem.options[selectElem.selectedIndex];
    const selectedValue = selectedOption.value;
    const selectedBalance = selectedOption.getAttribute("data-balance");

    // 선택한 계좌 번호 또는 Wallet 이름을 hidden input에 저장
    // document.getElementById("selectedAccountInfo").value = selectedValue;

    // 잔액 정보 업데이트
    document.getElementById("accountBalance").textContent = selectedBalance;
}

console.log(document.getElementById("sourceCurrencyCode").value);
document.addEventListener("DOMContentLoaded", function () {
    // console.log(document.getElementById("selectedAccountInfo").value);
    console.log(document.getElementById("hiddenSourceAmount").value);
    console.log(document.getElementById("hiddenFinalAmount").value);
    // console.log(document.getElementById("selectedAccountInfo").value);
});

    document.addEventListener("DOMContentLoaded", function () {
        // 사용자의 국적에 따른 기본 통화와 선택한 통화를 반영
        let defaultCurrency = "${defaultCurrencyCode}";
        currencySelected(defaultCurrency, true);

        let selectedCurrency = "${selectedCurrency}";
        if (selectedCurrency) {
            currencySelected(selectedCurrency, true);
        }
    });

function toggleRateInfo() {
    let rateInfo = document.querySelector('.showExchangeRate');
    let arrow = document.querySelector('.arrow');
    let toggleText = document.querySelector('.toggleText');

    if(rateInfo.classList.contains('open')) {
        rateInfo.classList.remove('open');
        arrow.innerHTML = '&#9660;'; // 아래쪽 화살표로 변경
        toggleText.textContent = 'open'; // 텍스트를 '보기'로 변경
    } else {
        rateInfo.classList.add('open');
        arrow.innerHTML = '&#9650;'; // 위쪽 화살표로 변경
        toggleText.textContent = 'close'; // 텍스트를 '닫기'로 변경
    }
}