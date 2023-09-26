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
    document.querySelector('.selectCurAndPayment'),
    document.querySelector('.compare_area'),
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

//=============================================================
