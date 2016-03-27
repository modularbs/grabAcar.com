$(document).ready(function () {
    tableStyle();
});




/// Table Style and Effect of Paging and Sorting

function tableStyle() {
    $("div#table-contain table tr:first-child th span:last-of-type").addClass("ui-icon ui-icon-carat-1-s");

    $("div#table-contain table tr:first-child th").click(function () {
        if ($("div#table-contain table tr:first-child th span:last-of-type").hasClass("ui-icon ui-icon-carat-1-s"))
            $("div#table-contain table tr:first-child th span:last-of-type").removeClass("ui-icon ui-icon-carat-1-s").addClass("ui-icon ui-icon-carat-1-n");
        else
            $("div#table-contain table tr:first-child th span:last-of-type").removeClass("ui-icon ui-icon-carat-1-n").addClass("ui-icon ui-icon-carat-1-s");
    });


    $("#table")
       .tablesorter()
       .tablesorterPager({ container: $("#pager") });
}

/// Show Error Dialog by exepting Error as parameter.

function showError(ex) {
    $("#dialog-message").html("Error Status: " + error.status + ", Error Description: " + error.statusText, 'Error');
    $("#dialog-message").dialog({
        modal: true,
        title: "Error",
        width: 400,
        resizable: false,
        buttons: {
            "Close": function () {
                $(this).dialog("close");
            }
        }
    });
}

/// Show Information Dialog, recieves- message and title as parameters.

function showMessage(message, title) {
    $("#dialog-message").html(message);
    $("#dialog-message").dialog({
        modal: true,
        title: title,
        width: 400,
        resizable: false,
        buttons: {
            "Close": function () {
                $(this).dialog("close");
            }
        }
    });
}

/// Restring Minimum date to second datepicker reffering first datepicker.

function restricDates(input, date) {
    $(input).removeAttr("disabled");
    $(input).attr('min', date);
}

/// Convert JSONDate format to Date format/

function JSONDate(dateStr) {
    var m, day;
    jsonDate = dateStr;
    var d = new Date(parseInt(jsonDate.substr(6)));
    m = d.getMonth() + 1;
    if (m < 10)
        m = '0' + m
    if (d.getDate() < 10)
        day = '0' + d.getDate()
    else
        day = d.getDate();
    return (day + '/' + m + '/' + d.getFullYear())
}

/// Convert JSONDateTime format to DateTime format/

function JSONDateWithTime(dateStr) {
    jsonDate = dateStr;
    var d = new Date(parseInt(jsonDate.substr(6)));
    var m, day;
    m = d.getMonth() + 1;
    if (m < 10)
        m = '0' + m
    if (d.getDate() < 10)
        day = '0' + d.getDate()
    else
        day = d.getDate();
    var formattedDate = day + "/" + m + "/" + d.getFullYear();
    var hours = (d.getHours() < 10) ? "0" + d.getHours() : d.getHours();
    var minutes = (d.getMinutes() < 10) ? "0" + d.getMinutes() : d.getMinutes();
    var formattedTime = hours + ":" + minutes;
    formattedDate = formattedDate + " " + formattedTime;
    return formattedDate;
}
