
	
	  
$('#demo').theatre('stop');
    	
    $('#demo').swipe({
             
    	swipe:function(event, direction, distance, duration, fingerCount) {
              		
    		if(direction == 'left')
          	{
    			$('#demo').theatre('next');
          	}
            else if(direction == 'right')
            {
            	$('#demo').theatre('prev'); 
            }
           	else if(direction == 'down')
            {
           		
           		$.mobile.silentScroll(200);
           	}
            else if(direction == 'top')
            {
                $.mobile.silentScroll(0);
            }

                   
        }
    });
                      
});	 

//Detailseite

$('#detailPage').live("pagehide", function() {
    	
    $('#detailPic').theatre('stop');
});*/


