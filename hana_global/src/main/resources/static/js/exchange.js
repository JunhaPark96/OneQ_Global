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