// 다음 주소 찾기 API
function sample4_execDaumPostcode(event) {
    event.preventDefault();
    new daum.Postcode(
        {
            oncomplete: function (data) {
                let roadAddr = data.roadAddress;
                let extraRoadAddr = '';

                if (data.bname !== ''
                    && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }

                if (data.buildingName !== ''
                    && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', '
                        + data.buildingName : data.buildingName);
                }

                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById('postcode').value = data.zonecode;
                document.getElementById('roadAddress').value = roadAddr;
                document.getElementById('jibunAddress').value = data.jibunAddress;

                if (roadAddr !== '') {
                    document.getElementById('extraAddress').value = extraRoadAddr;
                } else {
                    document.getElementById('extraAddress').value = '';
                }

                let guideTextBox = document.getElementById('guide');
                if (data.autoRoadAddress) {
                    let expRoadAddr = data.autoRoadAddress
                        + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소: '
                        + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
                } else if (data.autoJibunAddress) {
                    let expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소: '
                        + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }

                // 주소 필드를 채운 후 loginResult 페이지로 값을 넘기는 부분

            }
        }).open();
}


// 성별 선택
function selectGender(gender) {
    document.getElementById('gender').value = gender; // 숨겨진 input 필드에 값을 설정

    if (gender === 'male') {
        document.getElementById('maleBtn').style.backgroundColor = '#018085'; // bootstrap primary color
        document.getElementById('maleBtn').style.color = '#fff';
        document.getElementById('femaleBtn').style.backgroundColor = '#E0E0E0'; // reset to light gray
    } else {
        document.getElementById('femaleBtn').style.backgroundColor = '#018085';
        document.getElementById('femaleBtn').style.color = '#fff';
        document.getElementById('maleBtn').style.backgroundColor = '#E0E0E0';
        document.getElementById('maleBtn').style.color = 'black';
    }
}

// 로그인 모달

// function initializeModal() {
//     // Get the modal
//     var modal = document.getElementById("loginModal");
//
//     // Get the button that opens the modal
//     var btn = document.getElementById("openLoginModal");
//
//     // Get the <span> element that closes the modal
//     var span = document.getElementsByClassName("close")[0];
//
//     // When the user clicks on the button, open the modal
//     btn.onclick = function () {
//         modal.style.display = "block";
//     }
//
//     // When the user clicks on <span> (x), close the modal
//     span.onclick = function () {
//         modal.style.display = "none";
//     }
//
//     // When the user clicks anywhere outside of the modal, close it
//     window.onclick = function (event) {
//         if (event.target == modal) {
//             modal.style.display = "none";
//         }
//     }
// }
//
// // 페이지 로딩이 완료되면 initializeModal 함수를 호출
// window.onload = initializeModal;

// 모달 창을 열기 위한 함수
function openModal() {
    let modal = document.getElementById("certificateModal");
    modal.style.display = "block";
}

// 모달 창을 닫기 위한 함수
function closeModal() {
    let modal = document.getElementById("certificateModal");
    modal.style.display = "none";
}

// 모달 창 바깥을 클릭했을 때 닫기 위한 함수
function outsideModalClick(event) {
    let modal = document.getElementById("certificateModal");
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
