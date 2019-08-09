(function($){

     $.paisnom = function(string, locale){
		 var lang = locale || $.paisnom.lang;
		 if (!this.paisnom[lang] || !this.paisnom[lang].strings){
		     return string;
		 }
		 return this.paisnom[lang].strings[string]||string;
     };
	
     $.paisnom.setLocale = function (locale){
	 	$.paisnom.lang = locale;
     };

     $.paisnom.getLocale = function (){
	 	return $.paisnom.lang;
     };

 })(jQuery);