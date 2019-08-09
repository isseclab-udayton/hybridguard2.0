// A factory for Regex Library attached to module app.core

(function() {
    'use strict';

    angular
        .module('AngularInstance')
        .factory('caHelper', run);

    function run( $timeout , $rootScope ) {

					
		var helper = {};
		helper.console = window.console ;
		helper.alert = window.alert ;
		helper.moment = moment ;
        
        helper.go = customNamespace.page.goTo ;
        return helper;
    }
})();


