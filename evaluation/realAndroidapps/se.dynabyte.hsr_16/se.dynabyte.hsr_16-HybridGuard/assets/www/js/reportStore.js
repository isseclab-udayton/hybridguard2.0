var reportIdList = [];
var reportIndex = 0;
var typeOfReport = null;
var reportSentSuccess = 0;
var reportSentFailed = 0;

$('#storedReports').live("pageshow", function () {
    listReports();
});

$('#sentReports').live("pageshow", function () {
    listSentReports();
});

function initHSRReportDB() {
    GLOBAL.db.transaction(function (tx) {
        tx.executeSql('CREATE TABLE IF NOT EXISTS HSRReport ' +
            '(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
            'campaignCode TEXT, ' +
            'reportType TEXT, ' +
            'tippingType TEXT, ' +
            'licensePlate TEXT, ' +
            'carCondition TEXT, ' +
            'boatType TEXT, ' +
            'boatMaterial TEXT, ' +
            'boatSize TEXT, ' +
            'boatMotor TEXT, ' +
            'comment TEXT, ' +
            'estimatedTime TEXT, ' +
            'street TEXT, ' +
            'streetNbr TEXT, ' +
            'zipCode TEXT, ' +
            'city TEXT, ' +
            'municipality TEXT, ' +
            'country TEXT, ' +
            'imageEncode TEXT, ' +
            'createDate TEXT, ' +
            'latitude TEXT, ' +
            'longitude TEXT, ' +
            'accuracy TEXT, ' +
            'devicePlatform TEXT, ' +
            'deviceVersion TEXT,' +
            'errorMessage TEXT)');
    }, sqlErrorReportStore);
}

function initHSRSentReportDB() {
    GLOBAL.db.transaction(function (tx) {
        tx.executeSql('CREATE TABLE IF NOT EXISTS HSRSentReport ' +
            '(reportId INTEGER, ' +
            'reportType TEXT)');
    }, sqlErrorReportStore);
}

function listReports() {
    $.mobile.showPageLoadingMsg();
    enableReportStoreButtons();
    GLOBAL.db.transaction(readReports, sqlErrorReportStore);
}

function readReports(tx) {
    tx.executeSql('SELECT * FROM HSRReport', [], onReportsRead, sqlErrorReportStore);
}

function onReportsRead(tx, result) {
    var html = '';
    if (result.rows.length) {
        for (var i = 0; i < result.rows.length; i++) {
            var row = result.rows.item(i);
            var reportType = row.reportType;
            var createDate;
            if (row.createDate > 0) {
                createDate = new Date(parseInt(row.createDate));
            } else {
                createDate = new Date();
            }
            var formatedCreateDate = createDate.getDate() + '/' + (createDate.getMonth() + 1);
            var id = row.id;
            html += '<fieldset data-role="controlgroup" data-type="horizontal" id="savedReportsGroup">';
            html += '<input type="checkbox" name="' + id + '" id="' + id + '" class="custom"/>';
            html += '<label data-icon="check" data-iconpos="notext" for="' + id + '"></label>';
            if (typeof row.errorMessage != 'undefined' && row.errorMessage.length > 0) {
                html += '<a href="#" class="invalidReport" data-role="button" onclick="loadReportAndChangePage(' + id + ');">' + formatedCreateDate + ' ' + reportType + '</a>';
            } else {
                html += '<a href="#" data-role="button" onclick="loadReportAndChangePage(' + id + ');">' + formatedCreateDate + ' ' + reportType + '</a>';
            }
            html += '</fieldset>';
        }
    } else {
        html += '<p>Det finns inga sparade rapporter</p>';
    }
    $.mobile.hidePageLoadingMsg();
    $("#storedReportsContent").html(html).trigger("create");
}

function deleteMarkedReports() {
    reportIdList = []
    $('input[type="checkbox"]').each(function () {
        if ($(this).is(':checked')) {
            reportIdList.push($(this).attr('id'));

        }
    });
    deleteReportsFromList();
}

function deleteReportsFromList() {
    GLOBAL.db.transaction(function (tx) {
        for (var i = 0; i < reportIdList.length; i++) {
            var sql = "DELETE FROM HSRReport WHERE id=?";
            tx.executeSql(sql, [reportIdList[i]]);
        }
    }, sqlErrorReportStore);
    listReports();
}

function sendMarkedReports() {
    $.mobile.showPageLoadingMsg();
    disableReportStoreButtons();
    reportIdList = []
    reportSentSuccess = 0;
    reportSentFailed = 0;
    reportIndex = 0;
    $('#storedReportsContent input[type="checkbox"]').each(function () {
        if ($(this).is(':checked')) {
            reportIdList.push($(this).attr('id'));
        }
    });
    checkIfContest();
}

function checkIfContest() {
    var campaignCodes = "";
    GLOBAL.db.transaction(function (tx) {
        var sql = 'SELECT campaignCode FROM HSRReport WHERE ID IN (' + reportIdList.toString() + ')';
        tx.executeSql(sql, [], function (tx, result) {
            for (var x = 0; x < result.rows.length; x++) {
                var row = result.rows.item(x);
                if (x == 0 && campaignCodes.length < 1) {
                    campaignCodes = row.campaignCode;
                } else {
                    campaignCodes = campaignCodes + ", " + row.campaignCode;
                }
            }
            checkIfAnyContest(campaignCodes);
        }, sqlErrorReportStore);
    }, sqlErrorReport);
}

function checkIfAnyContest(campaignCodes) {
    var campaign = {};
    campaign.campaignCodes = campaignCodes;
    $.ajax({
        type: 'POST',
        url: GLOBAL.hsr_url + 'hasContest',
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
                    sendReportFlow = "#storedReports";
                    $.mobile.changePage($('#encourageProfileContest'), {transition: 'none'});
                } else {
                    sendReportFromList();
                }
            } else {
                sendReportFromList();
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("error: " + textStatus + ' - ' + errorThrown);
            displayMessage(ERROR, "Kontakt med servern misslyckades");
        },
        complete: function () {
        }
    });
}

function sendReportFromList() {
    if (reportIndex < reportIdList.length) {
        loadAndSendReport(reportIdList[reportIndex]);
    } else {
        $.mobile.hidePageLoadingMsg();
        listReports();
        var summary = "Totalt: " + reportIdList.length + " Lyckade: " + reportSentSuccess + " Misslyckade: " + reportSentFailed;
        displayMessage("Resultat", summary);
    }
}

function loadAndSendReport(id) {
    GLOBAL.db.transaction(function (tx) {
        var sql = "SELECT * FROM HSRReport WHERE ID=?";
        tx.executeSql(sql, [id], onLoadAndSendReport, sqlErrorReportStore);
    }, sqlErrorReport);
}

function onLoadAndSendReport(tx, result) {
    var reportToSend = {};
    for (var i = 0; i < result.rows.length; i++) {
        var row = result.rows.item(i);
        reportToSend = convertToMutable(row);
        reportToSend.createDate = parseInt(row.createDate);
        typeOfReport = row.reportType;
    }
    var errors = validateReport(reportToSend);
    if (errors == "") {
        if (typeof reportToSend.municipality == 'undefined' || reportToSend.municipality.length == 0) {
            getAddress(reportToSend.latitude, reportToSend.longitude, function (addressData) {
                    applyAddressDataAndSubmit(reportToSend, addressData);
                },
                function () {
                    reportSentFailed++;
                    updateErrorMessage(reportIdList[reportIndex], "Adressuppslagning misslyckades.");
                    sendNextReport();
                });
        } else {
            submitLoadedReport(reportToSend);
        }
    } else {
        reportSentFailed++;
        updateErrorMessage(reportIdList[reportIndex], errors);
        sendNextReport();
    }
}

function applyAddressDataAndSubmit(reportToSend, addressData) {
    reportToSend.streetNbr = addressData.addressStreetNbr;
    reportToSend.street = addressData.addressStreet;
    reportToSend.zipCode = addressData.addressZipCode;
    reportToSend.city = addressData.addressCity;
    reportToSend.municipality = addressData.addressMunicipality;
    reportToSend.country = addressData.addressCountry;
    submitLoadedReport(reportToSend);
}

function submitLoadedReport(reportToSend) {
    var serializedProfileData = serializeJSON($('#profileForm'));
    var serializedData = $.extend({}, reportToSend, serializedProfileData);
    submitReport(serializedData, submitLoadedReportSuccess, submitLoadedReportError)
}

function submitLoadedReportSuccess(data, textStatus, jqXHR) {
    var serverMessage = $.parseJSON(data);
    if (serverMessage.reportId > 0) {
        reportSentSuccess++;
        saveSentReport(serverMessage.reportId, typeOfReport);
        deleteReport(reportIdList[reportIndex]);
    } else {
        reportSentFailed++;
        updateErrorMessage(reportIdList[reportIndex], serverMessage.message);
    }
    sendNextReport();
}

function submitLoadedReportError(jqXHR, textStatus, errorThrown) {
    reportSentFailed++;
    updateErrorMessage(reportIdList[reportIndex], "Kontakt med servern misslyckades.");
    console.log('Error: ' + textStatus + ' - ' + errorThrown);
    sendNextReport();
}

function deleteReport(id) {
    GLOBAL.db.transaction(function (tx) {
        if (!id != 0) return;
        var sql = "DELETE FROM HSRReport WHERE id=?";
        tx.executeSql(sql, [id]);
    }, sqlErrorReportStore);
}

function validateReport(report) {
    var errors = "";
    if (report.imageEncode.length == 0) {
        errors += "Bild saknas. ";
    }
    if (report.latitude.length == 0 || report.longitude.length == 0) {
        errors += "Koordinater saknas. ";
    }
    return errors
}

function sendNextReport() {
    typeOfReport = null;
    reportIndex++;
    sendReportFromList();
}

function saveSentReport(reportId, reportType) {
    GLOBAL.db.transaction(function (tx) {
        var sql = 'INSERT INTO HSRSentReport (reportId, reportType) VALUES ("' +
            reportId + '", "' +
            reportType +
            '")';
        tx.executeSql(sql);
    }, sqlErrorReportStore);
}

function listSentReports() {
    $.mobile.showPageLoadingMsg();
    GLOBAL.db.transaction(readSentReports, sqlErrorReportStore);
}

function readSentReports(tx) {
    tx.executeSql('SELECT * FROM HSRSentReport', [], onReadSentReports, sqlErrorReportStore);
}

function onReadSentReports(tx, result) {
    var html = '';
    if (result.rows.length) {
        for (var i = 0; i < result.rows.length; i++) {
            var row = result.rows.item(i);
            var reportType = row.reportType;
            var id = row.reportId;
            html += '<fieldset data-role="controlgroup" data-type="horizontal" id="sentReportsGroup">';
            html += '<input type="checkbox" name="' + id + '" id="' + id + '" class="custom"/>';
            html += '<label data-icon="check" data-iconpos="notext" for="' + id + '"></label>';
            html += '<a href="#" data-role="button" onclick="getReportAndChangePage(' + id + ');">' + reportType + ' ' + id + '</a>';
            html += '</fieldset>';
        }
    } else {
        html += '<p>Det finns inga skickade rapporter</p>';
    }
    $.mobile.hidePageLoadingMsg();
    $("#sentReportsContent").html(html).trigger("create");
}

function deleteMarkedSentReports() {
    reportIdList = []
    $('#sentReportsContent input[type="checkbox"]').each(function () {
        if ($(this).is(':checked')) {
            reportIdList.push($(this).attr('id'));

        }
    });
    deleteSentReportsFromList();
}

function deleteSentReportsFromList() {
    GLOBAL.db.transaction(function (tx) {
        for (var i = 0; i < reportIdList.length; i++) {
            var sql = "DELETE FROM HSRSentReport WHERE reportId=?";
            tx.executeSql(sql, [reportIdList[i]]);
        }
    }, sqlErrorReportStore);
    listSentReports();
}

function sqlErrorReportStore(err) {
    $.mobile.hidePageLoadingMsg();
    console.log("Error processing SQL: " + err.code);
}

function updateErrorMessage(id, errorMessage) {
    var id = id;
    var errorMessage = errorMessage;
    GLOBAL.db.transaction(function (tx) {
        if (!id != 0) return;
        var sql = "UPDATE HSRReport SET errorMessage=? WHERE id=?";
        tx.executeSql(sql, [errorMessage, id]);
    }, sqlErrorReportStore);
}

function convertToMutable(result_object) {
    var mutable = new Object();
    for (var key in result_object) {
        mutable[key] = result_object[key]
    }
    ;
    return mutable;
}

function disableReportStoreButtons() {
    $('#sendReportStore').addClass('ui-disabled');
    $('#deleteReportStore').addClass('ui-disabled');
}

function enableReportStoreButtons() {
    $('#sendReportStore').removeClass('ui-disabled');
    $('#deleteReportStore').removeClass('ui-disabled');
}