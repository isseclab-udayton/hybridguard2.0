

function DBSync(restClient, db, local) {
	// Add object properties like this
	if (typeof local == "undefined") {
		local = false;
	}
	this.local=local;
	this.restClient = restClient;
	this.user = this.restClient.goptions.user;
	this.password = this.restClient.goptions.password;
	this.db = db;
	if (this.local == true) {
		this.syncDomain = "data";
	} else {
		this.syncDomain = Localization.trans("SMILE_RES_REST_URL");
	}
	this.filesToTransfer = null;
}


DBSync.prototype.authentication = function(username, password, successCallBack, error) {
	this.restClient.get({path: "account?user_name=" + username + "&password=" + password, success: successCallBack, error: error ? error : this.error});
};

DBSync.prototype.copyTable = function(table, parameters, successCallback, onlySchema) {
	if (typeof onlySchema == "undefined") {
		onlySchema = false;
	}
	
	logDisplay("copy table: " + table);
	//logDisplay(typeof this);
	var self = this;
	this.restClient.get({
		path: self.local==true?("schema/"+table+".json"):(table + "/schema"),
		success: function(schema) {
			//logDisplay("get schema OK");
			if (onlySchema == false) {
				self.restClient.get({
					path: self.local==true?(Localization.language+"/"+table+".json"):(table + "?" + parameters),
					success: function(data) {
						//logDisplay("get data OK");
						self.db.transaction(function(tx) {
							logDisplay(table + "?" + parameters);
							//logDisplay(schema);
							//logDisplay("drop table");
							tx.executeSql('DROP table if exists ' + schema.table + ';');
							var cols = new Array();
							jQuery.each(schema.columns, function(key, val) {
								cols.push(key + " " + val);
							});
							var createSql = "CREATE TABLE IF NOT EXISTS " + schema.table + " ( " + cols.join(", ") + " )";
							//logDisplay(createSql);
							tx.executeSql(createSql);
							jQuery.each(schema.indexes, function(key, val) {
								tx.executeSql("CREATE INDEX " + key + " ON " + schema.table + " (" + val + ");");
							});
							//logDisplay(data);						
							logDisplay("db inserts (rows: " + data.length + " " + schema.table + ")");
							var insert_str = "INSERT INTO " + schema.table + " ";
							for (var k = 0; k < data.length; k++) {
								var columns = new Array();
								var values = new Array();
								jQuery.each(data[k], function(i, val) {
									columns.push(i);
									values.push(mysqlEscape(val));
								});
								insert_query = insert_str + "( " + columns.join() + " ) VALUES ( '" + values.join("','") + "' );";
								//logDisplay(insert_query);
								tx.executeSql(insert_query);
							}
						}, self.dberror, successCallback ? successCallback : function() {
							logDisplay("success DB transaction");
						});
					},
					error: self.error
				});
			} else {
				self.db.transaction(function(tx) {
					logDisplay(table + "?" + parameters);
					//logDisplay(schema);
					//logDisplay("drop table");
					// TODO: DROP ONLY TABLE IF EMPTY
					tx.executeSql('DROP table if exists ' + schema.table + ';');
					var cols = new Array();
					jQuery.each(schema.columns, function(key, val) {
						cols.push(key + " " + val);
					});
					var createSql = "CREATE TABLE IF NOT EXISTS " + schema.table + " ( " + cols.join(", ") + " )";
					logDisplay(createSql);
					tx.executeSql(createSql);
					jQuery.each(schema.indexes, function(key, val) {
						logDisplay("CREATE INDEX " + key + " ON " + schema.table + " (" + val + ");");
						tx.executeSql("CREATE INDEX " + key + " ON " + schema.table + " (" + val + ");");
					});

				}, self.dberror, successCallback ? successCallback : function() {
					logDisplay("success DB transaction");
				});
			}
		},
		error: self.error});
};


DBSync.prototype.insertOrReplaceDatas = function(table, parameters, successCallback) {
	logDisplay("update table: " + table);
	//logDisplay(typeof this);
	var self = this;
	this.restClient.get({path: table + "?" + parameters, success: function(data) {
			self.db.transaction(function(tx) {
				logDisplay("db insert or replace (rows: " + data.length + " " + table + ")");
				var insert_str = "INSERT OR REPLACE INTO " + table + " ";
				for (var k = 0; k < data.length; k++) {
					var columns = new Array();
					var values = new Array();
					jQuery.each(data[k], function(i, val) {
						columns.push(i);
						values.push(mysqlEscape(val));
					});
					insert_query = insert_str + "( " + columns.join() + " ) VALUES ( '" + values.join("','") + "' );";
					//logDisplay(insert_query);
					tx.executeSql(insert_query);
				}
			}, self.dberror, successCallback ? successCallback : function() {
				logDisplay("success DB transaction");
			});
		}, error: self.error});

};

DBSync.prototype.initFileSystem = function() {
	var self = this;
	var filename = "dummy1.txt";
	window.requestFileSystem(
			LocalFileSystem.PERSISTENT, 0,
			function onFileSystemSuccess(fileSystem) {
				logDisplay("filesystem " + fileSystem.root.toURL());
				//window.localStorage.setItem("filepath", fileSystem.root.toURL());
				fileSystem.root.getFile(
						filename, {create: true, exclusive: false},
				function gotFileEntry(fileEntry) {

					var sPath = fileEntry.toNativeURL().replace(filename, "");
					logDisplay("gotfileentry: " + sPath);
					window.localStorage.setItem("filepath", sPath);
				}, self.fileFail);
			},
			self.fileFail);

};

DBSync.prototype.uploadFiles = function(filenames, params, uploadService, successFunction, errorFunction) {
	logDisplay("uploadFile");
	this.filesToTransfer = filenames;
	this.uploadOneFile(uploadService, params, successFunction, errorFunction);
};
DBSync.prototype.uploadOneFile = function(uploadService, params, successFunction, errorFunction) {
	logDisplay("uploadOneFile");
	var ft = new FileTransfer();
	var self = this;
	if (this.filesToTransfer.length == 0) {
		logDisplay("File transfer (upload) finished!");
		successFunction();
		return;
	}
	var filenameToUpload = this.filesToTransfer.pop();
	var fileURL = window.localStorage.getItem("filepath") + encodeURI(filenameToUpload);
	logDisplay(fileURL);
	var options = new FileUploadOptions();
	options.fileKey = "file";
	options.fileName = fileURL.substr(fileURL.lastIndexOf('/') + 1);
	options.params = params;
	logDisplay(options.fileName);
	var headers = {"Authorization": "Basic " + window.btoa(self.user + ":" + self.password)};
	options.headers = headers;

	logDisplay("--------------- UPLOAD FILE " + filenameToUpload + " ------------------");
	ft.upload(fileURL, encodeURI(self.syncDomain) + "/" + uploadService,
			function(r) {
				logDisplay("Code = " + r.responseCode);
				logDisplay("Response = " + r.response);
				logDisplay("Sent = " + r.bytesSent);
				self.uploadOneFile(uploadService, params, successFunction, errorFunction);
			},
			function(error) {
				//logDisplay("download error source " + error.source);
				//logDisplay("download error target " + error.target);
				logDisplay("upload error code: " + error.code);
				//errorFunction(error);

			}, options);

};

DBSync.prototype.downloadFile = function(filenames, successFunction, errorFunction) {
	this.filesToTransfer = filenames;
	this.downloadOneFile(successFunction, errorFunction);
};

DBSync.prototype.downloadOneFile = function(successFunction, errorFunction) {


	var filename = "dummy1.txt";
	var self = this;
	if (this.filesToTransfer.length == 0) {
		logDisplay("File transfer finished!");
		successFunction();
		return;
	}
	var filenameToDownload = this.filesToTransfer.pop();
	var remoteFile = "";
	if (self.syncDomain[self.syncDomain.length - 1] == "/" && filenameToDownload[0] == "/") {
		remoteFile = self.syncDomain + encodeURI(filenameToDownload.substr(1));
	} else {
		remoteFile = self.syncDomain + encodeURI(filenameToDownload);
	}
	if (self.syncDomain[self.syncDomain.length - 1] != "/" && filenameToDownload[0] != "/") {
		remoteFile = self.syncDomain + "/" + encodeURI(filenameToDownload);
	}
	window.requestFileSystem(
			LocalFileSystem.PERSISTENT, 0,
			function onFileSystemSuccess(fileSystem) {
				//logDisplay("--------------------------------------------------");
				fileSystem.root.getFile(
						filename, {create: true, exclusive: false},
				function gotFileEntry(fileEntry) {

					var sPath = fileEntry.fullPath.replace(filename, "");
					if ((device.platform == "Android" || device.platform == "android")) {
						sPath = sPath + "agroassist/";
						window.localStorage.setItem("filepath", fileSystem.root.toURL());
					}
					if (device.platform == "iOS") {
						window.localStorage.setItem("filepath", fileSystem.root.toURL());
					}

					var fileTransfer = new FileTransfer();

					logDisplay(sPath + filenameToDownload);
					fileEntry.remove();
					fileTransfer.download(
							remoteFile,
							window.localStorage.getItem("filepath") + encodeURI(filenameToDownload),
							function(theFile) {
								if (device.platform == "iOS") {
									theFile.setMetadata(self.fileSuccess, self.fileFail, {"com.apple.MobileBackup": 1});
								}
								self.downloadOneFile(successFunction, errorFunction);
							},
							function(error) {
								//logDisplay("download error source " + error.source);
								//logDisplay("download error target " + error.target);
								logDisplay("download error code: " + error.code);
								errorFunction(error);

							}
					);



				}, self.fileFail);
			},
			self.fileFail);
};


DBSync.prototype.fileSuccess = function() {
	logDisplay("file function ok");
};

DBSync.prototype.fileFail = function(evt) {
	logDisplay("error: " + evt.code);
};

DBSync.prototype.error = function(req, status, ex) {
	logDisplay(JSON.stringify(req) + " " + status + " " + ex);
};

DBSync.prototype.dberror = function(err) {
	logDisplay("Error processing SQL: " + err);
};


function checkConnection() {
	var networkState = navigator.connection.type;

	var states = {};
	states[Connection.UNKNOWN] = 'Unknown';
	states[Connection.ETHERNET] = 'Ethernet';
	states[Connection.WIFI] = 'WiFi';
	states[Connection.CELL_2G] = 'Cell';
	states[Connection.CELL_3G] = 'Cell';
	states[Connection.CELL_4G] = 'Cell';
	states[Connection.CELL] = 'Cell';
	states[Connection.NONE] = 'NO';

	return states[networkState];
}

function sqlEscape(stringToEscape) {
	return stringToEscape
			.replace("\\", "\\\\")
			.replace("\'", "\\\'")
			.replace("\"", "\\\"")
			.replace("\n", "\\\n")
			.replace("\r", "\\\r")
			.replace("\x00", "\\\x00")
			.replace("\x1a", "\\\x1a");
}