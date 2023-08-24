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