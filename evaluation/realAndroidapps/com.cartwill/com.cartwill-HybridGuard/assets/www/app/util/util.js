marina.util = (function() {
	var util = {},
	states = null;

  util.spinner = function() {
    $.fn.spin = function(opts) {
      this.each(function() {
        var $this = $(this),
        data = $this.data();

      if (data.spinner) {
        data.spinner.stop();
        delete data.spinner;
      }
      if (opts !== false) {
        data.spinner = new Spinner($.extend({
          color: $this.css('color'),
          lines: 7,
          length: 5,
          width: 4,
          radius: 4,
          speed: 1.0
        }, opts)).spin(this);
      }
      });
      return this;
    };
  }();

  util.startSpinner = function() {
    $('#spinner').spin();
  };

  util.stopSpinner = function() {
    $('#spinner').spin(false);
  };

  util.displayValue = function(value) {
    if (value === undefined || value === null) {
      return '';
    }
    return value;
  };

	util.states = function() {
		if (states === null) {
			states = {};
			states[Connection.UNKNOWN] = 'Unknown connection';
			states[Connection.ETHERNET] = 'Ethernet connection';
			states[Connection.WIFI] = 'WiFi connection';
			states[Connection.CELL_2G] = 'Cell 2G connection';
			states[Connection.CELL_3G] = 'Cell 3G connection';
			states[Connection.CELL_4G] = 'Cell 4G connection';
			states[Connection.NONE] = 'No network connection';
		}
		return states;
	};

	util.tryLog = function(scope, functionToTry, finallyDo) {
		finallyDo = finallyDo || function() {};
		try {
			return functionToTry.apply(scope);
		} catch(err) {
			console.log(err);
		} finally {
			finallyDo.apply(scope);
		}
		return null;
	};

	util.checkNetworkStatus = function() {
		var networkState = navigator.network.connection.type;
		console.log('nw state: ' + util.states()[networkState]);
		return networkState;
	};

	util.isConnected = function() {
		var connected = util.checkNetworkStatus();
		return connected && connected !== Connection.NONE;
	};

	util.XMLtoStr = function(xmlData) {
		if (window.ActiveXObject) {
			return xmlData.xml;
		} else {
			return (new XMLSerializer()).serializeToString(xmlData);
		}
	};

	return util;

} ());

