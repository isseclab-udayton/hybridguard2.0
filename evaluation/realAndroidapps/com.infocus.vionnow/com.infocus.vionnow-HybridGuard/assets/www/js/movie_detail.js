<!-- ------------------ Detailseiten mit Parameter Übergabe ----------------------- --> 

	

    $('#movie_detail').live('pagebeforeshow', function(event) {
    	/*if (navigator.network.connection.type == Connection.NONE || navigator.network.connection.type == Connection.UNKNOWN){
    		openPopupInfo('Fehler!', 'kein Internet :(');
    	}
    	else{*/
	    	checkStorageList();
	    	$('#content_film_main').show();
	    	$('#content_film_detail').hide();
	    	$('#content_film_meta').hide();
	        $('.btn-reset').removeClass('ui-btn-active');
    	//}    
    });
    
    $('#movie_detail').live( 'pagebeforehide', function( ) {
    	//$('#content_film_main').empty();
    	$('#content_film_main').empty();
    	$('#movie-stage').find('.contents').empty();
    	$('#voting1_plus').attr("checked",false);
    	$('#voting1_minus').attr("checked",false); 
    	var header = $('#movie_detail').children( ":jqmData(role=header)" );
		header.find("h1").html('');
    });
    
	function showDetailMeta(){
		$('#content_film_meta').show();
		$('#content_film_detail').hide();
		$('#content_film_main').hide();
	}
	function showDetailDetail(){
		$('#content_film_detail').show();
		$('#content_film_meta').hide();
		$('#content_film_main').hide();
	}
	function showDetailMain(){
		$('#content_film_main').show();
		$('#content_film_detail').hide();
		$('#content_film_meta').hide();
	}
	

    function checkStorageList() {
    	if(firebug != 1){
    	    var id = sessionStorage.getItem("movie_id");
    	    db.transaction(
	    	    function(tx) {
	    	        strsql = 'SELECT * FROM movie_storage LEFT JOIN storage_reason ON (movie_storage.storage_reason=storage_reason.id) WHERE deleted != 1 AND movie_storage.id='+id;	
	    	        tx.executeSql(strsql,
	    	        [],showMovie
	    	        , errorCB
	    	  );
	        });
    	}
    	else{
    		showMovie(null, null);
    	}
    }
    
    function showMovie(tx, results) {
    	var id = sessionStorage.getItem("movie_id");
    	$.ajax({
    		beforeSend: function() { $.mobile.showPageLoadingMsg(); }, // show spinner
    		complete: function() { $.mobile.hidePageLoadingMsg() }, //Hide spinner
			url: 'http://www.vionnow.de/json/showMovie/film/'+id+'/width/'+window.innerWidth,
			dataType: 'jsonp',
			jsonp: 'jsoncallback',
			timeout: 5000,
			success: function(data){
				sessionStorage.setItem("actual_cover", data.Cover);
	    		sessionStorage.setItem("actual_title", data.Titel);
	    		var header = $('#movie_detail').children( ":jqmData(role=header)" );
	    		header.find("h1").html(data.Titel);
	    		var href = '#'+sessionStorage.getItem("referrer_movie_detail");
	    		$("#back_button").attr("href", href);
				var navigation = $('#content_film_navi');
				var main = $('#movie-stage').find('.contents');
                var movie = $('#content_film_main');
				var detail = $('#content_film_detail');	
				var meta_data = $('#content_film_meta');
                var store_to_myvn = '';
                var store_to_myvn_text = '';
 				var film = '';
				var navi = '';
				var meta = '';
				var my_vionnow = '';
                var my_vionnow_storage = '';
				if(data.Trailer){
					film += '<div class="trailer" style="margin-top: 12%; text-align: center;"><a href="#" style="padding-bottom: 5px;" onclick="playTrailer(\''+data.Trailer+'\')"  data-inline="true" data-iconpos="top" data-icon="arrow-r" data-role="button">Trailer</a></div>';
				}
				if(data.BRD_DVD_Link){
    	    		if(data.Medium == "DVD-Video"){
    	    			navi += '<h2>'+data.Titel+'</h2><a href="#movie_detail" onclick="refreshMovieDetails('+data.BRD_DVD_Link+')" data-role="button">Auch auf Blu Ray erhältlich.</a>';
    	    		}
    	    		else{
    	    			navi += '<h2>'+data.Titel+'</h2><a href="#movie_detail" onclick="refreshMovieDetails('+data.BRD_DVD_Link+')" data-mini="false" data-role="button">Auch auf DVD erhältlich.</a>';
    	    		}
	    		}
				if(firebug !=1){
					if(results.rows.length == 0){
                       store_to_myvn = 'insertMovieDB();';
                       store_to_myvn_text = 'speichern';
                       store_to_myvn_icon = 'plus';
                       my_vionnow += '<h2>Bemerkung für deine Sammlung</h2><p>Füge diesen Film deiner Sammlung hinzu. Du kannst ihn bewerten, speichern und mit einer Bemerkung versehen!<p> <a class="options-toggle" href="#storage_edit" onclick="insertMovieDB()" data-mini="true" data-icon="plus" data-role="button" data-theme="e">Film Speichern</a>';
		        	}
					else{
                        store_to_myvn = 'editItem('+id+')';
                        store_to_myvn_text ='bearbeiten';
                        store_to_myvn_icon = 'gear';
						if(results.rows.item(0).name){
                            my_vionnow_storage += '<div class="stored-in-detail storage-'+results.rows.item(0).css_class+'"></div>';
						}
						else{
							//my_vionnow += '<h3>Diesen Film habe ich in meiner Merkliste</h3>';
						}
						if(results.rows.item(0).voting && results.rows.item(0).voting != ""){
							my_vionnow += '<div class="ui-block-b"><img src="img/voting_'+results.rows.item(0).voting+'.png"></div>';
						}
                        my_vionnow += '<h2>Aus meiner Sammlung ...</h2>';
                        my_vionnow += '<p>Meine Meinung zu diesem Film.';
						my_vionnow += '<p><b>Kommentar:</b> '+results.rows.item(0).comment+'</p>';
						my_vionnow += '<p><b>Ort:</b> '+results.rows.item(0).place+'</p>';
						my_vionnow += '<p><b>Bewertung:</b> '+results.rows.item(0).voting+'</p>';
						
					}
					film += my_vionnow_storage+'<div class="cover"><img src="'+data.Cover+'" /></div>';
				}
				else{
					my_vionnow += '<div class="ui-grid-a">';
					my_vionnow += '<div class="ui-block-a"><img src="img/g.png" /></div>';
					my_vionnow += '<div class="ui-block-b"><img src="img/voting_plus.png"></div>';
					my_vionnow += '</div>';
					my_vionnow += '<p><b>Kommentar:</b>Ein Test Kommentar für Firebug</p>';
					my_vionnow += '<p><b>Ort:</b>Ein Test Ort für Firebug</p>';
					film += my_vionnow_storage+'<div class="cover"><img src="'+data.Cover+'" /></div>';
				}
                film += '<div class="clear"></div>';
                if(firebug !=1){
	                $(".options-toggle").attr('onclick', store_to_myvn);
	                $(".options-toggle .ui-btn-text").text(store_to_myvn_text);
	                $(".options-toggle").buttonMarkup({ icon: store_to_myvn_icon });
                }
	    		main.html(film).trigger("create");
	    		/*if(data.Trailer){		   
	    			film +='<img src="img/play.jpg" onClick="playTrailer(\''+data.Trailer+'\')" /></p>';
	    		}*/
	    		meta +='<p><b>Darsteller: </b>';
	    		$.each(data.Darsteller, function(i,item){
	    			meta += '<a class="cast-link" href="#search_movies" onClick="searchActor(\''+item+'\')">'+item+'</a> ';
	    		});
	    		
	    		meta +='</p><p><b>Regie:</b> '+data.Regie+'</p>';	
	    		meta +='<p><b>Medium:</b> '+data.Medium+'</p>';
	    		meta +='<p><b>FSK:</b> '+data.FSK+'</p>';
	    		meta +='<p><b>Laufzeit:</b> '+data.Laufzeit+'</p>';
	    		meta +='<p><b>Vö-Datum:</b> '+data.VO_Datum+'</p>';
	    		meta +='<p><b>Genre:</b> '+data.Genre+'</p>';
	    		
	    		meta_data.html(my_vionnow).trigger("create");
               
                movie.html(navi + meta).trigger("create");
	    		
	    		inhalt = '<p>'+data.Inhalt+'</p>';
	    		detail.html(inhalt).trigger("create");
	    		/*var b = $(".options-toggle");
                b.text(store_to_myvn_text);
                b.buttonMarkup({ icon: "check" });
                b.button();
                b.button('refresh');*/
	    		//actual_cover = data.Cover // cover für Merkliste merken
			},
			error: function(){
				checkStorageList();
			}
     	});
    	
 }

    
    function refreshMovieDetails(id){
    	setSession_MovieID(id);
    	checkStorageList();
    	$('#content_film_main').show();
		$('#content_film_detail').hide();
		$('#content_film_vionnow').hide();
    }
    
    function searchActor(actor){
    	sessionStorage.setItem("search", actor);
    	initSearch();
    }