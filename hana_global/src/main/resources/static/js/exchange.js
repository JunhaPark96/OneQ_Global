function openCalendar(id) {
    let input = document.getElementById(id);
    let picker = new Pikaday({
        field: input,
        format: 'YYYY-MM-DD',
    });
    picker.show();
}

document.addEventListener("DOMContentLoaded", function () {
    const currencies = [
        "AED", "AUD", "BDT", "BHD", "BND", "BRL", "CAD", "CHF", "CLP", "CNY",
        "COP", "CZK", "DKK", "DZD", "EGP", "EUR", "GBP", "HKD", "HUF", "IDR",
        "ILS", "INR", "JPY", "JOD", "KES", "KWD", "KZT", "LKR", "MNT", "MXN",
        "MYR", "NOK", "NZD", "OMR", "PHP", "PKR", "PLN", "QAR", "RUB", "SAR",
        "SEK", "SGD", "THB", "TRY", "TWD", "TZS", "USD", "VND", "ZAR"
    ];

    const selectElement = document.getElementById("selectCurrency");

    currencies.forEach(currency => {
        let option = document.createElement("option");
        option.value = currency;
        option.textContent = currency;
        selectElement.appendChild(option);
    });
});

// 잔액 확인
// function changeBalance() {
//     let select = document.getElementById("selectAccountForm");
//     let selectedOption = select.options[select.selectedIndex];
//     let balance = selectedOption.getAttribute("data-balance");
//     document.getElementById("btnFclArea").innerText = balance;
// }
function changeBalance() {
    const selectElem = document.getElementById("selectAccountForm");
    const selectedOption = selectElem.options[selectElem.selectedIndex];
    const selectedValue = selectedOption.value;
    const selectedBalance = selectedOption.getAttribute("data-balance");

    // 선택한 계좌 번호 또는 Wallet 이름을 hidden input에 저장
    document.getElementById("selectedAccountInfo").value = selectedValue;

    // 잔액 정보 업데이트
    document.getElementById("accountBalance").textContent = selectedBalance;
}


// 통화별 나라 매핑
const currencyNames = {
    "AED": "United Arab Emirates",
    "DZD": "Algeria",
    "AUD": "Australia",
    "BHD": "Bahrain",
    "BDT": "Bangladesh",
    "BRL": "Brazil",
    "BND": "Brunei",
    "CAD": "Canada",
    "CLP": "Chile",
    "CNY": "China",
    "COP": "Colombia",
    "CZK": "Czech Republic",
    "DKK": "Denmark",
    "EGP": "Egypt",
    "EUR": "Eurozone",
    "HKD": "Hong Kong",
    "HUF": "Hungary",
    "INR": "India",
    "IDR": "Indonesia",
    "ILS": "Israel",
    "JPY": "Japan",
    "JOD": "Jordan",
    "KES": "Kenya",
    "KWD": "Kuwait",
    "KZT": "Kazakhstan",
    "KRW": "South Korea",
    "LKR": "Sri Lanka",
    "MYR": "Malaysia",
    "MXN": "Mexico",
    "MNT": "Mongolia",
    "NZD": "New Zealand",
    "NOK": "Norway",
    "OMR": "Oman",
    "PKR": "Pakistan",
    "PLN": "Poland",
    "QAR": "Qatar",
    "RUB": "Russia",
    "SAR": "Saudi Arabia",
    "SEK": "Sweden",
    "SGD": "Singapore",
    "ZAR": "South Africa",
    "LKR": "Sri Lanka",
    "CHF": "Switzerland",
    "TZS": "Tanzania",
    "TRY": "Turkey",
    "GBP": "United Kingdom",
    "USD": "United States",
    "VND": "Vietnam",
    "ZAR": "South Africa"
};
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


// 환율 변동률 계산
function getExchangeRateBetween(sourceCurrency, targetCurrency) {
    if (sourceCurrency === targetCurrency) {
        return 1;
    }

    // 원화에서 특정 화폐로 변환
    if (sourceCurrency === "KRW") {
        return 1 / exchangeRates[targetCurrency].baseRate;
    }
    if (targetCurrency === "KRW") {
        return exchangeRates[sourceCurrency].baseRate;
    }

    // 다른 화폐 간의 환율 변동률을 계산
    return exchangeRates[sourceCurrency].baseRate / exchangeRates[targetCurrency].baseRate;
}

// USD 기준 환율 변동률 계산
function getExchangeRateBetweenUsingUSD(sourceCurrency, targetCurrency) {
    if (sourceCurrency === targetCurrency) {
        return 1;
    }

    // USD 기준 환율 변동률 계산
    return (1 / exchangeRates[sourceCurrency].usdConversionRate) * exchangeRates[targetCurrency].usdConversionRate;
}

// 환율 계산
function calculateExchange(sourceCurrency, targetCurrency, amount) {
    const exchangeRate = getExchangeRateBetween(sourceCurrency, targetCurrency);
    return amount * exchangeRate;
}

// 환율 계산 업데이트
function updateExchangeRate() {
    const sourceCurrency = document.querySelector("#ds_sel ._text em").innerText;
    const targetCurrency = document.querySelector("#ds_sel2 ._text em").innerText;
    const amount = parseFloat(document.getElementById("ds_from_money").value.replace(/,/g, ''));

    const result = calculateExchange(sourceCurrency, targetCurrency, amount);
    document.getElementById("ds_to_money").value = new Intl.NumberFormat().format(result.toFixed(5));

    updateRecite(true);
    updateRecite(false);
}

document.getElementById("ds_from_money").addEventListener("input", updateExchangeRate);
// 사용자가 입력 값을 변경할 때도 recite를 갱신하기 위해 이벤트 리스너를 추가
document.getElementById("ds_from_money").addEventListener("input", function() {
    updateRecite(true);
});
// select box 통화 이미지, 통화코드, 나라 이름 설정
function currencySelected(currencyCode, isSource) {
    // 해당 통화 코드에 대한 정보를 가져오기
    console.log("currency Code :", currencyCode);
    const selectedRate = exchangeRates[currencyCode];
    const imageUrl = "./images/walletIcon_" + currencyCode + ".png";
    const countryName = currencyNames[currencyCode];
    const currencyShortName = currencyCode;

    const divId = isSource ? "ds_sel" : "ds_sel2";
    const currencyDiv = document.getElementById(divId);
    const flagImg = currencyDiv.querySelector("._img");
    const currencyLabel = currencyDiv.querySelector("._text");

    flagImg.src = imageUrl;
    flagImg.alt = countryName + " " + currencyShortName;
    currencyLabel.innerHTML = countryName + ' <em>' + currencyShortName + '</em>';

    if (isSource) {
        sourceCurrency = currencyCode;
    } else {
        targetCurrency = currencyCode;
    }

    console.log("환율", selectedRate);
    console.log("송금보낼때", selectedRate.remittance);
    // 추가: 환율 정보 테이블 업데이트
    document.getElementById("remittance").innerText = selectedRate.remittance.toFixed(2);
    document.getElementById("receiving").innerText = selectedRate.receiving.toFixed(2);
    document.getElementById("buying").innerText = selectedRate.buyRate.toFixed(2);
    document.getElementById("selling").innerText = selectedRate.sellRate.toFixed(2);
    updateRecite(isSource);
    updateExchangeRate();
}


// 통화 선택 select box
document.querySelectorAll("._trigger").forEach(trigger => {
    trigger.addEventListener("click", function () {
        const parent = this.closest("._select_box");
        const list = parent.querySelector("._list");

        if (list.style.display === "none" || list.style.display === "") {
            list.style.display = "block";
        } else {
            list.style.display = "none";
        }
    });
});

// 페이지 어느 곳이든 클릭했을 때 dropdown을 닫도록 합니다.
document.addEventListener("click", function (event) {
    if (!event.target.closest("._select_box")) {
        document.querySelectorAll("._list").forEach(list => {
            list.style.display = "none";
        });
    }
});

function setCountryNames() {
    for (const currencyCode in currencyNames) {
        const elementId = "countryNameFor_" + currencyCode;
        const element = document.getElementById(elementId);
        if (element) {
            element.textContent = currencyNames[currencyCode];
        }
    }
}

// 페이지 로드 시 실행
// window.onload = setCountryNames;
window.onload = function () {
    setCountryNames();
    updateExchangeRate();
};

// 통화 입력값, 이름 표시
function updateRecite(isSource) {
    const inputValue = parseFloat(document.getElementById("ds_from_money").value.replace(/,/g, ''));
    const sourceCurrencyCode = document.querySelector("#ds_sel ._text em").innerText;
    const targetCurrencyCode = document.querySelector("#ds_sel2 ._text em").innerText;

    let displayValue, currencyName;

    if (isSource) {
        displayValue = inputValue;
        currencyName = currencyUnits[sourceCurrencyCode];
    } else {
        displayValue = calculateExchange(sourceCurrencyCode, targetCurrencyCode, inputValue);
        currencyName = currencyUnits[targetCurrencyCode];
    }

    const reciteElementId = isSource ? "sourceCurrencyName" : "targetCurrencyName";
    document.getElementById(reciteElementId).innerText = new Intl.NumberFormat().format(displayValue.toFixed(5)) + " " + currencyName;
}