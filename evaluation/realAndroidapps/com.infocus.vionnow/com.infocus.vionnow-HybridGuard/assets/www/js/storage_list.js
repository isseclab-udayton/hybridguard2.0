var actual_cover = ""; // für Merkliste
var pager_start_storage = 0;
var pager_end_storage = 0;
var num_items_storage = 6;
var multi_dot_storage = 0;
var glob_dot_white_storage = 0;
var pager_stop_storage = 0;

var storage_message = "";



$('#storage_list').live( 'pageshow', function( ) {
	/*if (navigator.network.connection.type == Connection.NONE || navigator.network.connection.type == Connection.UNKNOWN){
		openPopupInfo('Fehler!', 'kein Internet :(');
	}
	else{*/
		//alert(sessionStorage.getItem("referrer"));
		
		var submenu = '';	
		submenu += '<div data-role="controlgroup">';
		submenu += '<a href="#login_cloud" id="sync_button" data-role="button">Synchronisieren</a>';
		if(android == 1){
			submenu += '<a href="#" onclick="sendCsvEmail();" data-role="button">CSV versenden</a>';
			submenu += '<a href="#" onclick="getPDF()" data-role="button">PDF versenden</a>';
		}	
		submenu += '</div>';
		$('#submenu').html(submenu).trigger('create');
		if(sessionStorage.getItem("referrer")!= "storage_list"){
			sessionStorage.setItem("storage_cat", 0);
		}	
		var cat = sessionStorage.getItem("storage_cat");
		if(cat == "0" || !cat){
			str_cat = "";
			getNumItemsStorage(str_cat);
			db.transaction(queryDBStorage);
		}
		else{
			str_cat = 'AND movie_storage.storage_reason='+cat;
			getNumItemsStorage(str_cat);
			showStorageCat(cat);
		}
		var user_id = sessionStorage.getItem("user_id");
		if(user_id && user_id != "999999"){
			$("#sync_button").attr('onclick', 'synchronize('+user_id+')');
			$("#sync_button").attr('href', '#');
	    }
	    
	    /********** Height fuer Content-Wrapper ************/
	    var deviceViewportHeight = $('body').height();
	    $('.subpage').find('.content-wrapper').height(deviceViewportHeight -110);
	//}    
                        
});
$('#storage_list').live( 'pagehide', function( ) {
	//pager_start_storage = 0;
	//multi_dot_storage = 0;
	glob_dot_white_storage = 0;
	//pager_stop_storage = 0;
}); 

$('#storage_list').live( 'pagechange', function( ) {
	sessionStorage.setItem("storage_cat", 0);	
});

function getNumItemsStorage(str_cat){
	db.transaction(
	        function(tx) {
	        tx.executeSql('SELECT movie_storage.id as movie_storage_id, * FROM movie_storage LEFT JOIN storage_reason ON (movie_storage.storage_reason=storage_reason.id) WHERE movie_storage.deleted != 1  '+str_cat+';',
	        [],
	        function (tx, results) {
	        	pager_end_storage = results.rows.length;
	        }, errorCB
	        );
	        });
}

function storage_pager(direction){
	//alert(pager_end_storage);
	if(direction == "back"){
		if(pager_start_storage >= num_items_storage){
			pager_start_storage = pager_start_storage - num_items_storage;
			if(glob_dot_white_storage % max_dot_count == 0 && glob_dot_white_storage != 0){
				multi_dot_storage--;
				//alert('multi: '+multi_dot_storage);
			}
			pager_stop_storage = 0;
		}	
	}
	else{
		if( pager_start_storage + num_items_storage <= pager_end_storage){
			pager_start_storage = pager_start_storage + num_items_storage;
			if((glob_dot_white_storage+1) % max_dot_count == 0 && glob_dot_white_storage != 0){
				multi_dot_storage++;
				//alert('multi: '+multi_dot_storage);
			}
		}
		
		
	}
	var cat = sessionStorage.getItem("storage_cat");
	if(cat == "0" || !cat){
		db.transaction(queryDBStorage);
	}
	else{
		showStorageCat(cat);
	}
}

function queryDBStorage(tx) {
	//alert('SELECT movie_storage.id as movie_storage_id, * FROM movie_storage LEFT JOIN storage_reason ON (movie_storage.storage_reason=storage_reason.id) WHERE movie_storage.deleted != 1 LIMIT '+pager_start_storage+', '+num_items_storage+';');
	storage_message = '';
	storage_message += '<h2>Deine Sammlung</h2>';
	storage_message += '<p>Hier entsteht deine pers&ouml;nliche Seite mit deiner Filmsammlung, Filme die du schon gesehen hast oder gerne noch sehen m&ouml;chtest.</p>';
	storage_message += '<p>Scanne dazu einfach den <a href="#" onClick="getBarcode(1)">Barcode</a> auf dem Cover deiner DVD oder Blu Ray oder durchst&ouml;bere unsere <a href="#start">Movies</a> und lege deine Favoriten in deiner Sammlung ab.</p>';
	storage_message += '<p>Bei Bedarf kannst du deine Sammlung auch in unserer <a href="#login_cloud">my vionnow-Cloud</a> kostenlos sichern und mit deinen anderen Endger&auml;ten synchronisieren</p>';
    tx.executeSql('SELECT movie_storage.id as movie_storage_id, * FROM movie_storage LEFT JOIN storage_reason ON (movie_storage.storage_reason=storage_reason.id) WHERE movie_storage.deleted != 1 LIMIT '+pager_start_storage+', '+num_items_storage+';', [], querySuccess, errorCB);
}

function showStorageCat(id) {
	storage_message = '';
	storage_message += '<h2>Keine Titel gefunden</h2><p>Du hast noch keine Filme unter dieser Kategorie gespeichert.</p>';
	db.transaction(
			function(tx) {
		        tx.executeSql('SELECT movie_storage.id as movie_storage_id, * FROM movie_storage LEFT JOIN storage_reason ON (movie_storage.storage_reason=storage_reason.id) WHERE movie_storage.deleted != 1 AND movie_storage.storage_reason='+id+' LIMIT '+pager_start_storage+', '+num_items_storage+';',
		        [],
		        querySuccess, errorCB
	        );
	});
	
}

function querySuccess(tx, results) {
	
	
	var grid_count = 97; // "a"
	
	// page indicator
	var dot_white = Math.round(pager_start_storage / num_items_storage);
	glob_dot_white_storage = dot_white;
	//alert(dot_white);
	
	//alert(multi_dot_storage * max_dot_count);
	dot_white = dot_white - (multi_dot_storage * max_dot_count);
	//alert(dot_white);
	var dot_count = Math.ceil(pager_end_storage / num_items_storage);

	if( pager_start_storage + num_items_storage > pager_end_storage){
		pager_stop_storage = 1;
	}
	if(Math.floor(dot_count / max_dot_count) == multi_dot_storage){
		dot_count = (dot_count % max_dot_count);
	}
	
	if(dot_count > max_dot_count){
		dot_count = max_dot_count;
	}
	
	//alert(dot_count);
	var css_class = ""; 
	
	$('#storage_movies_dots').empty();
	if(pager_start_storage != 0){
		$('#storage_movies_dots').append('<span>&laquo;</span>');
	}
	for(var i = 0; i < dot_count; i++){
		if(dot_white == i){
			css_class = "dot-white";
		}
		else{
			css_class = "dot";
		}
		$('#storage_movies_dots').append('<span class="'+css_class+'"></span>');
	}
	if(pager_stop_storage != 1){
		$('#storage_movies_dots').append('<span>&raquo;</span>');
	}	
	
	// grid leeren
	var z = 0;
    var n = 1;
	for(var i = 0; i < num_items_storage; i++){
		if(i == 3){
			n = 2;
			z = 0;
		}
		$('#content_storage'+n+' .ui-block-'+String.fromCharCode(grid_count + z)).html("");
		z++;
	}
	
    var len = results.rows.length;
    z = 0;
    n = 1;
    
    for (var i=0; i<len; i++){
	    	$.ajax({
	    	    beforeSend: function() { $.mobile.showPageLoadingMsg(); },
	    	    complete: function() { $.mobile.hidePageLoadingMsg() },
	 			url: 'http://www.vionnow.de/json/getCover/movie_id/'+results.rows.item(i).movie_storage_id+'/width/'+window.innerWidth,
	 			dataType: 'jsonp',
	 			jsonp: 'jsoncallback',
	 			timeout: 50000,
	 			success: function(data){
	 				$('#storage_'+data.ID).find('img').attr('src', data.Cover);
	 			},
	 			error: function(){
	
	 			}
	    	});	
    	if(results.rows.item(i).css_class){
			st_class = 'storage-'+results.rows.item(i).css_class;
	    }
	    else{
	        st_class = 'storage';
	    }
	    if(i >= 3){
	       n = 2;
	    }
	    if(i == 3){
	      z = 0;	
		}
	    var film = '<div class="cover" id="storage_'+results.rows.item(i).movie_storage_id+'">';
	    film += '<div class="stored-in '+st_class+'"></div>';
	    film += '<div class="storage-edit"><a href="#storage_edit" onClick="editItem('+results.rows.item(i).movie_storage_id+')" data-role="button" data-icon="gear" data-iconpos="notext">Edit</a></div>';
	    film +=	'<a href="#movie_detail" onClick="setSession_MovieID('+results.rows.item(i).movie_storage_id+')"><img src="'+results.rows.item(i).cover+'" /></a></div>';
		$('#content_storage'+n+' .ui-block-'+String.fromCharCode(grid_count + z)).html(film).trigger("create");
	       
		z++;
	    /*film += '<li><a href="#movie_detail" onClick="setSession_MovieID('+results.rows.item(i).id+')">';
	    film +=		'<img src="'+results.rows.item(i).cover+'" />';
	    film += '<h5>'+results.rows.item(i).title+'</h5>';
	    if(results.rows.item(i).name){
	    	film += '<div class="ui-grid-a">';
	    	film += '<div class="ui-block-a"><img src="img/'+results.rows.item(i).css_class+'.png" /></div>';
	    	film += '<div class="ui-block-b">('+results.rows.item(i).name+')</div>';
	    	film += '</div>'
	    }
	    else{
	    	film += '<div class="ui-grid-a">';
	    	film += '<div class="ui-block-a"><img src="img/o.png" /></div>';
	    	film += '<div class="ui-block-b">(ohne Kategorie)</div>';
	    	film += '</div>'
	    }
	    //film += '<p>Kommentar: '+comment+'</p>';
	    //film += '<p>Ort: '+results.rows.item(i).place+'</p>';
	    //film += '<p>Bewertung: '+results.rows.item(i).voting+'</p>';
		film +=		'</a>';
		//film +=	'<div data-role="controlgroup" data-type="horizontal">';
		//film +=		'</div>';
		//film += 	'<a href="#" onClick="deleteItem('+results.rows.item(i).id+')" data-role="button" data-icon="delete" data-iconpos="notext">Löschen</a>';
		//film += 	'<a href="#storage_edit_page" onClick="setSession_MovieID('+results.rows.item(i).id+')">Edit</a>';
		//alert(results.rows.item(i).movie_storage_id);
		film += '<a href="#storage_edit_dlg2" onClick="editItem('+results.rows.item(i).movie_storage_id+', 2)" data-rel="popup">Edit</a>';
		film +=		'</li>';
        //alert(item.Titel);*/
        $('#myvionnow-info').hide();
    }
    if(len == 0){
    	/* neues DIV */
    	$('#myvionnow-info').html(storage_message).trigger('create');
        $('#myvionnow-info').show();
    }
    if(sessionStorage.getItem("cloud_message") != '' ){
		openPopupInfo('Information', sessionStorage.getItem("cloud_message"));
		sessionStorage.setItem("cloud_message", "");
	}
    
}

function searchStorage(tx){
	storage_message = '';
	storage_message += '<h2>Keine Titel gefunden</h2><p>Es ist noch keinen Film mit diesem Titel gespeichert.</p>';
	var search = $('#search_storage').val();
	//alert(search);
	var sql = "SELECT * FROM movie_storage LEFT JOIN storage_reason ON (movie_storage.storage_reason=storage_reason.id) WHERE movie_storage.title like '%"+search+"%'";
	//alert(sql);
	tx.executeSql(sql, [], querySuccess, errorCB);
}

$('#storage_list').live("swipeleft", function(){
	storage_pager("forward");
});

$('#storage_list').live("swiperight", function(){
	
	storage_pager("back");
});



