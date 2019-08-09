(function() {
	
	/*---------------------------------------------------
	Globals
	---------------------------------------------------*/
	
	var config = {};
	var lastVisible = null;
	var noop = function() {};
	var historyStack = [];
	
	/*---------------------------------------------------
	General
	---------------------------------------------------*/
	
	$().ready(function() {
		// Add events
		$('#login-form').submit(buildSubmit);
		$('a[target="_system"]').on('click', function(e) {
			e.preventDefault();
			window.open($(this).attr('href'), '_system');
		});
		
		// Issue #27
		// When input box is selected, the soft-keyboard is shown
		// but the input box focus is in the incorrect position.
		$('#address').on('touchstart', function() {
			$('#address').focus();
		});
		
		// On input selection, backup the current address.
		$('#address').on('focus', function() {
			$('#address').attr('currentValue', getAddressField());
		});
		
		// On input de-selection, restore backup if there is no content.
		$('#address').on('blur', function() {
			var $address = $('#address'),
			whitespaceRegex = /^\s*$/;
			
			if (whitespaceRegex.test(getAddressField())) {
				$address.val($address.attr('currentValue'));
			}
			$address.attr('currentValue', '');
		});
		
		// Work around CSS browser issues.
		supportBrowserQuirks();
		
		$('#qr-code').on('click', function(e) {
			historyStack.push("scan");
			cordova.plugins.barcodeScanner.scan(scanSuccess, scanError);
		});
		
		$('#write-address, #form-cancel').on('click', function(e) {
			e.preventDefault();
			toggleForm();
		});
		
		$('#settings, #setting-cancel').on('click', function(e) {
			e.preventDefault();
			toggleSettings();
		});
		
		$('#reset-am').on('click', function(e) {
			e.preventDefault();
			resetAccountManager();
		});
		
		$('#reset-data').on('click', function(e) {
			e.preventDefault();
			resetData();
		});
		
		$('#setting-save').on('click', function(e) {
			e.preventDefault();
			saveConfig(toggleSettings);
		});
		
		$('#message-back').on('click', function(e) {
			e.preventDefault();
			toggleMessage();
		});
		
		$('#message-continue').on('click', function(e) {
			e.preventDefault();
			buildSubmit(true);
		});
	});
	
	$(document).on('deviceready', function() {
		document.addEventListener("backbutton", onBackButton, false);
			navigator.notification.alert(error, noop, 'Scan error');
		
		$('body').addClass('platform-' + cordova.platformId);
		
		// Add slight delay to allow DOM rendering to finish.
		// Avoids flicker on slower devices.
		setTimeout(function() {
			// allow the screen to dim when returning from the served app
			window.plugins.insomnia.allowSleepAgain();
			
			navigator.splashscreen.hide();
			
			// %HOCKEYAPP
			
			// Load configuration
			window.phonegap.app.config.load(function(data) {
				// store the config data
				config = data;
				
				// load emulator address
				if (config.emulatorAddress) {
					$('#address').val(config.emulatorAddress);
				}
				
				// load notification sender id
				if (config.notificationsSenderId) {
					$('#notifications-sender-id').val(config.notificationsSenderId);
				}
				
				setTimeout( function() {
					$('.logo').removeClass('hidden').removeClass('faded');
				}, 1750);
				
				setTimeout( openBot, 2750);
				setTimeout( function() {
					$('.buttons, .info').removeClass('hidden');
					$('.buttons, .info').removeClass('faded');
				}, 3350 );
			});
			
		}, 350);
	});
	
	/*---------------------------------------------------
	UI - General
	---------------------------------------------------*/
	
	function openBot() {
		$('.visor').addClass('faded');
		setTimeout(function() {
			$('.visor').addClass('hidden');
			if (lastVisible == 'form') {
				$('.monitor').removeClass('hidden');
				$('.monitor').removeClass('faded');
			} else if (lastVisible == 'settings') {
				$('.settings').removeClass('hidden');
				$('.settings').removeClass('faded');
			} else {
				$('.buttons, .info').removeClass('hidden');
				$('.buttons, .info').removeClass('faded');
			}
		}, 550);
	}
	
	function closeBot() {
		if (!$('.buttons').hasClass('hidden')) { // buttons visible
			lastVisible = 'buttons';
			$('.buttons, .info').addClass('faded');
			setTimeout(function() {
				$('.buttons, .info').addClass('hidden');
				$('.visor').removeClass('hidden');
				$('.visor').removeClass('faded');
			}, 550);
			
		} else if (!$('.settings').hasClass('hidden')) { // settings visible
			lastVisible = 'settings';
			$('.settings').addClass('faded');
			setTimeout(function() {
				$('.settings').addClass('hidden');
				$('.visor').removeClass('hidden');
				$('.visor').removeClass('faded');
			}, 550);
		} else if (!$('.message').hasClass('hidden')) { // settings visible
			lastVisible = 'message';
			$('.message').addClass('faded');
			setTimeout(function() {
				$('.message').addClass('hidden');
				$('.visor').removeClass('hidden');
				$('.visor').removeClass('faded');
			}, 550);
		} else { // form visible
			lastVisible = 'form';
			$('.monitor').addClass('faded');
			setTimeout(function() {
				$('.monitor').addClass('hidden');
				$('.visor').removeClass('hidden');
				$('.visor').removeClass('faded');
			}, 550);
			
		}
	}
	
	function toggleForm() {
		
		if ($('.monitor').hasClass('hidden')) { // show form
			
			$('.buttons, .info').addClass('faded');
			setTimeout(function() {
				$('.buttons, .info').addClass('hidden');
				$('.monitor').removeClass('hidden');
				$('.monitor').removeClass('faded');
			}, 550);
			historyStack.push("form");
		} else { // show buttons
			
			$('.monitor').addClass('faded');
			setTimeout(function() {
				$('.monitor').addClass('hidden');
				$('.buttons, .info').removeClass('hidden');
				$('.buttons, .info').removeClass('faded');
			}, 550);
			historyStack.pop();
		}
		
	}
	
	function toggleMessage(plugins) {	
		if ($('.message').hasClass('hidden')) { // show message
			
			$('.visor').addClass('faded');
			setTimeout(function() {
				$('.visor').addClass('hidden');
				$('.message').removeClass('hidden');
				$('.message').removeClass('faded');
			}, 550);
			$(".message .list").text("");
			for (var i = 0; i < plugins.length; i++) {
				var plugin = plugins[i];
				var message = $("<li>" + plugin.id + " <span>" + plugin.required
				+ "</span></li>");
				$(".message .list").append(message);
			}
			historyStack.push("message");
		} else { // show buttons
			
			$('.message').addClass('faded');
			setTimeout(function() {
				
				$('.message').addClass('hidden');
				
				if (lastVisible === "form") {
					$('.monitor').removeClass('faded');
					$('.monitor').removeClass('hidden');
				} else {
					$('.buttons, .info').removeClass('faded');
					$('.buttons, .info').removeClass('hidden');
				}
			}, 550);
			historyStack.pop();
		}
		
	}
	
	function toggleSettings() {	
		if ($('.settings').hasClass('hidden')) { // show settings
			$('.buttons, .info').addClass('faded');
			setTimeout(function() {
				$('.buttons, .info').addClass('hidden');
				$('.settings').removeClass('hidden');
				$('.settings').removeClass('faded');
			}, 550);
			historyStack.push("settings")
		} else { // show buttons
			
			$('.settings').addClass('faded');
			setTimeout(function() {
				$('.settings').addClass('hidden');
				$('.buttons, .info').removeClass('hidden');
				$('.buttons, .info').removeClass('faded');
			}, 550);
			historyStack.pop();
		}
		
	}
	
	function saveConfig(callback) {
		if ($('#notifications-sender-id').val()) {
			config["notificationsSenderId"] = $('#notifications-sender-id').val();
		} 
		config.emulatorAddress = getAddressField();
		window.phonegap.app.config.save(config, callback);
	}
	
	
	// Note that the bot needs to be closed to be able to view this
	function updateMessage( msg ) {
		$('.visor').removeClass('pulse');
		$('.visor').removeClass('alert');
		$('.visor label').html( msg.toUpperCase() );
	}
	
	function errorMessage( msg ) {
		updateMessage( msg );
		$('.visor').removeClass('pulse');
		$('.visor').removeClass('alert');
	}
	
	function pulsingMessage( msg ) {
		updateMessage( msg );
		$('.visor').addClass('pulse');
	}
	
	function alternatingPulsingMessage( msg1, msg2 ) {
		return setInterval(function() {
			var currentMsg = $('.visor label').text();
			newMsg = (currentMsg === msg1.toUpperCase()) ? msg2 : msg1;
			pulsingMessage(newMsg);
		}, 1500);
	}
	
	function clearAlternatingPulsingMessage(timer) {
		clearInterval(timer);
	}
	
	/*---------------------------------------------------
	UI - Form
	---------------------------------------------------*/
	
	function buildSubmit(ignorePlugins) {
		
		var submitCancelled = false;
		historyStack.push("build");
		var ajaxCall = null;
		
		function cancelSubmit(e) {
			submitCancelled = true;
			e.preventDefault();
			document.removeEventListener("backbutton", cancelSubmit);
			ajaxCall && ajaxCall.abort();
			openBot();
		}
		
		function navigateToApp() {
			// don't allow the screen to dim when serving an app
			window.plugins.insomnia.keepAwake();
			
			setTimeout(function() {
				if (submitCancelled) return;
				navigator.splashscreen.show();
				setConfigPreferences().then(function() {
					window.location = getAddress();
				})
			}, 1000);
		}
		
		function onBuildSubmitSuccess() {
			if (submitCancelled) return;
			updateMessage('Loading...');
			saveConfig(function() {
				
				if (ignorePlugins === true) {
					navigateToApp();
					return;
				}
				
				
				checkPlugins().then(function(result) {
					if (submitCancelled) return;
					if ($.isArray(result)) { // plugin errors
						toggleMessage(result)
					} else if (result) { // plugins OK
						navigateToApp();
					} else {
						// unable to check plugins
						onBuildSubmitError();
					}
				});
				
			});
		}
		
		function onBuildSubmitError(type) {
			if (submitCancelled) return;
			if (type === 'timeout') {
				errorMessage('Timeout Error!');
			} else {
				errorMessage('Connection Error!');
			}
			
			setTimeout(function() {
				if (submitCancelled) return;
				errorMessage('Check your Network Settings: mobile device and workstation must use the same network.');
			}, 1500);
			
			setTimeout(function() {
				if (submitCancelled) return;
				historyStack.pop();
				openBot();
			}, 3500);
		}
		
		function registerWithServer() {
			if (submitCancelled) return;
			ajaxCall = $.ajax({
				type: 'POST',
				url: getAddress('/__api__/register'),
				dataType: 'json',
				data: {
					platform: device.platform,
					version: device.cordova
				},			
				timeout: 1000 * 10,
				success: function(data) {
					onBuildSubmitSuccess();
				},
				error: function(xhr, type) {
					// support older servers that do not support /register
					if (submitCancelled) return;
					ajaxCall = $.ajax({
						type: 'GET',
						url: getAddress(),
						dataType: 'text',
						timeout: 1000 * 10,
						success: function(data) {
							onBuildSubmitSuccess();
						},
						error: function(xhr, type) {
							onBuildSubmitError(type);
						}
					});
					
				}
			});
		}
		
		document.addEventListener("backbutton", cancelSubmit, false);
		closeBot();
		pulsingMessage('Connecting to workstation...');
		setTimeout(function() {
			registerWithServer();
		}, 500);
		
		return false;
	}
	
	function listenForCancel(onCancel) {
		removeListenerForCancel(); // make sure we aren't multiple-binding
		$('#bot').on('touchend', function(e) {
			console.log('triggering...');
			$(document).trigger('cancelSync');
		});
	}
	
	function removeListenerForCancel() {
		$('#bot').off('touchend');
	}
	
	function onUserCancel() {
		var message = 'Cancelled';
		removeListenerForCancel();
		errorMessage(message);
		
		setTimeout(function() {
			$('.monitor').removeClass('alert');
			updateMessage('');
			openBot();
		}, 500);
	}
	
	function getAddressField() {
		var $address = $('#address'),
		address = $address.val() || $address.attr('placeholder');
		
		return address;
	}
	
	function getAddress(path) {
		var address = getAddressField();
		
		// default to http:// when no protocol exists
		address = (address.match(/^(.*:\/\/)/)) ? address : 'http://' + address;
		
		// append an optional path
		if (path) {
			address += '/' + path;
			
			// replace double forward slashes with a single forward-slash
			// except after the protocol (://)
			address = address.replace(/([^:])\/\//g, '$1/');
		}
		
		return address;
	}
	
	
	/*
	 * WebRatio: QR Code 
	 */
	
	function scanSuccess(result) {
		if (!result.cancelled && result.text) {
			if (result.format === 'QR_CODE') {
				if (result.text.match("^itms-services:\/\/.+(type%3Dplist|type=plist)$")) {
					// iOS App
					if (device.platform.toLowerCase() === "ios") {
						window.location = result.text;
					} else {
						scanError("Please use an iOS device to install your app");
					}
				} else if (result.text.match("^.+type=apk$")) { // Android App
					if (device.platform.toLowerCase() === "android") {
						installAndroid(result.text);
					} else {
						scanError("Please use an Android device to install your app");
					}
				} else { // Emulator link
					$('#address').val(result.text);
					$('#login-form').submit();
				}
			} else {
				scanError(null);
			}
		}
	}
	
	function scanError(error) {
		if (error) {
			navigator.notification.alert(error, noop, 'Scan error');
		} else {
			navigator.notification
			.alert('Please scan the QR Code generated from WebRatio Platform',
			noop, 'Scan error');
		}
		
	}
	
	/*
	 * WebRatio: Back Button Event
	 */
	
	function onBackButton(e) {
		if (historyStack.length) {
			var lastVisit = historyStack[historyStack.length - 1];
			
			switch (lastVisit) {
			case "form":
				toggleForm();
				break;
			case "settings":
				toggleSettings();
				break;
			case "message":
				toggleMessage();
				break;
			default:
				historyStack.pop();
			}
		} else {
			navigator.app.exitApp();
		}
	}	
	
	
	/*
	 * WebRatio: Reset Account Manager
	 */
	
	function resetAccountManager() {
		historyStack.push("resetAccountManager");
		closeBot();
		pulsingMessage('Resetting...');
		var p = clearAccount().catch(function(e) {
			errorMessage('Reset failed!');
			console.log(e);
			setTimeout(function() {
				openBot();
				if (historyStack.length && historyStack[historyStack.length - 1] === "resetAccountManager") {
					historyStack.pop(); // no back pressed
				}
			}, 1500);
			p.cancel();
		}).then(function() {
			updateMessage('Reset completed!');
			setTimeout(function() {
				openBot();
				if (historyStack.length && historyStack[historyStack.length - 1] === "resetAccountManager") {
					historyStack.pop(); // no back pressed
				}
			}, 1500);
		});
		
		return false;
	}
	
	
	/*
	 * WebRatio: Reset Data
	 */
	
	function resetData() {
		historyStack.push("resetData");
		closeBot();
		pulsingMessage('Resetting...');
		
		var p = clearData().catch(function(e) {
			errorMessage('Reset failed!');
			console.log(e);
			setTimeout(function() {
				openBot();
				if (historyStack.length && historyStack[historyStack.length - 1]
						=== "resetData") {
					historyStack.pop(); // no back pressed
				}
			}, 1500);
			p.cancel();
		}).then(function() {
			console.log("Reset completed!");			
			updateMessage('Reset completed!');
			setTimeout(function() {
				openBot();
				if (historyStack.length && historyStack[historyStack.length - 1]
						=== "resetData") {
					historyStack.pop(); // no back pressed
				}
			}, 1500);
			if(window.AppTools){
			  window.AppTools.restart(function() {
				console.log("Restart done");
			  },function(error) {
				console.log("Restart failed " + error);			
			  });
			}
		});
		
		return false;
	}	
	
	function clearAccount() {
		return new Promise(function(resolve, reject) {
			window.accountmanager.setPackage("com.webratio.mobile.developer",
			function() {
				window.accountmanager.clear(function() {
					console.log("Account manager cleared");
					resolve();
				}, function(e) {
					console.log("Unable to clear the Account Manager: " + e);
					reject("Unable to clear the Account Manager: " + e)
				});
			}, function(e) {
				console.log("Unable to set package in the Account Manager: " + e);
				reject("Unable to set package in the Account Manager: " + e)
			});		
		})	
	}
	
	function clearData() {
		var fs = null;
		
		var dirs = {
			'android': [ 
					cordova.file.cacheDirectory,
					cordova.file.dataDirectory + 'Documents',
					cordova.file.applicationStorageDirectory + 'app_webview',
					cordova.file.applicationStorageDirectory + 'app_database',
					cordova.file.applicationStorageDirectory + 'databases',
					cordova.file.externalApplicationStorageDirectory + 'cache'],
			'ios': [ cordova.file.cacheDirectory, cordova.file.tempDirectory,
					cordova.file.dataDirectory, cordova.file.documentsDirectory,
					cordova.file.applicationStorageDirectory
					+ 'Library/WebKit/LocalStorage' ]
		};
		var excludedChildDirs = {
			'android': [ cordova.file.dataDirectory + 'Documents' ],
			'ios': []
		};
		
		var dirList = dirs[cordova.platformId];
		var excludedChildDirList = excludedChildDirs[cordova.platformId];
		
		function ignoreError(e) {
			var ignore = false;
			switch (e.code) {
			case FileError.NOT_FOUND_ERR:
				ignore = true;
				break;
			case FileError.NO_MODIFICATION_ALLOWED_ERR:
				ignore = true;
				break;
			}
			;
			return ignore;
		}
		
		function deleteContent(directory, excludedDirectories) {
			var excludedDirectoriesSet = {};
			excludedDirectories.forEach(function(url) {
				excludedDirectoriesSet[url] = true;
				excludedDirectoriesSet[url + '/'] = true;
			});		
			return new Promise(function(resolve, reject) {
				window.resolveLocalFileSystemURL(directory, function(_dir) {
					var dirPath = _dir.nativeURL;
					_dir.createReader().readEntries(function(entries) {
						var p = Promise.resolve();					
						entries.forEach(function(entry) {
							p = p.then(function() {
								return new Promise(function(resolve, reject) {
									if (entry.isDirectory) {
										console.log("Deleting directory " + directory);
										if (excludedDirectoriesSet[entry.nativeURL]) {
											resolve();
										} else {
											entry.removeRecursively(resolve,
											function(e) {
												if (ignoreError(e)) {
													resolve();
												} else {
													reject("Unable to remove " + directory);
												}
											});
										}
									} else {
										if (directory === cordova.file.dataDirectory && entry.name === window.phonegap.app.configFilename) {
											resolve();
										} else {
											console.log("Deleting file " + directory);
											entry.remove(resolve, function(e) {
												if (ignoreError(e)) {
													resolve();
												} else {
													reject("Unable to remove " + directory)
												}
											});
										}
									}
								});
							}, function(e) {
								if (ignoreError(e)) {
									resolve();
								} else {
									reject("Unable to remove " + directory)
								}
							});
						});
						
						p = p.then(function() {
							resolve()
						})
						
						return p;
						
					}, function(e) {
						if (ignoreError(e)) {
							resolve();
						} else {
							reject("Unable to remove " + directory)
						}
					});
					
				}, function(e) {
					if (ignoreError(e)) {
						resolve();
					} else {
						reject("Unable to remove " + directory)
					}
				});
			});
		}
		
		var i = 0;
		var p = Promise.resolve();		
		dirList.forEach(function(currentDir) {
			p = p.then(function() {
				return deleteContent(currentDir, excludedChildDirList);
			});
		});
		
		return p;
	}
	
	/*
	 * WebRatio: Install Android App
	 */
	function installAndroid(appUrl) {
		var HISTORYNAME = "build";
		var downloadCancelled = false;
		var downloadComplete = false;
		historyStack.push(HISTORYNAME);
		var ajaxCall = null;
		var fileTransfer = new FileTransfer();
		
		function cancelDownload(e) {
			downloadCancelled = true;
			e.preventDefault();
			document.removeEventListener("backbutton", cancelDownload);
			
			if (!downloadComplete) {
				fileTransfer.abort();
			}
			
			openBot();
		}
		
		function onDownloadComplete(entry) {
			updateMessage('Download completed!');
			downloadComplete = true;
			setTimeout(function() {
				if (downloadCancelled) {
					return
				}
				cordova.plugins.fileOpener2.open(entry.toURL(),
				'application/vnd.android.package-archive', {
					error: onInstallationError,
					success: onInstallationSuccess
				});
			}, 1000);
		}
		
		function onDownloadError(error) {
			if (downloadCancelled || error.code == FileTransferError
					.ABORT_ERR) {
				return
			}
			
			errorMessage('Download failed!');
			console.log(error);
			setTimeout(function() {
				if (downloadCancelled) {
					return
				}
				openBot();
				if (historyStack.length && historyStack[historyStack.length - 1]
						=== HISTORYNAME) {
					historyStack.pop(); // no back pressed
				}
			}, 1500);
		}
		
		function onInstallationSuccess() {
			openBot();
			if (historyStack.length && historyStack[historyStack.length - 1]
					=== HISTORYNAME) {
				historyStack.pop(); // no back pressed
			}
		}
		
		function onInstallationError(e) {
			errorMessage('Installation failed!');
			console.log(e);
			setTimeout(function() {
				if (downloadCancelled) {
					return
				}
				openBot();
				if (historyStack.length && historyStack[historyStack.length - 1]
						=== HISTORYNAME) {
					historyStack.pop(); // no back pressed
				}
			}, 1500);
		}
		
		document.addEventListener("backbutton", cancelDownload, false);
		closeBot();
		pulsingMessage('Downloading...');
		
		fileTransfer.download(appUrl,
		cordova.file.externalCacheDirectory + 'wr-app.apk',
		onDownloadComplete, onDownloadError);
	}
	
	/*
	 * WebRatio: Set Config Preferences
	 */
	
	function setConfigPreferences() {
		var address = getAddress('/config.xml');
		
		var promise = new Promise(function(resolve, reject) {
			$.ajax({
				type: 'GET',
				url: address,
				dataType: 'xml',
				timeout: 1000 * 10,
				success: function(response) {
					resolve(response);
				},
				error: function(xhr, type) {
					reject(type);
				}
			});
		});
		
		promise = promise.then(function(config) {
			var $config = $(config);
			
			var isFullscreen = $('preference[name="Fullscreen"]',
			$config).attr("value");
			
			if (isFullscreen == "true") {
				StatusBar.hide();
			}
			
		}).catch(function(error) {
			return false;
		});
		
		return promise;
	}
	
	
	/*
	 * WebRatio: Plugin check
	 */
	
	function checkPlugins() {
		var address = getAddress('/cordova_plugins.js');
		var promise = new Promise(function(resolve, reject) {
			var success = function(response) {
				var plugins = {};
				var cordova = {
					"define": function(id, definition) {
						definition(null, null, plugins);
					}
				};
				eval(response);
				resolve(plugins.exports.metadata);
			};
			
			$.ajax({
				type: 'GET',
				url: address,
				dataType: 'text',
				timeout: 1000 * 10,
				success: function(response) {
					success(response);
				},
				error: function(xhr, type) {
					reject(type);
				}
			});
			
		});
		
		promise = promise.then(function(requiredPlugins) {
			var pluginsToIgnore = ['com.webratio.androidsupport', 
			'com.google.playservices',
			'cordova-plugin-legacy-whitelist',
			'com.webratio.apptools'];
			var availPlugins = cordova.require("cordova/plugin_list").metadata;
			var pluginsId = Object.keys(requiredPlugins);
			var errorList = [];		
			for (var i = 0; i < pluginsId.length; i++) {
				var id = pluginsId[i];
				if(contains(pluginsToIgnore, id)){
					continue;
				}
				if (!availPlugins[id]) {
					errorList.push({
						"type": "missing",
						"id": id,
						"required": requiredPlugins[id]
					});
				} else if (requiredPlugins[id] !== availPlugins[id]) {
					errorList.push({
						"type": "version",
						"id": id,
						"available": availPlugins[id],
						"required": requiredPlugins[id]
					});
				}
			}				
			if (errorList.length) {
				console.log(errorList);
				return errorList;
			}		
			return true;
		}).catch(function(error) {
			return false;
		});
		
		return promise;
	}
	
	function contains(a, obj) {
		var i = a.length;
		while (i--) {
			if (a[i] === obj) {
				return true;
			}
		}
		return false;
	}
	
	/*---------------------------------------------------
	Browser - Quirks
	---------------------------------------------------*/
	
	function supportBrowserQuirks() {
		// Issue #51
		// Windows Phone 8 does not support border-image
		if (/IEMobile\/10/.test(window.navigator.userAgent)) {
			var element = document.createElement('style');
			element.setAttribute('type', 'text/css');
			element.innerHTML = [
			'#bot .monitor .cover {',
			'   background-image: url(img/frame.png);',
			'   background-size: 270px 220px;',
			'   background-repeat: no-repeat;',
			'   border: none;',
			'}'
			].join('\n');
			document.body.appendChild(element);
		}
	}
})();
