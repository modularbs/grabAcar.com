$("#dialog-form").hide();
  
$("#btnAddCar").button().on("click", function () {
    var dialog, form;
    dialog = $("#dialog-form").dialog({
        autoOpen: false,
        height: 500,
        width: 400,
        modal: true,
        title: 'Add new car',
        buttons: {
            "add a car": function () {
                addCar(dialog);
            },
            Cancel: function () {
                dialog.dialog("close");
            }
        },
        close: function () {
            form[0].reset();
        }
    });

    form = dialog.find("form").on("submit", function (event) {
        event.preventDefault();
        addCar(dialog);
    });
        dialog.dialog("open");
        $('#CarNumber').val('');
        $("#CarModelId option[value='']").attr("selected", "selected");
        $('#Mileage').val('');
        $('#Photo').val('');
        $("#Rentable").attr('checked', false);
    });


function showMessageDialog(message, title) {
    $("#dialog-message").html(message);
    $("#dialog-message").dialog({
        modal: true,
        title: title,
        width: 400,
        resizable: false,
        buttons: {
            "Close": function () {
                $(this).dialog("close");
                $("#btnManageCars").click();
            }
        }
    });
}

function updateCar(carId, carNumber, carModelId, mileage, photo, rentable, isActive ) {
    var dialogUpd, formUpd;
    dialogUpd = $("#dialog-form").dialog({
        autoOpen: false,
        height: 500,
        width: 400,
        modal: true,
        title: 'update car:' + carNumber,
        buttons: {
            "update a car": function () {
                updCar(dialogUpd, carId, isActive);
               
            },
            Cancel: function () {
                dialogUpd.dialog("close");
            }
        },
        close: function () {
            formUpd[0].reset();
        }
    });

    formUpd = dialogUpd.find("form").on("submit", function (event) {
        event.preventDefault();
        addCar(dialogUpd, carId);
    });

    dialogUpd.dialog("open");
    $('#CarNumber').removeClass('input-validation-error');
    $('#CarNumber').val(carNumber);
    $("#CarModelId option[value=" + carModelId + "]").attr("selected", "selected");
    $('#Photo').val(photo);
    $('#Photo').removeClass('input-validation-error');
    $('#Mileage').val(mileage);
    $('#Mileage').removeClass('input-validation-error');
    $("#Rentable").attr('checked', (rentable == 'False' ? false : true));
    $('#Rentable').removeClass('input-validation-error');
}
function updCar(dialog, carId, isActive)
{
    $.ajax({
        type: "POST",
        url: "/Car/UpdateCar",
        data: { "carId": carId, "carNumber": $('#CarNumber').val(), "carModelId": $('#CarModelId :selected').val(), "mileage": $('#Mileage').val(), "photo": $('#Photo').val(), "rentable": $('#Rentable').is(":checked"), "isActive": isActive },
        success: function (carId) {
            $('#' + carId).empty();
            var tr = newRow(carId, $('#CarNumber').val(), $('#CarModelId :selected').val(), $('#CarModelId :selected').text(), $('#Mileage').val(), $('#Photo').val(), $('#Rentable').is(":checked"), isActive);
            $('#' + carId).append(tr);
            showMessage('car number: ' + $('#CarNumber').val() + ' updated', 'car updated');
            dialog.dialog("close");
        },
        error: function (error) {
            showError(error);
        }
    });
}

function newRow(carId, carNumber, carModelId,carModelName, mileage, photo, rentable, isActive)
{
    var tr= '<td>'+carNumber+'</td>'+
            '<td>'+carModelName+'</td>'+
            '<td>'+mileage+'</td>'+
            '<td><a href="'+photo+'" target="_blank"><img src="'+photo+'" alt="car photo" width="80" height="60" /></a></td>'+
            '<td>'+rentable+'</td>'+
            '<td class="tdClick"><a onclick="updateCar(' + carId + ', ' + carNumber + ', ' + carModelId + ',' + mileage + ', \'' + photo + '\' ,\'' + rentable + '\',' + isActive + ');" href="#">update</a>|<a onclick="deleteCar(' + carId + ', ' + carNumber + ');" href="#">delete</a></td>';
    return tr
}

function deleteCar(carId, carNumber) {
    $("#dialog-confirm").dialog({
        resizable: false,
        height: 200,
        modal: true,
        buttons: {
            "Delete": function () {
                $(this).dialog("close");

                $.ajax({

                    type: "POST",
                    url: "/Car/DeleteCar",
                    data: { "carId": carId },
                    success: function (isOk) {
                        if (isOk==true)
                            showMessage('car number: ' + carNumber + ' deleted', 'car deleted');
                        else
                            showMessage('car can not be deleted on future bookings', 'car not deleted');
                       $("#" + carId).remove();
                    },
                    error: function (error) {
                        showError(error);
                    }
                });
            },
            Cancel: function () {
                $(this).dialog("close");
            }
        }
    });
}
function addCar(dialog) {
    $.ajax({
        type: "POST",
        url: "/Car/AddCar",
        data: { "carNumber": $('#CarNumber').val(), "carModelId": $('#CarModelId :selected').val(), "mileage": $('#Mileage').val(), "photo": $('#Photo').val(), "rentable": $('#Rentable').is(":checked") },
        success: function (carId) {
           
            var tr = newRow(carId, $('#CarNumber').val(), $('#CarModelId :selected').val(), $('#CarModelId :selected').text(), $('#Mileage').val(), $('#Photo').val(), $('#Rentable').is(":checked"), 1);
            $('#table tr:last').after("<tr class='ui-widget-content' id='" + carId + "'>" +
                                         tr+ 
                                       "</tr>");
            showMessage('car number: ' + $('#CarNumber').val() + ' added', 'car added');
            dialog.dialog("close");
          
        },
        error: function (error) {
            showError(error);
        }
    });
   
}