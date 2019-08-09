var profile = {};
var contestProfile = false;

function initProfile() {
    GLOBAL.db.transaction(function (tx) {
        tx.executeSql('CREATE TABLE IF NOT EXISTS HSRProfile (firstName, lastName, userGroup, email, phone)')
    }, sqlErrorProfile, populateProfile);
}

function populateProfile() {
    GLOBAL.db.transaction(readProfile, sqlErrorProfile);
}

function submitProfile() {
    profile.firstName = $('#firstName').val();
    profile.lastName = $('#lastName').val();
    profile.userGroup = $('#userGroup').val();
    profile.email = $('#email').val();
    profile.phone = $('#phone').val();
    profile.tag = $('#tag').val();
    GLOBAL.db.transaction(saveProfile, sqlErrorProfile, onProfileSaved);
}

function saveProfile(tx) {
    tx.executeSql('DROP TABLE IF EXISTS HSRProfile');
    tx.executeSql('CREATE TABLE IF NOT EXISTS HSRProfile (firstName, lastName, userGroup, email, phone, tag)');
    var sql = 'INSERT INTO HSRProfile (firstName, lastName, userGroup, email, phone, tag) VALUES ("' +
        profile.firstName + '", "' +
        profile.lastName + '", "' +
        profile.userGroup + '", "' +
        profile.email + '", "' +
        profile.phone + '", "' +
        profile.tag +
        '")';
    tx.executeSql(sql);
}

function onProfileSaved() {
    if (contestProfile) {
        $.mobile.changePage($(sendReportFlow), {transition: 'none'});
        if (sendReportFlow == "#report") {
            submitReportForm();
        } else if (sendReportFlow == "#storedReports") {
            sendReportFromList();
        }
    } else {
        $.mobile.changePage($('#menu'), {transition: 'none'});
    }
}

function readProfile(tx) {
    tx.executeSql('SELECT * FROM HSRProfile', [], onProfileRead, sqlErrorProfile);

}

function onProfileRead(tx, result) {
    for (var i = 0; i < result.rows.length; i++) {
        var row = result.rows.item(i);
        if (typeof row.firstName != 'undefined' && row.firstName.length > 0) {
            $('#firstName').val(row.firstName);
        }
        if (typeof row.lastName != 'undefined' && row.lastName.length > 0) {
            $('#lastName').val(row.lastName);
        }
        if (typeof row.userGroup != 'undefined' && row.userGroup.length > 0) {
            $('#userGroup').val(row.userGroup);
        }
        if (typeof row.email != 'undefined' && row.email.length > 0) {
            $('#email').val(row.email);
        }
        if (typeof row.phone != 'undefined' && row.phone.length > 0) {
            $('#phone').val(row.phone);
        }
        if (typeof row.tag != 'undefined' && row.tag.length > 0) {
            $('#tag').val(row.tag);
        }
    }
}

function sqlErrorProfile(err) {
    console.log("Error processing SQL: " + err.code);
}

function viewProfile() {
    contestProfile = false;
}