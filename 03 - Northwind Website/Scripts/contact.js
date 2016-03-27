/// Sen Email

$("#btnSend").button().on("click", function () {

    var link = "mailto:gil@modular-bs.com"
    + "&subject=" + escape($('#Subject').val())
    + "&body=" + escape($('#Message').val())
    ;
    window.location.href = link;
    showMessage('Mail sent successfully', 'Contact Us');
});