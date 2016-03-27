$(document).ready(function () { $("dialog-summary").hide(); });
function reservationSummary(reservationId) {
    var message = '<h3>thank you for your reservation.</h3>' +
                    '<div><u>Your Reservation Number is- ' + reservationId + '.</u></div>' +
                    '<br />' +
                    '<div><i>You can view you future reservation and old ones in the "My Reservations" page.</i></div>';
    var title = 'Reservation completed successfully...';

    $("#dialog-summary").html(message);
    $("#dialog-summary").dialog({
        modal: true,
        title: title,
        width: 400,
        resizable: false,
        buttons: {
            "Close": function () {
                location.href = "/Home/Index";
                $(this).dialog("close");
            }
        }
    });
}