function Language()
{

	var lang;
	
	/*
	 * function checkLanguage
	 * args callback
	 * checks if there is a language defined
	 */
	
	this.checkLanguage = function(callback)
	{
		
		var db = window.openDatabase("VisitBruges", "1.0", "Visit Bruges", 15000000);

		db.transaction(function(tx)
		{
			// tx.executeSql('DROP TABLE IF EXISTS SETTINGS');
			tx.executeSql('CREATE TABLE IF NOT EXISTS SETTINGS (key UNIQUE, value)');
			
		}, errorCB, function()
		{

	    	db.transaction(function(tx)
	    	{
	    		tx.executeSql('SELECT value FROM SETTINGS WHERE key = "lang"', [], function(tx, results)
	    		{		
	    			if(results.rows.length < 1)
	    			{
	    				// er is nog geen taal ingesteld
	    				callback(false);
	    			}
	    			else
	    			{
	    				// er is al een taal ingesteld
	    				for (var i=0; i<results.rows.length; i++)
	    				{
		        			lang = results.rows.item(i).value;
		        			window.localStorage.setItem("lang", lang);
	    				}
	    				
	    				callback(true);
	    			}
	    			
	    		}, errorCB);

			});
			
		})
	
	}
		
	
	/*
	 * function setLanguage
	 * args lang, callback
	 * adds the prefered language to the settings table
	 */
	
	this.setLanguage = function(lang, callback)
	{
		
		window.localStorage.setItem("lang", lang);
		//$("head").append('<script type="text/javascript" src="js/translation_' + lang + '.js"></script>');
		
		var db = window.openDatabase("VisitBruges", "1.0", "Visit Bruges", 1000000);
	    db.transaction(function(tx)
	    {
	    	tx.executeSql('INSERT OR REPLACE INTO SETTINGS (key, value) VALUES ("lang", "' +lang+ '")');
	    	
	    }, errorCB, function(tx, results)
	    {
	    	callback("language set");
	    });
		
	}

	
	function errorCB(tx, error) 
	{
	    console.log("language.js - " + error);
	}

	
}

