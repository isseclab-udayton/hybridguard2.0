

/**
 * PUSH NOTIFICATION - START
 */

function registerPushNotification() {

	pushNotification = window.plugins.pushNotification;
	if (device.platform == 'android' || device.platform == 'Android') {
		pushNotification.register(
				logDisplay,
				errorHandler, {
					"senderID": "877563635514",
					"ecb": "onNotificationGCM"
				});
	}
	else {
		pushNotification.register(
				tokenHandler,
				errorHandler, {
					"badge": "true",
					"sound": "true",
					"alert": "true",
					"ecb": "onNotificationAPN"
				});
	}

}

function tokenHandler(result) {
// Your iOS push server needs to know the token before it can push to this device
// here is where you might want to send it the token for later use.
	logDisplay('APN_device_token: ' + result);
	var restSettings = {
		"url": Localization.trans("FIRSTAID_RES_REST_URL") + "/api",
		"error": function(req, status, ex)
		{
			logDisplay("REST error: " + req + " " + status);
		},
		"success": function() {
			logDisplay("TOKEN REST OK");
		},
		user: Localization.trans("FIRSTAID_RES_REST_USER"),
		password: Localization.trans("FIRSTAID_RES_REST_PWD"),
		"synchronous": true};
	var restClient = new RestClient(restSettings);
	restClient.post({"path": "tokens", "model": [{id: result, platform: "ios", application_name: "elsosegely_hu"}]});
}

// iOS
function onNotificationAPN(event) {
	if (event.alert)
	{
		if (!event.hiddenmsg) {
			navigator.notification.alert(null, alertDismissed, event.alert, "OK");
		}
		else {
			var messageContent = event.hiddenmsg;
			navigator.notification.confirm("", function(i) {
				if (i == 1) {
					window.open(messageContent, '_blank', 'location=yes');
				}
			}, event.alert, [Localization.trans("FIRSTAID_RES_0002"), Localization.trans("FIRSTAID_RES_0003")]);
		}
	}

	if (event.sound)
	{
		var snd = new Media(event.sound);
		snd.play();
	}

	if (event.badge)
	{
		pushNotification.setApplicationIconBadgeNumber(null, null, event.badge);
	}
}


// Android
function onNotificationGCM(e) {
	$("#app-status-ul").append('<li>EVENT -> RECEIVED:' + e.event + '</li>');
	switch (e.event)
	{
		case 'registered':
			if (e.regid.length > 0) {
				//alert(e.regid);
// Your GCM push server needs to know the regID before it can push to this device
// here is where you might want to send it the regID for later use.
				console.log("GCM_device_token = " + e.regid);
				var restSettings = {
					"url": Localization.trans("FIRSTAID_RES_REST_URL") + "/api",
					"error": function(req, status, ex)
					{
						logDisplay("REST error: " + JSON.stringify(req, null, 4) + " " + " ,status: " + JSON.stringify(status, null, 4));
					},
					"success": function() {
						logDisplay("TOKEN REST OK");
					},
					user: Localization.trans("FIRSTAID_RES_REST_USER"),
					password: Localization.trans("FIRSTAID_RES_REST_PWD"),
					"synchronous": true};
				var restClient = new RestClient(restSettings);
				restClient.post({"path": "tokens", "model": [{id: e.regid, platform: "android", application_name: "elsosegely_hu"}]});
			}
			break;
		case 'message':
			// if this flag is set, this notification happened while we were in the foreground.
			// you might want to play a sound to get the user's attention, throw up a dialog, etc.
			if (!e.payload.hiddenmsg) {
				navigator.notification.alert("", alertDismissed, e.payload.message, "OK");
			}
			else {
				messageContent = e.payload.hiddenmsg;
				navigator.notification.confirm(e.payload.message, messageCallback, Localization.trans("FIRSTAID_RES_0088"), [Localization.trans("FIRSTAID_RES_0002"), Localization.trans("FIRSTAID_RES_0003")]);
			}

			if (e.foreground)
			{
//				$("#app-status-ul").append('<li>--INLINE NOTIFICATION--' + '</li>');
				// if the notification contains a soundname, play it.
				var my_media = new Media("/android_asset/www/" + e.soundname);
				my_media.play();
			}
			else
			{  // otherwise we were launched because the user touched a notification in the notification tray.
				if (e.coldstart)
				{
//					$("#app-status-ul").append('<li>--COLDSTART NOTIFICATION--' + '</li>');
				}
				else
				{
//					$("#app-status-ul").append('<li>--BACKGROUND NOTIFICATION--' + '</li>');
				}
			}

//			$("#app-status-ul").append('<li>MESSAGE -> MSG: ' + e.payload.message + '</li>');
//			$("#app-status-ul").append('<li>MESSAGE -> MSGCNT: ' + e.payload.msgcnt + '</li>');
			break;
		case 'error':
//			$("#app-status-ul").append('<li>ERROR -> MSG:' + e.msg + '</li>');
			break;
		default:
//			$("#app-status-ul").append('<li>EVENT -> Unknown, an event was received and we do not know what it is</li>');
			break;
	}
}

function messageCallback(i) {
	if (i == 1) {
		window.open(messageContent, '_blank', 'location=yes');
	}
}

function errorHandler(error) {
//alert('GCM_error = ' + error);
	logDisplay('GCM_error: ' + error);
}
/**
 * PUSH NOTIFICATION - END
 */



/**
 * padNumber
 * put spaces before a string, final string length will be parameter length
 * 
 */

function padNumber(str, length) {
	str = str.toString();
	while (str.length < length) {
		str = '0' + str;
	}
//logDisplay(str);
	return str;
}

/**
 * partOfAnObject
 * 
 *   
 */


function partOfAnObject(obj) {

	var output = '';
	for (var property in obj) {
		output += property + ': ' + obj[property] + '; ';
	}
	alert(output);
	logDisplay(output);
}

function alertDismissed() {
// do something
}
function showMessage(message, title, buttonname)
{
	navigator.notification.alert(
			message, // message
			alertDismissed, // callback
			title, // title
			buttonname                  // buttonName
			);
}


function showError(message)
{
	navigator.notification.alert(
			message, // message
			alertDismissed, // callback
			Localization.trans("SMILE_RES_0001"), // title
			Localization.trans("SMILE_RES_0002")                 // buttonName
			);
}

function isNumber(n) {
	return !isNaN(parseFloat(n)) && isFinite(n);
}

function createSQLdate(date, onlyDate) {
	if (typeof onlyDate == "undefined") {
		onlyDate = false;
	}
	if (onlyDate == true) {
		return date.getFullYear() + "-" + padNumber(parseInt(date.getMonth()) + 1, 2) + "-" + padNumber(date.getDate(), 2);
	} else {
		return date.getFullYear() + "-" + padNumber(parseInt(date.getMonth()) + 1, 2) + "-" + padNumber(date.getDate(), 2) + " " + padNumber(date.getHours(), 2) + ":" + padNumber(date.getMinutes(), 2) + ":" + padNumber(date.getSeconds(), 2);
	}

}

/**
 * create date object from sql date format
 */
function dateFromSqlFormat(date) {
	logDisplay("dateFromSqlFormat: " + date);
	if (date == null) {
		return null;
	}
	var dateTags = date.split("-");
	return new Date(dateTags[0], dateTags[1] - 1, dateTags[2]);
}

/**
 * create date object from sql datetime format
 */
function dateFromSqlDateTime(date) {
	if (date == null) {
		return null;
	}
	var dateSplit = date.split(" ");
	var dateTags = dateSplit[0].split("-");
	var timeTags = dateSplit[1].split(":");
	return new Date(dateTags[0], dateTags[1] - 1, dateTags[2], timeTags[0], timeTags[1]);
}

/**
 * escape for mysql query
 *
 */
function mysqlEscape(str) {
//logDisplay(str.replace("'","''"));
	if (str == null || str == "null" || isNumber(str)) {
		return str;
	}
	return str.replace(/'/g, "''");
}

var hideKeyboard = function() {
	document.activeElement.blur();
	$("input").blur();
	if (device.platform == "Android") {
		SoftKeyboard.hide();
	}
};

function findObjectByAttribute(items, attribute, value) {
	for (var i = 0; i < items.length; i++) {
		if (items[i][attribute] === value) {
			return i;
			return items[i];
		}
	}
	return null;
}

/**
 * style a number with spaces
 */
function numberSpaces(str) {
	str = str.toString();
	logDisplay("numberSpaces");
	var str1 = "";
	var l = 0;
	logDisplay(str.length);
	for (var k = str.length - 1; k >= 0; k--) {
		str1 = str[k] + str1;
		logDisplay(str1);
		l++;
		if (l % 3 == 0) {
			str1 = " " + str1;
		}
	}
	return str1;
}

/**
 * read form values and write them to an object
 */
function getFormValues(form_selector) {
	var values = {};
	$(form_selector + " input[type=text], " + form_selector + " input[type=hidden], " + form_selector + " input[type=password], " + form_selector + " input[type=number], " + form_selector + " input[type=email], " + form_selector + " select, " + form_selector + " textarea").each(function() {
		var name = $(this).attr('name');
		eval("values." + name + "='" + $(this).val() + "'");
	});
	$(form_selector + " input[type=checkbox]").each(function() {
		var name = $(this).attr('name');
		if (this.checked) {
			eval("values." + name + "=1;");
		} else {
			eval("values." + name + "=0;");
		}
	});
	logDisplay(values);
	return values;
}

/**
 * set form values from an object
 */
function setFormValues(values, form_selector) {
	$(form_selector + " input[type=text], " + form_selector + " input[type=password], " + form_selector + " input[type=number], " + form_selector + " input[type=email], " + form_selector + " select").each(function() {
		var name = $(this).attr('name');
		eval("$(this).val(values." + name + ");");
	});
	$(form_selector + " textarea").each(function() {
		var name = $(this).attr('name');
		eval("$(this).html(values." + name + ");");
	});
	$(form_selector + " input[type=checkbox]").each(function() {
		var name = $(this).attr('name');
		if (parseInt(values[name]) == 1) {
			$(this).attr('checked', true);
			$(this).trigger("change");
		} else {
			$(this).attr('checked', false);
		}
	});
}

/**
 * get sql insert/update column- value string from an object
 */
function getSqlString(object, type) {
	var sqlString = "";
	var columns = new Array();
	var values = new Array();
	for (var key in object) {
		if (type == "update") {
			values.push("'" + key + "'='" + mysqlEscape(object[key]) + "'");
		}
		if (type == "insert") {
			values.push("'" + mysqlEscape(object[key]) + "'");
			columns.push("'" + key + "'");
		}

	}
	if (type == "update") {
		sqlString = values.join(",");
	}
	if (type == "insert") {
		sqlString = " ( " + columns.join(",") + " ) VALUES ( " + values.join(",") + " ) ";
	}
	return sqlString;
}


/**
 * Error function for global functions with sql queries
 */
function errorSQL(err) {
	logDisplay("SQL ERROR " + err.code + " : " + err.message);
}

/**
 * restore datas from a json string (for iCloud/Dropbox)
 */

function loadDatasFromJSON(data, successhandler, errorhandler) {
	if (typeof errorhandler == "undefined") {
		errorhandler = errorSQL;
	}
	data = JSON.decode(data);
	logDisplay("restore datas");
	jQuery.each(data.storage_items, function(key, val) {
		if(val != null) {
			storage.setItem(key, val);
			logDisplay("key: " + key + " value: " + val);
		}
		else {
			logDisplay("key: " + key + " value is null, no backup");
		}
	});
	var inserts = new Array();
	jQuery.each(data.db_tables, function(table, val) {
		var insert_strings = {};
		insert_strings.table_name = table;
		insert_strings.statements = new Array();
		var insert_str = "INSERT INTO " + table + " ";
		jQuery.each(val, function(key, datas) {
			var columns = new Array();
			var values = new Array();
			jQuery.each(datas, function(column, value) {
				columns.push(column);
				values.push(mysqlEscape(value));
			});
			insert_strings.statements.push(insert_str + "( " + columns.join() + " ) VALUES ( '" + values.join("','") + "' );");
		});
		//logDisplay(insert_strings);
		inserts.push(insert_strings);
	});

	var n = 0;
	db.transaction(function(tx) {
		for (var i = 0; i < inserts.length; i++) {
			(function f(k) {
				logDisplay("DELETE FROM " + inserts[k].table_name);
				tx.executeSql("DELETE FROM " + inserts[k].table_name, [], function(tx, res) {
					for (var j = 0; j < inserts[k].statements.length; j++) {
						(function f(l) {
							n++;
							var sqlQuery = inserts[k].statements[l];
							logDisplay(sqlQuery);
							tx.executeSql(sqlQuery, [],
									function(tx, results) {
										/*logDisplay("k: "+k+" l: "+l);
										 logDisplay("?k== "+inserts.length+" ?l== "+inserts[k].statements.length);*/
										if (k == inserts.length - 1 && l == inserts[k].statements.length - 1) {
											logDisplay("DATA RESTORE FINISHED");
											successhandler();
										}
									}, errorhandler);
						}(j));
					}
				}, errorhandler);
			}(i));
		}
	}, errorhandler);

}
