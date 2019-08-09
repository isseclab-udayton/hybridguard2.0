var report = {};
var phoneReportId = 0;
var sendReportFlow = "";

$(document).ready(function () {
    $(document).delegate("#report", "pageinit", function () {
        $.support.cors = true;
        $.mobile.allowCrossDomainPages = true;

    });
    reportTypeDisplayHandler();
    disableDefaultSubmitForm();
    initDropDowns();
});

$('#report').live("pageshow", function () {
    populateCampaignDropDown();
});

function newReport() {
    enableReportButtons();
    resetReportForm();
    geoLocationLookup(setFormCoordinates);
}

function setFormCoordinates(location) {
    $('#longitude').val(location.coords.longitude);
    $('#latitude').val(location.coords.latitude);
    $('#accuracy').val(location.coords.accuracy);
    resetFormAddress();
    getAddress(location.coords.latitude, location.coords.longitude, setFormAddress, formAddressError);
}

function reportTypeDisplayHandler() {
    $('#reportType').change(function () {
        $('#reportForm [id$=Container] :input').prop('disabled', true);
        $('#reportForm [id$=Container]').hide();
        switch ($(this).val()) {
            case 'Nedskräpning':
                break;
            case 'Illegal tippning':
                $('#tippingContainer :input').prop('disabled', false);
                $('#tippingContainer').show();
                break;
            case 'Skrotbil':
                $('#carWreckContainer :input').prop('disabled', false);
                $('#licensePlate').textinput('enable');
                $('#carWreckContainer').show();
                break;
            case 'Båtvrak':
                $('#boatWreckContainer :input').prop('disabled', false);
                $('#boatWreckContainer').show();
                break;
            case 'Klotter':
                break;
            case 'Skadegörelse':
                break;
            case 'Trasig belysning':
                break;
            case 'Övrigt':
                break;
        }
    });
}

//disable submit form as older versions of Android did auto-submit when pressing "done" on keyboard after entering some text in input fields
function disableDefaultSubmitForm() {
    $('#reportForm').submit(function (event) {
        event.stopPropagation();
        event.preventDefault();
        return false;
    });
}

//drop-downs needs to be initialized before they can be used
function initDropDowns() {
    $('#reportType').selectmenu();
    $('#tippingType').selectmenu();
    $('#carCondition').selectmenu();
    $('#boatType').selectmenu();
    $('#boatMaterial').selectmenu();
    $('#boatSize').selectmenu();
    $('#boatMotor').selectmenu();
    $('#estimatedTime').selectmenu();
}

function populateCampaignDropDown() {
    $('#campaignName').selectmenu('disable');
    $.ajax({
        type: 'POST',
        url: GLOBAL.hsr_url + 'getActiveCampaignUserGroups',
        headers: { "cache-control": "no-cache" },
        cache: false,
        timeout: 30000,
        success: function (data, textStatus, jqXHR) {
            var dataArray = jQuery.parseJSON(data);
            $('#campaignName')
                .empty()
                .append($('<option></option>')
                    .attr('value', '')
                    .text('Välj kampanj'));
            for (var i = 0; i < dataArray.length; i++) {
                $('#campaignName')
                    .append($('<option></option>')
                        .attr('value', dataArray[i].name)
                        .text(dataArray[i].name));
            }
            $('#campaignName').trigger("change");
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("error: " + textStatus + ' - ' + errorThrown);
        },
        complete: function () {
            $('#campaignName').selectmenu('enable');
        }
    });
    $('#campaignName').selectmenu();
}

function setCampaignName() {
    var cname = $('#campaignName').val();
    if (cname != "0") {
        $('#campaignCode').val(cname);
    } else {
        $('#campaignCode').val('');
    }
}

function submitReportButton() {
    if (isValidReport()) {
        $('#devicePlatform').val(device.platform);
        $('#deviceVersion').val(device.version);
        if ($('#municipality').val().length == 0) {
            $.mobile.showPageLoadingMsg();
            getAddress($('#latitude').val(), $('#longitude').val(), function () {
                checkIfContestAndSubmit();
            }, function () {
                $.mobile.hidePageLoadingMsg();
                displayMessage(ERROR, "Adressuppslagning misslyckades.");
            });
        } else {
            checkIfContestAndSubmit();
        }
    } else {
        $.mobile.silentScroll(0);
    }
}

function submitReportForm() {
    var serializedReportData = serializeJSON($('#reportForm'));
    serializedReportData.createDate = parseInt($('#createDate').val());
    var serializedProfileData = serializeJSON($('#profileForm'));
    var serializedData = $.extend({}, serializedReportData, serializedProfileData);

    submitReport(serializedData,
        function (data, textStatus, jqXHR) {
            console.log('Success: ' + textStatus);
            var serverMessage = $.parseJSON(data);

            if (serverMessage.reportId > 0) {
                saveSentReport(serverMessage.reportId, $('#reportType').val());
                deleteReport(phoneReportId);
                newReport();
                displayServerMessage(data);
            } else {
                displayServerMessage(data);
            }
        },
        function (jqXHR, textStatus, errorThrown) {
            console.log('Error: ' + textStatus + ' - ' + errorThrown);
            displayMessage(ERROR, "Kontakt med servern misslyckades");
        }
    );
}

function submitReport(reportData, reportSuccess, reportError) {
    if (reportData.municipality.length == 0) {
        reportData.municipality = "NOT_FOUND";
    }
    $.mobile.showPageLoadingMsg();
    disableReportButtons();
    GLOBAL.ajaxCall = $.ajax({
        type: 'POST',
        url: GLOBAL.hsr_url + 'report',
        dataType: 'json',
        contentType: 'text/json',
        cache: false,
        data: JSON.stringify(reportData),
        timeout: 60000,
        success: function (data, textStatus, jqXHR) {
            reportSuccess(data, textStatus, jqXHR);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            reportError(jqXHR, textStatus, errorThrown);
        },
        complete: function () {
            enableReportButtons();
            $.mobile.hidePageLoadingMsg();
        }
    });
}


function serializeJSON(object) {
    var json = {};
    $.map($(object).serializeArray(), function (n, i) {
        json[n['name']] = n['value'];
    });
    return json;
}

function loadReportAndChangePage(id) {
    loadReportToPage(id);
    $.mobile.changePage($("#report"), {transition: 'none'});
}

function loadReportToPage(id) {
    $.mobile.showPageLoadingMsg();
    resetReportForm();
    phoneReportId = 0;
    GLOBAL.db.transaction(function (tx) {
        var sql = "SELECT * FROM HSRReport WHERE ID=?";
        tx.executeSql(sql, [id], loadReportToPageSuccess, sqlErrorReport);
    }, sqlErrorReport);
}

function loadReportToPageSuccess(tx, result) {
    for (var i = 0; i < result.rows.length; i++) {
        $('#address').empty();
        var row = result.rows.item(i);
        phoneReportId = row.id;
        if (typeof row.campaignCode != 'undefined' && row.campaignCode.length > 0) {
            $('#campaignCode').val(row.campaignCode);
        }
        if (typeof row.reportType != 'undefined' && row.reportType.length > 0) {
            $('#reportType').val(row.reportType).trigger("change");
        }
        if (typeof row.tippingType != 'undefined' && row.tippingType.length > 0) {
            $('#tippingType').val(row.tippingType).trigger("change");
        }
        if (typeof row.licensePlate != 'undefined' && row.licensePlate.length > 0) {
            $('#licensePlate').val(row.licensePlate);
        }
        if (typeof row.carCondition != 'undefined' && row.carCondition.length > 0) {
            $('#carCondition').val(row.carCondition).trigger("change");
        }
        if (typeof row.boatType != 'undefined' && row.boatType.length > 0) {
            $('#boatType').val(row.boatType).trigger("change");
        }
        if (typeof row.boatMaterial != 'undefined' && row.boatMaterial.length > 0) {
            $('#boatMaterial').val(row.boatMaterial).trigger("change");
        }
        if (typeof row.boatSize != 'undefined' && row.boatSize.length > 0) {
            $('#boatSize').val(row.boatSize).trigger("change");
        }
        if (typeof row.boatMotor != 'undefined' && row.boatMotor.length > 0) {
            $('#boatMotor').val(row.boatMotor).trigger("change");
        }
        if (typeof row.comment != 'undefined' && row.comment.length > 0) {
            $('#comment').val(row.comment);
        }
        if (typeof row.estimatedTime != 'undefined' && row.estimatedTime.length > 0) {
            $('#estimatedTime').val(row.estimatedTime).trigger("change");
        }
        if (typeof row.street != 'undefined' && row.street.length > 0) {
            $('#street').val(row.street);
            $('#address').append(row.street + " ");
        }
        if (typeof row.streetNbr != 'undefined' && row.streetNbr.length > 0) {
            $('#streetNbr').val(row.streetNbr);
            $('#address').append(row.streetNbr + ", ");
        }
        if (typeof row.zipCode != 'undefined' && row.zipCode.length > 0) {
            $('#zipCode').val(row.zipCode);
            $('#address').append(row.zipCode + " ");
        }
        if (typeof row.city != 'undefined' && row.city.length > 0) {
            $('#city').val(row.city);
            $('#address').append(row.city + ", ");
        }
        if (typeof row.municipality != 'undefined' && row.municipality.length > 0) {
            $('#municipality').val(row.municipality);
        }
        if (typeof row.country != 'undefined' && row.country.length > 0) {
            $('#country').val(row.country);
            $('#address').append(row.country);
        }
        if (typeof row.imageEncode != 'undefined' && row.imageEncode.length > 0) {
            $('#imageEncode').val(row.imageEncode);
            $('#image').attr('src', row.imageEncode);
            $('#image').fadeIn();
        }
        if (typeof row.createDate != 'undefined' && row.createDate.length > 0) {
            $('#createDate').val(row.createDate);
        }
        if (typeof row.latitude != 'undefined' && row.latitude.length > 0) {
            $('#latitude').val(row.latitude);
        }
        if (typeof row.longitude != 'undefined' && row.longitude.length > 0) {
            $('#longitude').val(row.longitude);
        }
        if (typeof row.accuracy != 'undefined' && row.accuracy.length > 0) {
            $('#accuracy').val(row.accuracy);
        }
        if (typeof row.devicePlatform != 'undefined' && row.devicePlatform.length > 0) {
            $('#devicePlatform').val(row.devicePlatform);
        }
        if (typeof row.deviceVersion != 'undefined' && row.deviceVersion.length > 0) {
            $('#deviceVersion').val(row.deviceVersion);
        }
        if (typeof row.errorMessage != 'undefined' && row.errorMessage.length > 0) {
            $('#errorMessage').text(row.errorMessage);
        }
        if ($('#address').is(':empty')) {
            getAddress(row.latitude, row.longitude, setFormAddress);
        }
        $.mobile.hidePageLoadingMsg();
    }
}

function saveReportData() {
    $.mobile.showPageLoadingMsg();
    disableReportButtons();
    isValidReport();
    report = {};
    report.campaignCode = $('#campaignCode').val();
    report.reportType = $('#reportType').val();
    report.tippingType = $('#tippingType').val();
    report.licensePlate = $('#licensePlate').val();
    report.carCondition = $('#carCondition').val();
    report.boatType = $('#boatType').val();
    report.boatMaterial = $('#boatMaterial').val();
    report.boatSize = $('#boatSize').val();
    report.boatMotor = $('#boatMotor').val();
    report.comment = $('#comment').val();
    report.estimatedTime = $('#estimatedTime').val();
    report.street = $('#street').val();
    report.streetNbr = $('#streetNbr').val();
    report.zipCode = $('#zipCode').val();
    report.city = $('#city').val();
    report.municipality = $('#municipality').val();
    report.country = $('#country').val();
    report.imageEncode = $('#imageEncode').val();
    report.createDate = $('#createDate').val();
    report.latitude = $('#latitude').val();
    report.longitude = $('#longitude').val();
    report.accuracy = $('#accuracy').val();
    report.devicePlatform = $('#devicePlatform').val();
    report.deviceVersion = $('#deviceVersion').val();
    report.errorMessage = $('#errorMessage').text();

    if (phoneReportId != 0) {
        GLOBAL.db.transaction(updateReport, sqlErrorReport, onReportSaved);
    } else {
        GLOBAL.db.transaction(saveReport, sqlErrorReport, onReportSaved);
    }
}

function saveReport(tx) {
    var sql = 'INSERT INTO HSRReport (campaignCode, reportType, tippingType, licensePlate, carCondition, boatType, boatMaterial, boatSize, boatMotor, comment, estimatedTime, street, streetNbr, zipCode, city, municipality, country, imageEncode, createDate, latitude, longitude, accuracy, devicePlatform, deviceVersion, errorMessage) VALUES ("' +
        report.campaignCode + '", "' +
        report.reportType + '", "' +
        report.tippingType + '", "' +
        report.licensePlate + '", "' +
        report.carCondition + '", "' +
        report.boatType + '", "' +
        report.boatMaterial + '", "' +
        report.boatSize + '", "' +
        report.boatMotor + '", "' +
        report.comment + '", "' +
        report.estimatedTime + '", "' +
        report.street + '", "' +
        report.streetNbr + '", "' +
        report.zipCode + '", "' +
        report.city + '", "' +
        report.municipality + '", "' +
        report.country + '", "' +
        report.imageEncode + '", "' +
        report.createDate + '", "' +
        report.latitude + '", "' +
        report.longitude + '", "' +
        report.accuracy + '", "' +
        report.devicePlatform + '", "' +
        report.deviceVersion + '", "' +
        report.errorMessage +
        '")';
    tx.executeSql(sql);
}

function updateReport(tx) {
    var sql = 'UPDATE HSRReport SET ' +
        'campaignCode = "' + report.campaignCode +
        '", reportType = "' + report.reportType +
        '", tippingType = "' + report.tippingType +
        '", licensePlate = "' + report.licensePlate +
        '", carCondition = "' + report.carCondition +
        '", boatType = "' + report.boatType +
        '", boatMaterial = "' + report.boatMaterial +
        '", boatSize = "' + report.boatSize +
        '", boatMotor = "' + report.boatMotor +
        '", comment = "' + report.comment +
        '", estimatedTime = "' + report.estimatedTime +
        '", street = "' + report.street +
        '", streetNbr = "' + report.streetNbr +
        '", zipCode = "' + report.zipCode +
        '", city = "' + report.city +
        '", municipality = "' + report.municipality +
        '", country = "' + report.country +
        '", imageEncode = "' + report.imageEncode +
        '", createDate = "' + report.createDate +
        '", latitude = "' + report.latitude +
        '", longitude = "' + report.longitude +
        '", accuracy = "' + report.accuracy +
        '", devicePlatform = "' + report.devicePlatform +
        '", deviceVersion = "' + report.deviceVersion +
        '", errorMessage = "' + report.errorMessage +
        '" where id = ' + phoneReportId;
    tx.executeSql(sql);
}


function resetReportForm() {
    phoneReportId = 0;
    $('#campaignCode').val("");
    $('#reportType').val("Nedskräpning").selectmenu("refresh");
    $('#reportType').val("Nedskräpning").trigger("change");
    $('#tippingType').val("Byggavfall").selectmenu("refresh");
    $('#licensePlate').val("");
    $('#carCondition').val("Bra skick").selectmenu("refresh");
    $('#boatType').val("Roddbåt").selectmenu("refresh");
    $('#boatMaterial').val("Träbåt").selectmenu("refresh");
    $('#boatSize').val("0-4m").selectmenu("refresh");
    $('#boatMotor').val("Nej").selectmenu("refresh");
    $('#comment').val("").css("height", 50).keyup();
    $('#estimatedTime').val("Okänt").selectmenu("refresh");
    $('#estimatedTime').val("Okänt").trigger("change");
    $('#street').val("");
    $('#streetNbr').val("");
    $('#zipCode').val("");
    $('#city').val("");
    $('#municipality').val("");
    $('#country').val("");
    $('#imageEncode').val("");
    $('#image').attr("src", "images/camera.png");
    $('#createDate').val(Date.now());
    $('#latitude').val("");
    $('#longitude').val("");
    $('#accuracy').val("");
    $('#devicePlatform').val("");
    $('#deviceVersion').val("");
    $('#address').text("Lokaliserar plats... Använd kartan om du vill välja plats själv.");
    $('#errorMessage').empty();
}


function isValidReport() {
    var isValid = true;
    $('#errorMessage').empty();
    if (!$('#imageEncode').val()) {
        isValid = false;
        $('#errorMessage').append("Bild saknas. ");
    }
    if (!$('#latitude').val() || !$('#longitude').val()) {
        isValid = false;
        $('#errorMessage').append("Koordinater saknas. ");
    }
    return isValid;
}

function onReportSaved() {
    enableReportButtons();
    $.mobile.hidePageLoadingMsg();
    history.go(-1);
}

function sqlErrorReport(err) {
    enableReportButtons();
    $.mobile.hidePageLoadingMsg();
    console.log("Error processing SQL: " + err.code);
}


function checkIfContestAndSubmit() {
    if ($('#campaignCode').val()) {
        var campaign = {};
        campaign.campaignCode = $('#campaignCode').val();
        GLOBAL.ajaxCall = $.ajax({
            type: 'POST',
            url: GLOBAL.hsr_url + 'isContest',
            dataType: 'json',
            contentType: 'text/json',
            cache: false,
            data: JSON.stringify(campaign),
            timeout: 30000,
            success: function (data, textStatus, jqXHR) {
                console.log(data);
                var response = $.parseJSON(data);
                if (response.contest == true) {
                    if (!$('#email').val()) {
                        sendReportFlow = "#report";
                        $.mobile.changePage($('#encourageProfileContest'), {transition: 'none'});
                    } else {
                        submitReportForm();
                    }
                } else {
                    submitReportForm();
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("error: " + textStatus + ' - ' + errorThrown);
                displayMessage(ERROR, "Kontakt med servern misslyckades");
            },
            complete: function () {
            }
        });
    } else {
        submitReportForm();
    }
}

function acceptEnterProfileContest() {
    contestProfile = true;
    $.mobile.changePage($("#profile"), {transition: 'none'});
}

function rejectEnterProfileContest() {
    $.mobile.changePage($(sendReportFlow), {transition: 'none'});
    if (sendReportFlow == "#report") {
        submitReportForm();
    } else if (sendReportFlow == "#storedReports") {
        sendReportFromList();
    }
}

function disableReportButtons() {
    $('#submitBtn').addClass('ui-disabled');
    $('#saveBtn').addClass('ui-disabled');
}

function enableReportButtons() {
    $('#submitBtn').removeClass('ui-disabled');
    $('#saveBtn').removeClass('ui-disabled');
}






