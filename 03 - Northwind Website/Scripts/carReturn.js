$("#btnFindCar").click();

/// Generate Table of Car Return

function showTables(cars) {
    //no cars
    if (cars == null || cars.length == 0) {
        $("#table").hide();

        showMessage('There are no cars...', 'No Cars');
        return;
    }

    //there are cars---> init table
    $("#table tbody").empty();
    for (var i = 0; i < cars.length; i++) {
        var tr = "<tr class='ui-widget-content'>" +
                            "<td>" + cars[i].line_code + "</td>" +
                            "<td>" + cars[i].car_number + "</td>" +
                            "<td>" + cars[i].customer_id + "</td>" +
                            "<td>" + JSONDate(cars[i].date_start) + "</td>" +
                            "<td>" + JSONDate(cars[i].date_end) + "</td>" +
                            "<td>" + cars[i].first_name + " " + cars[i].last_name + "</td>" +
                            "<td>" + cars[i].id_number + "</td>" +
                            "<td>" + cars[i].model_name + "</td>" +
                            "<td>" + JSONDateWithTime(cars[i].create_time) + "</td>" +
                            "<td>" + "<input type='button' class='trHover' value='Car Return' onclick='ReturnCar(" + cars[i].line_code + ");'/>" + "</td>" +
                 "</tr>";
        $("#table tbody").append(tr);
    }
    $("#table").show();
    $("#table")
    .tablesorter()
    .tablesorterPager({ container: $("#pager") });
}

/// Returning a Car

function ReturnCar(line_code) {
    $.ajax({

        type: "POST",

        url: "/Car/ReturnSpecificCar",

        data: { "line_code": line_code },

        success: function (cost) {
            showMessage('Car Returned. Reservation Number: ' + line_code + '.' + '<br/> Total Price:' + cost, 'Car Return');
            $("#table").empty();
            $("#table").hide();
            $("#btnFindCar").click();

        },

        error: function (error) {
            showError(error);
        }

    });
}
