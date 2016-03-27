/// Save search result to local storage and to history table

function saveSearchToHistory() {
    //save history to localstorage
    var innerHTMLTable = localStorage.getItem("CarSearchHistory");
    if (innerHTMLTable == undefined || innerHTMLTable == null) {
        $('#SearchHistoryTbl')[0].innerHTML = '<tr><th>Rental Start</th><th>Rental End</th><th>Transmission Type</th><th>Year</th><th>Model</th><th>Manufacturer</th><th>Search Text</th></tr>';
    }
    $("#HistoryDiv").show();
    var isTrExist = false;
    var tr = '<td>' + $('#DateStart').val() + '</td>' +
            '<td>' + $('#DateEnd').val() + '</td>' +
            '<td id="' + ($('#TransmissionId :selected').val() == '' ? '-1' : $('#TransmissionId :selected').val()) + '">' + ($('#TransmissionId :selected').text() == '---Choose---' ? '' : $('#TransmissionId :selected').text()) + '</td>' +
            '<td id="' + ($('#ManufactureYear :selected').val() == '' ? '-1' : $('#ManufactureYear :selected').val()) + '">' + ($('#ManufactureYear :selected').text() == '---Choose---' ? '' : $('#ManufactureYear :selected').text()) + '</td>' +
            '<td id="' + ($('#CarModelId :selected').val() == '' ? '-1' : $('#CarModelId :selected').val()) + '">' + ($('#CarModelId :selected').text() == '---Choose---' ? '' : $('#CarModelId :selected').text()) + '</td>' +
            '<td id="' + ($('#ManufacturerId :selected').val() == '' ? '-1' : $('#ManufacturerId :selected').val()) + '">' + ($('#ManufacturerId :selected').text() == '---Choose---' ? '' : $('#ManufacturerId :selected').text()) + '</td>' +
            '<td>' + $('#freeText').val() + '</td>';
    $('#SearchHistoryTbl > tbody  > tr').each(function () {
        if ($(this).html() == tr) {
            isTrExist = true;
        }
    });
    if (!isTrExist) {
        $('#SearchHistoryTbl tr:last').after('<tr title="לחיצה על השורה תפעיל חיפוש" class="trHover" onclick="GoTobtnSearch(this);\">' + tr + '</tr>');
    }
    localStorage.setItem("CarSearchHistory", $('#SearchHistoryTbl')[0].innerHTML);
    $("#HistoryDiv").accordion({
        collapsible: true
    });
}

/// generates table of search result.

function showCarResult(cars) {

    saveSearchToHistory();

    //no cars
    if (cars == null || cars.length == 0) {
        $("#table").hide();

        showMessage('There are no cars...', 'No Cars');
        return;
    }

    $("#table tbody").empty();
    for (var i = 0; i < cars.length; i++) {
        var tr = "<tr class='ui-widget-content'>" +
                     "<td>" + cars[i].manufacturer_name + "</td>" +
                     "<td>" + cars[i].model_name + "</td>" +
                     "<td>" +
                     "<input type='button' class='trHover' value='Order' onclick='location.href = \"/Car/Reservation/" + cars[i].car_id + "/" + $('#DateStart').val() + "/" + $('#DateEnd').val() + "\";'/>" +
                     "</td>" +
                 "</tr>";
        $("#table tbody").append(tr);
    }
    $("#table").show();
    $("#table")
    .tablesorter()
    .tablesorterPager({ container: $("#pager") });

}

/// initializes filter controls and clicking search.

function GoTobtnSearch(obj) {
    $('#DateStart').val($(obj).find('td')[0].innerHTML);
    $('#DateEnd').val($(obj).find('td')[1].innerHTML);
    $("#TransmissionId option[value=" + ($(obj).find('td')[2].id == '-1' ? '' : "'" + $(obj).find('td')[2].id + "'") + "]").prop("selected", true);
    $("#ManufactureYear option[value=" + ($(obj).find('td')[3].id == '-1' ? '' : "'" + $(obj).find('td')[3].id + "'") + "]").prop("selected", true);
    $("#CarModelId option[value=" + ($(obj).find('td')[4].id == '-1' ? '' : "'" + $(obj).find('td')[4].id + "'") + "]").prop("selected", true);
    $("#ManufacturerId option[value=" + ($(obj).find('td')[5].id == '-1' ? '' : "'" + $(obj).find('td')[5].id + "'") + "]").prop("selected", true);
    $('#freeText').val($(obj).find('td')[6].innerHTML);
    $("#btnSearch").click();
}


$("#DateEnd").change(function () {

    if ($("#DateStart").val().length > 0)
        restricDates($("#DateEnd"), $("#DateStart").val());

});

$("#DateStart").change(function () {

    if ($("#DateStart").val().length > 0)
        restricDates($("#DateEnd"), $("#DateStart").val());

});

/// Initialize DateTime.Now to Date Controls.

function initDefaultDate() {

    var today = new Date();
    var day = new String(today.getDate());
    var mon = new String(today.getMonth() + 1); //January is 0!
    var yr = today.getFullYear();

    if (day.length < 2) { day = "0" + day; }
    if (mon.length < 2) { mon = "0" + mon; }

    var date = new String(yr + '-' + mon + '-' + day);

    $("#DateStart").val(date);
    $("#DateEnd").val(date);

    restricDates($("#DateStart"), date);
    restricDates($("#DateEnd"), date);
}
$(document).ready(function () {
    $("#table").hide();

    // presenting the search history to the history table from local storage.

    var innerHTMLTable = localStorage.getItem("CarSearchHistory");
    if (innerHTMLTable != undefined && innerHTMLTable != null) {
        $("#HistoryDiv").show();
        $('#SearchHistoryTbl')[0].innerHTML = innerHTMLTable;
        $("#HistoryDiv").accordion({

            collapsible: true

        });
    }

    initDefaultDate()



});
