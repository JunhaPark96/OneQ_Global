function changeBalance() {
    let select = document.getElementById("selectAccountForm");
    let selectedOption = select.options[select.selectedIndex];
    let balance = selectedOption.getAttribute("data-balance");
    document.getElementById("accountBalance").innerText = balance;
}

document.addEventListener("DOMContentLoaded", function () {
    var today = new Date();
    var endDate = today.toISOString().substring(0, 10);
    document.getElementById("inqEndDt").value = endDate;

    var startDate = new Date();
    startDate.setDate(startDate.getDate() - 14);
    startDate = startDate.toISOString().substring(0, 10);
    document.getElementById("inqStrDt").value = startDate;
});

function selectTransType(type) {
    document.getElementById("transaction_type").value = type;
    let buttons = document.getElementsByClassName("pushButton");
    for (let i = 0; i < buttons.length; i++) {
        buttons[i].classList.remove("active");
    }
    event.target.classList.add("active");
}

function openCalendar(id) {
    let input = document.getElementById(id);
    let picker = new Pikaday({
        field: input,
        format: 'YYYY-MM-DD',
    });
    picker.show();
}