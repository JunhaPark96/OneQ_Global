function openCalendar(id) {
    let input = document.getElementById(id);
    let picker = new Pikaday({
        field: input,
        format: 'YYYY-MM-DD',
    });
    picker.show();
}

document.addEventListener("DOMContentLoaded", function() {
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
    let selectedOption = document.getElementById("selectAccountForm").querySelector("option:checked");
    let balance = selectedOption.getAttribute("data-balance");
    document.getElementById("accountBalance").innerHTML = balance ? balance : "";
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
