// JavaScript Document
// Script CandibuzZ / Affichage des graphiques et échanges ajax avec le serveur

//----------------------------------------------------------
//--- GESTION MEMOIRE
//----------------------------------------------------------
//----------------------------------------------------------
//--- Mémorisation locale d'une donnée
function saveLocal(varName, varValue) {
	//--- Stockage local
	window.localStorage.setItem(varName, varValue);
	//--- Stockage dans un cookie
	$.cookie(varName, varValue, { expires: 365 })
}
function saveLocalShort(varName, varValue) {
	//--- Stockage local
	window.localStorage.setItem(varName, varValue);
	//--- Stockage dans un cookie
	$.cookie(varName, varValue, { expires: 30 })
}

//----------------------------------------------------------
//--- Mémorisation locale d'une donnée
function getLocal(varName) {
	if(window.localStorage) {
		//--- Stockage local
		return window.localStorage.getItem(varName);
	} else {
		//--- Stockage dans un cookie
		return $.cookie(varName)
	}
}


/**
 * jQuery Cookie plugin
 *
 * Copyright (c) 2010 Klaus Hartl (stilbuero.de)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 */
jQuery.cookie = function (key, value, options) {

    // key and at least value given, set cookie...
    if (arguments.length > 1 && String(value) !== "[object Object]") {
        options = jQuery.extend({}, options);

        if (value === null || value === undefined) {
            options.expires = -1;
        }

        if (typeof options.expires === 'number') {
            var days = options.expires, t = options.expires = new Date();
            t.setDate(t.getDate() + days);
        }

        value = String(value);

        return (document.cookie = [
            encodeURIComponent(key), '=',
            options.raw ? value : encodeURIComponent(value),
            options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
            options.path ? '; path=' + options.path : '',
            options.domain ? '; domain=' + options.domain : '',
            options.secure ? '; secure' : ''
        ].join(''));
    }

    // key and possibly options given, get cookie...
    options = value || {};
    var result, decode = options.raw ? function (s) { return s; } : decodeURIComponent;
    return (result = new RegExp('(?:^|; )' + encodeURIComponent(key) + '=([^;]*)').exec(document.cookie)) ? decode(result[1]) : null;
};
