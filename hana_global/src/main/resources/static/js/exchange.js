function openCalendar(id) {
    let input = document.getElementById(id);
    let picker = new Pikaday({
        field: input,
        format: 'YYYY-MM-DD',
    });
    picker.show();
}